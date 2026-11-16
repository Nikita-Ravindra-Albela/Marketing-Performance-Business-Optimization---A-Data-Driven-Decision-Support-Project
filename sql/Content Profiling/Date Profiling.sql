-- Date Profiling --

-- Checking Start Date distribution for mixed dates --
SELECT
      Start_Date,
      TRY_CONVERT(DATE, Start_Date, 23)
      AS iso_date,
      TRY_CONVERT(DATE, Start_Date, 103)
      AS british_date
FROM dbo.raw_data;

-- Checking End date distribution for mixed dates --
SELECT
      End_Date,
      TRY_CONVERT(DATE, End_Date, 23) AS iso_date,
      TRY_CONVERT(DATE, End_Date, 103) AS british_date
FROM dbo.raw_data;

-- Checking end_date < start_date --
SELECT *
FROM dbo.raw_data
WHERE 
     TRY_CONVERT(DATE, End_Date, 23)
     <
     TRY_CONVERT(DATE, Start_Date, 23);