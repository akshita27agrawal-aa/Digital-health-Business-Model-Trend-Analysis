-- ===== SETUP =====

CREATE DATABASE digital_health_analytics;

USE digital_health_analytics;
CREATE TABLE company_financials (
    company VARCHAR(50),
    fiscal_year INT,
    fiscal_quarter INT,
    quarter_label VARCHAR(20),
    revenue_usd_millions DECIMAL(10,2),
    net_income_loss_usd_millions DECIMAL(10,2),
    income_or_loss VARCHAR(10),
    user_count BIGINT,
    business_model_type VARCHAR(50)
);
-- ===== LOAD DATA =====

LOAD DATA LOCAL INFILE 'C:/Users/Akshita Agrawal/Desktop/SQL_project_CLEANED.csv'
INTO TABLE company_financials
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
USE digital_health_analytics;
-- ===== VERIFY IMPORT =====
SELECT COUNT(*) FROM company_financials;

SELECT company, COUNT(*) AS quarters_loaded
FROM company_financials
GROUP BY company;

SELECT * FROM company_financials
WHERE revenue_usd_millions IS NULL OR net_income_loss_usd_millions IS NULL;

-- ===== QUERY 1: Revenue growth quarter-over-quarter, per company =====
WITH revenue_with_lag AS (
    SELECT 
        company, 
        fiscal_year, 
        fiscal_quarter, 
        revenue_usd_millions,
        LAG(revenue_usd_millions) OVER (PARTITION BY company ORDER BY fiscal_year, fiscal_quarter) AS prev_quarter_revenue
    FROM company_financials
)
SELECT 
    company, 
    fiscal_year, 
    fiscal_quarter, 
    revenue_usd_millions,
    prev_quarter_revenue,
    ROUND((revenue_usd_millions - prev_quarter_revenue) / prev_quarter_revenue * 100, 1) AS pct_growth
FROM revenue_with_lag
ORDER BY company, fiscal_year, fiscal_quarter;

/*2.Average net margin by business model type*/
SELECT business_model_type,
       ROUND(AVG(net_income_loss_usd_millions / revenue_usd_millions) * 100, 1) AS avg_net_margin_pct
FROM company_financials
WHERE revenue_usd_millions IS NOT NULL
GROUP BY business_model_type
ORDER BY avg_net_margin_pct DESC;
SELECT business_model_type,
       ROUND(AVG(net_income_loss_usd_millions / revenue_usd_millions) * 100, 1) AS avg_net_margin_pct,
       ROUND(STDDEV(net_income_loss_usd_millions / revenue_usd_millions) * 100, 1) AS margin_volatility_pct
FROM company_financials
WHERE revenue_usd_millions IS NOT NULL
GROUP BY business_model_type;

/*3. User growth rate, latest vs earliest quarter, per company*/
SELECT company,
       MIN(user_count) AS earliest_user_count,
       MAX(user_count) AS latest_user_count,
       ROUND((MAX(user_count) - MIN(user_count)) / MIN(user_count) * 100, 1) AS pct_user_growth
FROM company_financials
GROUP BY company;

/*4. Ranking companies by total revenue growth window function*/
SELECT company,
       RANK() OVER (ORDER BY (MAX(revenue_usd_millions) - MIN(revenue_usd_millions)) DESC) AS growth_rank,
       MAX(revenue_usd_millions) - MIN(revenue_usd_millions) AS revenue_growth_musd
FROM company_financials
GROUP BY company;

/*5. Quarters where a company posted a net loss vs net income (trend of profitability)*/
SELECT company, income_or_loss, COUNT(*) AS num_quarters
FROM company_financials
GROUP BY company, income_or_loss
ORDER BY company;

/*6. Revenue per user (efficiency metric) — a nice "consulting-style" insight*/
SELECT company, fiscal_year, fiscal_quarter,
       ROUND((revenue_usd_millions * 1000000) / user_count, 2) AS revenue_per_user_usd
FROM company_financials
WHERE user_count IS NOT NULL AND user_count > 0
ORDER BY company, fiscal_year, fiscal_quarter;

/*7. Year-over-year comparison (same quarter, different years). */
SELECT curr.company, curr.fiscal_year, curr.fiscal_quarter, curr.revenue_usd_millions AS current_year_revenue,
       prev.revenue_usd_millions AS prior_year_revenue,
       ROUND((curr.revenue_usd_millions - prev.revenue_usd_millions) / prev.revenue_usd_millions * 100, 1) AS yoy_growth_pct
FROM company_financials curr
JOIN company_financials prev
  ON curr.company = prev.company
  AND curr.fiscal_quarter = prev.fiscal_quarter
  AND curr.fiscal_year = prev.fiscal_year + 1
ORDER BY curr.company, curr.fiscal_year, curr.fiscal_quarter;

/*8. Overall business model comparison summary (your "headline slide" query)*/
SELECT business_model_type,
       ROUND(AVG(revenue_usd_millions), 1) AS avg_quarterly_revenue,
       ROUND(AVG(net_income_loss_usd_millions), 1) AS avg_quarterly_net_income,
       ROUND(AVG(user_count), 0) AS avg_user_count
FROM company_financials
GROUP BY business_model_type;








