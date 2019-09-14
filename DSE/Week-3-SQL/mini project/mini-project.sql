use ipl;

# 1.	Show the percentage of wins of each bidder in the order of highest to lowest percentage
select bidder_id, sum( 
case
	when bid_status = 'won' then 1
    else 0
end
) * 100 / count(*) as 'percent_wins'
from ipl_bidding_details
group by bidder_id
order by percent_wins desc;

# 2.	Which teams have got the highest and the lowest no. of bids?
select bid_team, count(bid_team) FROM
    ipl_bidding_details
GROUP BY bid_team
having count(BID_TEAM) = (
select max(bids) max
from (
SELECT 
    bid_team, COUNT(bid_team) bids
FROM
    ipl_bidding_details
GROUP BY bid_team
) t);

select bid_team, count(bid_team) FROM
    ipl_bidding_details
GROUP BY bid_team
having count(BID_TEAM) = (
select min(bids) min
from (
SELECT 
    bid_team, COUNT(bid_team) bids
FROM
    ipl_bidding_details
GROUP BY bid_team
) t);


#3.	In a given stadium, what is the percentage of wins by a team which had won the toss?
 select sum(toss_winner = match_winner) / count(*) * 100 as 'Percent of winning if you win toss'
 from ipl_match;

#4.	What is the total no. of bids placed on the team that has won highest no. of matches?
# in the inner query get the team with the maximum wins
# outer query, print bids corresponding to team id
SELECT 
    bid_team, COUNT(bid_team) bids
FROM
    ipl_bidding_details
WHERE
    bid_team = (SELECT 
            team_ids
        FROM
            (SELECT 
                CASE
                        WHEN match_winner = 1 THEN TEAM_ID1
                        ELSE team_id2
                    END AS team_ids
            FROM
                ipl_match) winners_list
        GROUP BY team_ids
        ORDER BY COUNT(team_ids) DESC
        LIMIT 1)
GROUP BY bid_team;


#5.	From the current team standings, if a bidder places a bid on which of the teams, 
# there is a possibility of (s)he winning the highest no. of points – in simple words, 
# identify the team which has the highest jump in its total points (in terms of percentage) from the previous year to current year.
select ip1.team_id, ip2.TOTAL_POINTS - ip1.TOTAL_POINTS as jump, round((ip2.TOTAL_POINTS - ip1.TOTAL_POINTS) / ip1.TOTAL_POINTS * 100,2)  as jump_pct
from ipl_team_standings ip1 inner join ipl_team_standings ip2 on ip1.TEAM_ID = ip2.TEAM_ID and 
ip1.TOURNMT_ID = 2017 and ip2.TOURNMT_ID = 2018
where ip2.TOTAL_POINTS - ip1.TOTAL_POINTS > 0
order by jump desc;





