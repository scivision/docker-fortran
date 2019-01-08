[![Build Status](https://travis-ci.com/scivision/docker-fortran.svg?branch=master)](https://travis-ci.com/scivision/docker-fortran)

# `Dockerfile` for Fortran

This repo `Dockerfile` is a minimal example for Fortran developers.
Docker shares the kernel of the host operating system, so that from a Linux host one can run many types and versions of Linux distros.
This example shows Ubuntu 18.04 Docker container with OpenCoarrays on a Travis-CI Ubuntu 14.04 host.
CentOS 6 and CentOS 7 on Travis-CI using Docker containers has been 
[demonstrated previously](https://derekweitzel.com/2016/05/03/building-centos-packages-on-travisci/).

Specifically, this example `docker pull` a Docker image previously build from this Dockerfile, compiles the Fortran coarray example and runs a multi-image coarray Fortran test on Travis-CI.
This Docker container runs as non-root user with `sudo` privileges.

## Optional: working with Docker image

### Building the Docker image

Note: this is not necessary for running this example, but just for general information.

Although Travis-CI can also build and deploy (upload) Docker images, to simplify the example, we use a pre-built Docker image.
Here's one way to manually build and deploy a Docker image:

1. configure a file `Dockerfile` with the desired setup. The Dockerfile in this repo sets up Ubuntu 18.04 on many Linux distros or a Windows host.
2. build the Docker image. This will automatically download the base Ubuntu 18.04 image if needed.
   ```sh
   docker build -t test .
   ```
3. Instantiate the container in interactive mode, confirm you have the needed programs.
   If any need to be added, edit `Dockerfile`, exit / stop this container, and rebuild the container.
   ```sh
   docker run -it test
   ```
4. cleanup unused and stopped containers by
   ```sh
   docker system prune
   ```


### Upload the Docker
1. instantiate a new Docker container from the image
   ```sh
   docker build -t opencoarrays_fortran .
   
   docker run opencoarrays_fortran
   ```
2. commit the image state
   ```sh
   docker commit -m "your commit message" container_hex_id dockerhub_username/opencoarrays_fortran
   ```
3. push to DockerHub, where it becomes publicly available
   ```sh
   docker push dockerhub_username/opencoarrays_fortran
   ```
   
   
### Run Travis-CI with this image

Please see [.travis.yml](./.travis.yml) for a complete example.
The `chown` statement is necessary because Travis' default UID is 2000, while most Linux default UID is 1000.
It seemed better to `chown` a couple Travis folders rather than remake the image.
