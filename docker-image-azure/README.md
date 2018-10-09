# Azure CLI

> Azure command line has a Docker image

### How to use this image

At first time run you need to create all login files, to do this please run the command bellow:

```sh
docker run \
    -it \
    --rm \
    --privileged \
    -v $HOME/.ssh:/root/.ssh \
    -v $HOME/.azure:/root/.azure \
    -v $HOME/.docker:/root/.docker \
    -v /var/run/docker.sock:/var/run/docker.sock \
    jaschweder/azure \
    bash
```

This will create a new container and run `bash` inside of it, you need to run this two other commands to generate your authentication files.

Login at Azure:

```
az login
```

Login at Azure ACR:

```
az acr login --name <your-registry>
```

This will generate some files that are stored in `~/.docker` and `~/.azure`, this files will be saved at your local machine because of the volumes binds.

After doind this you can add this script to the end of your `~/.bashrc` file.

```sh
function azdocker() {
    docker run \
        -it \
        --rm \
        --privileged \
        -v $HOME/.ssh:/root/.ssh \
        -v $HOME/.azure:/root/.azure \
        -v $HOME/.docker:/root/.docker \
        -v /var/run/docker.sock:/var/run/docker.sock \
        jaschweder/azure \
        docker \
        "$@"
}
```

Then reload your `.bashrc` file.

```sh
. ~/.bashrc
```

Now you can run `azdocker` to access remote azure command. Really awesome!!!

```sh
azdocker pull <your-registry>/<some-image>
```

#### Maintainer

Jonathan A. Schweder <jonathanschweder@gmail.com>
