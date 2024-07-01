# CRM-Sales-Opportunities
![](images.jpg)

## Sales Analysis Report
# Introduction
This report provides a comprehensive analysis of sales data, integrating information from accounts, products, sales teams, and the sales pipeline. The purpose of this analysis is to uncover key insights and trends that can drive strategic decision-making and optimize sales performance.

# Data Preparation
# Data Sources
The analysis is based on data from four tables:
- **Accounts**
- **Products**
- **Sales Teams**
- **Sales Pipeline**-
- Data Cleaning and Preprocessing
- Removed duplicates and handled missing values.
- Ensured consistency in field names and data types.

# Data Structure
- **Accounts Table** account: Company name, sector: Industry, year_established: Year Established, revenue: Annual revenue (in millions of USD), employees: Number of employees
office_location: Headquarters, subsidiary_of: Parent company
- **Products Table** product: Product name, series: Product series, sales_price: Suggested retail price,
- **Sales Teams Table**  sales_agent: Sales agent, manager: Respective sales manager, regional_office: Regional office
- **Sales Pipeline Table** opportunity_id: Unique identifier, sales_agent: Sales agent, product: Product name, account: Company name, deal_stage: Sales pipeline stage (Prospecting > Engaging > Closing), engage_date: Date in which the "Engaging" deal stage was initiated, close_date: Date in which the deal was "Won" or "Lost", close_value: Revenue from the deal

# Insight

1. **Sector Performance**:
   - **Highest Close Value**: The entertainment sector leads with the highest close value at 1713.
   - **Lowest Close Value**: The medical sector has the lowest close value at 1431.
   - **Employee Count**: The retail sector has the highest number of employees, totaling 1397.

2. **Product Performance**:
   - **Highest Close Value Product**: The GTX Plus Pro product has the highest close value of 2,629,651.
   - **Lowest Close Value Product**: The MG Special product has the lowest close value of 43,768.
   - **Highest Revenue Generating Product**: The GTX Basic product generates the most revenue with a total of 4,121,351.
   - **Lowest Revenue Generating Product**: The GTK 500 product has the lowest revenue generation with a total of 128,566.

3. **Individual Performance**:
   - **Highest Close Value**: Darcel Schlecht has the highest close value.
   - **Lowest Close Value**: Wilburn Farren has the lowest close value.
   - **Highest Revenue Generation**: Darcel Schlecht generated the most revenue.
   - **Lowest Revenue Generation**: Wilburn Farren has the lowest revenue.

4. **Subsidiary Performance**:
   - **Highest Subsidiary Close Value**: The Sonron subsidiary has the highest close value.
   - **Lowest Subsidiary Close Value**: The Warephase subsidiary has the lowest close value.

# Recommendation
 In the entertainment sector, it suggests leveraging high close value to enhance market share through targeted marketing and customer engagement initiatives. In the medical sector, it suggests investigating factors contributing to low close value and improving product offerings or customer outreach. In the retail sector, it recommends optimizing workforce management and implementing training programs to increase productivity and customer service. The product recommendations include GTX Plus Pro, MG Special, GTX Basic, and GTK 500. Individual recommendations include recognizing and rewarding high performers, providing targeted support and training, and strengthening the subsidiary's market position. General recommendations include data-driven decisions, customer feedback, and innovation and adaptation
