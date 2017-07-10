# pi-motion-docker

## Usage
- Raspberry Pi running Raspbian
- Get your camera working so it shows up as a USB video device: `/dev/videoX` (usually /dev/video0)
  - If you're using a camera module (with a flat ribbon cable) you'll probably have to enable the camera interface using the `raspi-config` tool and then enable the v4l2 kernel module `echo "bcm2835-v4l2" | sudo tee -a /etc/modules`, then reboot so changes take effect. 
- Install Docker: `curl -sSL https://get.docker.com | sh`
- Build the pi-motion docker image: `docker build github.com/davecozz/pi-motion-docker`
- Run the image that you created: `docker run -d --device /dev/video0:/dev/video0 -p 8081:8081 <image ID>`
