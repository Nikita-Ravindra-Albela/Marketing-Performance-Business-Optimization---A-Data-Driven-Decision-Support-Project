-- Categorical Profiling --

-- Channel level record count --
SELECT
      Channel,
      COUNT(*) AS record_count
FROM dbo.raw_data
GROUP BY Channel
ORDER BY record_count DESC;

-- Campaign_Name level records count --
SELECT
      Campaign_Name,
      COUNT(*) AS record_count
FROM dbo.raw_data
GROUP BY Campaign_Name
ORDER BY record_count DESC;

-- Active level records count --
SELECT
      Active,
      COUNT(*) AS record_count
FROM dbo.raw_data
GROUP BY Active
ORDER BY record_count DESC;

-- Campaign_Tag level records count --
SELECT
      Campaign_Tag,
      COUNT(*) AS record_count
FROM dbo.raw_data
GROUP BY Campaign_Tag
ORDER BY record_count DESC;

