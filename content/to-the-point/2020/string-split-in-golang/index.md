---
title: "String Split in Golang"
date: 2020-12-15T10:10:29+05:30
description: "String split in golang"
categories: ["Golang", "to-the-point"]
tags: ["golang", "string"]
cover: https://schadokar.dev/images/golang-basic.png #image show on top
readingTime: true # show reading time after article date
toc: true
comments: true
published: true
---

Golang library has provided the `split` function in `strings` package to split the string by a separator and return the slice of substrings.

# Split

### Syntax

```go
func Split(s, sep string) []string
```

Split the string by separator `, `. Don't forget the white space.

```go
package main

import (
	"fmt"
	"strings"
)

func main() {
	var greeting string = "Namaste, India"

	// separate string using ', '
	arr := strings.Split(greeting, ", ")
	fmt.Println(arr)
}
```

**Output**

```go
[Namaste India]
```

[Try it](https://play.golang.org/p/IHc5ZVdz5q9)

## func SplitAfter

SplitAfter function split the string after the separator. It is useful when you want to include the sperator.

```go
var greeting string = "Namaste, India"

// separate string using ', '
arr := strings.SplitAfter(greeting, ", ")
fmt.Println(arr)
```

**Output**

```go
[Namaste,  India]
```

> There are other [Split](https://golang.org/pkg/strings/#Split) variation available in golang. Like SplitAfterN, SplitN

# func Fields

Fields split the strings by n consecutive white spaces around a string.

```go
var greeting string = "Happy                 New   Year"
// separate string using n white spaces
arr := strings.Fields(greeting)
fmt.Println(arr)
```

**Output**

```go
[Happy New Year]
```

---
