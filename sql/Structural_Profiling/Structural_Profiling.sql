-- Basic raw_data inspection (Structural Profiling) --

USE marketing_campaign_data;
Go

-- Table information --
SELECT
      COLUMN_NAME,
      DATA_TYPE,
      CHARACTER_MAXIMUM_LENGTH,
      IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'dbo'
AND TABLE_NAME = 'raw_data'
ORDER BY ORDINAL_POSITION;

SELECT *
FROM dbo.raw_data;

-- Total records (Rows) --
SELECT
      COUNT(*) as total_records
FROM dbo.raw_data;

-- Checking

-- Checking for whitespace in column names --
SELECT
      name AS Original_column_name,
      LEN(name) AS column_name_length
FROM sys.columns
WHERE object_id = OBJECT_ID('dbo.raw_data');

-- Missing value profiling --

SELECT
      COUNT(*) AS total_rows,

      SUM(CASE
         WHEN [Campaign_ID] IS NULL OR [Campaign_ID] = 'N/A' THEN 1
         ELSE 0
         END) AS missing_campaign_id,

       SUM(CASE
           WHEN [Campaign_Name] IS NULL OR [Campaign_Name] = 'N/A'THEN 1
           ELSE 0
           END) AS missing_campaign_name,

       SUM(CASE
           WHEN [Start_Date] IS NULL OR [Start_Date] = 'N/A' THEN 1
           ELSE 0
           END) AS missing_start_date,

       SUM(CASE
           WHEN [End_Date] IS NULL OR [End_Date] = 'N/A' THEN 1
           ELSE 0
           END) AS missing_end_date,

      SUM(CASE
          WHEN [Channel] IS NULL OR [Channel] = 'N/A' THEN 1
          ELSE 0
          END) AS missing_channel,

      SUM(CASE
          WHEN [Impressions] IS NULL THEN 1
          ELSE 0
          END) AS missing_impressions,

      SUM(CASE
          WHEN [Conversions] IS NULL THEN 1
          ELSE 0
          END) AS missing_conversions,

      SUM(CASE
          WHEN [Clicks] IS NULL THEN 1
          ELSE 0
          END) AS missing_clicks,

     SUM(CASE
         WHEN [Spend] IS NULL THEN 1
         ELSE 0
         END) AS missing_spend,

    SUM(CASE
         WHEN [Active] IS NULL OR [Active] = 'N/A'THEN 1
         ELSE 0
         END) AS missing_active,

    SUM(CASE
       WHEN [Clicks2] IS NULL THEN 1
       ELSE 0
       END) AS missing_clicks2,

    SUM(CASE
        WHEN [Campaign_Tag] IS NULL OR [Campaign_Tag] = 'N/A' THEN 1
        ELSE 0
        END) AS missing_campaign_tag
FROM dbo.raw_data;

