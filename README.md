# nextgen-connect-chart
Mirth / NextGen Connect Helm Chart with pgsql 

## Todo
- [ ] [critical] Postgres DB support
- [ ] Ingress support 
- [ ] TLS support 



## Contents

- Mirth / NextGen Connect Docker image
  - Custom entrypoint.sh to support running Kubernetes instance
- `nextgen-connect` Helm chart
  - uses custom `hiddehs/nextgen-connect` 3.11 docker image


### Custom `entrypoint.sh`

Following lines are added to the `entrypoint.sh` to make sure the connection within the container is forced to type postgres and the `JDBC_DATABASEURL` can be used for overriding GitLab's not jdbc-friendly `DATABASE_URL`

```bash
export DATABASE=postgres
export DATABASE_URL=$JDBC_DATABASE_URL
```
