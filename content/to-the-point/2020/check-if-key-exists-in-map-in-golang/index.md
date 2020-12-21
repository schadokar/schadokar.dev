---
title: "Check if Key Exists in Map in Golang"
date: 2020-12-21T10:38:27+05:30
description: "Check if Key Exists in Map in Golang"
categories: ["Golang", "2020", "to-the-point"]
tags: ["golang"]
cover: https://schadokar.dev/images/golang-basic.png #image show on top
readingTime: true # show reading time after article date
toc: true
comments: true
published: true
---

## Map

Map is a data structure which implements a hash table.

Map is a simple key-value storage. Map offers fast lookups, adds and deletes.

## Zero Value Table

Map don't explicitly check if a key is created or not, instead if a key doesn't exists it returns the default value of value type.

Data type and their Default Value

| Type                     | Default Value     |
| ------------------------ | ----------------- |
| Numeric type(int, float) | 0                 |
| Boolean                  | false             |
| String                   | "" (empty string) |

For Ex.

```go
package main

import "fmt"

func main() {
	m1 := map[string]int{
		"a": 1}
	m2 := map[string]bool{
		"a": true,
	}

	fmt.Printf("Value of key 'a' is %v\nValue of key 'b' is %v\n", m1["a"], m1["b"])
	fmt.Printf("Value of key 'a' is %v\nValue of key 'b' is %v\n", m2["a"], m2["b"])
}
```

**Output**

```go
Value of key 'a' is 1
Value of key 'b' is 0
Value of key 'a' is true
Value of key 'b' is false
```

## Check if key exist in a map or not

When value of the key is retrived from the map, it also returns a boolean value.

It is a widely used practice in golang to name `ok` to the boolean argument.

```go
package main

import "fmt"

func main() {
	m1 := map[string]int{
		"a": 1,
		"b": 2,
	}

	value, ok := m1["a"]

	fmt.Printf("Key 'a' exists %v and its value is %v\n", ok, value)

	_, ok = m1["c"]

	fmt.Printf("Key 'c' exists %v\n", ok)
}
```

**Output**

```go
Key 'a' exists true and its value is 1
Key 'c' exists false
```

## Final Words

Map is a very powerful data structure. If order is not required then prefer map to array.

---
