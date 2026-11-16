-- Numeric Profiling & Validaty checks --

-- Checking for nulls in Impressions Column --
SELECT
      COUNT(*) AS total_records,
      COUNT(Impressions) as Total_impressions,
      COUNT(*) - COUNT(Impressions) AS missing_impressions
FROM dbo.raw_data;

-- Checking column's basic descriptive stats --
SELECT
      COUNT(*)  total_records,
      MIN(Impressions)AS minimum_impressions,
      MAX(Impressions) AS maximum_impressions,
      AVG(CAST(Impressions AS DECIMAL(18,2))) AS average_impressions,
      STDEV(CAST(Impressions AS DECIMAL(18,2))) AS std_impressions
FROM dbo.raw_data;

-- Checking for null values in Clicks column --
SELECT
      COUNT(*) AS total_records,
      COUNT([Clicks ]) AS total_clicks,
      COUNT(*) - COUNT([Clicks ]) AS missing_clicks
FROM dbo.raw_data;

-- Checking clicks columns descriptive stats --
SELECT
      COUNT(*) AS total_records,
      MIN([Clicks]) AS min_clicks,
      MAX([Clicks]) AS max_clicks,
      AVG(CAST([Clicks] AS DECIMAL(18,2))) AS avg_clicks,
      STDEV(CAST([clicks] AS DECIMAL(18,2))) AS std_clicks
FROM dbo.raw_data;

-- Checking for nulls in conversions column --
SELECT
      COUNT(*) AS total_records,
      COUNT(Conversions) AS total_conversions,
      COUNT(*) - COUNT(Conversions) AS missing_conversions
FROM dbo.raw_data;

-- Checking descriptive stats for Conversions column --
SELECT DISTINCT
       COUNT(*) AS Total_records,
       MIN(Conversions) AS min_conversions,
       MAX(Conversions) AS max_conversions,
       AVG(CAST(Conversions AS DECIMAL(18,2))) AS avg_conversions,
       STDEV(CAST(Conversions AS DECIMAL(18,2))) AS std_conversion
FROM dbo.raw_data;

-- Checking for null in Clicks2 column --

SELECT
     COUNT(*) AS total_records,
     COUNT(Clicks2) AS total_clicks_count,
     COUNT(*) - COUNT(Clicks2) AS missing_clicks
FROM dbo.raw_data;

-- Checking basic stats of clicks2 column --
SELECT
      COUNT(*) AS total_records,
      MIN(Clicks2) AS min_clicks2,
      MAX(Clicks2) AS max_clicks2,
      AVG(CAST(Clicks2 AS DECIMAL(18,2))) AS avg_clicks2,
      STDEV(CAST(Clicks2 AS DECIMAL(18,2))) AS std_clicks2
FROM dbo.raw_data;
      