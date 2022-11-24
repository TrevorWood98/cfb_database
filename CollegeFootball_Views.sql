use cfb_statrec;

create view team_rank as
select t.school, s.year, wins, losses, ap_post as final_rank,
case when (ap_post <= 25 and ap_post >= 11) then 'Good'
    when (ap_post <= 11 and ap_post >= 5)  then 'Great'
    when (ap_post <= 5 and ap_post >= 1) then 'Elite'
    end as TeamIs
from teamseason
inner join team t
on teamseason.teamid = t.teamid
inner join season s
on teamseason.seasonid = s.seasonid
where ap_post is not null
order by final_rank;

CREATE VIEW whocoacheswho AS
SELECT coach.fname, coach.lname, team.school
FROM coach
INNER JOIN team
ON team.teamid = coach.teamid;

CREATE VIEW history AS
SELECT season.year, team.school, teamseason.wins, teamseason.losses, coach.fname, coach.lname
FROM season
INNER JOIN teamseason
ON season.seasonid = teamseason.seasonid
INNER JOIN coach
ON teamseason.coachid = coach.coachid
INNER JOIN team
ON teamseason.teamid = team.teamid;

CREATE VIEW tenwinseason_post2010 AS
SELECT team.teamid, team.school, COUNT(teamseason.wins) AS TenWins
FROM team
INNER JOIN teamseason 
ON team.teamid = teamseason.teamid
INNER JOIN season
ON season.seasonid = teamseason.seasonid
WHERE teamseason.wins > 11 and season.year >= 2010
GROUP BY team.school
ORDER BY TenWins DESC;

CREATE VIEW teamconference AS
SELECT team.school, conference.name
from team
inner join conference
on team.conferenceid = conference.conferenceid;

create view head_coaches as
select concat(fname, ' ', lname, ' is the ', position, ' Coach of ', t.school) as msg
from coach
left join team t
on coach.teamid = t.teamid
where position like 'Head';
