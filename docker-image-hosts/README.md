# Docker Hosts
> Automatic update local hosts files based on containers running

[![](https://images.microbadger.com/badges/image/jaschweder/hosts.svg)](https://microbadger.com/images/jaschweder/hosts "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/jaschweder/hosts.svg)](https://microbadger.com/images/jaschweder/hosts "Get your own version badge on microbadger.com")
[![GitHub issues](https://img.shields.io/github/issues/jaschweder/docker-image-hosts.svg)](https://github.com/jaschweder/docker-image-hosts/issues)
[![GitHub license](https://img.shields.io/github/license/jaschweder/docker-image-hosts.svg)](https://github.com/jaschweder/docker-image-hosts/blob/master/LICENSE)
[![Twitter](https://img.shields.io/twitter/url/http/github.com/jaschweder/docker-image-hosts.svg?style=social)](https://twitter.com/intent/tweet?text=Wow:&url=http%3A%2F%2Fgithub.com%2Fjaschweder%2Fdocker-image-hosts)

### Getting start

Start a new container passing your local `docker.sock` file.

```sh
$ docker run -d --privileged -v /var/run/docker.sock:/var/run/docker.sock -v /etc/hosts:/etc/hosts jaschweder/hosts
```

Now start any container with a `VIRTUAL_HOST` environment variable, see an example:

```sh
$ docker run -d -e VIRTUAL_HOST=app.local nginx
```

Then open your browser and access the virtual host that you set in the container (for this example: `http://app.local`)

That's it, now your hosts file is automaticaly updated each time you create a new container.

### Contribute

Any contribution is welcome, please fork the project and send pull request's.

### Maintainer

Jonathan A. Schweder <jonathanschweder@gmail.com>
