SELECT
st.schemaname,st.relname,
pg_size_pretty(pg_total_relation_size(st.relid)) as Total_Size,
st.seq_scan,
st.idx_scan,
st.n_tup_ins,
st.n_tup_upd,
st.n_tup_del
FROM pg_stat_all_tables st
WHERE st.schemaname not in ('pg_catalog','information_schema','pg_toast')
ORDER BY Total_Size DESC;
