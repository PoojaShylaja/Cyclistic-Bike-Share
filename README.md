# Cyclistic-Bike-Share
Analytics Portfolio

# Google Data Analytics Capstone Project : Cyclistic Bike-Share

Welcome to the Cyclistic bike-share analysis case study. I am doing my Capstone Project for Google's Data Analytics Professional Certificate.
In this analysis, wee  will follow the steps of the data analysis process: ask, prepare, process, analyze, share, and act. 

## Scenario

I this scenario I am a junior data analyst working in the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director of
marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore,my team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, my team will
design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must approve my
recommendations, so they must be backed up with compelling data insights and professional data visualizations.

## Characters and teams

● Cyclistic: A bike-share program that features more than 5,800 bicycles and 600 docking stations. Cyclistic sets itself apart
by also offering reclining bikes, hand tricycles, and cargo bikes, making bike-share more inclusive to people with disabilities
and riders who can’t use a standard two-wheeled bike. The majority of riders opt for traditional bikes; about 8% of riders use
the assistive options. Cyclistic users are more likely to ride for leisure, but about 30% use them to commute to work each
day.
* Lily Moreno: The director of marketing and your manager. Moreno is responsible for the development of campaigns and
initiatives to promote the bike-share program. These may include email, social media, and other channels.
* Cyclistic marketing analytics team: A team of data analysts who are responsible for collecting, analyzing, and reporting
data that helps guide Cyclistic marketing strategy. You joined this team six months ago and have been busy learning about
Cyclistic’s mission and business goals — as well as how you, as a junior data analyst, can help Cyclistic achieve them.
* Cyclistic executive team: The notoriously detail-oriented executive team will decide whether to approve the
recommended marketing program.

## About the company

In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown to a fleet of 5,824 bicycles that are
geotracked and locked into a network of 692 stations across Chicago. The bikes can be unlocked from one station and returned to
any other station in the system anytime.
Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One
approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and
annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who
purchase annual memberships are Cyclistic members.
Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. Although the pricing
flexibility helps Cyclistic attract more customers, Moreno believes that maximizing the number of annual members will be key to
future growth. Rather than creating a marketing campaign that targets all-new customers, Moreno believes there is a very good
chance to convert casual riders into members. She notes that casual riders are already aware of the Cyclistic program and have
chosen Cyclistic for their mobility needs.
Moreno has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members. In order to do
that, however, the marketing analyst team needs to better understand how annual members and casual riders differ, why casual
riders would buy a membership, and how digital media could affect their marketing tactics. Moreno and her team are interested in
analyzing the Cyclistic historical bike trip data to identify trends.

## Ask Phase

What is the problem you are trying to solve?

a). How to Maximize the annual membership Cyclistic Bikeshare.
b). How does annual members and casual riders use Cyclistic Bikeshare differently.

Key stake holders are : The director of marketing, Lily Moreno, Cyclistic marketing analytics team,Cyclistic executive team 


## Prepare Phase

Data Sources are from [the Cyclistic trip data]( https://divvy-tripdata.s3.amazonaws.com/index.html)

I have collected data from January 2022 to December 2022.

The Tools I have used are : SQL,Tableau

There were 12 files for each month.There were 13 variables.After making sure all the datatypes present in the files were same they were combined to a single file called year_tripdata for our analysis.

## Process Phase

Data combining has been done here [data combining](https://github.com/PoojaShylaja/Cyclistic-Bike-Share/blob/main/Data%20Collection%20and%20Combining.sql)

Data has been collected from 12 files and after changing it to same data  types they have been combined together as year_tripdata.

[Data Exploration](https://github.com/PoojaShylaja/Cyclistic-Bike-Share/blob/main/Data%20Exploration.sql) has been done.
There are around 5,66,7717 rows.We were able to find Null values,duplicate rows,to identify which rows can be filled by us by reference from the same file etc.

[Data Cleaning](https://github.com/PoojaShylaja/Cyclistic-Bike-Share/blob/main/Data%20Cleaning%20.sql) has been done.The steps that were taken included removing duplicates, removing unknown null values, filling some null values by taking reference to the already given data, splitting columns for better understanding, removing outliers, changing to correct data types, removing inconsistent values, checking consistency in identifiers as well.


## Analyze Phase

[Data Analyze](https://github.com/PoojaShylaja/Cyclistic-Bike-Share/blob/main/Data%20Analysis.sql) is done here.

Total number of rows after cleaning is 

![image](https://github.com/PoojaShylaja/Cyclistic-Bike-Share/assets/101803358/d6f8bd76-6997-4844-b9e5-0ea508f09592)

The Avg Ride Length is 

![image](https://github.com/PoojaShylaja/Cyclistic-Bike-Share/assets/101803358/fedd582e-5360-4cfe-b19f-0bdd591dcfee)

The total number of casual and member rides are

![image](https://github.com/PoojaShylaja/Cyclistic-Bike-Share/assets/101803358/723328f4-4d66-47d3-b098-cb5531a0d86a)

The Avg ride Length of members and casual riders are

![image](https://github.com/PoojaShylaja/Cyclistic-Bike-Share/assets/101803358/8e0d35a2-eead-49fa-8ec7-e8282b32f37f)

Different types of rides and count

![image](https://github.com/PoojaShylaja/Cyclistic-Bike-Share/assets/101803358/54ef9bcb-cf06-4895-aed8-320b2a63b58e)

Different types of rides and avg ride length

![image](https://github.com/PoojaShylaja/Cyclistic-Bike-Share/assets/101803358/971b3fea-1d29-4b74-838e-76d702ba3a60)

Total number of rides in each month

![image](https://github.com/PoojaShylaja/Cyclistic-Bike-Share/assets/101803358/dc77c7a0-7bbb-4e43-bb63-5989000e4b08)


Stations from more rides

![image](https://github.com/Pooj aShylaja/Cyclistic-Bike-Share/assets/101803358/ec174b8a-e2ae-4c22-b982-4b372f2ef555)


## Share






















