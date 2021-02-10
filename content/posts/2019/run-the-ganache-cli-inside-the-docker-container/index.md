---
title: "Run the Ganache Cli Inside the Docker Container"
date: 2019-04-01T10:03:57+05:30
description: "Connect the Metamask to ganache-cli running inside the docker container"
categories: ["Tutorial", "2019", "Blockchain"]
tags: ["tutorial", "blockchain", "ganache", "ethereum"]
cover: https://cdn-images-1.medium.com/max/1800/1*xDXuvZWGToFqqPKEBcwksg.png 
published: true
---

In this article, we’ll run the `ganache-cli` inside the docker container and
then we will connect it to the [Metamask](https://metamask.io/) and transfer some Ether from one account to another.

**Prerequisites:**

1.  Docker installed in your machine. Please check out this
[link](https://www.docker.com/get-started) and install which fits with your OS.
1.  The Metamask plugin installed to your browser. Please check out this [link](https://metamask.io/) and follow the instructions to install it.

Lets first create the project directory by name `docker-ganache`.

Inside the `docker-ganache`, create a file named `Dockerfile`.

The `Dockerfile` doesn’t require a file extension and **D** must be uppercase.

Our file structure will look like this

```sh
- docker-ganache
  - Dockerfile
```
    

`Dockerfile` is the file where we’ll define all the commands required to create a `ganache-cli` docker image.

> Docker can build images automatically by reading the instructions from a `Dockerfile`.

---

Open the Dockerfile in any editor and paste the below code

```docker
# node:alpine will be our base image to create this image
FROM node:alpine

# Set the /app directory as working directory
WORKDIR /app

# Install ganache-cli globally
RUN npm install -g ganache-cli

# Set the default command for the image
CMD ["ganache-cli", "-h", "0.0.0.0"]
```

Let’s take a dip into the code and explore what it is actually doing.

The Docker container requires Node.js installed in it to install the
`ganache-cli`.

The `node:alpine` is the base image in which the latest Node.js is
pre-installed.

> *What does alpine means?*

It is the minimum requirement needed for Node.js. It includes the required
libraries. For more information please visit this [link](https://derickbailey.com/2017/03/09/selecting-a-node-js-image-for-docker/).

The base image already has a filesystem for `node:alpine`

    app    dev    home   media  opt    root   sbin   sys    usr
    bin    etc    lib    mnt    proc   run    srv    tmp    var

The second step `WORKDIR /app` we are instructing the Dockerfile to use `/app` folder as the working directory for this image

The third step `RUN npm install -g ganache-cli` installs the `ganache-cli`
globally.

The last step `CMD ["ganache-cli","-h","0.0.0.0"]`

When this image run there must be a default command for this or else you have to manually tell what it should do.

`ganache-cli -h 0.0.0.0` is the default command for this image. When this image run it will run this default command.

> Ganache-cli’s default host is 127.0.0.1 but for docker instance it is 0.0.0.0

Please refer to this [link](https://hub.docker.com/r/trufflesuite/ganache-cli/).
for more information on `ganache-cli` flags like `-h`

*****

Lets now build the image. Open the terminal or CLI and make sure you’re in the docker-ganache directory

Run the below command to build the Dockerfile

    docker build .

Thanks to [KC Tam](https://medium.com/u/32dec75e8ca9) for suggesting to use the tag in docker build command.

    docker build -t ganache .

You can use tags for the image as image name instead of using an image ID like `7726b19a7bff` .

To learn more about image tags please visit this [link](https://docs.docker.com/engine/reference/commandline/build/).

The first time it runs, it might take some time. After it completes, you will
likely see the output similar to the image below.

![](https://cdn-images-1.medium.com/max/1200/1*6cI8NKpVxeZfRDLDv4LhbQ.png)

Your output might be slightly different than this. In my case, I have tested it
a couple of times previously so everything was saved in the cache memory.

Check the output carefully.

    Successfully built 7726b19a7bff

This is the image ID of Dockerfile what we just built. Great all the setup is
done, now let’s test it.

*****

Run the docker image and start a container

    docker run -p 8545:8545 7726b19a7bff

Or

    docker run -p 8545:8545 ganache

In my case `7726b19a7bff` is the image ID. You should run your matching ID or the image tag `ganache`.

> What is -p 8545:8545 doing here?

When ganache-cli run on 8545 port, this port is not exposed out of the
container. To access this `-p 8545:8545` flag expose the 8545 port on 8545 port.

To explain it further, take this example:


Whenever any request points to port 3000, it will redirect the request to
container’s 8545 port. It is not compulsory that the other port number has to be the same as the container.

> `--publish , -p `Publish a container’s port(s) to the host

For more information please refer to this [link](https://docs.docker.com/engine/reference/commandline/run/).

After running the command you’ll see the output like this

![](https://cdn-images-1.medium.com/max/1200/1*SpnZ8LOC0sYZoF3UAZkfMA.png)


If you see output like this then you’re on right path.

*****

Let’s connect our `ganache-cli` to Metamask. Open your browser and Metamask and select the **Localhost 8545** network.

![](https://cdn-images-1.medium.com/max/1200/1*fIkn_gha8BWay-SzYZ8XGw.png)


Metamask it now connected to `docker-ganache`.

Let’s import one account to the Metamask. Copy the private key of an account from the running ganache instance.

![](https://cdn-images-1.medium.com/max/1200/1*HjhJ4xYMgocxbN4pW-TXlQ.png)


From Metamask menu click on “Import Account”.

![](https://cdn-images-1.medium.com/max/1200/1*C5EfaJAD7fH1jLTPd2zSNA.png)


Paste the private key and import. After importing you will see 100 ETH in the
account.

![](https://cdn-images-1.medium.com/max/1200/1*Hou3-ya383e8i1J85IxSSw.png)


Let’s send some ether to another account

* Click on **Send**
* Select **Account 1** in To field
* Enter **10** in the **Amount** field
* Select **Next** and **Confirm**

Once the transaction is confirmed, check the Account 1 and Account 2.

**Account 2** is **89.9998** something. The additional missing ETH is the fee paid for the transaction.

### Conclusion

You successfully connected to the `ganache-cli` running inside the Docker container and
submitted a transaction using the Metamask.

---