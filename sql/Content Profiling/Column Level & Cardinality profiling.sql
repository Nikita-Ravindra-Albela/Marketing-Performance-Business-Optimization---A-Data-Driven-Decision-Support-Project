-- Column Level & Cardinality profiling --

-- Campaign_ID --

SELECT
     COUNT(*) AS total_records,
     COUNT(DISTINCT(Campaign_ID)) AS unique_campaign_ids
FROM dbo.raw_data;


-- Inspecting the repeated IDs --

SELECT
      [Campaign_ID],
      COUNT(*) AS occurance_count
FROM dbo.raw_data
GROUP BY [Campaign_ID]
HAVING COUNT(*) > 1
ORDER BY occurance_count DESC;


-- Checking whether one campaign_id is associated with multiple campaign names --
SELECT
      [Campaign_ID],
      COUNT(DISTINCT[Campaign_Name]) AS campaign_name_count
FROM dbo.raw_data
GROUP BY [Campaign_ID]
HAVING COUNT(DISTINCT[Campaign_Name]) > 1;

-- Checking for duplicate Campaigns --

SELECT
      [Campaign_ID],
      [Campaign_Name],
      [Start_Date],
      [End_Date],
      [Channel],
      [Impressions],
      [Clicks],
      [Spend],
      [Conversions],
      [Active],
      [Clicks2],
      [Campaign_Tag]
FROM dbo.raw_data
GROUP BY 
      [Campaign_ID],
      [Campaign_Name],
      [Start_Date],
      [End_Date],
      [Channel],
      [Impressions],
      [Clicks],
      [Spend],
      [Conversions],
      [Active],
      [Clicks2],
      [Campaign_Tag]
HAVING COUNT(*) > 1
ORDER BY [Campaign_ID] DESC;

-- Checking the duplicate campaign records in detail --
SELECT
      Campaign_ID,
      COUNT(*) AS distinct_record_versions
FROM dbo.raw_data
GROUP BY Campaign_ID
HAVING COUNT(*) > 1
ORDER BY distinct_record_versions DESC;

-- Checking if duplicate campaign_ID have the same record across all other columns --
WITH DistinctCampaignRows AS
(
    SELECT DISTINCT *
    FROM dbo.raw_data
)

SELECT
    Campaign_ID,
    COUNT(*) AS distinct_record_versions
FROM DistinctCampaignRows
GROUP BY Campaign_ID
HAVING COUNT(*) > 1
ORDER BY distinct_record_versions DESC;

-- Checking the different records in Campaign_ID CMP-01377 (Campaign_Tag difference is spotted) --
SELECT 
      *
FROM dbo.raw_data
WHERE Campaign_ID = 'CMP-01377';

-- Checking if campaign name occurs more than 1--
SELECT
     Campaign_Name,
     COUNT(Campaign_Name) AS total_Campaign_Name
FROM dbo.raw_data
GROUP BY Campaign_Name
HAVING COUNT(Campaign_Name) > 1;


-- Checking for Unique Campaign being run --
SELECT
      DISTINCT(Campaign_Name) AS unique_Campaign
FROM dbo.raw_data;

-- Checking count of channel across the dataset --
SELECT
      Channel,
      COUNT(Channel) AS total_channels
FROM dbo.raw_data
GROUP BY Channel;

-- Checking unique channels --
SELECT
     DISTINCT(Channel) AS unique_channels
FROM dbo.raw_data;

-- Checking Active counts --
SELECT
      Active,
      COUNT(Active) AS total_active
FROM dbo.raw_data
GROUP BY Active;

-- Checking Active ambigious values across active column --
SELECT
      DISTINCT(Active) AS unique_active_values
FROM dbo.raw_data;

-- Checking Campaign_Tag column count --
SELECT
     Campaign_Tag,
     COUNT(Campaign_Tag) AS total_campaign_tags
FROM dbo.raw_data
GROUP BY Campaign_Tag;

-- Checking Campaign_Tag unique values --
SELECT
      DISTINCT(Campaign_Tag) AS unique_campaign_tag
FROM dbo.raw_data;









