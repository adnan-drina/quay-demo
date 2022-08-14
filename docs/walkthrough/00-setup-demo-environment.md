### Setup demo environment

Before we can use our walkthrough demo scripts, we'll have to configure a few things. 
The complete setup process is scripted using a very basic bash script. All you have to do is clone our GitHub repo, login to your OpenShift cluster with a fresh running instance of Quay and run this script.

```
$ oc login
$ git clone https://github.com/adnan-drina/quay-demo.git
$ cd quay-demo
$ ./0-setup-env.sh
```

The [0-setup-env.sh](../0-set-env.sh) script will create a Quay demo user, all needed repositories and accounts used during the walkthrough. All user details are stored in ~/.quay-demo.env and sourced before each step in our walkthrough.
