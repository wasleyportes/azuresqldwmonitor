-- Monitor active queries
SELECT R.command, *
FROM sys.dm_pdw_exec_requests R
JOIN sys.dm_pdw_waits W
	ON R.session_id = W.session_id
WHERE 1=1
	AND R.status NOT IN ( 'Completed', 'Failed', 'Cancelled' )
	AND R.session_id <> session_id()
ORDER BY R.submit_time DESC;