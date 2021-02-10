---
title: "Create a Color Cli in Golang"
date: 2020-07-18T07:59:08+05:30
description: "Create a color cli. Get the color name of the hex code."
categories: ["Tutorial", "Golang", "2020"]
tags: ["golang", "cobra", "cli"]
cover: https://schadokar.dev/images/golang-basic.png #image show on top
readingTime: true # show reading time after article date
comments: true
published: true
---

In this tutorial, we will create a color cli in golang using cobra library. CLI is a standard interface between a software and a user.

> A command-line interface (CLI) processes commands to a computer program in the form of lines of text. - [Wikipedia](https://en.wikipedia.org/wiki/Command-line_interface)

**Table of Content**

- [Objective of the color cli](#objective-of-the-color-cli)
  - [Pre-requisites](#pre-requisites)
  - [Cobra](#cobra)
  - [Project Setup](#project-setup)
    - [Initiate the go modules](#initiate-the-go-modules)
  - [Hexcode Color names](#hexcode-color-names)
    - [Download the hexcode to color name json file](#download-the-hexcode-to-color-name-json-file)
  - [Create a name command in the colorcli](#create-a-name-command-in-the-colorcli)
  - [Add a color name to the colornames.min.json](#add-a-color-name-to-the-colornamesminjson)
  - [Conclusion](#conclusion)

# Objective of the color cli

The objective of the `colorcli` is to return the name of the hexcode of the color. If the hexcode doesn't exist then `colorcli` can add the color.

## Pre-requisites

1. Golang
2. Cobra library `go get -u github.com/spf13/cobra/cobra`

---

## Cobra

Cobra is a library providing a simple interface and application scaffolding to create a CLI interface.
Cobra is built on a structure of commands, arguments & flags. [Learn more](https://github.com/spf13/cobra).

- Commands are Verb
- Arguments are Noun
- Flags are Adjective

Example:

```go
App Command -Flag Argument
go get -u github.com/spf13/cobra/cobra
```

---

## Project Setup

Create a `colorcli` directory.
Open the directory in the terminal and run the below command to create a scaffolding of cli.

```go
cobra init --pkg-name colorcli
```

This will create a `colorcli` scaffolding.

```sh
colorcli
    |- cmd
        |- root.go
    |- main.go
```

The `main.go` will execute the root command from the `cmd/root.go`.

```go
package main

import "colorcli/cmd"

func main() {
  cmd.Execute()
}
```

> The root command is the cli name or app name. In this case, it is `colorcli`.

Let's build the cli and run the `colorcli`.

```go
go install colorcli
```

We'll get an error.

```sh
can't load package: package colorcli: cannot find package "colorcli" in any of:
        C:\Go\src\colorcli (from $GOROOT)
        C:\Users\shubh\go\src\colorcli (from $GOPATH)
```

> You'll not encounter this error if the project is inside the GOPATH.

By default go find the packages inside the `GOROOT` and `GOPATH`.
We have to initiate the Go modules inside the project to tell `go` to find the package in the project.

Go modules is a package manager in the golang. Go module tracks all the packages and their version used in the project. You can consider it similar to `node modules` in the nodejs. [Learn more](https://blog.golang.org/using-go-modules).

### Initiate the go modules

```go
go mod init colorcli
```

This will create a new file `go.mod`.

Now, try again to build the binary.

```go
go install colorcli
```

The binary is generated and saved in the `$GOPATH/bin/`. Now, you can directly run the `colorcli` command without setting the environment variable.

```go
colorcli
```

Output

```go
$ colorcli
A longer description that spans multiple lines and likely contains
examples and usage of using your application. For example:

Cobra is a CLI library for Go that empowers applications.
This application is a tool to generate the needed files
to quickly create a Cobra application.

subcommand is required
```

## Hexcode Color names

We are going to use the [meodai/color-names](https://github.com/meodai/color-names) git repo. This repo has a handpicked list of 18376 unique color names from various sources and thousands of curated user submissions.

### Download the hexcode to color name json file

Open the terminal in the project directory.

```sh
curl -O https://unpkg.com/color-name-list@5.7.0/dist/colornames.min.json
```

> You can download it in other formats. [Link](https://github.com/meodai/color-names#cdn-)

---

## Create a name command in the colorcli

To add a command, we are going to use `add` command of cobra.

```go
cobra add name
```

This will create a new file `name.go` in the `cmd` folder.

Build the binary.

```go
go install colorcli
```

Run the `name` command.

```go
colorcli name
```

Output

```go
$ colorcli name
name called
```

Open the `name.go` and check the `init` function.

```go
rootCmd.AddCommand(nameCmd)
```

The `AddCommand` is adding the `nameCmd` to the `rootCmd`. In this case it is `colorcli`.

Add a new function `hexToName`.

```go
import (
    "encoding/json"
    "fmt"
    "io/ioutil"

    "github.com/spf13/cobra"
)
...
func hexToName(args []string) {
    var hexMap map[string]string

    // read the color.min.json
    content, err := ioutil.ReadFile("colornames.min.json")

    if err != nil {
        fmt.Printf("Error while reading the file %v", err)
    }
    _ = json.Unmarshal(content, &hexMap)

    name, ok := hexMap[args[0]]
    if ok {
        fmt.Printf("Name: %s, Hex: %s\n", name, args[0])
    } else {

        fmt.Println("Color name not found")
    }
}
```

We are using `ioutil` package to read the file. The file is in json format. We are using `encoding/json` package to convert the `json` into `struct` to read it. Read the full tutorial [how to use json in golang](https://codesource.io/learn-how-to-use-json-in-golang/).

Update the `nameCmd`.

```go
var nameCmd = &cobra.Command{
    Use:   "name",
    Short: "A brief description of your command",
    Long: `A longer description that spans multiple lines and likely contains examples
and usage of using your command. For example:

Cobra is a CLI library for Go that empowers applications.
This application is a tool to generate the needed files
to quickly create a Cobra application.`,
    Run: func(cmd *cobra.Command, args []string) {
        // call hexToName function
        hexToName(args)
    },
}
```

Build the binary to reflect the changes.

```go
go install colorcli
```

Run the cli.

```go
colorcli name ffffff

colorcli name fffeee
```

Output

```go
Name: White, Hex: ffffff

Color name not found
```

---

## Add a color name to the colornames.min.json

Add an `addcolor` command, to add custom or extra color to the `colornames.min.json` file.

```go
cobra add addcolor
```

Open the `addcolor.go` and add the `addColor` function.

```go
import (
    "encoding/json"
    "fmt"
    "io/ioutil"

    "github.com/spf13/cobra"
)
...

func addColor(args []string) {

    hex := args[0]
    colorName := args[1]
    // Read the file
    content, err := ioutil.ReadFile("colornames.min.json")

    if err != nil {
        fmt.Printf("Error while reading a file %v", err)
    }

    // map hex value to color name
    var hexMap map[string]string

    // unmarshal to hexMap
    _ = json.Unmarshal(content, &hexMap)

    // check if hex exist
    name, ok := hexMap[hex]

    if ok {
        fmt.Printf("Hex already exist. Color Name is :%s\n", name)
    } else {
        hexMap[hex] = colorName

        // marshal to json or convert to json
        hexJSON, _ := json.Marshal(hexMap)

        // write to colornames.min.json
        err = ioutil.WriteFile("colornames.min.json", hexJSON, 0777)

        if err != nil {
            fmt.Printf("Error while writing a file %v", err)
        }

        fmt.Println("Hex to color added successfully!")

    }
}
```

We are using `ioutil` package for updating the file. It is creating a new file instead of just updating the existing one. [Learn more](https://golang.org/pkg/io/ioutil/).

Update the `addcolorCmd`.

```go
// addcolorCmd represents the addcolor command
var addcolorCmd = &cobra.Command{
    Use:   "addcolor",
    Short: "A brief description of your command",
    Long: `A longer description that spans multiple lines and likely contains examples
and usage of using your command. For example:

Cobra is a CLI library for Go that empowers applications.
This application is a tool to generate the needed files
to quickly create a Cobra application.`,
    Run: func(cmd *cobra.Command, args []string) {
        addColor(args)
    },
}
```

Build the binary.

```go
go install colorcli
```

Add a new color. The first argument is hexcode and second is color name.

```go
colorcli addcolor fffeee lightcream
```

Output

```go
Hex to color added successfully!
```

Check the color.

```go
colorcli name fffeee
```

Output

```go
Name: lightcream, Hex: fffeee
```

> In cobra library, all the arguments are in string format. You have to explicitly convert the string into the respective type.

---

## Conclusion

Congratulations. We just created a colorcli in golang using the cobra library. There are many features you can add in it, like creating a flag to return the color in rgb format. The colorcli has a dependency on the `colornames.min.json` file. There are many free apis you can utilize to remove the dependencies.
Any suggestion is most welcome. Keep coding.

The complete code is saved in [GitHub](https://github.com/schadokar/colorcli).

---
