# 🔍 QA Performance Dashboard – Power BI 
<p align="center">
  <a href="https://github.com/joshuaalmari/data-analytics-portfolio" style="text-decoration:none;">
    <img src="https://img.shields.io/badge/DATA%20ANALYTICS%20PORTFOLIO-2f2f2f?style=for-the-badge"><img src="https://img.shields.io/badge/CLICK%20TO%20RETURN-0078D4?style=for-the-badge">
  </a>
</p>

---

## 🧭 Project Overview  
<p align="justify">
This Power BI dashboard visualizes the performance of the Quality Assurance (QA) team for a BPO account, based on call audit data extracted from <b>AuditPro</b>. It consolidates key metrics such as <b>QA Scores, Error Categories, Critical and Major Error Counts,</b> and <b>Audit Type Distributions</b> to help QA Leads and Operations Managers identify trends, coaching opportunities, and overall adherence to quality standards.
</p>

---

## 🔧 Workflow & Data Pipeline  
- **📥 Data Extraction:**  
  Exported the latest snapshot of QA data from <b>AuditPro</b>, containing both error and accuracy logs.  

- **🐍 Data Processing (Python):**  
  Used <b>Pandas</b> to clean and standardize fields, normalize inconsistent date formats, and prepare structured CSV files for analysis.  

- **⚙️ Data Transformation (Power Query):**  
  Imported the processed CSV files into Excel templates connected through <b>Power Query</b> for data modeling and transformation.  

- **📊 Dashboard Development:**  
  Built interactive visual reports in <b>Power BI</b> covering accuracy trends, error distributions, auditor activity, and team-level performance insights.  

> ℹ️ <b>Data Coverage:</b> July 16 – September 25, 2025  
> The dataset represents a fixed snapshot extracted from AuditPro and does not refresh automatically.  

---

## 📌 Key Metrics & Insights  


---

## 🛠️ Tools & Technologies  
- **Python (Pandas)** – Data cleaning and date normalization  
- **Excel + Power Query** – ETL and structured data transformation  
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
- `data-prep/` – Python script, processed CSVs and Excel templates  
- `dashboard/` – Power BI file and dashboard screenshots  
- `assets/` – Visuals, banners, and logos  

---

## 🔗 Dashboard Access  
[View Power BI Dashboard ↗](https://app.powerbi.com/view?r=YOUR_DASHBOARD_LINK)

---

## 🖼️ Visual Preview  
<p align="center">
  <img src="dashboard/powerbi_dashboard_overview.png" width="750">
</p>

---

## 📥 Resources  
- [Excel Template (Power Query Model)](data-prep/QA_Template.xlsx)  
- [Processed CSV Data](data-prep/QA_Data_Processed.csv)  
- [Python Processing Script](automation/QA_Data_Preprocessing.ipynb)  

---

## 📎 Data Notes  
- Source: AuditPro QA audit logs (BPO account)  
- Data Period: July 16 – September 25, 2025  
- Type: Static snapshot (non-refreshing)  
- Sensitive data anonymized prior to publishing  

---

<p align="center">
  ⚡ <b>Repository:</b> qa-performance-dashboard
   <br><br>
  <a href="https://github.com/joshuaalmari/data-analytics-portfolio">
    <img src="https://img.shields.io/badge/BACK%20TO-DATA%20ANALYTICS%20PORTFOLIO-2f2f2f?style=for-the-badge&logo=github&logoColor=white"/>
  </a>
</p>
