COPY raw.qa_raw
FROM 'C:\\postgres\\imports\\Audit_Data_Processed.csv'
WITH (FORMAT CSV, HEADER true, DELIMITER ',', QUOTE '"')