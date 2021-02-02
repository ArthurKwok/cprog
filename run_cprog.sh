sudo docker run -i --gpus all \
--rm --name cprog \
--mount type=bind,source=/mnt/d/ubuntu/Workspace,target=/home/cprog-user/workspace \
--device /dev/snd:/dev/snd \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v /dev/shm:/dev/shm \
--security-opt apparmor=unconfined \
-e DISPLAY=unix$DISPLAY \
--privileged \
arthurgjy/cprog:latest
