---
title: "How to Join Strings in Golang?"
date: 2020-02-27T19:46:51+05:30
description: "There are multiple ways to join or concat strings in the golang."
categories: ["2-the-point", "to-the-point"]
tags: ["golang", "strings"]
published: true
---

There are multiple ways to join or concat strings in the golang. 

Let's start with the easy one.

## Using the + operator 🔧

```go
package main

import (
	"fmt"
)

func main() {
	str1 := "Hello"
	// there is a space before World
	str2 := " World!"

	fmt.Println(str1 + str2)
}
```
Output
```go
Hello World!
```
---

## Using Sprint, Sprintf, Sprintln 🛠 

The [fmt](https://golang.org/pkg/fmt/) package has [Sprint](https://golang.org/pkg/fmt/#Sprint), [Sprintf](https://golang.org/pkg/fmt/#Sprintf) and [Sprintln](https://golang.org/pkg/fmt/#Sprintln) function which can format the strings using the default or custom formats.

All the `Sprint` function are variadic functions.

> [Variadic functions](https://medium.com/rungo/variadic-function-in-go-5d9b23f4c01a) can be called with any number of trailing arguments. 

### Sprint

`Sprint` formats using the default formats and returns the resulting string. 

`Sprint` accepts an empty interface. It means it can take n elements of any type.  
If no element of type string is passed then the resulting string will add a Space between the elements.

```go
package main

import (
	"fmt"
)

func main() {
	num := 26

	str := "Feb"

	boolean := true

	withStr := fmt.Sprint(num, str, boolean)

	fmt.Println("With string: ", withStr)

	withOutStr := fmt.Sprint(num, boolean)

	fmt.Println("Without string: ", withOutStr)
}

```

Output
```
With string:  26Febtrue
Without string:  26 true
```

### Sprintf
`Sprintf` formats according to a format specifier and returns the resulting string.

**Format Specifiers**  
```
%v	the value in a default format
%s	the uninterpreted bytes of the string or slice
```
Check all the [available format specifier](https://golang.org/pkg/fmt/#hdr-Printing) in the `fmt` package.

> You can use the `Sprintf` function to create the `connection string` of the DB.

For the example we will create a ***Postgres Connection URL***.

> Connection URL format: **postgres://username:password@hostname/databasename**

```go
package main

import (
	"fmt"
)

func main() {

	dbname := "testdb"

	username := "admin"

	password := "test1234"

	hostname := "localhost"

	connectionURL := fmt.Sprintf("postgres://%s:%s@%v/%v", username, password, hostname, dbname)

	fmt.Println(connectionURL)
}
```

Output
```
postgres://admin:test1234@localhost/testdb
```
### Sprintln

`Sprintln` formats the elements or arguments using the default formats. Spaces are added between the elements and a new line is added in the end.

```go
package main

import (
	"fmt"
)

func main() {

	str1 := "Hello"
	str2 := "Gophers!"

	msg := fmt.Sprintln(str1, str2)

	fmt.Println(msg)
}
```
Output
```
Hello Gophers!
```

---

## Using the Join function  🔩 

The golang standard library has provided a  [Join](https://golang.org/pkg/strings/#Join) function in the [strings](https://golang.org/pkg/strings/) package. 

The `Join` function takes an array of strings and a separator to join them.

```go
func Join(elems []string, sep string) string
```
The example has an array of weekdays. The `Join` function will return a string of weekdays separated by `, `.

> Using `Join` you can convert an array of string to a string.

```go
package main

import (
	"fmt"
	"strings"
)

func main() {
	weekdays := []string{"Monday", "Tuesday", "Wednesday", "Thursday", "Friday"}
	// there is a space after comma
	fmt.Println(strings.Join(weekdays, ", "))
}
```
Output
```
Monday, Tuesday, Wednesday, Thursday, Friday
```
---