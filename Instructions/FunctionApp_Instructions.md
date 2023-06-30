## Populate Database with Dummy Data

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

## Generate Function Error Response

- Trigger GenerateErrorResponse function from the Function App created in Challenge 4
  - Go to GenerateErrorResponse function of your Function App
  - Go to Code + Test menu and wait for the logs screen at the bottom to say "Connected"
  ![GenerateErrorResponse Logs Screen](Images/TriggerGenerateErrorResponseLog.png 'GenerateErrorResponse Logs Screen')
  - Use Test/Run to trigger the function
  - This function requires one parameter
    - StatusCode: \<HTTP Status Code\> ([supported Status Code](https://learn.microsoft.com/en-us/dotnet/api/system.net.httpstatuscode?view=net-7.0))
  - This function will output with the status code you entered
  ![GenerateErrorResponse Test and Run](Images/TriggerGenerateErrorResponseRun.png 'GenerateErrorResponse Run')