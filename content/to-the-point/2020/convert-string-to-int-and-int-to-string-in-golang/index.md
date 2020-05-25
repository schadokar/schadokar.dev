---
title: "Convert String to Int and Int to String in Golang"
date: 2020-03-03T08:25:25+05:30
description: "Strconv package comes with 2 handy functions Atoi and Itoa"
categories: ["Tutorial", "to-the-point", Golang]
tags: ["golang", "to-the-point"]
cover: https://schadokar.dev/images/golang-basic.png
published: true
---

Golang standard library has provided 2 functions [Atoi](https://golang.org/pkg/strconv/#Atoi) and [Itoa](https://golang.org/pkg/strconv/#Itoa) to convert string to int and int to string respectively.

These 2 functions placed inside the [strconv](https://golang.org/pkg/strconv/) package.

> Package strconv implements conversions to and from string representations of basic data types.

## String to Int

The `strconv.Atoi` function takes a string and returns an int and an error.

```
func Atoi(s string) (int, error)
```

It will return type `int` and type `int` is system dependent. It is 32 bits on the 32-bit system and 64 bits on the 64-bit system.

>  💡 Use the term ASCII to Int to remember the func name.

```
package main

import (
	"fmt"
	"strconv"
)

func main() {

	str := "1234"

	i, err := strconv.Atoi(str)

	if err != nil {
		fmt.Println(err)
	}

	fmt.Printf("Type: %T, Value: %v\n", i, i)

	// convert int to int64
	i64 := int64(i)
	fmt.Printf("Type: %T, Value: %v", i64, i64)
}
```
Output
```
Type: int, Value: 1234
Type: int64, Value: 1234
```

## Int to String

The `strconv.Itoa` takes `int` as an argument and returns the `string`.

```
func Itoa(i int) string
````

Example:

```
package main

import (
	"fmt"
	"strconv"
)

func main() {
	num := 322020

	str := strconv.Itoa(num)

	fmt.Printf("Type: %T, Value: %v", str, str)
}
```
Output

```
Type: string, Value: 322020
```

