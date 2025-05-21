---
title: Azure Functions.- Http Trigger read query and post data
date: 2023-01-27 16:40:00 -800
categories: [Azure Functions, Http Trigger]
tags: [azure functions, http trigger]     # TAG names should always be lowercase
---

How to read query string in a get call and how to read body content on a post call for Http Triger Azure Functions

# Each escenary

## Read Query

```csharp
[Function("ReadQuery")]
public async Task<HttpResponseData> ReadQuery([HttpTrigger(AuthorizationLevel.Function, "get")] HttpRequestData req)
{
    // ../api/Function1?param1=Text 1&param2=123
    var data = System.Web.HttpUtility.ParseQueryString(req.Url.Query);

    _logger.LogInformation($"Param 1: {data["param1"]}");
    _logger.LogInformation($"Param 2: {data["param2"]}");

    var response = req.CreateResponse(HttpStatusCode.OK);
    response.Headers.Add("Content-Type", "text/plain; charset=utf-8");

    response.WriteString("Welcome to Azure Functions!");

    return response;
}
```

## Read Body
```csharp
[Function("ReadBody")]
public async Task<HttpResponseData> ReadBody([HttpTrigger(AuthorizationLevel.Function, "post")] HttpRequestData req)
{
    //{
    //  "param1": "Text 1",
    //  "param2": 123
    //}
    var body = await req.ReadAsStringAsync();

    _logger.LogInformation($"Body: {body}");

    var response = req.CreateResponse(HttpStatusCode.OK);
    response.Headers.Add("Content-Type", "text/plain; charset=utf-8");

    response.WriteString("Welcome to Azure Functions!");

    return response;
}
```

## Read x-www-form-urlencoded data

```csharp
[Function("ReadXwwFormData")]
public async Task<HttpResponseData> ReadXwwFormData([HttpTrigger(AuthorizationLevel.Function, "post")] HttpRequestData req)
{
    var data = await req.ReadAsStringAsync();

    // Parse as dictionary
    var formValues = data!.Split('&')
        .Select(x => x.Split('='))
        .OrderBy(pair => pair[0])
        .ToDictionary(pair => Uri.UnescapeDataString(pair[0]),
                        pair => Uri.UnescapeDataString(pair[1]));

    foreach (var item in formValues)
    {
        _logger.LogInformation($"Key: {item.Key} - Value: {item.Value}");
    }

    //// Parse as query string
    //var keyValues = HttpUtility.ParseQueryString(data);
    //var text = keyValues["param1"];
    //var userId = keyValues["param2"];

    var response = req.CreateResponse(HttpStatusCode.OK);
    response.Headers.Add("Content-Type", "text/plain; charset=utf-8");

    response.WriteString("Welcome to Azure Functions!");

    return response;
}
```

# Final class

```csharp
public class HttpTriggerFunctions
{
    private readonly ILogger _logger;

    public HttpTriggerFunctions(ILoggerFactory loggerFactory)
    {
        _logger = loggerFactory.CreateLogger<HttpTriggerFunctions>();
    }

    [Function("ReadQuery")]
    public async Task<HttpResponseData> ReadQuery([HttpTrigger(AuthorizationLevel.Function, "get")] HttpRequestData req)
    {
        var data = System.Web.HttpUtility.ParseQueryString(req.Url.Query);

        _logger.LogInformation($"Param 1: {data["param1"]}");
        _logger.LogInformation($"Param 2: {data["param2"]}");

        var response = req.CreateResponse(HttpStatusCode.OK);
        response.Headers.Add("Content-Type", "text/plain; charset=utf-8");

        response.WriteString("Welcome to Azure Functions!");

        return response;
    }

    [Function("ReadBody")]
    public async Task<HttpResponseData> ReadBody([HttpTrigger(AuthorizationLevel.Function, "post")] HttpRequestData req)
    {
        var body = await req.ReadAsStringAsync();

        //{
        //  "param1": "Text 1",
        //  "param2": 123
        //}
        _logger.LogInformation($"Body: {body}");

        var response = req.CreateResponse(HttpStatusCode.OK);
        response.Headers.Add("Content-Type", "text/plain; charset=utf-8");

        response.WriteString("Welcome to Azure Functions!");

        return response;
    }

    [Function("ReadXwwFormData")]
    public async Task<HttpResponseData> ReadXwwFormData([HttpTrigger(AuthorizationLevel.Function, "post")] HttpRequestData req)
    {
        var data = await req.ReadAsStringAsync();

        // Parse as dictionary
        var formValues = data!.Split('&')
            .Select(x => x.Split('='))
            .OrderBy(pair => pair[0])
            .ToDictionary(pair => Uri.UnescapeDataString(pair[0]),
                            pair => Uri.UnescapeDataString(pair[1]));

        foreach (var item in formValues)
        {
            _logger.LogInformation($"Key: {item.Key} - Value: {item.Value}");
        }

        //// Parse as query string
        //var keyValues = HttpUtility.ParseQueryString(data);
        //var text = keyValues["param1"];
        //var userId = keyValues["param2"];

        var response = req.CreateResponse(HttpStatusCode.OK);
        response.Headers.Add("Content-Type", "text/plain; charset=utf-8");

        response.WriteString("Welcome to Azure Functions!");

        return response;
    }
}
```