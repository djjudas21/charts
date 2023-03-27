# dbdump

dbddump is a tool for creating backups of MySQL and PostgreSQL databases in the form of a .sql file.

## Introduction

This chart helps set up a cronjob to backup a MySQL or PostgreSQL database into a Persistent Volume. You can specify an existing PVC, or Helm will create one for you.

## Prerequisites

- Kubernetes 1.21
- Helm 3.0

## Installing the Chart

To install the chart with the release name `my-release` with a list of databases in `values.yaml`:

```console
helm install my-release djjudas21/dbdump -f values.yaml
```

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
helm uninstall my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following tables lists the configurable parameters of the mysqldump chart and their default values.

| Parameter                    | Description                                                                     | Default                      |
| ---------------------------- | ------------------------------------------------------------------------------- | ---------------------------- |
| `image.repository`           | Name of image to use                                                            | `djjudas21/dbdump`           |
| `image.tag`                  | Version of image to use (uses appVersion form Chart.yaml as default if not set) |                              |
| `image.pullPolicy`           | Pull Policy to use for image                                                    | `IfNotPresent`               |
| `databases`                  | List of databases to backup (see format below)                                  | `[]`                         |
| `schedule`                   | crontab schedule to run on.                                                     | `0 3 \* \* \*`               |
| `mysqldumpOptions`           | options to pass onto MySQL                                                      | `--opt --single-transaction` |
| `pgdumpOptions`              | options to pass onto PostgreSQL                                                 |                              |
| `successfulJobsHistoryLimit` | number of successful jobs to remember                                           | `3`                          |
| `failedJobsHistoryLimit`     | number of failed jobs to remember                                               | `3`                          |
| `persistentVolumeClaim`      | existing Persistent Volume Claim to backup to, leave blank to create a new one  |                              |
| `persistence.enabled`        | create new PVC (unless `persistentVolumeClaim` is set)                          | `true`                       |
| `persistence.size`           | size of PVC to create                                                           | `8Gi`                        |
| `persistence.accessMode`     | accessMode to use for PVC                                                       | `ReadWriteMany`              |
| `persistence.storageClass`   | storage class to use for PVC                                                    |                              |
| `persistence.subPath`        | subPath for PVC                                                                 |                              |
| `housekeeping.enabled`       | delete old backups in pvc                                                       | `true`                       |
| `housekeeping.keepDays`      | keep last x days of backups in PVC                                              | `10`                         |
| `resources`                  | resource definitions                                                            | `{}`                         |
| `nodeSelector`               | k8s-node selector                                                               | `{}`                         |
| `tolerations`                | tolerations                                                                     | `[]`                         |
| `affinity`                   | affinity                                                                        | `{}`                         |
| `securityContext.enabled`    | set true to change default security context of job/cronjob                      | `false`                      |
| `securityContext.fsGroup`    | group ID to use                                                                 | `999`                        |
| `securityContext.runAsUser`  | user ID to use                                                                  | `999`                        |

Each database must be configured like this:

| Parameter      | Description                                  | Example                 |
| ---------------| ---------------------------------------------| ------------------------|
| `host`         | Database host to connect to (must be unique) | `db.example.com`        |
| `type`         | Type of database server                      | `mysql` or `postgresql` |
| `username`     | Username to connect to database              | `root` or `postgres`    |
| `password`     | Password to connect to database              | `pAsSwOrD`              |
| `port`         | TCP port of database host                    | `3306` or `5432`        |
| `database`     | Name of database to dump                     | `myDatabase`            |
| `allDatabases` | Back up all databases (overrides `database`) | `true` or `false`       |
| `debug`        | Enable debug output                          | `true` or `false`       |
