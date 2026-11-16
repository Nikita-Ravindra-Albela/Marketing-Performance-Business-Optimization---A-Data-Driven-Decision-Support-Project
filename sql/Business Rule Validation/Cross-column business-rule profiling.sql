-- Cross-column business-rule profiling --
-- Conversions =< Clicks =< Impressions --

-- Checking if clicks < Impressions --
SELECT
     COUNT(*) AS total_records
FROM dbo.raw_data
WHERE Clicks < Impressions;

-- Checking if Conversions < Clicks --
SELECT
     COUNT(*) AS total_records
FROM dbo.raw_data
WHERE Conversions < Clicks;

-- Checking if clicks > conversions --
SELECT
     COUNT(*) AS total_records
FROM dbo.raw_data
WHERE Conversions > Clicks;

-- Checking if Impressions > Conversions & Impressions > Clicks --

SELECT
     COUNT(*) AS total_records
FROM dbo.raw_data
WHERE Conversions > Impressions;

SELECT
     COUNT(*) AS total_records
FROM dbo.raw_data
WHERE Conversions > Impressions;