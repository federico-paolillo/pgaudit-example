# Setting up `pgaudit` on the relation level

Custom Docker image based on [`bitnami/postgresql`](https://hub.docker.com/r/bitnami/postgresql/) that setups [`pgaudit`](https://github.com/pgaudit/pgaudit) to log writes on a single table.

## Considerations

Base image [bitnami/postgresql](https://hub.docker.com/r/bitnami/postgresql/) was chosen because it ships bundled with [`pgaudit`](https://github.com/pgaudit/pgaudit).

## Run

Change directory to the root of this repository and run `docker compose up --build`.  
Anytime you try to edit `test_db.public.table_with_audit` you will see audit logs printed to stdout.  
Changes to `test_db.public.test_without_audit` will not generate any audit logs.
