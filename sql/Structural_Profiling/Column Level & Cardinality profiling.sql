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

