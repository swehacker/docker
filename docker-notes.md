### Remove old docker containers
```bash
docker ps -a | grep 'days ago' | awk '{print $1}' | xargs docker rm
```

