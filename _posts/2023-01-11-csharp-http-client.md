---
title: C# - Http Client
date: 2023-01-11 10:30:00 -800
categories: [C#]
tags: [c#, code snippets]     # TAG names should always be lowercase
---

Code Snippet to make a http api call with C#

--

# Http Client with C#

```csharp
using (var client = new HttpClient())
using (var request = new HttpRequestMessage(HttpMethod.Get, "[url]"))
using (var response = await client.SendAsync(request, cancellationToken))
{
	response.EnsureSuccessStatusCode();
	var content = await response.Content.ReadAsStringAsync();
	return JsonConvert.DeserializeObject<List<Model>>(content);
}
```

# Dependecy Injection

## ASP.NET

### Service configuration (Program.cs)

```csharp
builder.Services.AddHttpClient("Swapi", configuration => {
    configuration.BaseAddress = new Uri("https://swapi.dev/api/");
});
```

### Injecting

```csharp
private readonly HttpClient _httpClient;

...

public WeatherForecastController(IHttpClientFactory httpClientFactory)
{
	_httpClient = httpClientFactory.CreateClient("Swapi");
}

public async Task<string> Get()
{
	using (var response = await _httpClient.GetAsync("people/1/"))
	{
		response.EnsureSuccessStatusCode();
		var content = await response.Content.ReadAsStringAsync();
		return content;
		//return JsonConvert.DeserializeObject<[model]>(content);
	}
}
```

## Azure Functions (Isolated)

### Service configuration (Program.cs)

```csharp
var host = new HostBuilder()
    .ConfigureFunctionsWorkerDefaults()
    .ConfigureServices(services => {
        services.AddHttpClient("Swapi", configuration => {
            configuration.BaseAddress = new Uri(Environment.GetEnvironmentVariable("[ConfSettings]")); //"ConfSettings": ""https://swapi.dev/api/""
        });
    })
    .Build();
```

### Injecting

```csharp
private readonly HttpClient _httpClient;

...

public Function1(ILoggerFactory loggerFactory,
	IHttpClientFactory httpClientFactory)
{
	_logger = loggerFactory.CreateLogger<Function1>();
	_httpClient = httpClientFactory.CreateClient("Swapi");
}

[Function("Function1")]
public async Task Run([TimerTrigger("0 * */5 * * *", RunOnStartup = true)] MyInfo myTimer)
{
	using (var response = await _httpClient.GetAsync("people/1/"))
	{
		response.EnsureSuccessStatusCode();
		var content = await response.Content.ReadAsStringAsync();
		_logger.LogInformation(content);
	}
}
```