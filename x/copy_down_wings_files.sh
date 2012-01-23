cd /var/www/wings/uploads
sudo rm -rf audio_file
sudo rm -rf images
scp -r dolph.ccnmtl.columbia.edu:/var/www/wings/uploads/audio_file .
scp -r dolph.ccnmtl.columbia.edu:/var/www/wings/uploads/images     .
sudo chown -R pusher:users  audio_file
sudo chown -R pusher:users  images