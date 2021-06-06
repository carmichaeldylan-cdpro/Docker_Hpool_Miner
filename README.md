# Docker Hpool Miner

## Deploy
Pull the image and download the `config.yaml`

```sh
docker run -d \
   --name=hpool-miner \
   -v {config to config.yaml file}//...config.yaml:/hpool/config.yaml:ro \
   -v {dir to plots}:/plots \
   ghcr.io/carmichaeldylan-cdpro/docker_hpool_miner
```
If runing on Unraid you must add the `--network="host"` to the config to allow for connectivity

## Config file
Edit config file and add `apiKey` minus {}, change the name if you wish and change `scanMinute` to what you like. I have mine set to 1
You can just copy this template and save as config.yaml but has to be in this format exact.
```yaml
path:
- /plots/
minerName: Docker-Miner
apiKey: {Provided Hpool API}
cachePath: ""
deviceId: ""
extraParams: {}
log:
  lv: debug
  path: /plots/logs
  name: miner.log
url:
  info: ""
  submit: ""
scanPath: true
scanMinute: 1
```

## Creating Signature Key
You can run this command to retrieve your signature key.
```sh
docker run --network none ghcr.io/carmichaeldylan-cdpro/docker_hpool_miner ./plot-sign -action sign -sign-mnemonic "your mnemonic here"
```
The `--network none` option is recommended to avoid any possibility that your mnemonic is sent in the process.