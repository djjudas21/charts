# load all the just libraries
justlib := `git rev-parse --show-toplevel` / "tools/justlib"
develop := "just --justfile " + justlib / "develop.justlib"
e2e := "just --justfile " + justlib / "e2e.justlib"
helm := "just --justfile " + justlib / "helm.justlib"
image := "just --justfile " + justlib / "image.justlib"
renovate := "just --justfile " + justlib / "renovate.justlib"
security := "just --justfile " + justlib / "security.justlib"
tools := "just --justfile " + justlib / "tools.justlib"

# shortcut to execute some commands in bash verbosely and compatible with Github Actions
exec := tools + " xtrace"

chart_name := file_name(justfile_directory())
container_registry := "ghcr.io"


[private]
default:
    @just --list


# build out all "runtime" resources related to the current application (images, charts)
build: build-images build-chart

# build out all "external" resources related to the current application (charts, README, ...)
build-external: build-schema build-validation-files build-readme

# build one or multiple images (use relative path from current directory)
@build-images +IMAGES="all":
  {{ image }} build "{{ chart_name }}" "{{ container_registry }}" {{ IMAGES }}

# build out the charts/ directory from the Chart.lock file
@build-chart:
  {{ helm }} build

# generates all resources managed by this chart application to quickly see any changes
build-validation-files:
  {{ helm }} build-validation-files "{{ chart_name }}"

# generates markdown documentation from requirements and values files
@build-readme:
  {{ helm }} build-readme

# generates a json schema from values.schema.yaml
@build-schema:
  {{ helm }} build-schema


# lint all "runtime" resources related to the current application (images, charts)
lint: lint-images lint-chart

# lint one or multiple images (use relative path from current directory)
lint-images +IMAGES="all":
  {{ image }} lint {{ IMAGES }}

# runs a series of tests to verify that the chart is well-formed
@lint-chart:
  {{ helm }} lint


# install and test the current application into a local cluster
@e2e-run CLUSTER_NAME=("e2e-" + chart_name): (e2e-setup CLUSTER_NAME) (e2e-prepare CLUSTER_NAME) && (e2e-teardown CLUSTER_NAME)
  {{ e2e }} run "{{ CLUSTER_NAME }}" "{{ chart_name }}"

# prepare the local environment to run e2e tests locally
[private]
@e2e-setup CLUSTER_NAME=("e2e-" + chart_name):
  {{ e2e }} setup "{{ CLUSTER_NAME }}"

# install all required resources to install and run the application properly
[private]
@e2e-prepare CLUSTER_NAME=("e2e-" + chart_name):
  {{ e2e }} prepare "{{ CLUSTER_NAME }}" "{{ chart_name }}"

# remove the local environment to run e2e tests locally
[private]
@e2e-teardown CLUSTER_NAME=("e2e-" + chart_name):
  {{ e2e }} teardown "{{ CLUSTER_NAME }}"


# prepare a local environment to develop and/or debug the application
develop +OPTS="": develop-setup && develop-prepare (develop-install OPTS)

@develop-setup:
  {{ develop }} setup "{{ chart_name }}"

@develop-prepare:
  {{ develop }} prepare "{{ chart_name }}"

# install the application on the local environment
@develop-install +OPTS="":
  {{ develop }} install "{{ chart_name }}" {{ OPTS }}

# reinstall the application on the local environment
@develop-reinstall +OPTS="":
  {{ develop }} reinstall "{{ chart_name }}" {{ OPTS }}

# stop the local environment
@develop-teardown:
  {{ develop }} teardown "{{ chart_name }}"


# scan images and chart for missconfiguration or security issues
security-scan OPTS="": (security-scan-images OPTS) (security-scan-chart OPTS)

# scan one or multiple images for missconfiguration or security issues
@security-scan-images OPTS="" +IMAGES="all":
  {{ security }} scan-images "{{ chart_name }}" "{{ container_registry }}" "{{ OPTS }}" {{ IMAGES }}

# scan current chart for missconfiguration or security issues
@security-scan-chart OPTS="":
  {{ security }} scan-chart "{{ OPTS }}"


# automatically bump the chart version if something changes (used by Renovate).
@renovate-update-chart +BASE_BRANCH="main":
  {{ renovate }} update-chart "{{ chart_name }}" "{{ BASE_BRANCH }}"

# rebuild all "external" files (or files used for CI validation and packaging)
# and commit them automatically.
git-commit-package: build-external
  git add ~develop/validation/ README.md values.schema.json
  git commit --message ":package: (apps/{{ chart_name }}): rebuild all packaging files"
