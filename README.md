## To connect the current Terminal:
```bash
docker compose run muto
```

# Launch Muto
While inside the container:
```bash
ros2 launch /muto_ws/launch/muto.launch.py vehicle_id:=contributor-01

# or you could use the `launch_muto.sh` script
/muto_ws/launch_muto.sh
```

## Attaching VS Code
You need to install [Docker](vscode:extension/ms-azuretools.vscode-docker) and [Dev Containers](vscode:extension/ms-vscode-remote.remote-containers) extensions to be able to use the container within VS Code

