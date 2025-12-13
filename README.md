##Data Cleaning Process
To ensure the dataset was clean, consistent, and ready for analysis, the following steps were performed:
Standardized column names across all files in the spreadsheet.
Removed outliers, such as birth years of 1900, using filters in the spreadsheet.
Converted trip durations from seconds to minutes using spreadsheet formatting.
Used “Paste Special - Values Only” for preventing any changes of data.
Removed unnecessary whitespaces in all relevant columns.
Updated usertype values, changing all entries labeled “customer” to “casual” using Find and Replace.
Removed missing values in gender and birthyear using SQL in Google BigQuery. (Only used this formatted data for analyzing birthyear and gender)
Unified date formats for start_time and end_time using spreadsheet formatting.
Added new columns, day_of_week and ride_length, to support further analysis.
Checked for typos and inconsistencies using conditional formatting in the spreadsheet.
These steps ensured the data was accurate, standardized, and prepared for meaningful analysis and visualization.

##Data Preparation

For this analysis, we utilized Cyclistic’s historical trip data, specifically the Divvy 2019 Q1 and 2020 Q1 datasets, as recommended in the case study. These publicly available datasets provide detailed information on rides taken by both casual riders and annual members, while ensuring no personally identifiable information is included.
The datasets were downloaded, securely stored, and systematically organized for analysis. Data quality checks were performed, including verification of column consistency, identification of missing values, and detection of outliers. Additionally, derived variables such as ride duration and day of the week were created to facilitate subsequent analysis.

