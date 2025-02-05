# lldap

![Version: 0.4.2](https://img.shields.io/badge/Version-0.4.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.6.1](https://img.shields.io/badge/AppVersion-v0.6.1-informational?style=flat-square)

Light LDAP implementation

**Homepage:** <https://github.com/djjudas21/charts/tree/master/charts/lldap>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| djjudas21 | <djjudas21@users.noreply.github.com> |  |

## Source Code

* <https://github.com/lldap/lldap>
* <https://hub.docker.com/r/lldap/lldap>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | mariadb | ~18 |
| https://charts.bitnami.com/bitnami | postgresql | ~15 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| bootstrap | object | see below | Bootstrap (i.e. create) users and groups automatically. It is safe to run the bootstrap multiple times, however the one-shot Kubernetes job will be created on the first deployment, and the job will not be executed on subsequent deployments unless the job is deleted. |
| bootstrap.cleanup | bool | `false` | Remove redundant users and groups which are not in the config below |
| deploymentAnnotations | object | `{}` |  |
| deploymentLabels | object | `{}` |  |
| externalMariadb | object | `{"auth":{"database":"lldap","host":"","password":"","port":3306,"username":""},"enabled":false}` | Enable and configure external mariadb database |
| externalPostgresql | object | `{"auth":{"database":"lldap","host":"","password":"","port":5432,"username":""},"enabled":false}` | - Enable and configure external postgresql database |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"lldap/lldap"` | image repository |
| image.tag | string | chart.appVersion | image tag |
| imagePullSecrets | list | `[]` |  |
| ingress | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| livenessProbe.httpGet.path | string | `"/"` |  |
| livenessProbe.httpGet.port | string | `"http"` |  |
| lldap.baseDN | string | `"dc=example,dc=com"` | Base DN for LDAP. This is usually your domain name, and is used as a namespace for your users. The choice is arbitrary, but will be needed to configure the LDAP integration with other services. The sample value is for "example.com", but you can extend it with as many "dc" as you want, and you don't actually need to own the domain name. |
| lldap.extraVolumeMounts | list | `[]` |  |
| lldap.extraVolumes | list | `[]` | - define extra volumes and mounts for the ldap |
| lldap.gid | int | `1000` |  |
| lldap.jwtSecret | string | `"REPLACE_WITH_RANDOM"` | Random secret for JWT signature. This secret should be random, and should be shared with application servers that need to consume the JWTs. Changing this secret will invalidate all user sessions and require them to re-login. You can generate it with (on linux): LC_ALL=C tr -dc 'A-Za-z0-9!#%&'\''()*+,-./:;<=>?@[\]^_{|}~' </dev/urandom | head -c 32; echo '' |
| lldap.keySeed | string | `"REPLACE_WITH_RANDOM"` | Seed to generate the server private key. This can be any random string, the recommendation is that it's at least 12 characters long. |
| lldap.ldapUserDN | string | `"admin"` | Admin username. For the LDAP interface, a value of "admin" here will create the LDAP user "cn=admin,ou=people,dc=example,dc=com" (with the base DN above). For the administration interface, this is the username. |
| lldap.ldapUserPass | string | `"REPLACE_WITH_RANDOM"` | Admin password. Password for the admin account, both for the LDAP bind and for the administration interface. It is only used when initially creating the admin user. It should be minimum 8 characters long. Note: you can create another admin user for user administration, this is just the default one. |
| lldap.ldaps | object | see below | Options to configure LDAPS |
| lldap.ldaps.certFile | string | `"/data/cert.pem"` | Certificate file. |
| lldap.ldaps.enabled | string | `"false"` | Whether to enable LDAPS. |
| lldap.ldaps.keyFile | string | `"/data/key.pem"` | Certificate key file. |
| lldap.smtp | object | see below | Options to configure SMTP parameters, to send password reset emails. |
| lldap.smtp.enablePasswordReset | bool | `false` | Whether to enabled password reset via email, from LLDAP. |
| lldap.smtp.from | string | `"LLDAP Admin <sender@gmail.com>"` | The header field: how the sender appears in the email. The first is a free-form name, followed by an email between <>. Optional. |
| lldap.smtp.password | string | `"password"` | The SMTP password. |
| lldap.smtp.port | int | `587` | The SMTP port. |
| lldap.smtp.replyTo | string | `"Do not reply <noreply@localhost>"` | Same for reply-to, optional. |
| lldap.smtp.server | string | `"smtp.gmail.com"` | The SMTP server. |
| lldap.smtp.smtpEncryption | string | `"TLS"` | How the connection is encrypted, either "NONE" (no encryption), "TLS" or "STARTTLS". |
| lldap.smtp.user | string | `"sender@gmail.com"` | The SMTP user, usually your email address. |
| lldap.tz | string | `"Etc/UTC"` |  |
| lldap.uid | int | `1000` |  |
| lldap.verbose | bool | `false` | Tune the logging to be more verbose |
| mariadb | object | https://github.com/bitnami/charts/blob/master/bitnami/mariadb/values.yaml | Enable and configure mariadb database subchart under this key.    For more options see [mariadb chart documentation](https://github.com/bitnami/charts/tree/master/bitnami/mariadb) |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| persistence | object | see below | Persistence is only required if you are using the SQLite database (default). You can disable persistence if you select MariaDB or PostgreSQL. |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| postgresql | object | https://github.com/bitnami/charts/blob/master/bitnami/postgresql/values.yaml | Enable and configure postgresql database subchart under this key.    For more options see [postgresql chart documentation](https://github.com/bitnami/charts/tree/master/bitnami/postgresql) |
| readinessProbe.httpGet.path | string | `"/"` |  |
| readinessProbe.httpGet.port | string | `"http"` |  |
| replicaCount | int | `1` | Number of lldap replicas. Do not increase this above 1 if you are using the SQLite backend. |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service | object | See values.yaml | Configures service settings for the chart. |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.automount | bool | `false` |  |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | a name is generated using the fullname template | The name of the service account to use. |
| tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
