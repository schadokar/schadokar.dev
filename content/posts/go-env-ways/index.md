---
title: "Use Environment Variable in your next Golang Project"
date: 2020-01-12T18:14:49+05:30
description: "There are multiple ways in golang to use environment variables and files."
published: true
tags: ["golang", "viper", "tutorial"]
categories: ["Golang", "Tutorial", "2020"]
---

When it comes to creating a production-grade application, using the environment variable in the application is *de facto*.

### Why should we use the environment variable?

Suppose you have an application with many features and each feature need to access the Database. You configured all the DB information like `DBURL`, `DBNAME`, `USERNAME` and `PASSWORD` in each feature.

There are a few major disadvantages to this approach, there can be many.

- ##### Security Issue: 
  - You're entering all the information in the code. Now, all the unauthorized person also have access to the DB. 
  - If you're using code versioning tool like `git` then the details of your DB will go public once you push the code.


- ##### Code Management:
  - If you are changing a single variable then you have to change in all the features. There is a high possibility that you'll miss one or two. :relieved: been there
  - You can categorize the environment variables like `PROD`, `DEV`, or `TEST`. Just prefix the variable with the environment. 

In the start, it might look like some extra work, but this will reward you a lot in your project.

> :warning: Just don't forget to include your environment files in the .gitignore. :warning:

---

It is time for some action. :action:

#### What are we going to do in this tutorial?

In this tutorial, we will access environment variables in 3 different ways.

You can use according to your requirement.

  - `os` package
  - `godotenv` package
  - `viper` package

## Create a Project

Create a project `go-env-ways` outside the `$GOPATH`. 

### Initialize the module

Open the terminal inside the project root directory, and run the below command.

```go
go mod init go-env-ways
```

This module will keep a record of all the packages and their version used in the project. It is similar to `package.json` in `nodejs`.

---

Let's start with the easiest one, using `os` package.

## os Package

Golang provides `os` package, an easy way to configure and access the environment variable.

To set the environment variable, 

```go
os.Setenv(key, value)
```

To get the environment variable,

```go
value := os.Getenv(key)
```

Create a new file `main.go` inside the project.

```go
package main

import (
  "fmt"
  "os"
)

// use os package to get the env variable which is already set
func envVariable(key string) string {

  // set env variable using os package
  os.Setenv(key, "gopher")

  // return the env variable using os package
  return os.Getenv(key)
}

func main() {
    // os package
  value := envVariable("name")

  fmt.Printf("os package: %s = %s \n", "name", value)
}
```

Run the below command to check.

```go
go run main.go

// Output
os package: name = gopher
```
---

## GoDotEnv Package

The easiest way to load the `.env` file is using `godotenv` package.

### Install

Open the terminal in the project root directory.

```go
go get github.com/joho/godotenv
```

```go
// Load the .env file in the current directory
godotenv.Load()

// or

godotenv.Load(".env")
```
> Load method can load multiple env files at once. This also supports `yaml`. For more information check out the [documentation](https://github.com/joho/godotenv). 

Create a new `.env` file in the project root directory.

```toml
STRONGEST_AVENGER=Thor
```

Update the `main.go`.

```go
package main

import (

    ...
    // Import godotenv
  "github.com/joho/godotenv"
)


// use godot package to load/read the .env file and
// return the value of the key
func goDotEnvVariable(key string) string {

  // load .env file
  err := godotenv.Load(".env")

  if err != nil {
    log.Fatalf("Error loading .env file")
  }

  return os.Getenv(key)
}

func main() {
    // os package
    ... 

  // godotenv package
  dotenv := goDotEnvVariable("STRONGEST_AVENGER")

  fmt.Printf("godotenv : %s = %s \n", "STRONGEST_AVENGER", dotenv)
}
```

Open the terminal and run the `main.go`.

```go
go run main.go

// Output
os package: name = gopher

godotenv : STRONGEST_AVENGER = Thor
```

> Just add the code at the end of the os package in the main function.

---

## Viper Package

Viper is one of the most popular packages in the golang community. Many Go projects are built using Viper including Hugo, Docker Notary, Mercury.

> Viper is a complete configuration solution for Go applications including 12-Factor apps. It is designed to work within an application and can handle all types of configuration needs and formats. Reading from JSON, TOML, YAML, HCL, envfile and Java properties config files

> *For more information read the official documentation of [viper](https://github.com/spf13/viper)*

### Install

Open the terminal in the project root directory.

```go
go get github.com/spf13/viper
```

To set the config file and path

```go
viper.SetConfigFile(".env")
```

To read the config file

```go
viper.ReadInConfig()
```

To get the value from the config file using key

```go
viper.Get(key)
```

Update the `main.go`.

```go
import (
  "fmt"
  "log"
  "os"

  "github.com/joho/godotenv"
  "github.com/spf13/viper"
)

// use viper package to read .env file
// return the value of the key
func viperEnvVariable(key string) string {

  // SetConfigFile explicitly defines the path, name and extension of the config file.
  // Viper will use this and not check any of the config paths.
  // .env - It will search for the .env file in the current directory
  viper.SetConfigFile(".env")

  // Find and read the config file
  err := viper.ReadInConfig()

  if err != nil {
    log.Fatalf("Error while reading config file %s", err)
  }

  // viper.Get() returns an empty interface{}
  // to get the underlying type of the key,
  // we have to do the type assertion, we know the underlying value is string
  // if we type assert to other type it will throw an error
  value, ok := viper.Get(key).(string)

  // If the type is a string then ok will be true
  // ok will make sure the program not break
  if !ok {
    log.Fatalf("Invalid type assertion")
  }

  return value
}

func main() {

    // os package  
    ...
  
  // godotenv package
  ...

  // viper package read .env
  viperenv := viperEnvVariable("STRONGEST_AVENGER")

  fmt.Printf("viper : %s = %s \n", "STRONGEST_AVENGER", viperenv)
}
```

Open the terminal and run the `main.go`.

```go
go run main.go

// Output
os package: name = gopher

godotenv : STRONGEST_AVENGER = Thor

viper : STRONGEST_AVENGER = Thor
```

---

### Viper is not limited to .env files. 

It supports:

- setting defaults
- reading from JSON, TOML, YAML, HCL, envfile and Java properties config files
- live watching and re-reading of config files (optional)
- reading from environment variables
- reading from remote config systems (etcd or Consul), and watching changes
- reading from command line flags
- reading from buffer
- setting explicit values

Viper can be thought of as a registry for all of your applications configuration needs.

Let's experiment: :bomb: 

Create a new `config.yaml` file in the project root directory.

```yaml
I_AM_INEVITABLE: "I am Iron Man"
```

To set the config filename

```go
viper.SetConfigName("config")
```

To set the config file path

```go
// Look in the current working directory
viper.AddConfigPath(".")
```

To read the config file

```go
viper.ReadInConfig()
```

Update the `main.go`

```go
// use viper package to load/read the config file or .env file and
// return the value of the key
func viperConfigVariable(key string) string {

  // name of config file (without extension)
  viper.SetConfigName("config")
  // look for config in the working directory
  viper.AddConfigPath(".")

  // Find and read the config file
  err := viper.ReadInConfig()

  if err != nil {
    log.Fatalf("Error while reading config file %s", err)
  }

  // viper.Get() returns an empty interface{}
  // to get the underlying type of the key,
  // we have to do the type assertion, we know the underlying value is string
  // if we type assert to other type it will throw an error
  value, ok := viper.Get(key).(string)

  // If the type is a string then ok will be true
  // ok will make sure the program not break
  if !ok {
    log.Fatalf("Invalid type assertion")
  }

  return value
}

func main() {

  // os package
  ...

  // godotenv package
  ...

  // viper package read .env
  ...

  // viper package read config file
  viperconfig := viperConfigVariable("I_AM_INEVITABLE")  
  
  fmt.Printf("viper config : %s = %s \n", "I_AM_INEVITABLE", viperconfig)  
}
```

Open the terminal and run the `main.go`

```go
go run main.go

// Output
os package: name = gopher

godotenv : STRONGEST_AVENGER = Thor

viper : STRONGEST_AVENGER = Thor

viper config : I_AM_INEVITABLE = I am Iron Man
```

---

## Conclusion

That's it, now you can explore more of their secrets. If you find something worth sharing don't hesitate. 

The complete code is available in the [github](https://github.com/schadokar/blog-projects/tree/master/go-env-ways). 
