---
title: "Convert Hexadecimal to Decimal and Decimal to Hexadecimal in Golang"
date: 2020-12-17T22:58:00+05:30
description: "Convert Hexadecimal to Decimal and Decimal to Hexadecimal"
categories: ["Golang", "2020", "to-the-point"]
tags: ["conversion", "golang"]
cover: https://schadokar.dev/images/golang-basic.png #image show on top
readingTime: true # show reading time after article date
toc: true
comments: true
---

## Decimal Number System

Decimal number system is the standard system for denoting integers and non-integers numbers.  
This is also known as **base 10** number system.

```
0 1 2 3 4 5 6 7 8 9
```

## Hexadecimal Number System

Hexadecimal (mostly used as **hex**) number system use 16 symbols. It is known as **base 16** number system, where 10 symbols are same as decimal and value greater than 9 represent as A=10, B=11, C=12, D=13, E=14, F=15.

```
0 1 2 3 4 5 6 7 8 9 A B C D E F
```

## Convert Hexadecimal to Decimal

Golang package `strconv` provides `ParseInt` and `ParseUint` to convert the string to the number in the respective base.
Hexadecimal numbers are commonly use `0x` or `0X` in front of the number. It is only to avoid confusion.

**Syntax**

```go
func ParseInt(s string, base int, bitSize int) (i int64, err error)
```

```go
package main

import (
	"fmt"
	"strconv"
)

func main() {
	hexa := "F1"

	decimal, err := strconv.ParseInt(hexa, 16, 32)

	if err != nil {
		fmt.Println(err)
	}

	fmt.Printf("Hexadecimal %s (base16) = Decimal %v (base10)", hexa, decimal)
}
```

**Output**

```go
Hexadecimal F1 (base16) = Decimal 241 (base10)
```

> The `ParseUint` is same as `ParseInt` but it takes only unsigned integers.
> To remove the `0x` or `0X` from the hex number, you can use slices.

```go
hexa := "0xfc"
hexa = hexa[2:]
```

## Convert Decimal to Hexadecimal

The same `strconv` package provides `FormatInt` and `FormatUint` to convert the decimal number to a respective base number.

```go
package main

import (
	"fmt"
	"strconv"
)

func main() {
	var decimal int64 = 252

	hexa := strconv.FormatInt(decimal, 16)

	fmt.Printf("Decimal %v (base10) = Hexadecimal %s (base16)", decimal, hexa)
}
```

> The `FormatUint` is same as `FormatInt` but it takes only unsigned integers.

---

For negative numbers use `-` minus sign.

---
