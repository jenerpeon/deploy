tcos-dev
========

container for developing tcos packages


requirements
============

- docker

installation
============

- clone the git repo to "$some_place"
- cd "$some_place"
- docker build -t tcos-dev:1.0 .


add the following snippet to your shell profile (e.g. .bashrc or .zshrc)
```
function D() {
        docker run \
        --user="$USER" \
        --rm \
        -it \
        --hostname="$(hostname)[D]" \
        -v $HOME:$HOME \
        -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
        -e DISPLAY=unix:0 \
        -v /etc/passwd:/etc/passwd \
        -v /var/www/openthinclient:/var/www/openthinclient \
        -v /var/www/openthinclient-upstream:/var/www/openthinclient-upstream \
        -v $SSH_AUTH_SOCK:$SSH_AUTH_SOCK \
        -e SSH_AUTH_SOCK=$SSH_AUTH_SOCK \
        -e PS1=$PS1 \
        -e LS_COLORS=$LS_COLORS \
        --workdir $(pwd) \
        tcos-dev:1.0 "$SHELL"
}
```

From now on hit "D" and <Enter> in your shell environment and swith instantaneously to your docker set-up"
