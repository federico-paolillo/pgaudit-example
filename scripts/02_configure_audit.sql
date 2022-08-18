CREATE ROLE auditor;

ALTER DATABASE test_db SET pgaudit.role = 'auditor';

GRANT INSERT, UPDATE, DELETE ON public.table_with_audit TO auditor;