---
title: Azure Functions.- Message Queue Messsage Properties
date: 2023-01-17 19:58:00 -800
categories: [Azure Functions, Service Bus]
tags: [azure functions, message queue]     # TAG names should always be lowercase
---

# Message Properties on a Message Queue Azure Function

```csharp
[Function("Function1")]
public void Run([ServiceBusTrigger("myqueue", Connection = "sbconnectionstring")] string myQueueItem, FunctionContext context)
{
    _logger.LogInformation($"C# ServiceBus queue trigger function processed message: {myQueueItem}");

    var bindingData = context.BindingContext.BindingData;
    _logger.LogInformation($"Body: {myQueueItem} context: {string.Join(',', bindingData.Keys)}");
    foreach (var key in bindingData.Keys)
    {
        _logger.LogInformation($"Key: {key}, Type: {bindingData[key]?.GetType()} Value: {bindingData[key]}");
    }

    context.BindingContext.BindingData.TryGetValue("UserProperties", out var appProperties);
    if (appProperties is string properties)
    {
        var dict = JsonSerializer.Deserialize<Dictionary<string, object>>(properties);
        if (dict != null)
        {
            _logger.LogInformation($"Sender: {dict["Sender"]}");
            _logger.LogInformation($"Number: {dict["Number"]}");
        }
    }
}
```