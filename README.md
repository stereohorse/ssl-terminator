# SSL Terminator

Starts nginx instance with self-signed SSL certificate

## Usage

```bash
$ FROM_PORT=5678 TO_PORT=8080 ./run
```

If you have multiple network interfaces:

```bash
$ PUBLIC_IP=<external IP> FROM_PORT=5678 TO_PORT=8080 ./run
```

You can also do it without run script:

```bash
$ docker run -it --rm \
  -e PUBLIC_IP=<external IP> \
  -e TARGET_PORT=<target port for proxy> \
  -p <external port>:443 \
  0x06065a/ssl-terminator
```
