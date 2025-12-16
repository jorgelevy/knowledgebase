---
title: Html/Css/Js.- Init/Configure projects
date: 2023-06-07 16:42:00 -800
categories: [Html/Css/Js]
tags: [html, java script, angular, react, azure functions, static web apps]     # TAG names should always be lowercase
---

Html/Css/Js snippets

## Vanilla
```
mkdir swa-vanilla
cd swa-vanilla
New-Item -Path . -Name "index.html"
```

Html
```html
<!DOCTYPE html>
<html lang="en">
 
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vanilla JavaScript App</title>
</head>
 
<body>
    <main>
        <h1>Vanilla JavaScript App</h1>
        <p>Loading content from the API: <b id="apiresponse">...</b></p>
    </main>
 
    <script>
        (async function () {
            let response = await fetch(`/api/message`);
            let data = await response.text();
            console.log(data);
            document.querySelector('#apiresponse').textContent = data;
        }())
    </script>
</body>
 
</html>
```

## Angular
[https://angular.io/guide/setup-local](https://angular.io/guide/setup-local){:target="_blank"}
```
ng new my-app --package-manager pnpm
cd my-app
ng serve --open
```

## React
[https://reactjs.org/docs/create-a-new-react-app.html#create-react-app](https://reactjs.org/docs/create-a-new-react-app.html#create-react-app){:target="_blank"}
```
npx create-react-app my-app
cd my-app
npm start
```

## Azure Functions
[https://docs.microsoft.com/en-us/azure/azure-functions/functions-core-tools-reference?tabs=v2#func-init](https://docs.microsoft.com/en-us/azure/azure-functions/functions-core-tools-reference?tabs=v2#func-init){:target="_blank"}
```
func init 'api' --worker-runtime dotnet-isolated --target-framework net7.0
cd api
func new --name HttpExample --template "HTTP trigger" --authlevel "anonymous"
func start
```

## Vite

[https://vite.dev/guide/#scaffolding-your-first-vite-project](https://vite.dev/guide/#scaffolding-your-first-vite-project){:target="_blank"}
```
npm create vite@latest
cd [vite-project]
npm install
npm run dev
```

## Vue.js
[https://vuejs.org/guide/quick-start.html](https://vuejs.org/guide/quick-start.html){:target="_blank"}
```
npm create vue@latest
...
```

## SWA CLI
[https://github.com/Azure/static-web-apps-cli](https://github.com/Azure/static-web-apps-cli){:target="_blank"} / [https://azure.github.io/static-web-apps-cli](https://azure.github.io/static-web-apps-cli){:target="_blank"}
```
swa
npx @azure/static-web-apps-cli init
swa start

swa login --tenant-id xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx --subscription-id xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
swa deploy --env production --deployment-token xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx-xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxxxxxxxxxx
```
