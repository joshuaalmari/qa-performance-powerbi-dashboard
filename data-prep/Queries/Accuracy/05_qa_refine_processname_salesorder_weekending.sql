CREATE OR REPLACE VIEW refine.vw_qa_with_process AS
WITH base AS (
  SELECT c.*,
         COALESCE(r.process_name, 'Unmapped') AS process_name
  FROM staging.vw_qa_clean c
  LEFT JOIN ref.role_to_process r
    ON r.role_selection = c.role_selection
),
sales_fix AS (
  SELECT *,
         CASE
           WHEN right(sales_order_number, 2) = '.0'
             THEN left(sales_order_number, length(sales_order_number) - 2)
           ELSE sales_order_number
         END AS sales_order_number_clean
  FROM base
),
week_calc AS (
  /* Sunday-start week beginning:
     date_trunc('week') is Monday-based; this expression aligns to Sunday. */
  SELECT *,
         (datetimestamp::date - EXTRACT(DOW FROM datetimestamp)::int) AS week_beginning
  FROM sales_fix
)
SELECT *
FROM week_calc;
