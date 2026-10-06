# Digital Health Business Model Trend Analysis
## Project Overview:
This project analyzes and compares the financial performance of four publicly traded digital health companies: Teladoc Health, Hims & Hers Health, GoodRx and Talkspace representing distinct digital health business models.
The analysis evaluates how different monetization strategies including subscription-based, pay-per-use, and payer-reimbursed models influence revenue growth, profitability, and user economics over a four-year period from Q1 2022 to Q1 2026.

The project simulates a commercial and competitive analysis that could support healthcare consulting engagements involving business model strategy, competitive positioning and investment decisions.

## Business Problem:
Digital health companies operate under different monetization models, including subscription-based, pay-per-use, and payer-reimbursed models. These differences can significantly influence how companies grow revenue, acquire and retain users, generate profits, and maintain financial stability.
This project evaluates the financial and operating performance of four publicly traded digital health companies — Teladoc Health, Hims & Hers Health, GoodRx, and Talkspace over Q1 2022 to Q1 2026. The objective is to compare their business models across revenue growth, profitability, user growth, revenue efficiency, and financial consistency to identify which models demonstrate stronger overall performance and what trade-offs exist between growth and profitability.

## Companies Analyzed:
Teladoc- Subscription based model
Him & Hers- Subscription based model
Good Rx- Pay-per-use model
Talkspace- Payer-reimbursed (B2B)

## Analysis Period
Q1 2022 – Q1 2026

## Key Areas of Analysis
- Revenue growth
- Revenue trends
- Profitability
- User economics
- Business model comparison
- Quarterly performance trends
- Competitive positioning

## Tools & Technologies
- Excel
- MYSQL

### Data Collection & Preparation:

* Quarterly financial and operating data for **Q1 2022–Q1 2026** was manually extracted from the companies' **SEC 10-Q filings, investor press releases, and shareholder letters**.
* No pre-built dataset was used; the data was collected and compiled manually from publicly available company disclosures.
* The extracted data was organized and standardized in **Excel** to create a structured dataset for analysis.
* The cleaned dataset was then imported into **SQL** for querying and business analysis.
* SQL was used to analyze revenue growth, profitability, user growth, revenue per user, YoY performance, and business-model trends.
There was no ready-made dataset available for the specific comparison I wanted to perform, so I collected the quarterly data manually from SEC filings and company investor disclosures, standardized it in Excel, and then used SQL to perform the analysis.

## Business Questions:

1. How did quarterly revenue change over time for each company, and which companies demonstrated stronger and more consistent revenue growth?

2. Which business model generated stronger average net margins, and how volatile were those margins over the analysis period?

3. Which companies experienced the strongest growth in their user base between the earliest and latest quarters?

4. How do the companies rank against each other based on their revenue growth performance?

5. How frequently did each company report losses versus positive net income during the analysis period?

6. How effectively did each company convert its user base into revenue?

7. How did each company's financial performance change compared with the same quarter in the previous year?

8. When companies are grouped by business model, how do the models compare in terms of revenue, growth, profitability, and user economics?

## SQL Analysis & Techniques:

LAG() for QoQ growth
RANK() for revenue growth ranking
Self-JOIN for YoY comparison
GROUP BY for business-model averages
CASE WHEN for loss vs. income quarters
Aggregate functions for margins, revenue/user, averages
Window functions for sequential and ranking analysis

### Key Findings:

1. **Hims & Hers demonstrated the strongest and most sustained revenue growth**, with revenue increasing approximately 6× from $101.3M to $608.1M and YoY growth consistently exceeding 45%.

2. **Pay-per-use recorded the highest average net margin (0.0%)**, but its high volatility (-22% to +31%) makes profitability less predictable than the consistently negative Subscription and Payer-reimbursed models.

3. **Hims & Hers showed the strongest underlying user growth (+266.2%)**, while Talkspace's higher apparent growth (+1,677.8%) was influenced by a mid-period decline and changes in user-count definitions.

4. **Hims & Hers achieved the strongest absolute revenue growth (+$516.5M)**, more than 5× Teladoc's growth (+$94.8M), while GoodRx showed limited growth despite its larger revenue base.

5. **Teladoc reported losses in every recorded quarter (13 of 13)** despite having the highest revenue scale, while GoodRx had the most profitable quarters (10 of 17).

6. **Hims & Hers showed the strongest improvement in revenue per user ($143 → $234)** among companies with consistently defined user metrics, while Teladoc declined from $10.4 to $6.1 despite member growth.

7. **Teladoc's revenue growth turned negative from 2024 onward**, while Talkspace maintained steady double-digit YoY growth and GoodRx showed weak, inconsistent YoY performance.

8. **Business model comparison revealed a clear scale–profitability trade-off:** Subscription had the highest average quarterly revenue ($465.8M) and largest average user base (38.2M), but also the largest average quarterly loss (-$372.0M). Pay-per-use was approximately break-even on average, while Payer-reimbursed operated at a smaller scale with modest average losses.

### Conclusion:
The analysis shows that **growth, scale, profitability, and monetization efficiency do not always move together** in digital health.
Hims & Hers emerged as the strongest growth performer, combining rapid revenue and user growth with improving revenue per user. GoodRx maintained relatively stable scale but showed limited growth and high profitability volatility. Teladoc demonstrated that a large user and revenue base does not necessarily translate into financial sustainability, with persistent losses and declining revenue per user. Talkspace showed positive expansion, although changes in user definitions limit direct user-economics comparisons.
At the business-model level, **Subscription offered the greatest scale but also the weakest average profitability, while Pay-per-use was approximately break-even but more volatile**. Overall, the findings highlight the importance of evaluating digital health businesses across multiple dimensions rather than relying on revenue or user growth alone.

**Overall takeaway:** Strong growth and a large customer base are not enough; long-term success depends on turning that growth into consistent profits and better revenue from each customer.


