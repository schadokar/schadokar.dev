---
title: "How to Read and Write a File in Golang?"
date: 2020-03-24T11:13:24+05:30
description: "In this tutorial, we will learn how to read and write files in the file system using the `io/ioutil` package."
categories: ["Tutorial", "to-the-point", "Golang"]
tags: ["golang","to-the-point"]
cover: /images/golang-basic.png
published: true
---

In this tutorial, we will learn how to read and write files in the file system using the `io/ioutil` package.

## Write a file using WriteFile

The `WriteFile` function takes 3 arguments, filename, data in a byte array, and filemode.

```go
func WriteFile(filename string, data []byte, perm os.FileMode) error
```

A FileMode represents a file's mode and permission bits. [Learn more](https://golang.org/pkg/os/#FileMode)

```go
package main

import (
    "io/ioutil"
    "log"
)

func main() {
    // create a byte array of a string
    data := []byte("Hello Gopher!")

    // write data to a hello file, with 0777 file permission
    err := ioutil.WriteFile("hello.txt", data, 0777)

    if err != nil {
        log.Fatalf("%v", err)
    }
}
```

This will create a new file `hello.txt` in the current directory.

### File mode
Most file systems have methods to assign permissions or access rights to specific users and groups of users. These permissions control the ability of the users to view, change, navigate, and execute the contents of the file system. -- [wikipedia](https://en.wikipedia.org/wiki/File_system_permissions)

A few examples of filemode number notation. 

```
0000     no permissions
0700     read, write, & execute only for owner
0770     read, write, & execute for owner and group
0777     read, write, & execute for owner, group and others
0111     execute
0222     write
0333     write & execute
0444     read
0555     read & execute
0666     read & write
0740     owner can read, write, & execute; group can only read; others have no permissions 
```
---

## Read a file using ReadFile

The `ReadFile` function reads the file by its filename and returns the file data in array of byte.

```go
func ReadFile(filename string) ([]byte, error)
```

We will read the above created `hello.txt` file. Please create a file if it is not created.

```go
package main

import (
    "fmt"
    "io/ioutil"
    "log"
)

func main() {

    // read the hello.txt
    content, err := ioutil.ReadFile("hello.txt")

    if err != nil {
        log.Fatalf("error while reading %v", err)
    }

    // convert the byte into string
    fmt.Println(string(content))
}
```
Output
```
Hello Gopher!
```
---

## Write to an existing file

### 1.  using ioutil

First using `ReadFile`, we will read the content and then we will append the new content.  

```go
package main

import (
    "io/ioutil"
    "log"
)

func main() {
    // Read the content
    content, err := ioutil.ReadFile("hello.txt")

    if err != nil {
        log.Fatalf("error while reading the file. %v", err)
    }
    
    //  new content
    newText := []byte("\nAppended text.")
    
    // append the content
    content = append(content, newText...)

    // overwrite the content of hello.txt
    err = ioutil.WriteFile("hello.txt", content, 0777)

    if err != nil {
        log.Fatalf("error while writing the file. %v", err)
    }
}
```
The 3 dots after `newText...` is a variadic argument. In simple terms it will extract all the array elements. [Learn more](https://medium.com/rungo/variadic-function-in-go-5d9b23f4c01a)

For Example:
```go
if a = [1,2,3,4]

func (a...) => func (1, 2, 3, 4)
```

### 2. using os package

Using [OpenFile](https://golang.org/pkg/os/#OpenFile) in the [os](https://golang.org/pkg/os/) package we can open the file and append the data in it.
> Package os provides a platform-independent interface to operating system functionality. 

```go
func OpenFile(name string, flag int, perm FileMode) (*File, error)
```
The [flag](https://golang.org/pkg/os/#pkg-constants) parameter defines the operation on the file. The available flags are:

```
    O_RDONLY int = syscall.O_RDONLY // open the file read-only.
    O_WRONLY int = syscall.O_WRONLY // open the file write-only.
    O_RDWR   int = syscall.O_RDWR   // open the file read-write.
    // The remaining values may be or'ed in to control behavior.
    O_APPEND int = syscall.O_APPEND // append data to the file when writing.
    O_CREATE int = syscall.O_CREAT  // create a new file if none exists.
    O_EXCL   int = syscall.O_EXCL   // used with O_CREATE, file must not exist.
    O_SYNC   int = syscall.O_SYNC   // open for synchronous I/O.
    O_TRUNC  int = syscall.O_TRUNC  // truncate regular writable file when opened.
```

Example

```go
package main

import (
    "log"
    "os"
)

func main() {
    // If the file doesn't exist, create it, or append to the file
    file, err := os.OpenFile("hello.txt", os.O_APPEND|os.O_CREATE|os.O_WRONLY, 0777)

    if err != nil {
        log.Fatalf("error while opening the file. %v", err)
    }

    // close the file once program execution complete
    defer file.Close()

    if _, err := file.Write([]byte("\nappended data")); err != nil {
        log.Fatalf("error while writing the file. %v", err)
    }
}

```

---

## Read and Write a JSON file

Reading and writing the JSON file requires to unmarshal and marshal the data respectively.

Learn more about [How to use JSON in Golang]()

We are going to create a library object and a book object. The library stores the array of books.

```go
type book struct {
    Name   string
    Author string
}

type library struct {
    Books []book
}
```

Create books and library
```go
    // create some books
    books := []book{
        {Name: "An Introduction to programming in Go", Author: "Caleb Doxsey"},
        {Name: "Go in Action", Author: "William Kennedy"},
        {Name: "The way to Go", Author: "IVO BALBAERT"},
    }

    // create the library with books
    lib := library{Books: books}
```

### Write JSON
The library is in golang struct format. To convert it JSON we need to marshal it.

```go
    // marshal to json or convert to json
    libJSON, _ := json.Marshal(lib)
```

Save it in `library.json`

```go
    // write to library.json
    err := ioutil.WriteFile("library.json", libJSON, 0777)

    if err != nil {
        log.Fatalf("Error while writing a file %v", err)
    }
```

### Read JSON
Read the `library.json`.

```go
    // Read the file
    content, err := ioutil.ReadFile("library.json")

    if err != nil {
        log.Fatalf("Error while reading a file %v", err)
    }
```

The data is in byte. Unmarshal it to access the data.

```go
    // create a new library
    var readLib library

    // unmarshal the json to library
    err = json.Unmarshal(content, &readLib)

    if err != nil {
        log.Fatalf("Error while unmarshal the content  %v", err)
    }

    // print all the books
    for i, book := range readLib.Books {

        fmt.Printf("%v| Name: %-40s | Author: %s\n", i, book.Name, book.Author)
    }
```
Output

```
0| Name: An Introduction to programming in Go     | Author: Caleb Doxsey
1| Name: Go in Action                             | Author: William Kennedy
2| Name: The way to Go                            | Author: IVO BALBAERT
```
The output is formatted because we used a little string formatting.  
In the `Printf`, we have used `%-40s`.  `40` is the width. `-` align the data to left. [Learn more](https://gobyexample.com/string-formatting) about string formatting.  

> Width is measured in units of Unicode code points, that is, runes.   
> For most values, width is the minimum number of runes to output, padding the formatted form with spaces if necessary. 

The complete code will look like this

```go
package main

import (
    "encoding/json"
    "fmt"
    "io/ioutil"
    "log"
)

type book struct {
    Name   string
    Author string
}

type library struct {
    Books []book
}

func main() {
    // create some books
    books := []book{
        {Name: "An Introduction to programming in Go", Author: "Caleb Doxsey"},
        {Name: "Go in Action", Author: "William Kennedy"},
        {Name: "The way to Go", Author: "IVO BALBAERT"},
    }

    // create the library with books
    lib := library{Books: books}

    // marshal to json or convert to json
    libJSON, _ := json.Marshal(lib)

    // write to library.json
    err := ioutil.WriteFile("library.json", libJSON, 0777)

    if err != nil {
        log.Fatalf("Error while writing a file %v", err)
    }

    // Read the file
    content, err := ioutil.ReadFile("library.json")

    if err != nil {
        log.Fatalf("Error while reading a file %v", err)
    }

    // create a new library
    var readLib library

    // unmarshal the json to library
    err = json.Unmarshal(content, &readLib)

    if err != nil {
        log.Fatalf("Error while unmarshal the content  %v", err)
    }

    // print all the books
    for i, book := range readLib.Books {

        fmt.Printf("%v| Name: %-40s | Author: %s\n", i, book.Name, book.Author)
    }

}
```

### Update the existing JSON file

We will use `ioutil` for this. First, we will read `library.json` and then we add a new book in it.

```go
package main

import (
    "encoding/json"
    "fmt"
    "io/ioutil"
    "log"
)

type book struct {
    Name   string
    Author string
}

type library struct {
    Books []book
}

func main() {

    // Read the file
    content, err := ioutil.ReadFile("library.json")

    if err != nil {
        log.Fatalf("Error while reading a file %v", err)
    }

    // create a new library
    var readLib library

    // unmarshal the json to library
    err = json.Unmarshal(content, &readLib)

    if err != nil {
        log.Fatalf("Error while unmarshal the content  %v", err)
    }

    // before update
    fmt.Println("Before Update")

    // print all the books
    for i, book := range readLib.Books {

        fmt.Printf("%v| Name: %-40s | Author: %s\n", i, book.Name, book.Author)
    }

    // Update
    newBook := book{
        Name:   "Go Web Programming",
        Author: "Sau Sheong Chang",
    }

    // append the new book
    readLib.Books = append(readLib.Books, newBook)

    // write the book
    // marshal to json or convert to json
    libJSON, err := json.Marshal(readLib)

    if err != nil {
        log.Fatalf("Error while marshal. %v", err)
    }

    // write to library.json
    err = ioutil.WriteFile("library.json", libJSON, 0777)

    if err != nil {
        log.Fatalf("Error while writing a file %v", err)
    }

    // After Update
    fmt.Println("After update")

    // Read the file
    content, err = ioutil.ReadFile("library.json")

    if err != nil {
        log.Fatalf("Error while reading a file %v", err)
    }

    // unmarshal the json to library
    err = json.Unmarshal(content, &readLib)

    if err != nil {
        log.Fatalf("Error while unmarshal the content  %v", err)
    }

    // print all the books
    for i, book := range readLib.Books {
        fmt.Printf("%v| Name: %-40s | Author: %s\n", i, book.Name, book.Author)
    }
}
```

Output 
```
Before Update
0| Name: An Introduction to programming in Go     | Author: Caleb Doxsey
1| Name: Go in Action                             | Author: William Kennedy
2| Name: The way to Go                            | Author: IVO BALBAERT

After update
0| Name: An Introduction to programming in Go     | Author: Caleb Doxsey
1| Name: Go in Action                             | Author: William Kennedy
2| Name: The way to Go                            | Author: IVO BALBAERT
3| Name: Go Web Programming                       | Author: Sau Sheong Chang
```

---

## References
- [How to use JSON in Golang?](https://schadokar.dev/posts/how-to-use-json-in-golang/)
- [Golang documentation](https://golang.org/pkg/io/ioutil/)

---