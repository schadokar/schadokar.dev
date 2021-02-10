---
title: "Convert Byte to Hex and Hex to Byte in Golang"
date: 2020-07-18T13:33:52+05:30
description: "Conversion between byte array to hex string and hex string to byte array."
categories: ["Tutorial", "to-the-point", "2020", "Golang"]
tags: ["golang", "to-the-point", "conversion"]
cover: https://schadokar.dev/images/golang-basic.png #image show on top
readingTime: true # show reading time after article date
comments: true
published: true
---

In this post of **_to-the-point_** series, we will convert a hex string to a byte array and vice-versa. For this, we're going to use the `encoding/hex` package provided by the golang. Package `hex` implements hexadecimal encoding and decoding.

# byte array to hex string

To convert a byte array to hex string, we will encode the byte array to the hexadecimal string.

### Syntax

```go
func EncodeToString(src []byte) string
```

First we will convert a string to a byte array.

```go
package main

import (
	"encoding/hex"
	"fmt"
)

func main() {
	byteArray := []byte("Learn Go!")
	fmt.Println("byteArray: ", byteArray)

	encodedString := hex.EncodeToString(byteArray)

	fmt.Println("Encoded Hex String: ", encodedString)
}
```

**Output**

```go
byteArray: [76 101 97 114 110 32 71 111 33]
Encoded Hex String: 4c6561726e20476f21
```

[Try it](https://play.golang.org/p/z9TmK3KoBGy)

# hex string to byte array

To convert hex string to byte array, we will decode the encoded hex string.

### Syntax

```go
func DecodeString(s string) ([]byte, error)
```

We are going to use the same hex string from above.

```go
package main

import (
	"encoding/hex"
	"fmt"
)

func main() {
	hexString := "4c6561726e20476f21"

	fmt.Println("Hex String: ", hexString)

	decodedByteArray, err := hex.DecodeString(hexString)

	if err != nil {
		fmt.Println("Unable to convert hex to byte. ", err)
	}

	fmt.Printf("Decoded Byte Array: %v \nDecoded String: %s", decodedByteArray, decodedByteArray)
}
```

[Try it](https://play.golang.org/p/dxuei1X-nyd)

**Output**

```go
Hex String:  4c6561726e20476f21
Decoded Byte Array: [76 101 97 114 110 32 71 111 33]
Decoded String: Learn Go!
```

---
