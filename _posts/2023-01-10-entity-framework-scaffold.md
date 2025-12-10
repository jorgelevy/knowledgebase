---
title: Entity Framework Scaffold
date: 2023-01-10 00:05:00 -800
categories: [Entity Framework]
tags: [entity framework, database]     # TAG names should always be lowercase
---

How to add Entity Framework Nuget packages and how to scaffold a database context for a SQL Database.

--

# Nuget Packages

## Update

```
Update-Package
```

## Install

### Package Manager
```
Install-Package Microsoft.EntityFrameworkCore
Install-Package Microsoft.EntityFrameworkCore.SqlServer
Install-Package Microsoft.EntityFrameworkCore.Tools
Install-Package Microsoft.EntityFrameworkCore.Design
```

### .NET CLI

```
dotnet add package Microsoft.EntityFrameworkCore
dotnet add package Microsoft.EntityFrameworkCore.SqlServer
dotnet add package Microsoft.EntityFrameworkCore.Tools
dotnet add package Microsoft.EntityFrameworkCore.Design
```

# Scaffold (Database First)

### Package Manager

```
Scaffold-DbContext "Data Source=localhost;Initial Catalog=[database];Integrated Security=True;TrustServerCertificate=True" Microsoft.EntityFrameworkCore.SqlServer -ContextDir [ContextDir] -Context [ApplicationDbContext] -OutputDir [OutputDir]
```

# App Configuration

## ASP .NET Core (+6.x)

```csharp
builder.Services.AddDbContext<ApplicationDbContext>(options =>
{
    options.UseSqlServer(builder.Configuration.GetConnectionString("ConfigContext"));
});
```
