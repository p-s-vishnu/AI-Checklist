use ipl;

select * from
(select bidder_id, bid_team,bid_status,
case
		when m.match_winner = 1 and bd.bid_team = m.team_id1  then 'won'
		when m.match_winner = 1 and bd.bid_team != m.team_id1  then 'lost'
        when m.match_winner = 2 and bd.bid_team = m.team_id2  then 'won'
        else 'lost'
end  match_result,
case
		when m.match_winner = 1 then m.team_id1
        else m.team_id2
end  winning_team
from ipl_bidding_details bd natural join ipl_match_schedule ms inner join ipl_match m on ms.match_id = m.match_id
) t
where bid_status <> 'cancelled' and (bid_team = winning_team and bid_status not like match_result) or
(bid_team != winning_team and bid_status like match_result);