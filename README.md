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
For this analysis, we utilized Cyclistic’s historical trip data, specifically the Divvy 2019 Q1 and 2020 Q1 datasets, as recommended in the case study. These publicly available datasets provide detailed information on rides taken by both casual riders and annual members, while ensuring no personally identifiable information is included. Due to the limitations of the **Postit Cloud Free Trial**, a smaller subset of the full dataset was used for this analysis.
Since the 2019 and 2020 datasets contained slightly different columns, we first standardized the datasets to include only the common fields. Any columns that were present in one dataset but missing in the other are noted and addressed later in the analysis where relevant.
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
Tools I used for data analysis was **Google Bigquery** with SQL. All of my SQL commands are in **All SQL Commands.sql** under the same repository of this rmd file.

1. **Age Distribution:** Casual riders tend to be younger than members. Due to data skewness, medians were used: median birth year is 1992 for casuals and 1985 for members.
<img width="568" height="494" alt="image" src="https://github.com/user-attachments/assets/d8bb0631-88db-4cfc-b68e-8b56cb73016b" />

2. **Ride Duration:** Casuals typically take 6 times longer trips than members.   
<img width="600" height="371" alt="image" src="https://github.com/user-attachments/assets/b2aec693-313b-4b86-8f58-1a3a60fb0b06" />

3. **Hourly Patterns:** Members typically ride from early morning to early afternoon, while casual riders tend to ride during daytime hours. For instance, at 8 a.m., the difference in bike usage between the two user groups is approximately 60 rides.
<img width="568" height="494" alt="image" src="https://github.com/user-attachments/assets/d146cd40-2922-4b48-94f1-018269399e68" />

4. **Seasonal Patterns:** Both groups ride more in March compared to January and February. Of the total rides in Q1, 31% occurred in January, 30% in February, and 39% in March (spring in Chicago). 
<img width="600" height="371" alt="image" src="https://github.com/user-attachments/assets/9cddda74-3455-411d-8290-c223b1e1628f" />
<img width="666" height="339" alt="image" src="https://github.com/user-attachments/assets/786af3f7-bf68-4220-9812-6b2a11edb8fc" />

5. **Trip Start and End Locations:** There is no significant difference in the starting and ending locations between casual riders and members.
<img width="865" height="771" alt="image" src="https://github.com/user-attachments/assets/0c55be43-26fd-4619-89f3-11e73c845039" />
<img width="865" height="771" alt="image" src="https://github.com/user-attachments/assets/ac54449c-5a8d-4bb8-8516-e7b6018db326" />
<img width="865" height="771" alt="image" src="https://github.com/user-attachments/assets/896ed116-d295-4ab2-89b7-e575ea1326b0" />
<img width="865" height="771" alt="image" src="https://github.com/user-attachments/assets/45fcb1ec-525e-4eca-9b8d-e7060613a737" />

6. **Weekly Usage Patterns:** Members exhibit relatively consistent bike usage throughout the week, whereas casual riders tend to ride more frequently on weekends, with usage approximately twice as high as on weekdays.
<img width="600" height="371" alt="image" src="https://github.com/user-attachments/assets/0e1ed16c-5f28-4146-b4d3-6709753c242a" />

---

# Share

---

# Recommendations
1. **March Marketing:** Intensify marketing campaigns in March to leverage higher ridership during spring.
2. **Target Younger Casual Riders:** Focus marketing on younger casual riders to increase the likelihood of converting them into long-term members.
3. **Target Weekend and Early-Week Riders:** Design promotions for casual riders who ride on weekends and Mondays, while also considering weekday riders likely using bikes as alternative transportation.
