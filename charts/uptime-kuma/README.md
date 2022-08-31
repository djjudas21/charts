# uptime-kuma

![Version: 1.4.2](https://img.shields.io/badge/Version-1.4.2-informational?style=flat-square) ![AppVersion: 1.17.1](https://img.shields.io/badge/AppVersion-1.17.1-informational?style=flat-square)

A fancy self-hosted monitoring tool for your sites and applications

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/djjudas21/charts/issues/new/choose)**

## Source Code

* <https://github.com/louislam/uptime-kuma>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| `http://bjw-s.github.io/helm-charts/` | common | 4.5.2 |

## TL;DR

```console
helm repo add djjudas21 https://djjudas21.github.io/charts/
helm repo update
helm install uptime-kuma djjudas21/uptime-kuma
```

## Installing the Chart

To install the chart with the release name `uptime-kuma`

```console
helm install uptime-kuma djjudas21/uptime-kuma
```

## Uninstalling the Chart

To uninstall the `uptime-kuma` deployment

```console
helm uninstall uptime-kuma
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/bjw-s/helm-charts/blob/main/charts/library/common/values.yaml) from the [common library](https://github.com/bjw-s/helm-charts/tree/main/charts/library/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install uptime-kuma \
  --set env.TZ="America/New York" \
    djjudas21/uptime-kuma
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install uptime-kuma djjudas21/uptime-kuma -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/bjw-s/helm-charts/tree/main/charts/library/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env.TZ | string | `"UTC"` | Set the container timezone |
| env.UPTIME_KUMA_DISABLE_FRAME_SAMEORIGIN | int | `0` | Set the custom ssl cert path (string) UPTIME_KUMA_SSL_CERT: -- Set the custom ssl key path (string) UPTIME_KUMA_SSL_KEY: -- Set the frame same-origin policy (int) |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"louislam/uptime-kuma"` | image repository |
| image.tag | string | chart.appVersion | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

### Version 1.4.2

#### Added

N/A

#### Changed

* Upgraded `common` chart dependency to version 4.5.2

#### Fixed

N/A

### Older versions

A historical overview of changes can be found on [ArtifactHUB](https://artifacthub.io/packages/helm/djjudas21/uptime-kuma?modal=changelog)

## Support

* Open an [issue](https://github.com/djjudas21/charts/issues/new/choose)
