# Customer Acquisition Channel ROI Analysis SQL + Power BI

## OVERVIEW

This project analyzes multi-channel marketing campaign data to evaluate key metrics such as ROI, CAC, and conversion rates. It identifies high-performing and underperforming campaigns, along with inefficiencies in marketing spend. Using advanced SQL techniques and Tableau visualization, the project delivers actionable insights for optimizing marketing strategy and budget allocation.


## OBJECTIVE

- High-performing campaigns
- Inefficient marketing spend
- Opportunities for budget optimization

## DATASET

The dataset contains marketing campaign data with the following columns:

- **Dataset** : [Marketing Campaign Dataset](Customer-Acquisition-Channel-ROI-Analysis/blob/main/Marketing%20%20-%20Marketing.csv)

- campaign_id
- campaign_name
- category (social, search, influencer,)
- impressions
- clicks
- leads
- orders
- marketing spend
- revenue


## Business Questions

- Which campaigns generate the highest ROI?
- Which campaigns have the lowest CAC?
- Where are the biggest drop-offs in the marketing funnel?
- Which category performs best?
- Which campaigns are wasting budget?

## KPIs

- CTR
- CAC
- ROI
- Conversion rate
- Revenue per campaign


## Tools Used

- SQL for data analysis
- Power BI for dashboard visualization

## SQL Queries Analysis

All SQL queries used for analysis are available in:
- **SQL Queries** :[Sql queries solution](Customer-Acquisition-Channel-ROI-Analysis/blob/main/SQL%20queries%20solution.sql)


## Power BI Dashboard

👉 [Customer-Acquisition-Channel-ROI-Analysis Power BI Dashboard](https://github.com/aaruie/Customer-Acquisition-Channel-ROI-Analysis/blob/main/Customer%20Acquisition%20Channel%20ROI%20Analysis%20Dashboard.pdf)

Key visuals include:

- KPI Cards: Total Spend, Revenue, Orders, CTR, Conversion Rate, ROI
- Clicks vs Orders Channel-wise
- Revenue Contribution by Channel
- Traffic Distribution 
- Conversion Rate Comparison
- Marketing Funnel (Clicks → Leads → Orders)
- Revenue vs Orders 
- Campaign Performance Table: ROI, Spend, Revenue, Conversion per campaign

## Key Insights

3M clicks generate only 8K orders ~0.27% conversion rate, showing major funnel drop-offs
Social channels drive ~50% of traffic 1.5M clicks but have lower conversion - 0.20%–0.28%
Influencer channels generate the highest revenue 21M+ with strong conversion (~0.43%)
YouTube Blogger campaign delivers highest ROI of 2.77 and best performance
Several campaigns (Facebook LAL, Google Wide, Instagram Tier2) show negative ROI
Overall performance is profitable with 42.8M revenue on ~30.5M spend (ROI ~0.40)


## Recommendations

Reallocate Budget: Shift spend from low-ROI campaigns to high-performing influencer channels
Improve Funnel Conversion: Optimize landing pages, targeting, and creatives to reduce drop-offs
Scale High Performers: Increase investment in YouTube Blogger and retargeting campaigns
Reduce Inefficient Spend: Pause or optimize campaigns with negative ROI
Diversify Channels: Reduce over-reliance on social traffic and expand high-converting sources
A/B Testing: Test creatives, audience segments, and offers to improve conversion rates


## Business Impact
Identified high-performing channels driving 21M+ revenue individually
Highlighted conversion inefficiencies across funnel (~0.27% CVR)
Provided actionable insights to improve ROI and optimize marketing spend allocation




