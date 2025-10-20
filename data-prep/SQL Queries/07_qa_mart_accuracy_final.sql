DROP MATERIALIZED VIEW IF EXISTS mart.mv_accuracy;

CREATE MATERIALIZED VIEW mart.mv_accuracy AS
WITH
-- Pivot error counts PER audit row (PowerAppsId + DateTimeStamp)
pivoted AS (
  SELECT
    powerapps_id,
    datetimestamp,
    COALESCE(SUM(CASE WHEN error_category_new = 'Critical' THEN error_count END), 0) AS "#_of_Critical",
    COALESCE(SUM(CASE WHEN error_category_new = 'Major'    THEN error_count END), 0) AS "#_of_Major",
    COALESCE(SUM(CASE WHEN error_category_new = 'Minor'    THEN error_count END), 0) AS "#_of_Minor",
    COALESCE(SUM(CASE WHEN error_category_new = 'Feedback' THEN error_count END), 0) AS "#_of_Feedback"
  FROM refine.vw_error_counts
  GROUP BY powerapps_id, datetimestamp
),

-- Context for each audit row (cleaned fields and derived week ending)
context AS (
  SELECT
    q.powerapps_id,
    q.globalid,
    q.site,
    q.firstname,
    q.lastname,
    q.remotepartner,
    q.role,
    q.team_lead,
    q.domesticteamlead1,
    q.domesticteamlead2,
    q.sales_order_number_clean  AS sales_order_number,
    q.invoice_number,
    -- raw error text columns (multi-valued, comma-separated) for display
    q.critical_errors,
    q.major_errors,
    q.minor_errors,
    q.feedback_errors,
    q.score,
    q.auditor,
    q.datetimestamp,
    q.role_selection,
    q.process_name,
    q.error_type,
    -- week beginning already computed in refine; derive week ending
    (q.week_beginning + INTERVAL '6 days')::date AS week_ending,
    -- other flags used downstream
    q.is_agent_team_lead,
    q.buffer_resource
  FROM refine.vw_qa_with_process q
)

-- Final projection in your EXACT desired order
SELECT
  /* 1 */  c.globalid                              AS "GlobalID",
  /* 2 */  c.site                                  AS "Site",
  /* 3 */  c.firstname                             AS "FirstName",
  /* 4 */  c.lastname                              AS "LastName",
  /* 5 */  c.remotepartner                         AS "RemotePartner",
  /* 6 */  c.role                                  AS "Role",
  /* 7 */  c.team_lead                             AS "Team Lead",
  /* 8 */  c.domesticteamlead1                     AS "DomesticTeamLead1",
  /* 9 */  c.domesticteamlead2                     AS "DomesticTeamLead2",
  /*10 */  c.sales_order_number                    AS "Sales Order Number",
  /*11 */  c.invoice_number                        AS "Invoice Number",
  /*12 */  c.critical_errors                       AS "Critical Errors",
  /*13 */  c.major_errors                          AS "Major Errors",
  /*14 */  c.minor_errors                          AS "Minor Errors",
  /*15 */  c.feedback_errors                       AS "Feedback Errors",
  /*16 */  c.score                                 AS "Score",
  /*17 */  c.auditor                               AS "Auditor",
  /*18 */  c.datetimestamp                         AS "DateTimeStamp",
  /*19 */  c.role_selection                        AS "Role_Selection",
  /*20 */  c.powerapps_id                          AS "__PowerAppsId__",
  /*21 */  COALESCE(p."#_of_Critical", 0)          AS "#_of_Critical",
  /*22 */  COALESCE(p."#_of_Major",    0)          AS "#_of_Major",
  /*23 */  COALESCE(p."#_of_Minor",    0)          AS "#_of_Minor",
  /*24 */  COALESCE(p."#_of_Feedback", 0)          AS "#_of_Feedback",
  /*25 */  CASE WHEN c.score < 100 OR COALESCE(p."#_of_Feedback", 0) > 0 THEN 1 ELSE 0 END AS "Count",
  /*26 */  c.week_ending                           AS "Week Ending",
  /*27 */  (btrim(c.firstname) || ' ' || btrim(c.lastname)) AS "Name",
  /*28 */  c.process_name                          AS "Process",
  /*29 */  c.error_type                            AS "Audit Type",
  /*30 */  c.is_agent_team_lead                    AS "Is TL",
  /*31 */  c.buffer_resource                       AS "Buffer"
FROM context c
LEFT JOIN pivoted p
       ON p.powerapps_id = c.powerapps_id
      AND p.datetimestamp = c.datetimestamp
ORDER BY c.datetimestamp DESC, c.powerapps_id;

-- quick peek
SELECT * FROM mart.mv_accuracy LIMIT 5;
