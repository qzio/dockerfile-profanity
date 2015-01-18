# Profanity on debian:wheezy


## Install
Build the container:

    $ sudo docker build -t "profanity" .


Run with:

    $ sudo docker run -t -i profanity:latest

Inside the container you should su to the 'user' and run profanity from there:

    $ su - user
    $ profanity


For some reason, using something like:

    CMD ["/usr/bin/sudo", "-u user", "profanity"]

in the Dockerfile does not work.

(pull requests welcome!)
