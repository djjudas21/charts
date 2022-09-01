# bookstack

![Version: 5.1.2](https://img.shields.io/badge/Version-5.1.2-informational?style=flat-square) ![AppVersion: v21.12](https://img.shields.io/badge/AppVersion-v21.12-informational?style=flat-square)

A simple, self-hosted, easy-to-use platform for organising and storing information.

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/djjudas21/charts/issues/new/choose)**

## Source Code

* <https://www.bookstackapp.com/>
* <https://hub.docker.com/r/linuxserver/bookstack>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| `https://charts.bitnami.com/bitnami` | mariadb | 11.0.14 |
| `http://bjw-s.github.io/helm-charts/` | common | 4.5.2 |

## TL;DR

```console
helm repo add djjudas21 https://djjudas21.github.io/charts/
helm repo update
helm install bookstack djjudas21/bookstack
```

## Installing the Chart

To install the chart with the release name `bookstack`

```console
helm install bookstack djjudas21/bookstack
```

## Uninstalling the Chart

To uninstall the `bookstack` deployment

```console
helm uninstall bookstack
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/bjw-s/helm-charts/blob/main/charts/library/common/values.yaml) from the [common library](https://github.com/bjw-s/helm-charts/tree/main/charts/library/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install bookstack \
  --set env.TZ="America/New York" \
    djjudas21/bookstack
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install bookstack djjudas21/bookstack -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/bjw-s/helm-charts/tree/main/charts/library/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env | object | See below | environment variables. See more environment variables in the [bookstack documentation](https://hub.docker.com/r/linuxserver/bookstack) |
| env.TZ | string | `"UTC"` | Set the container timezone |
| image.pullPolicy | string | `"IfNotPresent"` | image tag |
| image.repository | string | `"ghcr.io/linuxserver/bookstack"` | image repository |
| image.tag | string | `"version-v21.12"` | image pull policy |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| mariadb | object | See values.yaml | Enable and configure mariadb database subchart under this key.    For more options see [mariadb chart documentation](https://github.com/bitnami/charts/tree/master/bitnami/mariadb). |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

### Version 5.1.2

#### Added

N/A

#### Changed

* Upgraded `common` chart dependency to version 4.5.2

#### Fixed

N/A

### Older versions

A historical overview of changes can be found on [ArtifactHUB](https://artifacthub.io/packages/helm/djjudas21/bookstack?modal=changelog)

## Support

* Open an [issue](https://github.com/djjudas21/charts/issues/new/choose)
