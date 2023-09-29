SELECT SUM(impressions), date
FROM marketing_performance
GROUP BY date;

SELECT state, revenue
FROM website_revenue 
ORDER BY revenue DESC limit 3;

SELECT m.cost, m.impressions, m.clicks, c.id, c.name
FROM marketing_performance AS m
INNER JOIN campaign_info AS c ON c.id = m.campaign_id
GROUP BY c.id;


