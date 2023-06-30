# Challenge 05: Monitoring Dashboard

[< Previous Challenge](./Challenge-04.md) - **[Home>](../README.md)**

## Introduction

The fifth challenge is to learn how to use Azure dashboard for monitoring resources.
![Challenge 07: Infrastructure](Images/Challenge-05-workflow.png 'Challenge 07: Infrastructure')

## Description

- **Step 1:** Create new Azure dashboard. 
    - Navigate to Azure portal menu > Select `Dashboard` > Select `Create` > Select `Custom` to create a custom dashboard > Put a dashboard name called `<your name>-cloudhack-dashboard`  and click `Save`.
    - Select your resource group and "Publish"
          ![Challenge 05: Shared Dashboard](Images/Challenge-05-Share.png 'Challenge 05: Shared Dashboard')
<br>

- **Step 2:** Add metrics from Application Insights into the dashboard.
    - Navigate to your Application Insights > Select `Metrics` > Save metrics to the dashboard.
        - Required information: 
            - Process CPU
            - Failed request
    - Navigate to your Application Insights > Select `Logs` > Create a custom query using `requests` table > Save a pie chart to the dashboard.
        - Required information: 
            - Pie chart of request count by function name
<br>

- **Step 3:** Add metrics from SQL database into the dashboard.
    - Navigate to your SQL database > Select `Metrics` > Save metrics to the dashboard.
        - Required information: 
            - Average CPU/DTU percentage
            - Average data space used percentage
            - Failed Connection: System Error and User Error
<br>

- **Step 4:** Use resource graph query to show resources in resource group and save it to the dashboard.
    - Navigate to Azure Resource Graph Explorer > create a custom query using `resources` table > Save custom query to the dashboard.
        - Required information: resource name, resource type and location
<br>

- **Step 5:** Use resource graph query to show fired alerts in resource group and save it to the dashboard.
    - Navigate to Azure Resource Graph Explorer > create a custom query using `alertsmanagementresources` table > Save custom query to the dashboard.
        - Required information: alert name, severity, target resource, alert condition and trigger time

## Success Criteria

- Azure dashboard with application insights information, SQL database health information, resources and fired alerts in resource group.

## Additional Resource
- [Create a dashboard in the Azure portal](https://learn.microsoft.com/en-us/azure/azure-portal/azure-portal-dashboards).
- [Supported metrics with Azure Monitor (microsoft.insights/components)](https://learn.microsoft.com/en-us/azure/azure-monitor/essentials/metrics-supported#microsoftinsightscomponents).
- [Supported metrics with Azure Monitor (Microsoft.Sql/servers/databases)](https://learn.microsoft.com/en-us/azure/azure-monitor/essentials/metrics-supported#microsoftsqlserversdatabases).
- [Azure Resource Graph table and resource type reference](https://learn.microsoft.com/en-us/azure/governance/resource-graph/reference/supported-tables-resources).

[< Previous Challenge](./Challenge-04.md) - **[Home>](../README.md)**
