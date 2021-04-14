---
title: "Create a Weather App in Html"
date: 2021-04-14T19:33:42+05:30
description: ""
categories: ["Tutorial", "2021"]
tags: ["html","material-ui","github-pages"]
cover: https://schadokar.dev/posts/create-a-weather-app-in-html/cover.PNG #image show on top
readingTime: true # show reading time after article date
toc: true
comments: true
published: true
---

In this post, we are creating a weather app in html using material and openweathermap api.  

The final app will look like this.

The code is available on [GitHub](http://github.com/day-to-day-coding/html-weather-app/).

![cover](./cover.PNG)

## Openweathermap API

Go to [Openweathermap.org](https://openweathermap.org/) and create an account. We are utilizing free tier api. 

In free tier, we can call **60 calls**/minute **1,000,000 calls**/month.

Checkout the available APIs for free tier. 

Login to your account and go to My API Keys from the top-right menu.

Create a new api key.

## Project Setup

Create a project directory `html-weather-app`.

```json
|-html-weather-app
	|- icons
	|- index.html
	|- style.css
	|- weather.js
```

### index.html

Open `index.html` and paste the below code.

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      rel="apple-touch-icon"
      sizes="180x180"
      href="/icons/apple-touch-icon.png"
    />
    <link
      rel="icon"
      type="image/png"
      sizes="32x32"
      href="/icons/favicon-32x32.png"
    />
    <link
      rel="icon"
      type="image/png"
      sizes="16x16"
      href="/icons/favicon-16x16.png"
    />
    <link rel="manifest" href="/icons/site.webmanifest" />
    <!-- Compiled and minified CSS -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css"
    />
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link
      href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet"
    />

    <link rel="stylesheet" href="./style.css" />
    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <script src="./weather.js"></script>
    <title>Weather App</title>
  </head>
  <body>
    <div class="container">
      <span>
        <i class="large material-icons">cloud_queue</i>
        <header>Weather App</header></span
      >
      <main>
        <div class="row">
          <div class="col s6">
            <!-- <form> -->
            <div class="row">
              <div class="input-field col s12">
                <i class="material-icons prefix">location_city</i>
                <input id="city" type="text" class="validate" />
                <label for="city">City name</label>
              </div>
            </div>
            <div class="row">
              <button
                class="btn blue amber lighten-2 waves-effect waves-light"
                onclick="getWeatherReport(document.getElementById('city').value)"
              >
                Is it?
                <i class="material-icons right">wb_sunny</i>
              </button>
            </div>
            <!-- </form> -->
          </div>
          <!-- <div class="divider vertical"></div> -->
          <div class="col s6 vertical-divider">
            <div>
              <table>
                <tbody>
                  <tr>
                    <td>
                      <i class="material-icons">my_location</i> coordinate
                    </td>
                    <td id="coordinate"></td>
                  </tr>
                  <tr>
                    <td><i class="material-icons">whatshot</i> temp</td>
                    <td id="temp"></td>
                  </tr>
                  <tr>
                    <td><i class="material-icons">cloud_queue</i> weather</td>
                    <td id="weather"></td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </main>
      <footer class="center">
        <div class="footer-copyright">
          <div class="container">
            Made with <span style="color: red">❤️</span> by
            <a href="https://schadokar.dev">schadokar</a>
          </div>
          <div class="container">
            Ingredients <span> 🧪</span> html, css and
            <a href="https://materializecss.com/">material ui</a>
          </div>
          <div class="container">
            <a href="https://github.com/schadokar"
              ><i class="material-icons">code</i></a
            >
          </div>
        </div>
      </footer>
    </div>
  </body>
</html>
```

### style.css

Open the `style.css` and paste the below code.

```css
body {
  background-color: white;
  color: black;
  background-size: auto;
  background-repeat: no-repeat;
  font-family: "Pacifico", cursive;
  display: flex;
  flex-direction: column;
}

header {
  font-size: xx-large;
  margin-bottom: 50px;
}

main {
  flex: 1 0 auto;
}

input {
  font-family: "Pacifico", cursive;
}

.vertical-divider {
  border-left: 1px solid gray;
}

.page-footer .footer-copyright {
  background-color: white;
}

footer {
  margin-top: 7rem;
}
```

### weather.js

The function will accept `city` name.

Open the Openweathermap and copy the api key. The api key takes a couple of hours to activate before you can use.

Replace your API key in `fetch` request.

```js
fetch(
    `https://api.openweathermap.org/data/2.5/weather?q=${city}&units=metric&APPID=<YOUR API KEY>`,
    requestOptions
  )
```

Open the `weather.js` and paste the below code.

```js
function getWeatherReport(city) {
  var requestOptions = {
    method: "GET",
    redirect: "follow",
  };

  fetch(
    `https://api.openweathermap.org/data/2.5/weather?q=${city}&units=metric&APPID=<YOUR API KEY>`,
    requestOptions
  )
    .then((response) => response.json())
    .then((result) => {
      document.getElementById(
        "coordinate"
      ).innerHTML = `${result.coord.lon}&#176;, ${result.coord.lat}&#176;`;
      document.getElementById(
        "temp"
      ).innerHTML = `${result.main.temp} &#8451;, min ${result.main.temp_min} &#8451;, max ${result.main.temp_max} &#8451;`;
      document.getElementById(
        "weather"
      ).innerHTML = `${result.weather[0].description} <img style="vertical-align: middle;" src="http://openweathermap.org/img/wn/${result.weather[0].icon}@2x.png" />`;
    })
    .catch((error) => console.log("error", error));
}
```

### favicon

Use [favicon.io](https://favicon.io/) to generate your custom favicon and save it in icons folder.

Or you can download the `icons` folder from the [GitHub](http://github.com/day-to-day-coding/html-weather-app/) code.

## Run

Open the `index.html` in the browser and test it.

To run it as server, install `serve` using `npm install --global serve`. Install nodejs first to run `npm` command.

Open the terminal or cmd in the project and run `serve`.

This will start a server at `localhost:5000` and serve `index.html`.

## Host it

You can host it on GitHub Pages.

Create a `html-weather-app` repository on the GitHub. You can name it anything.

Open the terminal or cmd in the project and instantiate git init.

Stage and commit the code.

```shell
git init
git add .
git commit -m 'weather app is complete'
```

> This is a static web app due to which **your api key** is visible to everyone. So either keep the account in free tier or remove/delete the API key from the `weather.js` and then push it. Or you can delete the API key in openweathermap account.

Open GitHub repo and copy the repo url. Add it as `origin` and push the code to the GitHub.

```shell
git remote add origin https://github.com/<Your username>/<repo name>.git
git branch -M main
git push -u origin main
```

Open the GitHub repo settings and go to `pages`.

Under `Source`, select the `main` branch, `/root` folder and **save** it.

The app is now live at

```js
https://<Your Username>.github.io/<your repo name>/
```

---



