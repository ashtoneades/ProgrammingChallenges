#Questions are answered using MySQL

#Question 1
SELECT SUM(impressions) AS "Sum of Impressions", date AS "Date"
FROM marketing_performance
GROUP BY date
ORDER BY SUM(impressions) DESC;

#Question 2
SELECT state, SUM(revenue) AS "Total Revenue"
FROM website_revenue 
GROUP BY state
ORDER BY revenue DESC limit 3;
#The third best state (Texas) generated $34,080 in revenue.

#Question 3
SELECT m.cost, m.impressions, m.clicks, c.id, c.name
FROM marketing_performance AS m
INNER JOIN campaign_info AS c ON c.id = m.campaign_id
GROUP BY c.id;

#Question 4
SELECT COUNT(m.conversions), w.state
FROM marketing_performance AS m
INNER JOIN campaign_info AS c ON c.id = m.campaign_id
INNER JOIN website_revenue AS w ON w.campaign_id = c.id
WHERE c.name = 'Campaign5'
GROUP BY w.state;
#GA generated the most conversions for this campaign

#Question 5
SELECT c.name AS "Campaign Name",
    (
        0.2 * w.revenue +
        0.2 * m.conversions +
        0.2 * m.clicks -
        0.2 * m.cost +
        0.2 * m.impressions
    ) AS effectiveness_score
FROM campaign_info AS c
INNER JOIN website_revenue AS w ON c.id = w.campaign_id
INNER JOIN marketing_performance AS m ON c.id = m.campaign_id
GROUP BY c.name
ORDER BY effectiveness_score DESC
LIMIT 1;
#I created this query to look at which campaign was the most effective. I decided to weigh revenue, conversions, 
  #clicks, cost, and impressions all equally to create an "effectiveness score". In my opinion, campaign 4 was the most
  #effective. The company could change the weights of each variable based on what metrics they want to prioritize.

#Bonus Question 6
SELECT DAYNAME(date) AS day_of_week, AVG(clicks) AS average_clicks
FROM marketing_performance
GROUP BY DAYOFWEEK(date)
ORDER BY average_clicks DESC LIMIT 1;
