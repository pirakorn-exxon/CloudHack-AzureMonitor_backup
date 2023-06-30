# Challenge 01: Implement ServiceNow request by Logic App

[< Previous Challenge](./Challenge-00Task2.md) - **[Home](../README.md)** - [Next Challenge >](./Challenge-02.md)

## Introduction

In this challenge, you will implement Logic App for creating ServiceNow incident ticket by using ServiceNow API. 

This logic app will receive data from Azure Monitoring Alert and create ServiceNow incident ticket as below diagram.

![Image of Challenge2 Architecture.](./Images/Challenge2-Architecture.png 'Solution diagram')

## Description
In this challenge we will create Logic App and implement workflow to get data from Azure Monitoring Alert to ServiceNow using ServiceNow API.

- Navigate to your resource group in [APPS_CloudHack_DEV](https://portal.azure.com/#@EMCloudAD.onmicrosoft.com/resource/subscriptions/d5ee6e04-0498-4b40-963e-8bcf6bcaf680/)
- Create Logic App (consumption plan) with system managed identity called `<yourname>-cloudhack-logicapp` in your resource group.
- Create Key Vault called `<yourname>-cloudhack-kv` in your resource group.
    - Assign permission for Logic App's managed identity to "Key Vault Secret User" role.
    - Assign yourself to "Key Vault Secrets Officer" role.
    - Add new secret called "SNOW-SECRET" and ask coach to provide App Registration's secret. (This app registration provide permission to send ServiceNow API request.)
- In Logic App, navigate to Logic app designer and implement workflow as picture below
![Workflow Overview.](./Images/Challenge2-workflowoverview.png 'Solution diagram')
    - Step 1: Receive HTTP Request
        - Add "When a HTTP request is received".
        - As Azure Monitoring Alert, it uses Log alert V2 type. You can find schema following this https://learn.microsoft.com/en-us/azure/azure-monitor/alerts/alerts-common-schema#sample-alert-payload
        - Copy JSON of Sample alert payload and fill into "Use sample payload to generate schema" as picture below.
        ![Step 1.](./Images/Challenge2-step1.png 'Solution diagram')
    - Step 2: Get App Registration's secret for ServiceNow request.
        - Click "Insert New Step" > "Add an action" and choose "Azure Key Vault" > "Get Secret".
        - Connect to your KeyVault and retrieve secret called "SNOW-SECRET" that you already implemented.
        ```
        Connection name: SNOW-SECRET
        Authentication Type: Managed identity
        Vault Name: `<Key vault name>`
        ```
        - Click "settings" of this box and enable "Secure Output" to secure your secret.
        - Click Save

        ![Step 2.](./Images/Challenge2-step2.png 'Solution diagram')
    - Step 3: Request "Authentication Token" for ServiceNow Request.
        - Add new action called "HTTP".
        - Get authentication token request following:
        ```
        Method: POST
        URI: https://login.microsoftonline.com/d1ee1acd-bc7a-4bc4-a787-938c49a83906/oauth2/v2.0/token
        Headers: {Content-Type: application/x-www-form-urlencoded }
        Body: {
           grant_type=client_credentials&Client_Id=4a380ad4-614c-4835-a922-d910ae7b2199&Client_Secret=<Value>&scope=api://app.emprod.service-now.xom.com/.default 
        }
        ```
        Note: This app registration has permission `"emprod.service-now.xom.com Client Credential Flow ONLY"` for sending ServiceNow API.
        - Click Save

        ![Step 3.](./Images/Challenge2-step3.png 'Solution diagram')
    - Step 4: Get access_token from previous step.
        - Add new action called "Parse JSON" operation.
        - Get information from previous step following below.
        ```
        Content: <Body>
        Schema: 
        {
            "properties": {
                "access_token": {
                    "type": "string"
                },
                "expires_in": {
                    "type": "integer"
                },
                "ext_expires_in": {
                    "type": "integer"
                },
                "token_type": {
                    "type": "string"
                }
            },
            "type": "object"
        }
        ```
        ![Step 4.](./Images/Challenge2-step4.png 'Solution diagram')
    - Step 5: Add conditions to send description that get data from Azure Monitoring Alert.
        - According to this logic app, it will receive alert from Log Analytic and Azure Metrics. In Log Analytics, it can set columns (dimensions) to display, but Azure Metric cannot. So, we have to support these 2 conditions.
        - Add an action called "Condition" and put "MetricName" is **null** expression to condition box as below:

        ![Step 5](./Images/Challenge2-Step5.png 'Solution diagram')
        ![Step 5.1](./Images/Challenge2-step5.1.png 'Solution diagram')

    - Step 6: Implement SNOW Request both conditions
        - For Log Analytics, SNOW Request will display columns (dimensions) from alert. For Azure Metric, SNOW Request will display all information.
        - Add an Action "HTTP" for both conditions.
        - Following https://developer.servicenow.com/dev.do#!/reference/api/tokyo/rest/c_TableAPI#table-POST 
        ```
        Method: POST
        URI: https://emprod.service-now.com/api/now/v2/table/incident
        Headers: {
            Authorization: Bearer <ACCESS TOKEN from Step 4>
            Content-Type: application/json 
        }
        Body: {
            "assignment_group": "5b694db4dbc52594ea3ac7a6059619f1",
            "cmdb_ci": "ce02b8461b88f01030cb635bbc4bcb6d",
            "description": <dimensions>/ <allOf>,
            "short_description": <ALERT RULE>
        }
        ```
        - Click Save

        Note:
        - This event uses "MAP Hackathon (5b694db4dbc52594ea3ac7a6059619f1)" for assignment group and "Application - Shared Platforms (ce02b8461b88f01030cb635bbc4bcb6d)" for configuration item

        ![Step 6](./Images/Challenge2-step6.png 'Solution diagram')

- Create Action Group called `<your name>-cloudhack-ag` in Azure Monitoring Alert.
    - Navigate to "Monitor" service by searching on top of Azure Portal
    ![Monitor Action Group](./Images/Challenge2-actiongroup1.png 'Solution diagram')
    - Click "Alerts" blade and "Action Groups". Then, click create
    - Fill information to create action group.
    ```
    Subscription: APPS_CloudHack_DEV
    Resource group: <Your Resource Group>
    Region: <Global>
    Action Group Name: <recommend: <your first alphabet>-cloudhack-ag
    ```
    - Select "Action Type" tab and add information below
    ```
    Action type: Logic App
    Selected: <Select Logic App that you already implemented.>
    Enable the common alert schema: Yes
    Name: logic-app-<any name>
    ```
    ![Create Action Group](./Images/Challenge2-actiongroup2.png 'Solution diagram')
- Test Logic App
    - Navigate to Action Group that you already implemented.
    - Click "Test"
    ```
        Select sample type: Log Alert V2
        Action type: Logic App
    ```
    - Navigate to Logic App and check your run history.
    - If Logic App run successfully, you can see "Succeeded" status in run history page.
    ![run history](./Images/Challenge2-logicappstatus.png 'run history')
    - Ask coach to confirm that your logic app is able to send incident to ServiceNow


## Success Criteria
1. Logic App and KeyVault are created.
2. Using Managed Identity
3. Able to send incident ticket in ServiceNow via Logic App


## Learning Resources
- [Log Alert V2 Schema](https://learn.microsoft.com/en-us/azure/azure-monitor/alerts/alerts-common-schema#sample-alert-payload)
- [ServiceNow API](https://developer.servicenow.com/dev.do#!/reference/api/tokyo/rest/c_TableAPI#table-POST)

[< Previous Challenge](./Challenge-00Task2.md) - **[Home](../README.md)** - [Next Challenge >](./Challenge-02.md)
