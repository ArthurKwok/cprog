sudo docker run -i --gpus all \
--rm --name cprog \
--mount type=bind,source=/mnt/d/ubuntu/Workspace,target=/home/cprog-user/workspace \
--device /dev/snd \
-e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native \
-v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native \
-v ~/.config/pulse/cookie:/root/.config/pulse/cookie \
--group-add $(getent group audio | cut -d: -f3) \
arthurgjy/cprog:latest
