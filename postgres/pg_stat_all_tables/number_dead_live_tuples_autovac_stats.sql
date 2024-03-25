SELECT
schemaname,
relname,
n_live_tup,
n_dead_tup,
n_dead_tup * 100 / (case when n_live_tup > 0 then n_live_tup else 1 end) as dead_rows_percent,
last_autovacuum,
last_autoanalyze,
n_dead_tup,
relname
FROM
pg_stat_all_tables
WHERE
schemaname not in ('pg_catalog','information_schema','pg_toast')
ORDER BY
n_dead_tup DESC;
