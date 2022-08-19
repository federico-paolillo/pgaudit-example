# PostgreSQL `pgaudit` configuration example

Custom Docker image based on [`bitnami/postgresql`](https://hub.docker.com/r/bitnami/postgresql/) that setups [`pgaudit`](https://github.com/pgaudit/pgaudit) to log writes on a single table.

## Considerations

Base image [bitnami/postgresql](https://hub.docker.com/r/bitnami/postgresql/) was chosen because it ships bundled with [`pgaudit`](https://github.com/pgaudit/pgaudit).

## Run

Change directory to the root of this repository and run `docker compose up --build`.  
The logs will be bind-mounted to a folder called `logs/`, if it does not exist it will be created.

## Usage

Anytime you try to edit `test_db.public.table_with_audit` you will see audit logs printed to stdout.  
Changes to `test_db.public.test_without_audit` will not generate any audit logs.  
You can use the pgAdmin instance included and pre-configured in the docker-compose.yml to mess with the database.

The file `cfg/99_logging.conf` configures PostgreSQL logging and configures where the log files will be stored.  
I've chose to use the folder `/bitnami/postgresql/logs`, if you change it remember to update the bind mounts in `docker-compose`.

To configure auditing rules refer to [the official documentation](https://github.com/pgaudit/pgaudit) but you can find an example of [object audit logging](https://github.com/pgaudit/pgaudit#object-audit-logging) in `scripts/02_configure_audit.sql`.  
Remember that PostgreSQL pre-configuration is executed only once and skipped if PostgreSQL data already exists. If you make changes to the `scripts/` and don't see any changes remember to destroy any volumes left over.

See [official `bitnami/postgresql` docs](https://github.com/bitnami/containers/tree/main/bitnami/postgresql) for further explanations on _why_ files have been copied to specific folders.

## Example of audit output

```
2022-08-19 07:54:31.204 GMT [163] LOG:  AUDIT: OBJECT,1,1,WRITE,INSERT,TABLE,public.table_with_audit,"INSERT INTO public.table_with_audit (
	id, column_1, column_2) VALUES (
	'b123c109-1246-4433-a270-b98d39a97185'::uuid, 'sadasdasdas'::character varying, 'asdasdasdasda'::character varying)
	 returning id;",<not logged>
```
