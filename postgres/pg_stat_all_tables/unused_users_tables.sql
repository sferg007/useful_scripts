SELECT
schemaname,
relname,
seq_scan,
idx_scan,
(COALESCE(seq_scan, 0) + COALESCE(idx_scan, 0)) as total_scans_performed
FROM
pg_stat_all_tables
WHERE
(COALESCE(seq_scan, 0) + COALESCE(idx_scan, 0)) < 10
AND schemaname not in ('pg_catalog', 'information_schema', 'pg_toast')
ORDER BY
5 DESC;
