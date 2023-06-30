# CloudHack - Azure Monitoring

## Introduction

The Azure monitoring CloudHack immersive learning series is intended to teach how to monitor Azure workloads and send incident ticket to ServiceNow.

In this event, you can learn how to use Azure Monitoring alert, Application Insight, Azure Metrics, and ServiceNow. On side benefits, you also learn how to use Logic App, Function App, SQL database, and KeyVault. Let's get out of our comfort zones and try to learn something new. And let's have fun!

And don't forget there are coaches around you, just raise your hand at any time!

## Learning Objectives
- Build technical skills for varieties of Azure monitor resources such as Azure Monitoring Alert, Azure Metrics, Application Insight.
- Learn how to send alert from Azure to ServiceNow.
- You will provision Azure Logic App, Azure Function App, SQL databases, etc. to get workloads for many scenario of monitoring.


## Potential Solution Architecture

![Challenge Overview](./Instructions/Images/main_challengeoverview.png 'Solution diagram')

## Technology

Azure services and related products leveraged to create this one possible solution architecture are:
- Azure Logic App
- Azure KeyVault
- ServiceNow
- Azure Function App
- Azure SQL Database
- Azure Metric
- Azure Log Analytic
- Application Insight
- Azure Monitor
- Dashboard

## Challenges
- Challenge 00: Pre-requisites - Ready, Set, GO!
	- Task 1: [Check permission and create Log Analytic Workspace](/Instructions/Challenge-00Task1.md)
	- Task 2: [Implement functions for upload data into database and send API](/Instructions/Challenge-00Task2.md)
		- Upload data to SQL database
		- Create demo function to send API.

- Challenge 01: [Implement ServiceNow request by Logic App](/Instructions/Challenge-01.md)
	- Implement logic app's workflow to call ServiceNow request.
	- Learn how to use Azure Monitoring Alert
- Challenge 02: [Monitoring KeyVault](/Instructions/Challenge-02.md)
	- Someone is trying to get **secret** in KeyVault
- Challenge 03: [Implement functions for upload data into database and send API](/Instructions/Challenge-03.md)
	- Upload data to SQL database
	- Create demo function to send API.
- Challenge 04: [Monitoring Data disk usage, and DTU for SQL database](/Instructions/Challenge-04.md)
	- Learn how to use Azure Metric
- Challenge 05: [Monitoring Dashboard](/Instructions/Challenge-05.md)
	- Learn how to use Azure Monitoring Dashboard to get data from Application Insight

## Prerequisites

- Your laptop: A GME device (or modern client)
- Access to the shared Azure subscription overview [APPS_CloudHack_DEV](https://portal.azure.com/#@EMCloudAD.onmicrosoft.com/resource/subscriptions/d5ee6e04-0498-4b40-963e-8bcf6bcaf680/). You should be given Owner RBAC access to a single resource group within this subscription, the name and link of which will be shared with you by your coach. Your resource group name should look something like `rg-monitoring-<your name>`


## Contributors
**ExxonMobil**
- Azure Shared Services East team
- ELT Cloud Network

