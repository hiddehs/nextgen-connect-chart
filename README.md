# nextgen-connect-chart
Mirth / NextGen Connect Helm Chart with pgsql 

## Todo
- [x] [critical] Out-of-the-box-auto-configured postgresql DB support
- [ ] Ingress / TLS support 

## Usage
```bash
helm repo add hiddehs-nextgen https://hiddehs.github.io/nextgen-connect-chart/
helm repo update
helm install nextgen-connect hiddehs-nextgen/nextgen-connect --create-namespace --set postgresql.postgresqlPassword="supersecrethere"
```

## Contents

- Mirth / NextGen Connect Docker image
  - Custom entrypoint.sh to support running Kubernetes instance
  - FHIR 🔥 plugin support
- `nextgen-connect` Helm chart
  - uses custom `hiddehs/nextgen-connect` 3.11 docker image

### Custom `entrypoint.sh`
##### See [deployment.yaml](charts/nextgen-connect/templates/deployment.yaml#L51) `spec.template.spec.containers[0].env`

Following lines are added to the `entrypoint.sh` to make sure the connection within the container is forced to type postgres and the `JDBC_DATABASEURL` can be used for overriding GitLab's not jdbc-friendly `DATABASE_URL`

```bash
export DATABASE=postgres
export DATABASE_URL=$JDBC_DATABASE_URL
```

