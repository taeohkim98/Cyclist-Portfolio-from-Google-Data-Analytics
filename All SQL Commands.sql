--Name change for column
ALTER TABLE `Trips2020`
RENAME COLUMN member_casual TO usertype;

--Unification for 2 Tables
create table `tuCombined` as
select tripduration, usertype
from `Trips2019`
union all
select tripduration, usertype
from `Trips2020`

--Update Customer to Casual for unity
UPDATE ` tuCombined`
set usertype = 'casual'
where usertype = 'customer';

--Figuring out average trip duration of each customer group
select avg(tripduration) as averageTrip
from ` tuCombined`
where usertype = 'customer'
group by usertype;


select avg(tripduration) as averageTrip
from ` tuCombined`
where usertype = 'member'
group by usertype;

--Figuring out number of rides per each group (also with percentage)
select Count(*) as NumberOfRides
from ` tuCombined_fixed`
where usertype = 'casual'
group by usertype;
select Count(*) as NumberOfRides
from ` tuCombined_fixed`
where usertype = 'member'
group by usertype;

select Count(*) / (select count(*) from ` tuCombined_fixed`) * 100 as Percentage
from ` tuCombined_fixed`
where usertype = 'casual'
group by usertype;
select Count(*) / (select count(*) from ` tuCombined_fixed`) * 100 as Percentage
from ` tuCombined_fixed`
where usertype = 'member'
group by usertype;

--For making the dataset usertype vs. birthyear
select usertype, birthyear
from ` Trips2019`
where birthyear is not null

--Only get ride_length and days_of_week
Create table ` CyclistModified.TripRLDW`
as
select ride_length, day_of_week AS days_of_week
from ` CyclistModified.Table2019`
union all
select ride_length, days_of_week
from ` CyclistModified.Trip2020`

--Days of week vs. Average Ride length (Make sure using Pivot table on Excel for creating chart)
SELECT
  usertype,
  days_of_week,
  FORMAT_TIME(
    '%H:%M:%S',
    TIME(
      TIMESTAMP_SECONDS(
        CAST(
          AVG(
            CAST(SUBSTR(ride_length, 1, STRPOS(ride_length, ':') - 1) AS INT64)
              * 3600
            + CAST(
              SUBSTR(
                ride_length,
                STRPOS(ride_length, ':') + 1,
                STRPOS(SUBSTR(ride_length, STRPOS(ride_length, ':') + 1), ':')
                  - 1)
              AS INT64)
              * 60
            + CAST(SUBSTR(ride_length, LENGTH(ride_length) - 1, 2) AS INT64))
          AS INT64))))
    AS avg_ride_length
FROM `capstone-case-study-1-480800`.`CyclistModified`.`TripRLDWGroup`
GROUP BY usertype, days_of_week
ORDER BY usertype, days_of_week;

--Usertype vs. Average of Trip Duration (Single Trip)
/*
usertype | Average Trip Duration
casual | 90.06
member | 13.08
*/
SELECT usertype, avg(tripduration) FROM ` CyclistModified.tripdurationusertype`
group by usertype
order by usertype

--Usertype vs. Month
select usertype, month, count(*) as numbers
from ` Cyclist_month.monthusertype`
group by usertype, month
order by usertype, month;
