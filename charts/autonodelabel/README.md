# autonodelabel

![Version: 0.0.10](https://img.shields.io/badge/Version-0.0.10-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.6](https://img.shields.io/badge/AppVersion-0.0.6-informational?style=flat-square)

Automatically label Kubernetes nodes based on their hardware

**Homepage:** <https://github.com/djjudas21/charts/tree/master/charts/autonodelabel>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| djjudas21 | <djjudas21@users.noreply.github.com> |  |

## Source Code

* <https://github.com/djjudas21/autonodelabel>
* <https://hub.docker.com/r/djjudas21/autonodelabel>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"djjudas21/autonodelabel"` | image repository |
| image.tag | string | chart.appVersion | image tag |
| imagePullSecrets | list | `[]` |  |
| nameOverride | string | `""` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| resources.requests.cpu | string | `"1m"` |  |
| resources.requests.memory | string | `"60Mi"` |  |
| securityContext | object | `{}` |  |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | a name is generated using the fullname template | The name of the service account to use. |
| tolerations | list | `[{"effect":"NoSchedule","key":"node-role.kubernetes.io/control-plane","operator":"Exists"},{"effect":"NoSchedule","key":"node-role.kubernetes.io/master","operator":"Exists"}]` | These tolerations are required to run the daemonset on control plane nodes. Remove them if your control plane nodes should not run pods. |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
