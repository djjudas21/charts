# ecowitt-exporter

Ecowitt exporter for Prometheus & InfluxDB

The WiFi-enabled Ecowitt weather stations can export metrics in a number of protocols to various online weather services, as a push operation.
They also support pushing to a custom endpoint in a choice of two protocols, Ecowitt or Wunderground. Blogger Ernest Neijenhuis has
[checked out the protocols](https://www.pa3hcm.nl/?p=2095) and found that the Ecowitt protocol is more comprehensive. He then wrote a Python
app called [Ecowither](https://github.com/pa3hcm/ecowither) to gateway the Ecowitt metrics into InfluxDB.

Here I am building on his work to present the Ecowitt metrics as an exporter for Prometheus.

## Note about Ecowitt firmware

It seems that an Ecowitt WS2910 with firmware v5.1.1 has a bug when writing out HTTP headers, which causes it to not work with Flask.
This [has been reported](https://github.com/pallets/werkzeug/issues/2734) to Flask, but closed as WONTFIX because the underlying problem
is with the Ecowitt firmware.

It is possible to work around this issue by fronting this exporter with an NGINX reverse proxy (such as a Kubernetes Ingress),
because NGINX magically fixes the headers on the fly.

## Values

Set the units for the export of each metric. Ecowitt weather stations always take measurements in Imperial.
This exporter converts them on the fly if necessary, to present them to Prometheus in your desired format.
Metric/SI is always the default. People in the USA will probably want to set everything to Imperial
alternatives, while Brits will likely want a mixture of both!

All units are expressed in lower case and without slashes, for simplicity. Apologies to scientists,
for whom this will be a difficult time.

| Value                 | Default                 | Choices                            | Meaning                                                                  |
|-----------------------|-------------------------|------------------------------------|--------------------------------------------------------------------------|
| `env.debug`           | `false`                 | `false`, `true`                    | Enable extra output for debugging                                        |
| `env.prometheus`      | `true`                  | `false`, `true`                    | Enable Prometheus exporter                                               |
| `env.influxdb`        | `false`                 | `false`, `true`                    | Enable InfluxDB support                                                  |
| `env.temperatureUnit` | `c`                     | `c`, `f`, `k`                      | Temperature in Celsius, Fahrenheit or Kelvin                             |
| `env.pressureUnit`    | `hpa`                   | `hpa`, `in`, `mmhg`                | Pressure in hectopascals (millibars), inches of mercury or mm of mercury |
| `env.windUnit`        | `kmh`                   | `kmh`, `mph`, `ms`, `knots`, `fps` | Speed in km/hour, miles/hour, metres/second, knots or feet/second        |
| `env.rainUnit`        | `mm`                    | `mm`, `in`                         | Rainfall in millimetres or inches                                        |
| `env.irradianceUnit`  | `wm2`                   | `wm2`, `lx`, `fc`                  | Solar irradiance in Watts/m^2                                            |
| `env.influxdbToken`   |                         |                                    | InfluxDB token                                                           |
| `env.influxdbUrl`     | `http://localhost:8086` |                                    | InfluxDB endpoint                                                        |
| `env.influxdbOrg`     | `influxdata`            |                                    | InfluxDB organisation                                                    |
| `env.influxdbBucket`  | `default`               |                                    | InfluxDB bucket                                                          |


If you want to use one of the units that is not yet supported, please [open an issue](https://github.com/djjudas21/ecowitt-exporter/issues)
and request it. I can add the code to convert and display other units if there is demand.

## Deployment

Te recommended way to run this exporter is in Kubernetes via the [Helm chart](https://github.com/djjudas21/charts/tree/main/charts/ecowitt-exporter).
The Helm chart also supports integration with the [Prometheus Operator](https://github.com/prometheus-operator/prometheus-operator) and will
create ServiceMonitor resources to enable automatic scraping.

```console
helm repo add djjudas21 https://djjudas21.github.io/charts/
helm repo update djjudas21
helm install -n monitoring ecowitt-exporter djjudas21/ecowitt-exporter
```

## How to configure your weather station

After deploying via Helm, it will print some output to explain how to find the IP and/or hostname of the exporter running in Kubernetes.

Use the WSView Plus all to configure the integration. Go into the device, scroll across until Customized and set the following:

* Customized: Enable
* Protocol: Ecowitt
* Server IP / Hostname: the IP or hostname that Helm gave you
* Path: `/report`
* Port: `8088` unless you are using an Ingress, in which case probably `80`
* Upload interval: `60`

Then hit Save. It seems to take a couple of minutes for the weather station to submit its first reading.
