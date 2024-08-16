# validate-fhir-profiles

## Docker Image

The build information can be found in `docker/`.

Build FHIR profiles for FSH sushi project in `<project dir>`.

```bash
docker run --rm -u $(id -u):$(id -g) \
    -v <project dir>:/project \
    ghcr.io/cybernop/validate-fhir-profiles:<validator version>
```

With `<validator version>` one can specify which version of the HAPI Java Validator to use for checking. Currently the following versions are supported:

* `6.3.18`
* `6.3.19`
* `6.3.20`

### Script

A convenience script can be downloaded

```bash
wget https://raw.githubusercontent.com/cybernop/validate-fhir-profiles/main/docker/scripts/validate-fhir-profiles.sh
```

set executable permissions

```bash
chmod a+x validate-fhir-profiles.sh
```

Call the script with

```bash
[VALIDATOR_VERSION=<validator version>] validate-fhir-profiles.sh [<project dir>]
```
