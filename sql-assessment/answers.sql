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

SELECT COUNT(m.conversions), w.state
FROM marketing_performance AS m
INNER JOIN campaign_info AS c ON c.id = m.campaign_id
INNER JOIN website_revenue AS w ON w.campaign_id = c.id
WHERE c.name = 'Campaign5'
GROUP BY w.state;
#GA generated the most conversions for this campaign

