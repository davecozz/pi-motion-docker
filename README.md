# pi-motion-docker

## Usage
- Raspberry Pi running Raspbian
- Get your camera working so it shows up as a USB video device: `/dev/videoX` (usually /dev/video0)
- Install Docker: `curl -sSL https://get.docker.com | sh`
- Build the pi-motion docker image: `docker build github.com/davecozz/pi-motion-docker`
- Run the image that you created: `docker run -d --device /dev/video0:/dev/video0 -p 8081:8081 <image ID>`
