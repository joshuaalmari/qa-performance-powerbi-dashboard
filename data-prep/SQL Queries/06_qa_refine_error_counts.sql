CREATE OR REPLACE VIEW refine.vw_error_counts AS
WITH exploded AS (
    -- Critical
    SELECT
        q."__PowerAppsId__"          AS powerapps_id,
        q."DateTimeStamp"            AS datetimestamp,
        'Critical'                   AS error_category_new,
        TRIM(regexp_split_to_table(q."Critical Errors", ',')) AS error_detail
    FROM raw.qa_raw q
    WHERE q."Critical Errors" IS NOT NULL
      AND TRIM(q."Critical Errors") <> ''

    UNION ALL

    -- Major
    SELECT
        q."__PowerAppsId__", q."DateTimeStamp",
        'Major',
        TRIM(regexp_split_to_table(q."Major Errors", ',')) AS error_detail
    FROM raw.qa_raw q
    WHERE q."Major Errors" IS NOT NULL
      AND TRIM(q."Major Errors") <> ''

    UNION ALL

    -- Minor
    SELECT
        q."__PowerAppsId__", q."DateTimeStamp",
        'Minor',
        TRIM(regexp_split_to_table(q."Minor Errors", ',')) AS error_detail
    FROM raw.qa_raw q
    WHERE q."Minor Errors" IS NOT NULL
      AND TRIM(q."Minor Errors") <> ''

    UNION ALL

    -- Feedback
    SELECT
        q."__PowerAppsId__", q."DateTimeStamp",
        'Feedback',
        TRIM(regexp_split_to_table(q."Feedback Errors", ',')) AS error_detail
    FROM raw.qa_raw q
    WHERE q."Feedback Errors" IS NOT NULL
      AND TRIM(q."Feedback Errors") <> ''
)

SELECT
    powerapps_id,
    datetimestamp,
    error_category_new,
    COUNT(*) AS error_count
FROM exploded
GROUP BY powerapps_id, datetimestamp, error_category_new
ORDER BY datetimestamp;


SELECT *
FROM refine.vw_error_counts
LIMIT 5;