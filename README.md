# Helm Charts by djjudas21

Welcome to the documentation for the [djjudas21 Helm charts](https://github.com/djjudas21/charts) project.

Some of these charts are my own creation, while others were adopted after the
[k8s-at-home charts project was deprecated](https://github.com/k8s-at-home/charts/issues/1761).

I use these charts in my own cluster. I subscribe to notifications for when the upstream apps 
are updated, and I update the charts when there are upstream releases.

Contributions are always welcome, either for new features, bug fixes, or if I've missed a update.

## Getting started

[Helm](https://helm.sh) must be installed to use the charts in this repository.

Refer to Helm's [documentation](https://helm.sh/docs/) to get started.

## Installation

```console
helm repo add djjudas21 https://djjudas21.github.io/charts/
helm repo update djjudas21
```

You can then run `helm search repo djjudas21` to search the charts.

## Updating

I recommend you subscribe to release notifications so you know when there are chart updates.

1. Click the arrow next to the **Watch** button in the top-right corner of the Github project
2. Click **Custom**
3. Tick **Releases**
4. Click **Apply**

There's also a great tool called [`nova`](https://github.com/FairwindsOps/nova) which
can check your installed charts for available updates.

```console
nova find --format table --show-old
```

## Contributing

To contribute code, fork this repo, submit a PR, and make sure the CI tests are passing.
Values files should be commented in [helm-docs](https://github.com/norwoodj/helm-docs) format.
The chart README and Values schema in JSON format will be auto generated upon pull request.

I get through a lot of caffeine writing code. If my work is useful to you, please [buy me a coffee](https://www.buymeacoffee.com/jgazeley).

## License

This project is licensed under the terms of the Apache 2.0 License license.
