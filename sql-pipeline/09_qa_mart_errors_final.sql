CREATE OR REPLACE VIEW mart.vw_errors AS
SELECT
    e.error_detail_new                                 AS "Error_Detail_New",
    e.site                                             AS "Site",
    e.powerappsid                                      AS "__PowerAppsId__",
    e.error_category_new                               AS "Error_Category_New",

    e.globalid                                         AS "GlobalID",
    e.firstname                                        AS "FirstName",
    e.lastname                                         AS "LastName",
    e.remotepartner                                    AS "RemotePartner",
    e.role                                             AS "Role",
    e.team_lead                                        AS "Team Lead",
    e.domesticteamlead1                                AS "DomesticTeamLead1",
    e.domesticteamlead2                                AS "DomesticTeamLead2",
    e.sales_order_number                               AS "Sales Order Number",
    e.score                                            AS "Score",
    e.auditor                                          AS "Auditor",
    e.datetimestamp                                    AS "DateTimeStamp",
    e.role_selection                                   AS "Role_Selection",
    e.week_beginning                                   AS "Week Beginning",
    e.process_name                                     AS "Process Name",
    concat_ws(' ', trim(e.firstname), trim(e.lastname)) AS "Name",
    e.error_type                                        AS "Audit Type"
FROM staging.vw_errors_exploded e
ORDER BY e.datetimestamp, e.powerappsid, e.error_category_new, e.error_detail_new;

SELECT *
FROM mart.vw_errors
LIMIT 5;
