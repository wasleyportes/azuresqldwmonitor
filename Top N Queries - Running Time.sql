-- Find top 10 queries longest running queries
SELECT TOP 10
       *
FROM sys.dm_pdw_exec_requests
ORDER BY total_elapsed_time DESC;