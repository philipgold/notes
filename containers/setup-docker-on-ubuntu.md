# Setup Docker on Ubuntu

Describe how to Install Docker on AWS Ubuntu 16.04

## Installing Docker

First, add the GPG key for the official Docker repository to the system:

```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

Add the Docker repository to APT sources:

```text
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
```

Make sure you are about to install from the Docker repo instead of the default Ubuntu 16.04 repo:

```text
apt-cache policy docker-ce
```

Finally, install Docker:

```text
sudo apt-get install -y docker-ce
```

Docker should now be installed, the daemon started, and the process enabled to start on boot. Check that it's running:

```text
sudo systemctl status docker
```

## Executing the Docker Command Without Sudo \(Optional\)

By default, running the docker command requires root privileges — that is, you have to prefix the command with sudo.

If you want to avoid typing sudo whenever you run the docker command, add your username to the docker group:

```text
sudo usermod -aG docker ${USER}
```

To apply the new group membership, you can log out of the server and back in.

## Links

* [How To Install and Use Docker on Ubuntu 16.04](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04)

<<<<<<< HEAD
## Links
* [How To Install and Use Docker on Ubuntu 16.04](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04)


Install Docker
https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-centos-7

Install Docker Compose
https://docs.docker.com/compose/install/#install-compose
=======
>>>>>>> e64f836c1d70d1581425c7798a559672ec2dc7f4
