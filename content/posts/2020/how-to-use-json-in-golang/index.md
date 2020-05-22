---
title: "How to Use Json in Golang?"
date: 2020-03-23T11:23:56+05:30
description: "In this tutorial we'll learn how to use json in golang."
categories: ["Tutorial", "Golang"]
tags: ["golang", "json"]
cover: /images/golang-basic.png
published: true
---

When you start a project which interacts with the outer world, it requires data exchange. 
To make a project successful this interaction must be simple and efficient. 

### What is Data Exchange?

> **Data exchange** is the process of taking data structured under a source schema and transforming it into data structured under a target schema, so that the target data is an accurate representation of the source data. - [Wikipedia](https://en.wikipedia.org/wiki/Data_exchange)

In simple terms, convert the data in the format which the receiver understands.

There are many data exchange formats like XML, JSON, HTML, CSV etc. Among all, JSON has become ubiquitous for web applications.

> Originally published on [codesource.io](https://codesource.io/learn-how-to-use-json-in-golang/).

### What is JSON?

**JSON (JavaScript Object Notation) is a lightweight format that is used for data interchanging.** It is based on a subset of Javascript language. An object is an unordered set of name/value pairs.

An Example of JSON
```json
{
    "title": "How to use JSON in golang?",
    "type": "Tutorial",
    "publisher": "codesource.io",
    "tags": [ "golang", "json" ],
    "published": true    
}
```
---
Now, we know what is JSON. It is time to use it with golang.
In this tutorial, we will explore different golang types like string, int, struct, array, slice, maps.

## Parse JSON in Golang ⚙️ 

JSON is JavaScript Object Notation and golang can't use it in its original format.
For this, golang has provided an `encoding/json` package in the [standard library](https://golang.org/pkg/encoding/json/).

In golang, we use `struct` to represent `json`.

For example:
In golang
```go
type Employer struct {
    Name string
    Employee []int
}
```
In JSON
```json
{
    "name": "string",
    "employee": []
}
```

We will use `encode/json` package to convert `json` into `struct` and `struct` into `json`. For this we will use 2 functions:

1. Marshal (Encode) : Convert golang `struct` into `json` format.
2. Unmarshal (Decode): Convert `json` into golang `struct`

It is more like mapping the parameters than conversion. The default Go types for decoding and encoding JSON are

- bool for JSON boolean
- string for JSON string
- int/float64 for JSON number
- nil for JSON null

### Encode (Marshal) 👨‍💻 

To encode JSON data we use the [Marshal](https://golang.org/pkg/encoding/json/#Marshal) function.

```go
func Marshal(v interface{}) ([]byte, error)
```

Marshal function accepts an empty interface and returns an array of byte and error message.

```go
package main

import (
    "encoding/json"
    "fmt"
    "log"
)

func main() {
    type Person struct {
        Name     string
        Age      int64
        Location string
    }

    person := Person{
        "Jon", 27, "London",
    }

    // encode into JSON
    b, err := json.Marshal(person)

    if err != nil {
        log.Fatalf("Unable to encode")
    }

    // Marshal returns []byte

    fmt.Println(string(b))
}
```
[Try It](https://play.golang.org/p/a7GJlbd_Ddq)

Output
```json
{"Name":"Jon","Age":27,"Location":"London"}
```

We are encoding `Person` struct in JSON format. First, create a new object of `Person` as `person`. 
Then, encode the `person` in JSON using `json.Marshal`.
If everything goes well, then the `err` will be `nil` and `b` is the representation of `person` in `[]byte` format.

Only data structures that can be represented as valid JSON will be encoded: 
- JSON objects only support strings as keys; to encode a Go map type it must be of the form map[string]T (where T is any Go type supported by the json package).
- Only the exported fields (those that begin with an uppercase letter) of the struct can be encoded in JSON.
- Cyclic data structures are not supported; they will cause Marshal to go into an infinite loop.
- Pointers will be encoded as the values they point to (or 'null' if the pointer is nil).

> In golang Uppercase represent that a field is exported or public.

Take a look at the `Person` struct,
```go
type Person struct {
        Name     string
        Age      int64
        Location string
    }
```

Change the `Location` field to lowercase `location`.
```go
type Person struct {
        Name     string
        Age      int64
        location string
    }
```
[Try it](https://play.golang.org/p/BEtHJkVw6ca)

Output
```json
{"Name":"Jon","Age":27}
```

#### To map the struct field to the `json` tag.

For example, you have `struct` field as `Name` but you want to map it as `firstName` in `json`. 
To do this, you can tag the struct field.

Syntax
```go
FieldName type `json:"tagname"`
```
> ⚠️ Don't give any space between `json:"tagname"`, else it will throw an error.
> `struct field tag  json: "firstName" not compatible with reflect.StructTag.Get: bad syntax for struct tag value`

Tag the `Name` field as `firstName`.
```go
type Person struct {
        Name     string `json:"firstName"`
        Age      int64
        Location string
    }
```
[Try it](https://play.golang.org/p/f32foy7ULIC)


Output
```json
{"firstName":"Jon","Age":27,"Location":"London"}
```

### Omitempty
We have a special json tag as `omitempty`. If a field is set as `omitempty` then it will not encode that field to json if it is empty.

For example, set `Location` field as `omitempty`.
```go
type Person struct {
        Name     string `json:"firstName"`
        Age      int64
        Location string `json:"location, omitempty"`
    }

person := Person{
		Name: "Jon", 
		Age: 27,
	}
```
[Try it](https://play.golang.org/p/29npD-Qv96E)

Output
```
{"firstName":"Jon","Age":27}
```
---

### Decode (Unmarshal) 👨‍💻 

To decode JSON data we use the [Unmarshal](https://golang.org/pkg/encoding/json/#Unmarshal) function.
```go
func Unmarshal(data []byte, v interface{}) error
```

Unmarshal accepts an array of byte and an interface and returns the error message. This interface is the struct to which the JSON decode.

```go
package main

import (
    "encoding/json"
    "fmt"
    "log"
)

func main() {
    type Person struct {
        Name     string
        Age      int64
        Location string
    }

    j := []byte(`{"name":"Jon","age":27,"location":"London"}`)

    var p Person

    err := json.Unmarshal(j, &p)

    if err != nil {
        log.Fatalf("Unable to decode the json")
    }
    
    fmt.Println(p)
}
```

[Try it](https://play.golang.org/p/k25DaMXEQLD)

Output
```
{Jon 27 London}
```
> To store the decoded data in the struct, `Unmarshal` will look the json **case-insensitive** keys in the exported struct fields. As in the above case, `name` is in lowercase and is mapped to the exported `Name` field.

Similar, to encoding you can add json tag to the struct field. 
For example:

Tag the `Name` field with `json:"firstName"`. Now, it will map `firstName` to the `Name`.
```go
type Person struct {
        Name     string `json:"firstName"`
        Age      int64
        Location string
    }
```

[Try it](https://play.golang.org/p/0m7vo90yM8H)

---

## Decoding the arbitrary JSON  👨‍💻 

In the above examples, we knew the JSON structure and we mapped it to the struct.

**What if you don't know the JSON structure?** 🤔 

In the json all the keys must be `string`. It means we can use the `map` type for arbitrary data.  

The `encoding/json` package uses 
- `map[string]interface{}` to store the arbitrary JSON objects 
- `[]interface{}`  to store the arbitrary JSON arrays.  

In `map[string]interface{}` the keys are `string` and values are `interface{}`. It is an empty interface. The `interface{}` (empty interface) type describes an interface with zero methods. In short, it can accept all the types. 

The default Go types are:
- bool for JSON booleans,
- float64 for JSON numbers,
- string for JSON strings, and
- nil for JSON null.

Consider the JSON object as
```json
{
    "name": "Jon",
    "location": {
        "country": "England",
        "city": "London"
    },
    "hobbies": [ "photography", "writing"]
}
```
The `Unmarshal` function will parse it into a map whose keys are string and values are empty interface.
```go
map[string]interface{} {
    "Name": "Jon",
    "Location": map[string]interface{} {
        "Country": "England",
        "City": "London",
    },
    "Hobbies": []interface{} {
        "photography",
        "writing",
    },
}
```
All the values are of type `interface{}`. To access the underlying type of interface, we have to use **type assertion**.

For example: 
```go
var name interface{}
name = "Jon"

result := name.(string)
fmt.PrintF("Type is %T, value is %s", result, result") 
```
[Try it](https://play.golang.org/p/Vd6zPbtj_9T)

```go
package main

import (
    "encoding/json"
    "fmt"
    "log"
)

func main() {

    jsonObj := `{
                "name": "Jon",
            "age" : 27,
                "location": {
                        "country": "England",
                  "city": "London"
                },
               "hobbies": [ "photography", "writing"]
        }`

    var person map[string]interface{}

    err := json.Unmarshal([]byte(jsonObj), &person)

    if err != nil {
        log.Fatalf("Unable to encode")
    }

    for k, v := range person {
        switch v := v.(type) {
        case string:
            fmt.Println(k, v)
        case float64:
            fmt.Println(k, v)
        case map[string]interface{}:
            for i, ival := range v {
                fmt.Println(i, ival)
            }
        case []interface{}:
            for i, ival := range v {
                fmt.Println(i, ival)
            }
        default:
            fmt.Println(k, v)
        }
    }
}
```
[Try it](https://play.golang.org/p/eadXK7Kstkw)

Output
```
country England
city London
0 photography
1 writing
name Jon
age 27
```
> Map is not indexed, so the order will always be different.

---

## Streaming Encoders and Decoders

The `encoding/json` provides `Decoder` and `Encoder` types to support the common operation of reading and writing streams of JSON data.

```go
func NewDecoder(r io.Reader) *Decoder
func NewEncoder(w io.Writer) *Encoder
```

In the below example, 
- It will read the stream of JSON data from an `io.Reader`
- removes the `Age` field from each object
- writes the objects to an `io.Writer`

```go
package main

import (
	"encoding/json"
	"log"
	"os"
	"strings"
)

func main() {

	jsonStream := `{"Name":"Jon", "Age":27, "Location": "London"}
		{"Name":"Bruce", "Age":35, "Location": "Gotham"}`

	reader := strings.NewReader(jsonStream)
	writer := os.Stdout

	dec := json.NewDecoder(reader)
	enc := json.NewEncoder(writer)

	for {
		var v map[string]interface{}
		if err := dec.Decode(&v); err != nil {
			log.Println(err)
			return
		}
		for k := range v {
			if k == "Age" {
				delete(v, k)
			}
		}
		if err := enc.Encode(&v); err != nil {
			log.Println(err)
		}
	}
}
```
[Try it](https://play.golang.org/p/N9kuKqybSox)

Output
```
{"Location":"London","Name":"Jon"}
{"Location":"Gotham","Name":"Bruce"}
2009/11/10 23:00:00 EOF
```

#### Code Walkthrough

```go
reader := strings.NewReader(jsonStream)
```
Create a type of `io.Reader` using the [strings](https://golang.org/pkg/strings/#NewReader) package. 

```go
dec := json.NewDecoder(reader)
enc := json.NewEncoder(writer)
```

Create a new decoder which reads the data from the `reader`. 
Create a new encoder which writes the data to the `writer`.

Rest of the code is self-explanatory.
Decode the arbitrary json in `map[string]interface{}`.

---

## Conclusion
In this tutorial, we explored the `json` package. There are many other amazing functions provided by the `encoding/json`. Like `MarshalIndent`, it will indent the encoded `json`. Please check out the official website to [learn more](https://golang.org/pkg/encoding/json/). 

---
