\connect test_db;

CREATE TABLE public.table_with_audit (
    id uuid PRIMARY KEY,
    column_1 VARCHAR(32) NOT NULL,
    column_2 VARCHAR(32) NOT NULL
);

CREATE TABLE public.table_without_audit (
    id uuid PRIMARY KEY,
    column_1 VARCHAR(32) NOT NULL,
    column_2 VARCHAR(32) NOT NULL
);