# Îagûara


## Dependencies

- [Make](https://www.gnu.org/software/make/manual/html_node/index.html)
- [Docker](https://docs.docker.com/install/)


## Install

Clone this repository and insert the code below into your `.bashrc` or `.zshrc`.

```shell
export IAGUARA_HOME="$HOME/.iaguara"
[ -s "$IAGUARA_HOME/iaguara.sh" ] && \. $IAGUARA_HOME/iaguara.sh
```


## Use

### Build

```shell
iaguara build
```

### Run project

```shell
iaguara run
```

### Start ssh

```shell
GITHUB_USERS="user1 user2 userN" iaguara run start
```

### Stop container

```shell
iaguara stop
```

### Remove image

```shell
iaguara remove
```

### List all Îagûara images & containers

```shell
iaguara ls
```
