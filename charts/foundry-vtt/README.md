# Foundry VTT

<!-- BADGES/ -->

[![FoundryVTT Version: v10.288](https://img.shields.io/badge/foundry-v10.288-brightgreen?logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAYAAAAfSC3RAAAAAXNSR0IArs4c6QAAAIRlWElmTU0AKgAAAAgABQESAAMAAAABAAEAAAEaAAUAAAABAAAASgEbAAUAAAABAAAAUgEoAAMAAAABAAIAAIdpAAQAAAABAAAAWgAAAAAAAABIAAAAAQAAAEgAAAABAAOgAQADAAAAAQABAACgAgAEAAAAAQAAAA6gAwAEAAAAAQAAAA4AAAAATspU+QAAAAlwSFlzAAALEwAACxMBAJqcGAAAAVlpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IlhNUCBDb3JlIDUuNC4wIj4KICAgPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICAgICAgPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIKICAgICAgICAgICAgeG1sbnM6dGlmZj0iaHR0cDovL25zLmFkb2JlLmNvbS90aWZmLzEuMC8iPgogICAgICAgICA8dGlmZjpPcmllbnRhdGlvbj4xPC90aWZmOk9yaWVudGF0aW9uPgogICAgICA8L3JkZjpEZXNjcmlwdGlvbj4KICAgPC9yZGY6UkRGPgo8L3g6eG1wbWV0YT4KTMInWQAAAiFJREFUKBVVks1rE1EUxc+d5tO0prZVSZsUhSBIPyC02ooWurJ0I7rQlRvdC/4N4h9gt7pyoRTswpWgILgQBIOIiC340VhbpC0Ek85MGmPmXc+baWpNGJg77/7uOffeB+z9FHB0FrH9eLwwqpOF0f34KrpsTicW+6L8KE8QhO/n8n1IOgtQHYZA+a/Ai9+Wd6v1g7liq5A2OjKSQNa9hkO4hAzOIylf6CHALk6hoWXsylPkfjyyApaJhVCxmERy5zLSuI7D8h1H5BWht1aBhS6wdI3pN7GabyuyS4JPrchzujmNjDxAVrrRL2PoxRSGxOfjssgEjkkJvVJBWu6h5M7YenvDoOO0OgicD4TPIKWbBG6xvwTaKCMwSU7hKxK6gt8mbsFIMaF5iDyjUg6iPnqc58higCr9fD4iTvWMziAmK2g73f/AADVWX0YXrlChirgOcqL3WXYBYpTfUuxzjkW30dI1C0ZW1RnjMopo4C56MIs6CgQrMER2cJoz9zjdO2iz17g2yZUjqzHWbuA4/ugiEz7DVRe/aLxmcvDQ5Cq+oWGWeDbAgiETXgArrVOFGzR0EkclxrVMcpfLgFThY5roe2yz95ZZkzcbj22+w2VG8Pz6Q/b5Gr6uM9mw04uo6ll4tOlhE8a8xNzGYihCJoT+u3I4kUIp6OM0X9CHHds8frbqsrXlh9CB62nj8L5a9Y4DHR/K68TgcHhoz607Qp34L72X0rdSdM+vAAAAAElFTkSuQmCC)](https://foundryvtt.com/releases/10.288)
[![Lint, Test and Deploy Charts](https://github.com/mahahe-it/helm/actions/workflows/chart-workflow.yaml/badge.svg?branch=main)](https://github.com/mahahe-it/helm/actions/workflows/chart-workflow.yaml)
[![Patreon](https://img.shields.io/badge/patreon-donate-yellow.svg)](https://patreon.com/nerdweekoficial)
[![GitHub license](https://img.shields.io/github/license/hugoprudente/charts)](https://github.com/hugoprudente/charts/blob/master/LICENSE)

[Foundry VTT](http://foundryvtt.com/) is a standalone application built for experiencing multiplayer tabletop RPGs using a feature-rich and modern self-hosted application where your players connect directly through the browser.

## TL;DR

```console
$ helm repo add mahahe https://helm.mahahe.it/
$ helm install my-release mahahe/foundry-vtt
```

## Introduction

You can get a [FoundryVTT](https://foundryvtt.com) instance up and running in
minutes using this chart and Felddy [foundryvtt-docker](https://github.com/felddy/foundryvtt-docker) Docker container.

## Prerequisites

- 512 MB of RAM
- Kubernetes 1.19+
- PV provisioner support in the underlying infrastructure

## Installing the Chart

To install the chart with the release name `my-release`:

```console
$ helm install my-release mahahe/youtrack
```

The command deploys YouTrack on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
$ helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Parameters

### Common Parameters

| Name                         | Description                                    | Value    |
| ---------------------------- | ---------------------------------------------- | -------- |
| `nameOverride`               | Name Override                                  | `""`     |
| `fullnameOverride`           | FullName Override                              | `""`     |
| `dnsConfig`                  | Override for FoundryVTT DNS Configuration      | `{}`     |
| `threadCount`                | Override for default NodeJS Thread Count       | `6`      |
| `serviceAccount.create`      | Enable ServiceAccount Creation                 | `false`  |
| `serviceAccount.annotations` | Extra annotations to add to the ServiceAccount | `{}`     |
| `serviceAccount.name`        | Name of the Service Account                    | `nil`    |
| `resources.requests.cpu`     | Percentile of CPU Requested to run             | `500m`   |
| `resources.requests.memory`  | RAM Requested to run                           | `512Mi`  |
| `resources.limits.cpu`       | Maximum CPU allowed                            | `1000m`  |
| `resources.limits.memory`    | Maximum RAM allowed                            | `1024Mi` |
| `podSecurityContext`         | Extra security context for Pods                | `{}`     |
| `securityContext`            | Extra security context                         | `{}`     |
| `nodeSelector`               | Pod Node selector                              | `{}`     |
| `tolerations`                | Pod Tolerations                                | `[]`     |
| `affinity`                   | Pod Affinity                                   | `{}`     |


### Image Parameters

| Name               | Description                                | Value               |
| ------------------ | ------------------------------------------ | ------------------- |
| `image.pullPolicy` | pullPolicy for the Image                   | `IfNotPresent`      |
| `image.repository` | Repository to take the Image from          | `felddy/foundryvtt` |
| `image.tag`        | Image Tag                                  | `10.288`            |
| `imagePullSecrets` | Credentials for Docker private repository. | `[]`                |


### FoundryVTT Configuration

| Name                             | Description                                                                                                                                                                                                                                                           | Value                |
| -------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------- |
| `foundryvtt.username`            | Username of the Account who bought the FoundryVTT License                                                                                                                                                                                                             | `""`                 |
| `foundryvtt.password`            | Password of the Account who bought the FoundryVTT License                                                                                                                                                                                                             | `""`                 |
| `foundryvtt.licenseKey`          | License Key for FoundryVTT. If set the account infos are ignored.                                                                                                                                                                                                     | `""`                 |
| `foundryvtt.existingSecret`      | Name of an existing Secret to fetch the account from. If set, account settings from values are ignored. Must be used in combination with `foundryvtt.existingLicenseType` to fetch the correct data                                                                   | `""`                 |
| `foundryvtt.existingLicenseType` | Type of License to be fetched from the existing secret. Must be either `account` or `licenseKey`. If set to `account`, the `existingSecret` must contain a `username`/`password` data pair. If set to `licenseKey`, the secret must contain a `licenseKey` data entry | `account`            |
| `foundryvtt.hostname`            | Hostname of FoundryVTT                                                                                                                                                                                                                                                | `foundry.domain.com` |
| `foundryvtt.language`            | Language to use                                                                                                                                                                                                                                                       | `en.core`            |
| `foundryvtt.minifyStaticFiles`   | Whether to minify static files or not                                                                                                                                                                                                                                 | `true`               |
| `foundryvtt.proxySSL`            | Indicates whether the software is running behind a reverse proxy that uses SSL. This allows invitation links and A/V functionality to work as if the Foundry Server had SSL configured directly.                                                                      | `true`               |
| `foundryvtt.adminPassword`       | Admin Password to Access Admin Page                                                                                                                                                                                                                                   | `""`                 |
| `foundryvtt.upnp`                | Enable UPNP                                                                                                                                                                                                                                                           | `false`              |
| `foundryvtt.version`             | FoundryVTT Version to use                                                                                                                                                                                                                                             | `10.288`             |
| `foundryvtt.world`               | World to load at startup                                                                                                                                                                                                                                              | `""`                 |
| `foundryvtt.s3.enabled`          | Enable S3 Integration                                                                                                                                                                                                                                                 | `false`              |
| `foundryvtt.s3.existingSecret`   | Existing Secret containing a aws-credentials.json data entry, which must contain supported values by FoundryVTT. More Info [Here](https://foundryvtt.com/article/aws-s3/)                                                                                             | `""`                 |
| `foundryvtt.s3.config.endpoint`  | Custom S3 Endpoint, if different from AWS                                                                                                                                                                                                                             | `""`                 |
| `foundryvtt.s3.config.accessKey` | Access Key ID                                                                                                                                                                                                                                                         | `""`                 |
| `foundryvtt.s3.config.secretKey` | Secret Access Key                                                                                                                                                                                                                                                     | `""`                 |
| `foundryvtt.s3.config.region`    | S3 Bucket Region                                                                                                                                                                                                                                                      | `""`                 |


### Service Parameters

| Name                               | Description                                                              | Value       |
| ---------------------------------- | ------------------------------------------------------------------------ | ----------- |
| `service.serviceType`              | Type of Service to create, defaults to ClusterIP                         | `ClusterIP` |
| `service.port`                     | Port to expose                                                           | `80`        |
| `service.protocol`                 | Protocol to use                                                          | `TCP`       |
| `service.loadBalancerIP`           | IP to assign to the Service if type LoadBalancer is selected, deprecated | `nil`       |
| `service.loadBalancerSourceRanges` | Range from which to choose the IP to assign to the Service               | `[]`        |
| `service.externalTrafficPolicy`    | External Traffic Policy                                                  | `Local`     |
| `service.labels`                   | Extra labels to assign to the Service                                    | `{}`        |
| `service.tls`                      | Enable TLS for the Service                                               | `true`      |
| `service.annotations`              | Extra annotations to assign to the Service                               | `{}`        |


### Persistence Parameters

| Name                          | Description                                                                        | Value               |
| ----------------------------- | ---------------------------------------------------------------------------------- | ------------------- |
| `persistence.enabled`         | Enable or Disable Persistence                                                      | `true`              |
| `persistence.storageClass`    | Storage Class to use when creating the Persistent Volume Claim                     | `""`                |
| `persistence.size`            | Size of the PV to create                                                           | `8Gi`               |
| `persistence.readAccessModes` | List of ReadAccessModes to use with the PVC                                        | `["ReadWriteOnce"]` |
| `persistence.existingClaim`   | Name of an existing claim to use instead of creating a new one. If this is set and | `""`                |


### Extra Container Configurations

| Name                       | Description                                                                                                                                                                                                                                                           | Value                   |
| -------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------- |
| `container.cache`          | Path to use when downloading FoundryVTT                                                                                                                                                                                                                               | `/data/container_cache` |
| `container.preserveConfig` | Normally new `options.json` and `admin.txt` files are generated by the container at each startup.  Setting this to `true` prevents the container from modifying these files when they exist.  If they do not exist, they will be created as normal. Default is false. | `false`                 |
| `container.timezone`       | Container [TZ database name](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List). Default is UTC                                                                                                                                                       | `UTC`                   |
| `container.verbose`        | Set to `true` to enable verbose logging for the container utility scripts. Default is false                                                                                                                                                                           | `false`                 |


### Ingress Parameters

| Name                           | Description                                    | Value                |
| ------------------------------ | ---------------------------------------------- | -------------------- |
| `ingress.enabled`              | Enable Ingress creations                       | `false`              |
| `ingress.hostname`             | Hostname for FoundryVTT                        | `foundry.domain.com` |
| `ingress.annotations`          | Ingress Annotations, useful for TLS            | `{}`                 |
| `ingress.path`                 | FoundryVTT Path                                | `/`                  |
| `ingress.pathType`             | Type of Path                                   | `Prefix`             |
| `ingress.tls`                  | Enable or Disable TLS                          | `false`              |
| `ingress.configurationSnippet` | Extra NGINX Configuration to add as Annotation | `""`                 |

