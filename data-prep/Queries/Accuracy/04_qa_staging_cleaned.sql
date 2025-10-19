CREATE OR REPLACE VIEW staging.vw_qa_clean AS
SELECT
  btrim("GlobalID")                         AS globalid,
  btrim("FirstName")                        AS firstname,
  btrim("LastName")                         AS lastname,
  btrim("RemotePartner")                    AS remotepartner,
  btrim("Role")                             AS role,
  btrim("Team Lead")                        AS team_lead,
  btrim("DomesticTeamLead1")                AS domesticteamlead1,
  btrim("DomesticTeamLead2")                AS domesticteamlead2,
  btrim("Sales Order Number")               AS sales_order_number,
  btrim("Invoice Number")                   AS invoice_number,
  btrim("Error_Type")                       AS error_type,
  btrim("Error Detail")                     AS error_detail,
  btrim("Critical Errors")                  AS critical_errors,
  btrim("Major Errors")                     AS major_errors,
  btrim("Minor Errors")                     AS minor_errors,
  btrim("Feedback Errors")                  AS feedback_errors,
  "Score"                                   AS score,            -- numeric stays numeric
  btrim("Auditor")                          AS auditor,
  btrim("Auditor Comment")                  AS auditor_comment,
  "DateTimeStamp"                           AS datetimestamp,    -- keep date/timestamp
  btrim("Role_Selection")                   AS role_selection,
  btrim("__PowerAppsId__")                  AS powerapps_id,
  "Start Date"                              AS start_date,       -- date
  btrim("Remote Partner Location")          AS site,
  btrim("Is Agent Team Lead")               AS is_agent_team_lead,
  btrim("Buffer Resource")                  AS buffer_resource
FROM raw.qa_raw;
