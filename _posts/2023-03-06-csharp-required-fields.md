---
title: C#.- Required Fields
date: 2023-03-06 09:58:00 -800
categories: [C#]
tags: [c#, c# 11]     # TAG names should always be lowercase
---

How to use Required keyword for C# 11

# Code

```csharp
using System.Diagnostics.CodeAnalysis;

var book1 = new Book("Jean M Auel", "The Clan of the Cave Bear");

var book2 = new Book
{
    Author = "Jean M Auel",
    Title = "The Valley of Horses",
};

public class Book
{
    public Book()
    {
    }

    [SetsRequiredMembers]
    public Book(string author, string title)
    {
        Author = author;
        Title = title;
    }

    public required string Title { get; set; }
    public required string Author { get; set; }
}
```

# Rererences

## Required modifier (C# Reference)
[https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/required](https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/required)

## Claudio Bernasconi - YouTube
[https://www.youtube.com/watch?v=64hWLzJSsGY](https://www.youtube.com/watch?v=64hWLzJSsG)