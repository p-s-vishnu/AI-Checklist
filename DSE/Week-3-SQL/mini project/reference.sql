/*****************************************************************/
/************************* Pie-in-the-sky ************************/
/*****************************************************************/
USE ipl;

/*	Update the bid status of records with value as 'Bid' and data correction	*/
UPDATE ipl_bidding_details bdg
SET bid_status = (
		CASE WHEN bid_team = (SELECT CASE WHEN match_winner = 1 THEN team_id1 ELSE team_id2 END
									FROM ipl_match_schedule ms INNER JOIN ipl_match m ON m.match_id = ms.match_id
									WHERE ms.schedule_id = bdg.schedule_id)
							THEN 'Won'
			 ELSE 'Lost' END)
WHERE bid_status <> 'Cancelled';

/*	1.	Show the percentage of wins of each bidder in the order of highest to lowest percentage.	*/
SELECT usr.user_id, bidder_name,
	((SELECT count(*) FROM ipl_bidding_details bdg WHERE bdg.bidder_id = bdr.bidder_id AND bid_status = "Won") /
    (SELECT count(*) FROM ipl_bidding_details bdg WHERE bdg.bidder_id = bdr.bidder_id AND bid_status IN ("Won","Lost")) * 100) AS "%_wins"
FROM ipl_user usr
INNER JOIN ipl_bidder_details bdr ON bdr.user_id = usr.user_id
ORDER BY 3 DESC;

/*	2.	Which teams have got the highest and the lowest no. of bids?	*/
SELECT t.*, count(*) AS "no_of_bids"
FROM ipl_team t
INNER JOIN ipl_bidding_details bdg ON bdg.bid_team = t.team_id
GROUP BY team_id
HAVING count(*) IN (
		(SELECT count(*)
		FROM ipl_bidding_details
		GROUP BY bid_team
		ORDER BY 1
		LIMIT 1),
		(SELECT count(*)
		FROM ipl_bidding_details
		GROUP BY bid_team
		ORDER BY 1 DESC
		LIMIT 1))
ORDER BY 5 DESC;

/*	3.	In a given stadium, what is the percentage of wins by a team which had won the toss?	*/
SELECT stadium_id, stadium_name, city, #(SELECT count(*) FROM ipl_match m WHERE ms.match_id = m.match_id AND toss_winner = match_winner) AS "win", (SELECT count(*) FROM ipl_match m WHERE ms.match_id = m.match_id) AS "total",
		((SELECT count(*) FROM ipl_match_schedule ms INNER JOIN ipl_match m ON ms.match_id = m.match_id
				WHERE s.stadium_id = ms.stadium_id AND toss_winner = match_winner) /
        (SELECT count(*) FROM ipl_match_schedule ms INNER JOIN ipl_match m ON ms.match_id = m.match_id
				WHERE s.stadium_id = ms.stadium_id) * 100) AS "%_wins_by_toss_winner"
FROM ipl_stadium s
ORDER BY 1;

/*	4.	What is the total no. of bids placed on the team that has won highest no. of matches?	*/
SELECT t.*, count(*) AS "NO_OF_BIDS"
FROM ipl_team t
INNER JOIN ipl_bidding_details bdg ON bdg.bid_team = t.team_id
WHERE bid_team = (
		SELECT	CASE WHEN match_winner = 1 THEN team_id1
					 ELSE team_id2
				END
		FROM ipl_match
		GROUP BY 1
		ORDER BY count(*) DESC
		LIMIT 1);

/*	5.	From the current team standings, if a bidder places a bid on which of the teams, there is a possibility of (s)he winning the
		highest no. of points – in simple words, identify the team which has the highest jump in its total points (in terms of percentage)
		from the previous year to current year.	*/
SELECT *, ((SELECT total_points FROM ipl_team_standings ts WHERE t.team_id = ts.team_id AND tournmt_id = 2018) /
			(SELECT total_points FROM ipl_team_standings ts WHERE t.team_id = ts.team_id AND tournmt_id = 2017) - 1) * 100 AS "%_INCREASE"
FROM ipl_team t
ORDER BY 5 DESC
LIMIT 1;

/*****************************************************************/
/******************************** END ****************************/
/*****************************************************************/