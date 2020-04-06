SELECT S.Name SchemaName,
       O.Name TableName,
       D.distribution_policy_desc DistType,
       SUM(rg.total_rows) TotalRows,
       CAST(ROUND(CAST(SUM(rg.size_in_bytes) AS DECIMAL(16, 2)) / 1024.0 / 1024.0 / 1024.0, 0) AS INT) SizeGB
FROM sys.pdw_table_distribution_properties D
    JOIN sys.objects O
        ON O.object_id = D.object_ID
    JOIN sys.schemas S
        ON O.schema_id = S.schema_Id
    JOIN sys.pdw_table_mappings MP
        ON O.object_id = MP.object_id
    JOIN sys.pdw_nodes_tables NT
        ON NT.name = MP.physical_name
    JOIN sys.dm_pdw_nodes_db_column_store_row_group_physical_stats rg
        ON rg.object_id = NT.object_id
           AND rg.pdw_node_id = NT.pdw_node_id
           AND rg.distribution_id = NT.distribution_id
GROUP BY S.Name,
         O.Name,
         D.distribution_policy_desc
ORDER BY TotalRows DESC;