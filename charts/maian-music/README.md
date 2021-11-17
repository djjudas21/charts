# Helm Chart for Maian Music

Maian Music is a PHP application for selling digital and physical music

## Installation

Add the Helm repo:

```sh
helm repo add djjudas21 https://djjudas21.github.io/charts/
helm repo update
```

Customise your own copy of [`values.yaml`](https://github.com/djjudas21/charts/blob/main/charts/maian-music/values.yaml).
You can just delete anything you don't want to override.

Finally, install Maian Music into your Kubernetes cluster by doing:

```sh
helm upgrade --install -n maian-music maian-music -f myvalues.yaml --create-namespace djjudas21/maian-music
```

## Manual post install steps

After deployment, style sheets will be broken because the Maian Music app doesn't know its own URL.

1. Browse to the URL where you deployed Maian Music and add `/admin/index.php?p=settings` to the end of the path
1. Scroll down to **Store HTTP Path** and enter the fully qualified path to your site, taking care to specify `http://` or `https://` as appropriate
1. Set **Server Path to Secure Folder** as `/var/www/secure`
1. Click **Update**
