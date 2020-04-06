-- Find information about all the workers completing a Data Movement Step.
-- Replace request_id and step_index with values from Step 1 and 3.

DECLARE @reqid VARCHAR(20) = 'QID906592' -- Change it to address the query to monitor

SELECT * FROM sys.dm_pdw_dms_workers
WHERE 1=1
	AND request_id = @reqid
	AND step_index = 2 -- Use whatever step_index you would like to monitor;