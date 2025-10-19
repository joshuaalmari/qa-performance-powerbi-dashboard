DROP MATERIALIZED VIEW IF EXISTS mart.mv_accuracy;

CREATE MATERIALIZED VIEW mart.mv_accuracy AS
WITH
pivoted AS (
  SELECT
    powerapps_id,
    COALESCE(SUM(CASE WHEN error_category_new = 'Critical' THEN error_count END), 0) AS "#_of_Critical",
    COALESCE(SUM(CASE WHEN error_category_new = 'Major'    THEN error_count END), 0) AS "#_of_Major",
    COALESCE(SUM(CASE WHEN error_category_new = 'Minor'    THEN error_count END), 0) AS "#_of_Minor",
    COALESCE(SUM(CASE WHEN error_category_new = 'Feedback' THEN error_count END), 0) AS "#_of_Feedback"
  FROM refine.vw_error_counts
  GROUP BY powerapps_id
),
context AS (
  SELECT
    q.powerapps_id            AS powerapps_id,
    q.globalid, q.site, q.firstname, q.lastname,
    q.remotepartner, q.role, q.team_lead,
    q.domesticteamlead1, q.domesticteamlead2,
    q.sales_order_number_clean      AS sales_order_number,
    q.invoice_number,
    q.score, q.auditor, q.auditor_comment,
    q.datetimestamp,
    q.role_selection, q.process_name,
    q.week_beginning,
    (btrim(q.firstname) || ' ' || btrim(q.lastname)) AS name,
    (q.week_beginning + INTERVAL '6 days')::date      AS week_ending,
    q.start_date,
    q.is_agent_team_lead AS "Is TL",
    q.buffer_resource    AS "Buffer"
  FROM refine.vw_qa_with_process q
)
SELECT
  c.*,
  COALESCE(p."#_of_Critical", 0) AS "#_of_Critical",
  COALESCE(p."#_of_Major",    0) AS "#_of_Major",
  COALESCE(p."#_of_Minor",    0) AS "#_of_Minor",
  COALESCE(p."#_of_Feedback", 0) AS "#_of_Feedback",
  CASE WHEN c.score < 100 OR COALESCE(p."#_of_Feedback", 0) > 0 THEN 1 ELSE 0 END AS "Count",
  CASE
    WHEN c.start_date IS NOT NULL AND (c.week_ending::date - c.start_date::date) > 90
    THEN 1 ELSE 0
  END AS "New Hire"
FROM context c
LEFT JOIN pivoted p
  ON p.powerapps_id = c.powerapps_id
ORDER BY c.datetimestamp DESC, c.powerapps_id;

SELECT *
FROM mart.mv_accuracy;