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
