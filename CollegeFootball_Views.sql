use cfb_statrec;

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