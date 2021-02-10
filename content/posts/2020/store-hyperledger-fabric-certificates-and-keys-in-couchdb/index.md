---
title: "Store Hyperledger Fabric certificates and keys in CouchDB"
date: 2020-02-08T10:02:42+05:30
description: "Hyperledger Fabric is all about permissions. These permissions are provided in a form of certificates and keys."
tags: ["hyperledger-fabric", "couchdb", "tutorial"]
categories: ["Tutorial", "Blockchain"]
cover: cover-pic.jpg
published: true
---

Photo by [Micah Williams](https://unsplash.com/@mr_williams_photography?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) on [Unsplash](https://unsplash.com/s/photos/safe?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText)

Hyperledger Fabric is all about permissions. These permissions are provided in the form of
certificates and keys. In broad term, it is known as [Identities](https://hyperledger-fabric.readthedocs.io/en/latest/identity/identity.html).

When an application interacts with the Hyperledger Fabric Network, it uses this identity to authenticate itself. Fabric network validates the identity and authorizes the application to interact.

In short, identities are very important and if you don't save them properly, then it may turn into a headache. :weary:

## Where can I store the Identities? :briefcase:

In Hyperledger Fabric, this storage is known as [**_Wallet_**](https://hyperledger-fabric.readthedocs.io/en/latest/developapps/wallet.html).

There are three types of wallet:

- #### _File System_
  This is a simple folder. A local storage wallet. It is a good default choice for wallets. In `fabric-samples/balance-transfer`, the `file system` is the default wallet. When you run the `balance-transfer` it creates a `fabric-client-kv-orgName` folder and saves all the identities in it. This configuration is defined in the `orgname.yaml` [link](https://github.com/hyperledger/fabric-samples/blob/release-1.4/balance-transfer/artifacts/org1.yaml).
- #### _In-Memory_
  A wallet in application storage. Use this type of wallet when your application is running in a constrained environment without access to a file system; typically a web browser. It’s worth remembering that this type of wallet is volatile; identities will be lost after the application ends normally or crashes. - [Documentation](https://hyperledger-fabric.readthedocs.io/en/latest/developapps/wallet.html#types)
- #### _CouchDB_
  Using couchdb as a wallet. This option is best for production.

---

In this tutorial, we will configure the `CouchDB` as the Wallet. 👨🏻‍💻

> _For the demonstration, I am using `Fabric Node SDK` and `fabric/samples/balance-transfer`._

The wallet uses 2 stores to save the certificates and keys:

#### 1. State Store:

The state store is used to store the certificates of the enrolled identity. It stores the basic information of the identity:

```json
{
  "name": "test",
  "mspid": "org1",
  "roles": null,
  "affiliation": "",
  "enrollmentSecret": "<ENROLLMENT_SECRET>",
  "enrollment": {
    "signingIdentity": "<PRIVATE_KEY_NAME>",
    "identity": {
      "certificate": "<SIGN_CERT>"
    }
  }
}
```

> ❗️ _Note: The signingIdentity is the pointer or the address of the private and public key stored in the crypto-store._

#### 2. Crypto Store:

The crypto store is used to store the public and private key of the identity.

---

To configure the couchdb as wallet:

#### Step 1

Import the `CouchDBKeyValueStore` library, which is provided by the `Node SDK`.

```js
const CDBKVS = require("fabric-client/lib/impl/CouchDBKeyValueStore.js");
```

> _Do read the [`CouchDBKeyValueStore.js`](https://github.com/hyperledger/fabric-sdk-node/blob/release-1.4/fabric-client/lib/impl/CouchDBKeyValueStore.js) it is worth reading._

#### Step 2

Set the `state store`.

```js
let stateStore = await new CDBKVS({
  url: "https://<USERNAME>:<PASSWORD>@<URL>",
  name: "<DB_NAME>"
});

const Client = require("fabric-client");

const client = Client.loadFromConfig("path of network.yaml");

client.setStateStore(stateStore);
```

- `<USERNAME>` is the username of the couchdb.
- `<PASSWORD>` is the password of the couchdb.
- `<URL>` is the couchdb URL.
- `<DB_NAME>` (OPTIONAL) is the dbname to use as state store. The default dbname is `userdb`. It creates the DB if it doesn't exist.

> **_[Client](https://hyperledger.github.io/fabric-sdk-node/release-1.4/Client.html) is the interface between the user and the fabric network._**

#### Step 3

Set the `crypto store`.

```js
const cryptoSuite = Client.newCryptoSuite();

let cryptoKS = Client.newCryptoKeyStore(CDBKVS, {
  url: "https://<USERNAME>:<PASSWORD>@<URL>",
  name: "<DB_NAME>"
});

cryptoSuite.setCryptoKeyStore(cryptoKS);

client.setCryptoSuite(cryptoSuite);
```

You have to update the client according to the above steps to make it use the couchdb.  
In the next section, we'll implement the above steps in the `balance-transfer` fabric sample.

---

## Implementation of CouchDB in Balance Transfer

I am using the [balance transfer](https://github.com/hyperledger/fabric-samples/blob/release-1.4/balance-transfer) fabric sample as a reference.

> _I am assuming that you know how to run the balance transfer._

### Start the balance transfer network

Follow the balance transfer instructions to start the network.

It will start the network with:

- 2 CAs
- A SOLO Orderer
- 4 peers (2 peers per Org)

### Start a couchdb for the wallet

This step is optional if you're using the cloud based couchdb.

**Docker-based Couchdb**

```
docker run --name couch-userdb -e COUCHDB_USER=admin -e COUCHDB_PASSWORD=password -p 5984:5984 -d couchdb
```

Above command will pull the docker image of the `couchdb` from the docker hub if it doesn't exist.

##### CouchDB Details:

- Container Name: couch-userdb
- CouchDB Username: admin
- CouchDB Password: password
- URL: localhost:5984

The CouchDB connection URL is

```
https://<USERNAME>:<PASSWORD>@<URL>

https://admin:password@localhost:5984
```

### Update the client in the balance-transfer

Open the `app/helper.js` and update the `getClientForOrg`.

In the below code, we just replaced `await client.initCredentialStores();` with the above couchdb config steps.

{{< gist schadokar 004b87e24a52f7260bd7cad252353cbb >}}

The changes we made,

- **_Line 13:_** Import the `CouchDBKeyValueStore`. Step 1 from above.
- **_Line 31-52:_** Set the state store and crypto store. Step 2 & 3.

There is a minor change in the above code.

```js
// Client variable is used as hfc
var hfc = require("fabric-client");

// Instead of Client
const Client = require("fabric-client");
```

**_It is not necessary that db(dbname) of state store and crypto store is the same. Both the stores can have their separate dbs. It depends on the requirement. You can have state store and crypto store db as `orgName-state-store` and `orgName-crypto-store` respectively._**

**_Each organization must have their state-store and crypto-store db, else it will throw the Authentication Error._**

```
Error: fabric-ca request register failed with errors [[{"code":20,"message":"Authentication failure"}]]
```

### Register a new user in the balance transfer

Once you register a user, you can check the state-store and crypto-store using the couchdb apis.

##### For Example: Register a user

I used the below arguments to register a user. For `org1`, I used the same db `org1db` for both `state-store` and `crypto-store`.

- Name: alice
- Org: org1
- DBNAME: org1db
- CouchDB URL: http://admin:password@localhost:5369

Open the browser, go to `http://localhost:5369/org1db/_all_docs`. It returns all the docs saved in the `org1db`.

![](./asset1.PNG)

The indexes `0, 1, 2` are the certificates of the `admin`.

The index `3` is the `alice` certificate stored in the `state-store`.  
The indexes `4-5` are the `alice`'s public and private keys stored in the `crypto-store`.

Go to `http://localhost:5369/org1db/alice`.
It returns all the details of the `alice` stored in the state store.

![](./asset2.PNG)

Check the `signingIdentity`.

```
"signingIdentity":"d37a97a8c2377c21537801ec1a929d81905ae57963a2f6c8ba0308931a7fc791"
```

Now, check the id of the indexes `4 & 5` in the above image. Both are same.

If you remember, `signingIdentity` field is a reference of the private and public keys of the identity stored in the crypto store.

### Conclusion

CouchDB wallet is a great choice for a production use case. You can try with other dbs but in that case, you have to write the library accordingly like `CouchDBKeyValueStore.js`.

---

Below are the references I found helpful.  
If you find any resource which you think can be added here, don't feel shy to share. :wink:

---

## References :pushpin:

- https://developer.ibm.com/tutorials/store-fabric-certificates-keys-ibm-cloudant-fabric-node-sdk/
- https://stackoverflow.com/questions/53639061/hyperledger-fabric-what-is-the-difference-between-state-store-and-crypto-store
- https://stackoverflow.com/questions/54305378/hyperledger-fabric-client-credential-store-using-couchdb
- https://stackoverflow.com/questions/58371858/hyperledger-fabric-client-credential-store-using-couchdbcouchdbkeyvaluestore

---
