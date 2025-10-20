# 🔍 QA Performance Dashboard – Power BI  

<p align="center">
  <a href="https://github.com/joshuaalmari/data-analytics-portfolio" style="text-decoration:none;">
    <img src="https://img.shields.io/badge/DATA%20ANALYTICS%20PORTFOLIO-2f2f2f?style=for-the-badge">
    <img src="https://img.shields.io/badge/CLICK%20TO%20RETURN-0078D4?style=for-the-badge">
  </a>
</p>

---

## 🧭 Project Overview  
<p align="justify">
This Power BI dashboard visualizes the performance of the <b>Quality Assurance (QA) team</b> for a BPO account using data extracted from <b>AuditPro</b>.  
It tracks <b>QA Scores, Error Categories, Accuracy Rates,</b> and <b>Audit Type Distributions</b> — empowering QA Leads and Operations Managers to identify trends, detect recurring issues, and strengthen quality compliance.
</p>

---

## ⚙️ Workflow & Data Pipeline  

**📥 1. Data Extraction**  
- Exported QA audit snapshots (Error & Accuracy logs) from **AuditPro**.

**🐍 2. Data Preprocessing (Python)**  
- Cleaned and standardized CSVs using **Pandas**.  
- Normalized inconsistent formats and anonymized sensitive data.

**🗄️ 3. Data Transformation (PostgreSQL)**  
- Rebuilt transformation logic from Power Query into **SQL views** and **materialized views** for scalability and clarity.  
- Implemented a modular schema pipeline:
  - 🧱 **staging** – raw-to-clean data transformations  
  - 🔄 **refine** – process tagging, standardization, role mapping  
  - 📊 **mart** – reporting tables for Accuracy & Error sheets  
- Used **CTEs**, **UNNEST()**, and **string_to_array()** for splitting multi-error columns, trimming text, and aggregating counts.

**⚙️ 4. Light Shaping (Power Query)**  
- Final column ordering and binding before loading into Power BI.

**📊 5. Visualization (Power BI)**  
- Designed interactive dashboards for error trends, weekly accuracy, and auditor productivity using **DAX** and custom visuals.

> 🗓️ **Data Coverage:** July 16 – September 25, 2025  
> Extracted from AuditPro as a static, non-refreshing dataset.

---

## 🧠 SQL ETL Pipeline Diagram  

```mermaid
flowchart TD
    A[📥 Raw AuditPro CSVs] --> B[🐍 Python Preprocessing<br>Clean, normalize, export CSVs]
    B --> C[🧱 staging schema<br>Raw-to-clean tables]
    C --> D[🔄 refine schema<br>Process tagging, role mapping,<br>Sales order cleaning, week calc]
    D --> E[📊 mart schema<br>Aggregated reporting tables:<br>mv_accuracy, vw_errors_exploded]
    E --> F[⚡ Power BI Dashboard<br>Visuals: Accuracy, Errors, Trends, Auditors]
```

---

## 📌 Key Metrics & Insights  


---

## 🛠️ Tools & Technologies  
- **Python (Pandas)** – Data cleaning and date normalization  
- **PostgreSQL + Power Query** – ETL and structured data transformation  
- **Power BI** – Data modeling and visualization  

---

## 🚀 Impact  
- Provided QA and Operations with an automated view of audit results across teams and processes.  
- Helped identify recurring error types and training gaps for targeted improvement.  
- Reduced manual QA reporting time through a consistent, refreshable data model.  
- Supported data-driven decision-making through visual summaries of quality metrics.  

---

## 📁 Repository Contents  
- `README.md` – Project documentation  
- `data-prep/` – Python script and processed CSV
- `sql-pipeline/` – SQL Scripts used for data transformation
- `dashboard/` – Power BI file and dashboard screenshots  
- `assets/` – Visuals, banners, and logos  

---


---

## 🔗 Dashboard Access  
[**View Power BI Dashboard ↗**](https://app.powerbi.com/view?r=YOUR_DASHBOARD_LINK)

---

## 🖼️ Visual Preview  

<p align="center">
  <img src="dashboard/powerbi_dashboard_overview.png" width="750" alt="Power BI Dashboard Overview">
</p>

---

## 📥 Resources  
- [PostgreSQL ETL Scripts](./sql-pipeline/)  
- [Processed CSV Data](./data-prep/Audit_Data_Processed.csv)  
- [Python Preprocessing Script](./data-prep/QA%20Report%20Data%20Processing.ipynb)

---

## 📎 Data Notes  
- **Source:** AuditPro QA Audit Logs (BPO Account)  
- **Period:** July 16 – September 25, 2025  
- **Type:** Static snapshot (non-refreshing)  
- **Sensitive data:** Fully anonymized before publication  

---

<p align="center">
  ⚡ <b>Repository:</b> qa-performance-dashboard  
  <br><br>
  <a href="https://github.com/joshuaalmari/data-analytics-portfolio">
    <img src="https://img.shields.io/badge/BACK%20TO-DATA%20ANALYTICS%20PORTFOLIO-2f2f2f?style=for-the-badge&logo=github&logoColor=white"/>
  </a>
</p>
