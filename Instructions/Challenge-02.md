# Challenge 02: Monitoring Key Vault

[< Previous Challenge](./Challenge-01.md) - **[Home](../README.md)** - [Next Challenge >](./Challenge-03.md)

## Introduction

Azure Key Vault is a cloud service for securely storing and assessing secrets, such as API Keys, passwords or certificates. To minimize the risk of any unwanted access to the Key Vault, we can proactively monitor it and set up an alert for that kind of access.

## Architecture

![No Description](Images/keyvault-monitoring.png 'Architecture')

We will send the logs from Key Vault to Log Analytics Workspace and then set up the alert of any unwanted access with a log query.

## Prerequisite

- In Azure portal, navigate to your Key Vault created earlier from the previous step.
- Under Diagnostic settings blade in Monitoring section, add diagnostic setting.
![No Description](Images/diagnostic-setting-1.png 'key vault')
- Configure the setting to send logs to your Log Analytics Workspace.
![No Description](Images/diagnostic-setting-2.png 'Diagnostics settings')
- After configuring Diagnostic setting, navigate to Secrets blade and view the secret you have created. In this action, you are trying to get your secret from the Key Vault so that your name will be logged in Log Analytic Workspace.

## Challenge

- From your Key Vault overview page, navigate to Logs blade under Monitoring section where you can query logs.
- Change the scope to your Log Analytics workspace you have created or you can choose to stay at the current scope and perform the query here. Note that it may take approximately 15 minutes before the log appear. 
- ***Write a query against the table named "AzureDiagnostics" with KQL language to return only the records of those who have recently accessed the secret other than your Logic app over the past 30 minutes.***
![No Description](Images/query.png 'Write your query')
- ***The query must return the columns as the following picture. Note that you need to add a column "Severity" with the value "High" and another column "Description" with the value "Unwanted access is identified" for every record returned from the query.***

![No Description](Images/output.PNG 'Query output')

***Query sample***
```kql
AzureDiagnostics
| where TimeGenerated >= now(-30m) // Activities happen within last 30 minutes
| where Resource =~ "" // KeyVault name to be monitored
| extend Email = identity_claim_unique_name_s // Add a new column
```
***Explore more at https://wiki.gotocloud.xom.cloud/docs/Security/key-vault-detective-monitor.html***

- After finish writing the query, click on "New alert rule"
- Set up dimensions to the columns and values returned from the query result and enable "Include all future values" as the picture below. The dimension values should be filled out automatically. The information in the dimension will appear in the ServiceNow ticket.
![No Description](Images/dimension.PNG 'Dimension')

- Configure the alert logic to trigger the alert in case there is any record appeared.
- For this event, you can set Measurement `Measure: Table rows, Aggregation type: Count, Aggregation granularity: 1 minute` and Alert logic `Operator: Greater than, Theshold value: 0, Frequency of evaluation: 1 minute`
- Select the Action Group you created before, leave the other configurations as the default value and then create the rule.
- Set up Alert rule name to ***"\<name\>-challenge2-alert"***
- Test the alert by navigating to the key vault and viewing the secret from the portal. Please make sure you have at least Key Vault Secrets User role to view the secret.
- Since you are not whiltelisted, the alert will be fired to create a ticket in ServiceNow. Then, navigate to Secrets again and ask coach to check incident in ServiceNow.
- You can check whether the alert has been fired by navigating to Alerts blade at your resource group page.
![No Description](Images/checkalert.png 'alertpage')
- If you have seen the alert record, ask a coach to confirm that there is an incident ticket created in ServiceNow.
- ***Disable the alert rule the moment that you have seen the alert in ServiceNow to avoid too many tickets in the system.***

## Success Criteria

1. A ServiceNow ticket is created for the unwanted access.

![No Description](Images/ServiceNow.png 'ServiceNow')

## Learning Resources

- [Azure Key Vault logging](https://learn.microsoft.com/en-us/azure/key-vault/general/logging?tabs=Vault)
- [AppWiki](https://goto/appwiki)
- [KQL quick reference](https://learn.microsoft.com/en-us/azure/data-explorer/kql-quick-reference)

[< Previous Challenge](./Challenge-01.md) - **[Home](../README.md)** - [Next Challenge >](./Challenge-03.md)


