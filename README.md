# TMAN Swagger Documents

> Read these APIs in Swagger

- [Atlassian Cloud](https://tman-lab.github.io/tman-favorite-api/?path=docs/atlassian/cloud.json)

- [Atlassian Data Center](https://tman-lab.github.io/tman-favorite-api/?path=docs/atlassian/datacenter.json)

- [TMAN CRM Hub](https://tman-lab.github.io/tman-favorite-api/?path=https://apps.tman.work/crmhub/rest/api/openapi.json)

## Write API Doc

[swagger_yaml/atlassian](swagger_yaml/atlassian)

## Push Doc to GitHub

Setup new swagger ui version

```bash
./step_1_prepare_assets.sh
```

Convert YAML to Json

```bash
./step_2_convert_yaml_to_json.py
```

## Build a local Docker image to debug

Build an new Docker image

```bash
./step_3_build_docker_image.sh
```
