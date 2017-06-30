#!/bin/sh

# check for video device
if [ ! -e /dev/video0 ]; then
  echo "WARNING: /dev/video0 device not detected! Try adding '--device /dev/video0:/dev/video0' to your docker run command."
fi

# set hostname for mail
if [ ! -z "$HOSTNAME" ]; then
  echo $HOSTNAME > /etc/mailname
else
  hostname --fqdn > /etc/mailname
fi

# set up postfix mail
if [ ! -z "$GMAIL_USERNAME" ] && [ ! -z "$GMAIL_PASSWORD" ]; then
  sed -i "s/GMAIL_USERNAME/${GMAIL_USERNAME}/g" /etc/postfix/sasl_passwd
  sed -i "s/GMAIL_PASSWORD/${GMAIL_PASSWORD}/g" /etc/postfix/sasl_passwd
  postmap /etc/postfix/sasl_passwd
else
  echo "WARN: GMAIL_USERNAME and/or GMAIL_PASSWORD not set; not configuring mail!"
fi

# start services
/etc/init.d/motion start
/etc/init.d/postfix start
tail -f /tmp/motion.log 
