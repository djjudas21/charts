# Helm Charts by djjudas21

Welcome to the documentation for the [djjudas21 Helm charts](https://github.com/djjudas21/charts) project.

Some of these charts are my own creation, while others were adopted after the
[k8s-at-home charts project was deprecated](https://github.com/k8s-at-home/charts/issues/1761).

I use these charts in my own cluster so I do update the images when the upstream apps make releases.
Contributions are always welcome.

## Getting started

[Helm](https://helm.sh) must be installed to use the charts in this repository.

Refer to Helm's [documentation](https://helm.sh/docs/) to get started.

## Installation

```sh
helm repo add djjudas21 https://djjudas21.github.io/charts/
helm repo update
```

You can then run `helm search repo djjudas21` to search the charts.

## License

This project is licensed under the terms of the Apache 2.0 License license.
