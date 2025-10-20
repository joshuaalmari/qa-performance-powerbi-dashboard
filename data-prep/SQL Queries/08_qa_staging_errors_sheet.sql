CREATE OR REPLACE VIEW staging.vw_errors_exploded AS
WITH base AS (
    SELECT
        q.powerapps_id                    AS powerappsid,
        q.datetimestamp                   AS datetimestamp,        -- DATE
        q.globalid                        AS globalid,
        q.firstname                       AS firstname,
        q.lastname                        AS lastname,
        q.remotepartner                   AS remotepartner,
        q.role                            AS role,
        q.team_lead                       AS team_lead,
        q.domesticteamlead1               AS domesticteamlead1,
        q.domesticteamlead2               AS domesticteamlead2,
        q.sales_order_number_clean        AS sales_order_number,
        q.invoice_number                  AS invoice_number,
        q.score                           AS score,
        q.auditor                         AS auditor,
        q.auditor_comment                 AS auditor_comment,
        q.role_selection                  AS role_selection,
        q.process_name                    AS process_name,
        q.site                            AS site,
        q.error_type                      AS error_type,
        q.critical_errors                 AS critical_errors,
        q.major_errors                    AS major_errors,
        q.minor_errors                    AS minor_errors,
        q.feedback_errors                 AS feedback_errors
    FROM refine.vw_qa_with_process q
),

-- Split each error col by comma, trim, drop blanks, tag category
crit AS (
    SELECT
        b.*, 'Critical'::text AS error_category_new,
        trim(x)               AS error_detail_new
    FROM base b
    CROSS JOIN LATERAL unnest(
        string_to_array(coalesce(b.critical_errors, ''), ',')
    ) AS x
    WHERE trim(x) <> ''
),

maj AS (
    SELECT
        b.*, 'Major'::text AS error_category_new,
        trim(x)            AS error_detail_new
    FROM base b
    CROSS JOIN LATERAL unnest(
        string_to_array(coalesce(b.major_errors, ''), ',')
    ) AS x
    WHERE trim(x) <> ''
),

min AS (
    SELECT
        b.*, 'Minor'::text AS error_category_new,
        trim(x)            AS error_detail_new
    FROM base b
    CROSS JOIN LATERAL unnest(
        string_to_array(coalesce(b.minor_errors, ''), ',')
    ) AS x
    WHERE trim(x) <> ''
),

feed AS (
    SELECT
        b.*, 'Feedback'::text AS error_category_new,
        trim(x)               AS error_detail_new
    FROM base b
    CROSS JOIN LATERAL unnest(
        string_to_array(coalesce(b.feedback_errors, ''), ',')
    ) AS x
    WHERE trim(x) <> ''
),

unioned AS (
    SELECT * FROM crit
    UNION ALL SELECT * FROM maj
    UNION ALL SELECT * FROM min
    UNION ALL SELECT * FROM feed
)

SELECT
    powerappsid,
    datetimestamp,
    -- Sunday week start: (Mon-trunc on +1 day) -1 day
    (date_trunc('week', datetimestamp::timestamp + INTERVAL '1 day') - INTERVAL '1 day')::date
        AS week_beginning,
    error_category_new,
    error_detail_new,

    site,
    globalid,
    firstname,
    lastname,
    remotepartner,
    role,
    team_lead,
    domesticteamlead1,
    domesticteamlead2,
    sales_order_number,
    invoice_number,
    score,
    auditor,
    auditor_comment,
    role_selection,
    process_name,
    error_type
FROM unioned;

SELECT *
FROM staging.vw_errors_exploded;
