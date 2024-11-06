#!/usr/bin/env bash

# ssh into HassIO host
# edit python script in supervisor container: docker exec -it hassio_supervisor vi /usr/src/supervisor/supervisor/resolution/evaluations/container.py
# on line 26 add "portainer/agent" to the IGNORE_IMAGES list
# restart supervisor container: docker restart hassio_supervisor

# Note: On the other side the portainer/agent can also just not be installed on the Portainer Server
# as it ouly would be needed to browse the host "/" which can be achieved in other ways as well ie. ssh into
# host.

