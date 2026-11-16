-- Stats profiling --

-- Impressions --
SELECT TOP 1
      PERCENTILE_CONT(0.25)
            WITHIN GROUP(ORDER BY Impressions)
            OVER() AS Q1_impressions,
      PERCENTILE_CONT(0.50)
            WITHIN GROUP(ORDER BY Impressions)
            OVER() AS Q2_impressions,
      PERCENTILE_CONT(0.75)
            WITHIN GROUP(ORDER BY Impressions)
            OVER() AS Q3_impressions
FROM dbo.raw_data;

-- Clicks --
SELECT TOP 1
      PERCENTILE_CONT(0.25)
      WITHIN GROUP (ORDER BY [Clicks])
      OVER() AS Q1_clicks,
      PERCENTILE_CONT(0.50)
      WITHIN GROUP (ORDER BY [Clicks])
      OVER() AS Q2_Clicks,
      PERCENTILE_CONT(0.75)
      WITHIN GROUP (ORDER BY [Clicks])
      OVER() AS Q3_Clicks
FROM dbo.raw_data;

-- Conversions --
SELECT Top 1
      PERCENTILE_CONT(0.25)
       WITHIN GROUP (ORDER BY Conversions)
       OVER() AS Q1_conversions,
       PERCENTILE_CONT(0.50)
       WITHIN GROUP (ORDER BY Conversions)
       OVER() AS Q2_conversions,
       PERCENTILE_CONT(0.75)
       WITHIN GROUP (ORDER BY Conversions)
       OVER() AS Q3_conversions
FROM dbo.raw_data;

-- Clicks2 --
SELECT TOP 1
      PERCENTILE_CONT(0.25)
      WITHIN GROUP (ORDER BY Clicks2)
      OVER() AS Q1_clicks,
      PERCENTILE_CONT(0.50)
      WITHIN GROUP (ORDER BY Clicks2)
      OVER() AS Q2_clicks,
      PERCENTILE_CONT(0.75)
      WITHIN GROUP (ORDER BY Clicks2)
      OVER() AS Q3_clicks
FROM dbo.raw_data
