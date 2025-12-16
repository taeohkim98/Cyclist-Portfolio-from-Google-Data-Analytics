# Introduction

I began my career as a Software Engineer and Network QA Engineer, where I worked on software development and network testing. Over time, I discovered that I was more interested in analyzing data and extracting insights than in building or testing software. This realization led me to pursue a career in data analytics.
To build a strong foundation, I completed the **Google Data Analytics Professional Certificate** offered through Coursera, where I learned core data analytics concepts and best practices. One of the key frameworks emphasized in the program is the **six-step data analysis process: Ask, Prepare, Process, Analyze, Share, and Act**.
In this capstone project, I apply this framework to the **Cyclistic case study**, with the goal of understanding rider behavior and providing data-driven marketing recommendations. Throughout the project, I use the tools introduced in the program—including **Google Sheets, SQL (BigQuery), R, and Tableau**—to clean, analyze, and visualize the data.
This case study demonstrates my ability to follow a structured analytical process and communicate insights through clear visualizations and actionable recommendations.

---

# Scenario

For this analysis, we examined Cyclistic’s historical trip data to understand behavioral differences between casual riders and annual members. Cyclistic is a bike-share company operating in Chicago with a fleet of 5,824 bikes across 692 docking stations, allowing riders to pick up and return bikes at any station within the network.
Prior internal analysis conducted by Cyclistic’s finance team indicates that annual members are more profitable than casual riders. As a result, the marketing team aims to identify usage patterns that distinguish casual riders from members in order to develop data-driven strategies to convert casual riders into annual memberships.
This analysis utilizes publicly available Divvy trip data from Q1 2019 and Q1 2020, as recommended in the case study. These datasets include detailed trip-level information for both rider types while excluding any personally identifiable information. The data was downloaded, securely stored, and systematically organized for analysis.
Data quality checks were conducted to ensure consistency across datasets, including column name standardization, verification of missing values, and identification of outliers. Additional variables—such as ride duration, day of the week, and hour of day—were derived to support exploratory data analysis and comparative insights.
The findings from this analysis are intended to support Cyclistic executives in evaluating proposed marketing strategies through clear, compelling data insights and professional visualizations.

---

# Ask
The guiding question for this analysis is:  
**"How do annual members and casual riders use Cyclistic bikes differently?"**
To answer this question, I structured the analysis around the following key points:
  1. A clear description of the data sources used in this analysis  
  2. An explanation of how the data was cleaned and prepared  
  3. A concise summary of the analysis process and results  
  4. Key findings supported by data visualizations  
  5. The top three data-driven recommendations based on the analysis

---

# Prepare
For this analysis, we utilized Cyclistic’s historical trip data, specifically the Divvy 2019 Q1 and 2020 Q1 datasets, as recommended in the case study. These publicly available datasets provide detailed information on rides taken by both casual riders and annual members, while ensuring no personally identifiable information is included.
The datasets were downloaded, securely stored, and systematically organized for analysis. Data quality checks were performed, including verification of column consistency, identification of missing values, and detection of outliers. Additionally, derived variables such as ride duration and day of the week were created to facilitate subsequent analysis.

---

# Process
## Data Integration

* Aligned column names across all datasets to ensure consistency
* Unified date and time formats for `start_time` and `end_time`
* Standardized user type values by converting all `customer` entries to `casual`
* Prepared datasets (Q1 2019 and Q1 2020) with a common schema to enable seamless integration

## Data Profiling and Exploration

* Conducted a comprehensive review of dataset structure, column names, and data types
* Identified missing values in the `gender` and `birthyear` columns
* Detected outliers in `birthyear` (e.g., anomalous values such as 1900)
* Checked for inconsistencies, typos, and irregular formatting

These insights guided the subsequent cleaning and transformation steps.

## Data Cleaning and Transformation

1. Standardized column names across all files using Google Sheets
2. Removed outliers (e.g., `birthyear = 1900`) using spreadsheet filters
3. Converted trip duration from seconds to minutes for consistency
4. Applied **Paste Special → Values Only** to prevent unintended data changes
5. Trimmed unnecessary whitespaces from relevant columns
6. Updated user type values (`customer` → `casual`) using Find and Replace
7. Removed missing values in `gender` and `birthyear` using SQL in Google BigQuery
   *(This cleaned subset was used only for birthyear and gender analysis)*
8. Unified date formats for `start_time` and `end_time`
9. Added derived columns such as `day_of_week` and `ride_length` to support analysis
10. Validated data consistency using conditional formatting

These procedures ensured the dataset was accurate, standardized, and fully prepared for analytical processing.

---

# Analysis



