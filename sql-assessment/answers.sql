SELECT SUM(impressions), date
FROM marketing_performance
GROUP BY date;

SELECT state, revenue
FROM website_revenue 
ORDER BY revenue DESC limit 3;


