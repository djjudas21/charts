# openssh-server

Helm chart to install an OpenSSH server based on the
[linuxserver.io Docker image](https://docs.linuxserver.io/images/docker-openssh-server).

## Examples

### Public key auth

```yaml
auth:
  username: admin
  publicKey: ""
```

### Password auth

```yaml
auth:
  passwordAccess: true
  username: admin
  password: admin
```
