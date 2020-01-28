```sh
docker-compose build --no-cache
docker-compose up --scale salt-minion=3
# Wait until the key-exchange occurs and accept all keys
docker container exec -it saltstack_salt-master_1 salt-key -A -y
# Test
docker container exec -it saltstack_salt-master_1 /bin/sh
salt '*' test.ping
```
