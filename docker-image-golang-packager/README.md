# Packager
> Packager for Go projects

# Prerequisites

 - Docker >= 18.06
 
# How to use

```bash
$ docker run --rm -v $PWD:/go/src/github.com/user/project -w /go/src/github.com/user/project jaschweder/golang-packager project
```

This will generate a folder 'build' with '.tar.gz', '.zip', '.deb' files

## Maintainer

Jonathan A. Schweder <jonathanschweder@gmail.com>

## License

See [LICENSE](./LICENSE) file
