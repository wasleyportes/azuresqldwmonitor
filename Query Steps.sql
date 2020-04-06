-- Find the distributed query plan steps for a specific query.

DECLARE @reqid VARCHAR(20) = 'QID906592' -- Change it to address the query to monitor

SELECT * FROM sys.dm_pdw_request_steps
WHERE request_id = @reqid
ORDER BY step_index;

SELECT command, * FROM sys.dm_pdw_sql_requests
WHERE request_id = @reqid
ORDER BY step_index;


-- Find the SQL Server execution plan for a query running on a specific SQL pool or control node.
DBCC PDW_SHOWEXECUTIONPLAN(1 /* distribution_id */, 218 /* spid */);