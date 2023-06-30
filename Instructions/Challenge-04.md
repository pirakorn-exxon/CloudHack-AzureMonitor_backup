# Challenge 04: Monitoring Data disk usage, and DTU for SQL database

[< Previous Challenge](./Challenge-03.md) - **[Home](../README.md)** - [Next Challenge >](./Challenge-05.md)

## Introduction

To maintain its efficiency and performance. It is better to have monitoring tools to help observe our resources.

![Challenge06Workflow](Images/Challenge6-workflow.png)
For this challenge, we are going to create an alert rule to monitor our SQL database and send an alert to ServiceNow System

## Description
### How to Configure an Alert
##### Step 1 - Create Alert rule for your resource

- From your Resource, navigate to `Monitoring` panel on the left.
- Choose `Alert`.
- `+ Create` then choose `Alert rule`.

<!-- ![Alt text](/CreateAlertRule.png) -->

##### Step 2 - Configure the condition for the alert

The next step is to configure the condition of the alert.
In this challenge, we are going to monitor DTU and Data disk Usage.

###### Condition
- Signal name
    - DTU (Database transaction units)   
    - Data space used percent (Database data storage)      
- Alert Logic
    - Threshold: Static
    - Aggregation type: Maximum
    - Operator: Greater than
    - Threshold Value
        - DTU (Database transaction units)                : Over 50%
        - Data space used percent (Database data storage) : Over 80%

**Note**: One condition per one alert rule, In this case you will need 2 alert rules 

<!-- ![Alt text](/AlertCondition.png) -->

##### Step 3 - Assign the Action Group to your alert

The next step is to assign the action group to our alert so that the alert can be displayed on ServiceNow.

In `Actions` tab, then choose `Select action groups`

**Note:** Use your `Action Group` you created earlier.

<!-- ![Alt text](/ActionGroup.png) -->

##### Step 4 - Configure Alert Detail

This step is to enter meaningful detail into our alert rule, this is to provide the alert name which will be displayed in ServiceNow.
 
- Detail
    - Alert Name (\<name\>-challenge4-(DTU/DataDiskUsage)-alert)

<!-- ![Alt text](/AlertDetail.png) -->

##### Step 5 - Review and Create the alert

After configuring all the detail for the alert, it is good to review the alert to make sure we configured it correctly.

- Double-check the alert detail
- Choose `create` to create the alert rule.


##### Step 6 - Populate Database with Dummy Data to test the alert

- Trigger PrepareDB function from the Function App created in Challenge 4
  - Go to PrepareDB function of your Function App
  - Go to Code + Test menu and wait for the logs screen at the bottom to say "Connected"
  ![PrepareDB Logs Screen](Images/TriggerPrepareDBLog.png 'PrepareDB Logs Screen')
  - Use Test/Run to trigger the function
  - This function requires two parameters
    - Instance: \<Your Name\>-sql-server.database.windows.net (Or you can copy Server name from the SQL database's overview page)
    - DatabaseName: \<Your Name\>sql
  - Please note that this function may take a few minutes to execute, it may respond with HTTP 5XX error. However, please monitor the logs screen whether the function is successfully executed or not
  ![PrepareDB Test and Run](Images/TriggerPrepareDBRun.png 'PrepareDB Run')


<!-- ![Alt text](/ReviewAlert.png) -->

##### Step 7 - Ask coach to review incident in ServiceNow. 
- ***Disable the alert rule the moment that you have seen the alert in ServiceNow to avoid too many tickets in the system.***

## Success Criteria

1. Be able to create an informational alert for the resources.
1. The alert working as it was configured in both Azure Portal and ServiceNow 

## Learning Resources

- [Azure Monitor Alert](https://learn.microsoft.com/en-us/azure/azure-monitor/alerts/alerts-overview)
- [Create New Alert Rule](https://learn.microsoft.com/en-us/azure/azure-monitor/alerts/alerts-create-new-alert-rule?tabs=metric)

[< Previous Challenge](./Challenge-03.md) - **[Home](../README.md)** - [Next Challenge >](./Challenge-05.md)
