using namespace System.Net

# Input bindings are passed in via param block.
param($Request, $TriggerMetadata)

# Write to the Azure Functions log stream.
Write-Host "PowerShell HTTP trigger function processed a request."

# Interact with query parameters or the body of the request.
$StatusCode = $Request.Query.StatusCode
if (-not $StatusCode) {
    $StatusCode = $Request.Body.StatusCode
}

If ([string]::IsNullOrEmpty($StatusCode)) {
    Write-Host "No Status Code received, using default value of 404"
    $StatusCode = 404
}
Else {
    Write-Host "Status Code: $($StatusCode)"
}

Write-Host "A list of valid Status Code can be found at https://learn.microsoft.com/en-us/dotnet/api/system.net.httpstatuscode?view=net-7.0"

# Associate values to output bindings by calling 'Push-OutputBinding'.
Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
    StatusCode = $StatusCode
})
