Docker container for skype2irc
===

Based on a [fork of skype2irc](https://github.com/caktux/skype2irc).

Create group chats with `/createmoderatedchat` and use `/get blob` to get blob IDs, however group creation like this doesn't seem to work from linux...

### Installation
```
git clone https://github.com/caktux/skype2irc-docker
```

### Configuration

Copy `config.py.sample` to `config.py` and edit to your liking, then copy `credentials.sample` to `credentials` and edit with your bridge's Skype login information.

### Building and running

Build the docker container and run it with:

```
cd skype2irc-docker/docker
docker build -t skype2irc .
docker run -d -p 5900:5900 -t skype2irc
```

### Initial setup over VNC

Connect over VNC on the first run to accept the ToS and API request from skype2irc. The VNC password is `letmein`, as the `-nopw` option of x11vnc didn't play well with the OSX screen sharing for some reason.

### Useful tips

Enter your container with:
```
docker exec -ti <container name> bash
```


### Running on OSX

Port-mapping for boot2docker required.

Temporary (keep opened):
```
boot2docker ssh -L 5900:localhost:5900
```

Permanent:
```
VBoxManage controlvm "boot2docker-vm" natpf1 "tcp-port5900,tcp,,5900,,5900";
```