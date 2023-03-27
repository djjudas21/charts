# dbdump

dbddump is a tool for creating backups of MySQL and PostgreSQL databases in the form of a .sql file.

## TLDR

```console
helm repo add djjudas21 https://djjudas21.github.io/helm-charts
helm install djjudas21/dbdump --set mysql.host=mysql;mysql.username=root,mysql.password=password
```

## Introduction

This chart helps set up a cronjob or one time job to backup a MySQL database with mysqldump into a Persistent Volume. You can specify an existing PVC, or helm will create one for you.

## Prerequisites

- Kubernetes 1.21
- Helm 3.0

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install djjudas21/dbdump --set mysql.host=mysql,mysql.username=root,mysql.password=password
```

This command will create a cronjob to run a job once a day to backup the databases found on the host `mysql`

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
helm uninstall my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following tables lists the configurable parameters of the mysqldump chart and their default values.

| Parameter                                     | Description                                                                     | Default                      |
| --------------------------------------------- | ------------------------------------------------------------------------------- | ---------------------------- |
| image.registry                                | Name of docker registry to use                                                  | quay.io                      |
| image.repository                              | Name of image to use                                                            | monotek/gcloud-mysql         |
| image.tag                                     | Version of image to use (uses appVersion form Chart.yaml as default if not set) | ""                           |
| image.pullPolicy                              | Pull Policy to use for image                                                    | IfNotPresent                 |
| mysql.db                                      | single mysql db to backup (optional)                                            | mysql                        |
| mysql.host                                    | mysql host to backup                                                            | mysql                        |
| mysql.username                                | mysql username                                                                  | root                         |
| mysql.password                                | mysql password                                                                  | ""                           |
| mysql.port                                    | mysql port                                                                      | 3306                         |
| schedule                                      | crontab schedule to run on.                                                     | "0 3 \* \* \*"               |
| options                                       | options to pass onto MySQL                                                      | "--opt --single-transaction" |
| debug                                         | print some extra debug logs during backup                                       | false                        |
| additionalSteps                               | run these extra shell steps after all backup jobs completed                     | []                           |
| successfulJobsHistoryLimit                    | number of successful jobs to remember                                           | 5                            |
| failedJobsHistoryLimit                        | number of failed jobs to remember                                               | 5                            |
| persistentVolumeClaim                         | existing Persistent Volume Claim to backup to, leave blank to create a new one  |                              |
| persistence.enabled                           | create new PVC (unless `persistentVolumeClaim` is set)                          | true                         |
| persistence.size                              | size of PVC to create                                                           | 8Gi                          |
| persistence.accessMode                        | accessMode to use for PVC                                                       | ReadWriteOnce                |
| persistence.storageClass                      | storage class to use for PVC                                                    |                              |
| persistence.subPath                           | subPath for PVC                                                                 |                              |
| allDatabases.enabled                          | backup all databases                                                            | true                         |
| allDatabases.SingleSqlFile                    | backup all databases to single file                                             | false                        |
| housekeeping.enabled                          | delete olf backups in pvc                                                       | true                         |
| housekeeping.keepDays                         | keep last x days of backups in PVC                                              | 10                           |
| resources                                     | resource definitions                                                            | {}                           |
| nodeSelector                                  | k8s-node selector                                                               | {}                           |
| tolerations                                   | tolerations                                                                     | \[]                          |
| affinity                                      | affinity                                                                        | {}                           |
| securityContext.enabled                       | set true to change default security context of job/cronjob                      | false                        |
| securityContext.fsGroup                       | group ID to use                                                                 | 999                          |
| securityContext.runAsUser                     | user ID to use                                                                  | 999                          |

```console
helm install djjudas21/dbdump --name my-release --set persistentVolumeClaim=name-of-existing-pvc
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```console
helm install djjudas21/dbdump --name my-release -f values.yaml
```