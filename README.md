# docker-node-service
Base image for node.js services

## Summary

This Dockefile for this image includes the gpg key for installing node from
ppa. In our stack we use coffeescript, gulp for build and testing, and pm2 as
our process manager.

## Usage

This image exposes three entrypoints for starting this container or containers
that extend it:

    - pm2: Run the node service in `production mode` with pm2 using a pm2 file
      contained in the image.
    - dev: Run the service in development mode with `gulp serve`.
    - test: Run the tests for the image with `gulp test`.
    - If a command other than `pm2`, `dev`, or `test` is run, then that command is run as is.
