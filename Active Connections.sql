-- Other Active Connections
SELECT *
FROM sys.dm_pdw_exec_sessions
WHERE status <> 'Closed'
      AND session_id <> session_id();