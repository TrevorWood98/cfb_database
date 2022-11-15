use cfb_statrec;
DROP TABLE conference;
DROP TABLE team;
DROP TABLE teamseason;
DROP TABLE coach;
DROP TABLE team_stats;
DROP TABLE player;
DROP TABLE season;
drop table record;


CREATE TABLE conference
(conferenceid SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
name varchar(50),
city varchar(50),
state varchar(25),
date_created DATE,
CONSTRAINT pk_conferenceid PRIMARY KEY (conferenceid)
);

CREATE TABLE season (
seasonid SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
year int not null,
CONSTRAINT pk_seasonid PRIMARY KEY (seasonid)
);


CREATE TABLE team
(teamid SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
school varchar(50),
nickname varchar(50),
city varchar(50),
state varchar(25),
conferenceid SMALLINT UNSIGNED,
CONSTRAINT fk_conferenceid FOREIGN KEY (conferenceid) REFERENCES conference (conferenceid),
CONSTRAINT pk_teamid PRIMARY KEY (teamid)
);

CREATE TABLE teamseason
(tsid SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
teamid SMALLINT UNSIGNED,
seasonid SMALLINT UNSIGNED,
coachid SMALLINT UNSIGNED,
wins SMALLINT,
losses SMALLINT,
ap_pre SMALLINT,
ap_high SMALLINT,
ap_post SMALLINT,
CONSTRAINT fk_teamid FOREIGN KEY (teamid) REFERENCES team (teamid),
CONSTRAINT fk_seasonid FOREIGN KEY (seasonid) REFERENCES season (seasonid),
CONSTRAINT fk_coachid FOREIGN KEY (coachid) REFERENCES coach (coachid),
CONSTRAINT pk_tsid PRIMARY KEY (tsid)
);

CREATE TABLE coach
(coachid SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
fname varchar(25),
lname varchar(25),
experience int,
position varchar(25),
headcoachid smallint unsigned,
teamid smallint unsigned,

CONSTRAINT fk_team_id_ FOREIGN KEY (teamid) REFERENCES team (teamid),
constraint fk_headcoachid foreign key (headcoachid) references coach (coachid),
CONSTRAINT pk_coachid PRIMARY KEY (coachid)
);

CREATE TABLE team_stats(
statid SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
offensive_rank SMALLINT,
defensive_rank SMALLINT,
off_total_yds INT,
def_total_yds INT,
off_passing_yds INT,
off_passing_yds_game INT,
off_rushing_yds INT,
off_rushing_yds_game INT,
off_points INT,
off_points_game INT,
def_passing_yds INT,
def_passing_yds_game INT,
def_rushing_yds INT,
def_rushing_yds_game INT,
def_points INT,
def_points_game INT,
tsid SMALLINT UNSIGNED,
CONSTRAINT fk_tsid FOREIGN KEY (tsid) REFERENCES teamseason (tsid),
CONSTRAINT pk_statid PRIMARY KEY (statid)
);

CREATE TABLE player
(playerid SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
fname VARCHAR(25),
lname VARCHAR(25),
class char(1),
position varchar(10),
teamid SMALLINT UNSIGNED,
CONSTRAINT fk_p_teamid FOREIGN KEY (teamid) REFERENCES team (teamid),
CONSTRAINT pk_playerid PRIMARY KEY (playerid)
);

/*Populate Tables*/

/*conference data*/
INSERT INTO conference (name, city, state, date_created) VALUES('Big 12', 'Irving','Texas','1984-02-25');
INSERT INTO conference (name, city, state, date_created) VALUES('SEC', 'Birmingham','Alabmama','1932-03-14');
INSERT INTO conference (name, city, state, date_created) VALUES('Pac 12', 'San Fransico','California','1959-07-04');
INSERT INTO conference (name, city, state, date_created) VALUES('Big 10', 'Rosemont','Illinois','1896-02-05');
INSERT INTO conference (name, city, state, date_created) VALUES('ACC', 'Greensboro','North Carolina','1953-04-15');
INSERT INTO conference (name, city, state, date_created) VALUES('American', 'Irving','Texax','2013-11-22');
INSERT INTO conference (name, city, state, date_created) VALUES('C-USA', 'Irving','Texas','1995-07-25');
INSERT INTO conference (name, city, state, date_created) VALUES('Ind.', 'Indianapolis','Indiana','1978-01-02');
INSERT INTO conference (name, city, state, date_created) VALUES('MAC', 'Cleveland','Ohio','1946-03-12');
INSERT INTO conference (name, city, state, date_created) VALUES('MWC', 'Colorado Springs','Colorado','1946-10-18');
INSERT INTO conference (name, city, state, date_created) VALUES('SBC', 'New Orleans','Louisiana','1976-08-15');

/*season data*/
INSERT INTO season (year) VALUES(2013);
INSERT INTO season (year) VALUES(2014);
INSERT INTO season (year) VALUES(2015);
INSERT INTO season (year) VALUES(2016);
INSERT INTO season (year) VALUES(2017);
INSERT INTO season (year) VALUES(2018);
INSERT INTO season (year) VALUES(2019);
INSERT INTO season (year) VALUES(2020);
INSERT INTO season (year) VALUES(2021);
INSERT INTO season (year) VALUES(2022);

/*Team data*/
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Air Force', 'Falcons','USAF Academy','Colorado',10);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Akron ', 'Zips','Akron','Ohio',9);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Alabama', 'Crimson Tide','Tuscaloosa','Alabama',2);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Appalachian State', 'Mountaineers','Boone','North Carolina',11);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Arizona', 'Wildcats','Tucson ','Arizona',3);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Arizona State', 'Sun Devils','Tempe','Arizona',3);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Arkansas', 'Razorbacks','Fayetteville','Arkansas',2);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Arkansas State', 'Red Wolves','Jonesboro','Arkansas',11);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Army', 'Black Knights','West Point','New York',8);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Auburn', 'Tigers','Auburn','Alabama',2);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Ball State', 'Cardinals','Muncie','Indiana',9);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Baylor', 'Bears','Waco','Texas',1);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Boise State', 'Broncos','Boise','Idaho',10);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Boston College', 'Eagles','Chestnut Hill','Massachusetts',5);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Bowling Green', 'Falcons','Bowling Green ','Ohio',9);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Buffalo', 'Bulls','Buffalo','New York',9);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('BYU', 'Cougars','Provo','Utah',8);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('California', 'Golden Bears','Berkeley','Califronia',3);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Central Michigan', 'Chippewas','Mount Pleasant','Michigan',9);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Charlotte', '49ers','Charlotte','North Carolina',7);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Cincinnati', 'Bearcats','Cincinnati','Ohio',6);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Clemson', 'Tigers','Clemson','South Carolina',5);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Coastal Carolina', 'Chanticleers','Conway','South Carolina',11);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Colorado', 'Buffaloes','Boulder','Colorado',3);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Colorado State', 'Rams','Fort Collins','Colorado',10);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Duke', 'Blue Devils','Durham','North Carolina',5);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('East Carolina', 'Pirates','Greenville','North Carolina',5);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Eastern Michigan', 'Eagles','Ypsilanti','Michigan',9);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Florida Atlantic', 'Owls','Boca Raton','Florida',7);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('FIU', 'Panthers','Miami','Florida',7);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Florida', 'Gators','Gainesville','Florida',2);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Florida State', 'Seminoles','Tallahassee','Florida',5);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Fresno State', 'Bulldogs','Fresno','California',10);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Georgia', 'Bulldogs','Athens','Georgia',2);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Georgia Southern', 'Eagles','Statesboro','Georgia',11);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Georgia State', 'Panthers','Atlanta','Georgia',11);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Georgia Tech', 'Yellow Jackets','Atlanta','Georgia',5);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Hawaii', 'Rainbow Warriors','Honolulu','Hawaii',10);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Houston', 'Cougars','Houston','Texas',6);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Illinois', 'Fighting Illini','Urbana-Champaign','Illinois',4);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Indiana', 'Hoosiers','Bloomington','Indiana',4);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Iowa', 'Hawkeyes','Iowa City','Iowa',4);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Iowa State', 'Cyclones','Ames','Iowa',2);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('James Madison', 'Dukes','Harrisonburg','Virginia',11);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Kansas', 'Jayhawks','Lawrence','Kansas',1);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Kansas State', 'Wildcats','Manhattan','Kansas',1);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Kent State', 'Golden Flashes','Kent','Ohio',9);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Kentucky', 'Wildcats','Lexington','Kentucky',2);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Liberty', 'Flames','Lynchburg','Virginia',8);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Louisiana', 'Ragin' 'Cajuns','Lafayette','Louisiana',11);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Louisiana-Monroe', 'Warhawks','Monfroe','Louisiana',11);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Louisiana Tech', 'Bulldogs','Ruston','Louisiana',7);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Louisville', 'Cardinals','Louisville','Kentucky',5);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('LSU', 'Tigers','Baton Rouge','Louisiana',2);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Marshall', 'Thundering Herd','Huntington','West Virginia',11);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Maryland', 'Tarrapins','College Park','Maryland',4);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Memphis', 'Tigers','Memphis','Tennessee',6);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Miami (FL)', 'Hurricanes','Coral Gables','Florida',5);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Miami (OH)', 'RedHawks','Oxford','Ohio',9);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Michigan', 'Wolverines','Ann Arbor','Michigan',4);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Michigan State', 'Spartans','East Lansing','Michigan',4);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Middle Tennessee', 'Blue Raiders','Murfreesboro','Tennessee',7);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Minnesota', 'Golden Gophers','Minneapolis','Minnesota',4);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Mississippi State', 'Bulldogs','Starkville','Mississippi',2);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Missouri', 'Tigers','Columbia','Missouri',2);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Navy', 'Midshipmen','Annapolis','Maryland',6);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('NC State', 'Wolfpack','Raleigh','North Carolina',5);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Nebraska', 'Cornhuskers','Lincoln','Nebraska',4);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Nevada', 'Wolf Pack','Reno','Nevada',10);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('New Mexico', 'Lobos','Albuquerque','New Mexico',10);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('New Mexico State', 'Aggies','Las Cruces','New Mexico',8);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('North Carolina', 'Tar Heels','Chapel Hill ','North Carolina',5);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('North Texas', 'Mean Green','Denton','Texas',7);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Northern Illinois', 'Huskies','DeKalb','Illinois',9);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Northwestern', 'Wildcats','Evanston','Illinois',4);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Notre Dame', 'Fighting Irish','South Bend','Indiana',8);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Ohio', 'Bobcats','Athens','Ohio',9);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Ohio State', 'Buckeyes','Columbus','Ohio',4);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Oklahoma', 'Sooners','Norman','Oklahoma',1);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Oklahoma State', 'Cowboys','Stillwater','Oklahoma',1);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Old Dominion ', 'Monarchs','Norfolk','Virginia',11);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Ole Miss', 'Rebels','Oxford','Mississippi',2);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Oregon', 'Ducks','Eugene','Oregon',3);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Oregon State', 'Beavers','Corvallis','Oregon',3);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Penn State', 'Nittany Lions','University Park','Pennsylvania',4);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Pittsburgh', 'Panthers','Pittsburgh','Pennsylvania',5);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Purdue', 'Boilermakers','West Lafayette','Indiana',4);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Rice', 'Owls','Houston','Texas',7);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Rutgers', 'Scarlet Knights','Piscataway','New Jersey',4);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('San Diego State', 'Aztecs','San Diego','California',10);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('San Jose State', 'Spartans','San Jose','California',10);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('SMU', 'Mustangs ','University Park','Texas',6);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('South Alabama', 'Jaguars','Mobile','Alabama',11);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('South Carolina', 'Gamecocks','Colubia','South Carolina',2);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('South Florida', 'Bulls','Tampa','Florida',6);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Southern Miss', 'Golden Eagles','Hattiesburg','Mississippi',11);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Stanford', 'Cardinal','Stanford','California',3);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Syracuse', 'Orange','Syracuse','New York',5);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('TCU', 'Horned Frogs','Fort Worth','Texas',1);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Temple ', 'Owls','Philadelphia','Pennsylvania',6);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Tennessee', 'Volunteers','Knoxville','Tennessee',2);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Texas', 'Longhorns','Austin','Texas',1);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Texas A&M', 'Aggies','College Station','Texas',2);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Texas State', 'Bobcats','San Marcos','Texas',11);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Texas Tech', 'Red Raiders','Lubbock','Texas',1);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Toledo', 'Rockets','Toledo','Ohio',9);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Troy', 'Trojans','Troy ','Alabama',11);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Tulane', 'Green Wave','New Orleans','Louisiana',6);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Tulsa', 'Golden Hurricane','Tulsa','Oklahoma',6);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('UAB', 'Blazers','Birmingham','Alabama',7);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('UCF', 'Knights','Orlando','Florida',6);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('UCLA', 'Bruins','Los Angeles ','California',3);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('UConn', 'Huskies','Storrs','Connecticut',8);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('UMass', 'Minutement','Amherst','Massaschusetts',8);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('UNLV', 'Rebels','Las Vegas','Nevada',10);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('USC', 'Trojans','Los Angeles ','California',3);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('UTEP', 'Miners','El Paso','Texas',7);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('UTSA', 'Roadrunners','San Antonio','Texas',7);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Utah', 'Utes','Salt Lake City','Utah',3);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Utah State', 'Aggies','Logan','Utah',10);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Vanderbilt', 'Commodores','Nashville','Tennessee',2);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Virginia', 'Cavaliers','Charlottesville','Virginia',5);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Virginia Tech', 'Hokies','Blacksburg','Virginia',5);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Wake Forest', 'Demon Deacons','Winston-Salem','North Carolina',5);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Washington ', 'Huskies','Seattle','Washington',3);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Washington State', 'Cougars','Pullman','Washington',3);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('West Virginia', 'Mountaineers','Morgantown','West Virginia',1);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Western Kentucky', 'Hilltoppers','Bowling Green ','Kentucky',7);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Western Michigan', 'Broncos','Kalamazoo','Michigan',9);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Wisconsin ', 'Badgers','Madison','Wisconsin',4);
INSERT INTO team (school, nickname, city, state, conferenceid) VALUES('Wyomin', 'Cowboys','Laramie','Wyoming',10);


/* Coach table data */
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Brent', 'Venables',29,'Head',null, 139);
/*Lincoln Riley has USC teamid since he is their head coach*/
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Lincoln', 'Riley',14,'Head',null, 176);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Bob', 'Stoops',25,'null',null, null);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('John', 'Blake',3,'null',null, null);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Howard', 'Schnellenberger',15,'null',null, null);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Gary', 'Gibbs',6,'null',null, null);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Barry', 'Switzer',16,'null',null, null);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Chuck', 'Fairbanks',6,'null',null, null);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Jim', 'MacKenzie',1,'null',null, null);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Gomer', 'Jones',2,'null',null, null);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Bud', 'Wilkinson',17,'null',null, null);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Jim', 'Tatum',1,'null',null, null);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Snorter', 'Luster',5,'null',null, null);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Tom', 'Stidham',4,'null',null, null);

/*Alabama coaches*/
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Nick', 'Saban',49,'Head',null, 63);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Mike ', 'Shula',34,'null',null, null);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Dennis', 'Franchione',2,'null',null, null);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Mike ', 'Dubose',4,'null',null, null);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Gene', 'Stallings',7,'null',null, null);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Bill', 'Curry',3,'null',null, null);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Ray ', 'Perkins',4,'null',null, null);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Bear ', 'Bryant',24,'null',null, null);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Jennings', 'Whitworth',3,'null',null, null);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Red', 'Drew',8,'null',null, null);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Frank', 'Thomas',15,'null',null, null);

/*Georgia coaches*/
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Kirby', 'Smart',23,'Head',null, 94);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Bryan', 'McClendon',14,'null',null, null);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Mark', 'Richt',25,'null',null, null);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Jim', 'Donnan',3,'null',null, null);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Ray', 'Goff',15,'null',null, null);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Vince', 'Dooley',6,'null',null, null);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Johnny', 'Griffith',16,'null',null, null);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Wally', 'Butts',6,'null',null, null);

/*Ohio State coaches*/
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Ryan', 'Day',12,'Head',null, 138);
/*Also coached Florida, Utah*/
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Urban', 'Meyer',20,'null',null, null);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Luke', 'Fickell',14,'null',null, null);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Jim', 'Tressel',9,'null',null, null);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('John', 'Cooper',12,'null',null, null);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Earle', 'Bruce',8,'null',null, null);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Woody', 'Hayes',27,'null',null, null);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Wes', 'Fesler',4,'null',null, null);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Paul', 'Bixler',1,'null',null, null);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Carroll', 'Widdoes',1,'null',null, null);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Paul', 'Brown',3,'null',null, null);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Francis', 'Schmidt',7,'null',null, null);

/*Michigan coaches data*/
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Jim', 'Harbaugh',20,'Head',null, 120);
/*Also coaches San Diego State*/
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Brady', 'Hoke',41,'Head',null, 150);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Rich', 'Rodriguez',2,'null',null, null);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Lloyd', 'Carr',12,'null',null, null);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Gary', 'Moeller',4,'null',null, null);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Bo', 'Schembechler',20,'null',null, null);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Bump', 'Elliot',9,'null',null, null);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Bennie', 'Oosterbaan',10,'null',null, null);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Fritz', 'Crisler',9,'null',null, null);

/*TCU coaches data*/
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Sonny', 'Dykes',28,'Head',null, 159);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Gary ', 'Patterson',40,'null',null, 162);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Dennis', 'Franchione',2,'null',null, null);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Pat', 'Sullivan',5,'null',null, null);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Jim', 'Wacker',8,'null',null, null);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('F.A.', 'Dry',5,'null',null, null);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Jim', 'Shofner',3,'null',null, null);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Billy', 'Tohill',3,'null',null, null);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Jim', 'Pittman',1,'null',null, null);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Fred', 'Taylor',8,'null',null, null);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Abe', 'Martin',13,'null',null, null);
INSERT INTO coach (fname, lname, experience, position, headcoachid, teamid) VALUES('Dutch', 'Meyer',18,'null',null, null);

/* Oklahoma team season data */
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 1,25,6,3,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 2,24,6,3,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 3,24,3,5,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 4,24,7,2,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 5,24,6,3,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 6,24,5,5,null,14,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 7,23,8,3,null,13,14);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 8,22,7,2,null,15,16);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 9,22,10,1,null,5,5);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 10,22,11,0,null,2,2);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 11,22,10,1,6,1,1);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 12,22,8,2,4,4,10);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 13,22,8,1,4,3,4);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 14,22,9,1,6,4,4);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 15,22,10,0,2,1,3);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 16,22,11,0,2,1,1);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 17,22,10,0,1,1,1);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 18,22,10,1,1,1,4);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 19,22,10,1,2,1,5);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 20,22,7,3,2,2,15);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 21,22,3,6,10,10,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 22,22,5,5,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 23,22,8,3,null,8,8);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 24,22,8,2,4,1,10);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 25,21,6,4,2,2,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 26,21,3,7,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 27,20,6,4,null,10,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 28,19,10,1,null,3,3);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 29,19,7,4,4,4,11);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 30,19,6,4,6,6,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 31,19,7,4,20,14,20);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 32,19,11,1,10,2,2);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 33,19,11,1,6,2,2);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 34,18,10,0,11,2,3);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 35,18,11,0,1,1,1);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 36,18,11,1,1,1,1);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 37,18,9,2,5,3,5);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 38,18,10,2,1,1,7);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 39,18,11,1,4,1,3);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 40,18,11,1,3,3,3);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 41,18,10,2,5,3,3);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 42,18,7,4,2,2,20);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 43,18,8,4,9,9,16);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 44,18,8,4,2,2,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 45,18,9,2,16,2,6);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 46,18,11,1,1,1,1);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 47,18,11,1,1,1,3);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 48,18,11,1,1,1,3);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 49,18,9,3,3,3,14);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 50,17,7,4,15,6,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 51,17,8,3,22,4,17);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 52,17,9,3,10,5,16);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 53,17,5,4,15,13,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 54,17,9,3,22,9,17);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 55,17,6,6,16,15,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 56,16,5,5,15,10,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 57,15,3,8,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 58,15,4,8,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 59,15,5,6,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 60,14,7,5,null,23,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 61,14,13,0,19,1,1);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 62,14,11,2,3,2,6);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 63,14,12,2,2,1,5);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 64,14,12,2,1,1,3);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 65,14,12,1,2,2,3);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 66,14,8,4,7,7,22);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 67,14,11,3,10,7,11);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 68,14,11,3,8,3,8);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 69,14,12,2,4,1,5);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 70,14,8,5,3,3,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 71,14,12,2,7,3,6);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 72,14,10,3,1,1,16);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 73,14,10,3,4,4,15);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 74,14,11,2,16,6,6);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 75,14,8,5,4,4,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 76,14,11,2,19,3,5);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 77,14,11,2,3,3,5);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 78,13,12,2,7,2,3);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 79,13,12,2,7,4,4);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 80,13,12,2,4,4,7);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 81,13,9,2,5,3,6);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 82,13,11,2,2,2,10);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(139, 83,1,5,4,9,6,null);

/*Alabama teamseason data*/
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 1,12,7,2,null,14,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 2,12,9,2,null,7,20);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 3,12,8,3,null,3,10);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 4,null,null,null,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 5,12,5,2,null,13,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 6,12,10,0,null,2,2);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 7,12,7,4,null,6,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 8,11,8,3,null,6,6);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 9,11,6,4,null,null ,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 10,11,6,3,null,null ,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 11,11,9,2,null,12,16);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 12,11,5,6,9,9,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 13,11,10,2,null,8,9);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 14,11,6,3,5,5,13);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 15,11,4,5,14,12,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 16,10,0,10,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 17,10,2,7,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 18,10,2,7,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 19,9,5,4,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 20,9,7,2,null,10,10);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 21,9,8,1,null,5,9);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 22,9,11,0,3,1,1);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 23,9,10,1,3,1,5);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 24,9,9,2,3,2,8);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 25,9,10,1,6,1,1);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 26,9,9,1,5,1,1);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 27,9,11,0,1,1,3);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 28,9,8,2,2,2,8);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 29,9,8,3,10,7,17);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 30,9,6,5,13,13,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 31,9,6,5,16,16,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 32,9,11,1,16,2,4);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 33,9,10,2,7,2,7);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 34,9,11,1,6,1,4);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 35,9,11,1,4,2,5);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 36,9,11,1,2,2,3);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 37,9,9,3,6,6,11);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 38,9,11,1,6,2,2);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 39,9,11,1,3,2,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 40,9,12,0,4,2,7);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 41,9,10,2,2,1,6);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 42,9,9,2,4,2,7);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 43,9,8,4,3,2,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 44,8,8,4,13,3,15);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 45,8,5,6,9,9,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 46,8,9,2,null,10,13);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 47,8,10,3,5,2,9);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 48,7,7,5,null,11,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 49,7,9,3,14,12,17);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 50,7,10,2,16,2,9);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 51,6,7,5,12,12,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 52,6,11,1,22,5,5);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 53,6,13,0,9,1,1);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 54,6,9,3,2,2,14);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 55,6,12,1,12,3,5);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 56,6,8,3,10,10,21);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 57,6,10,3,15,7,11);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 58,5,4,7,15,11,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 59,5,7,5,null,22,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 60,5,10,3,20,5,8);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 61,5,3,8,3,3,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 62,4,7,5,25,25,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 63,4,10,3,null,9,11);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 64,3,4,9,null,21,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 65,3,6,6,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 66,3,10,2,null,4,8);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 67,3,6,7,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 68,2,7,6,null,16,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 69,2,12,2,24,1,6);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 70,2,14,0,5,1,1);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 71,2,10,3,1,1,10);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 72,2,12,1,2,1,1);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 73,2,13,1,2,1,1);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 74,2,11,2,1,1,7);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 75,2,12,2,2,1,4);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 76,2,14,1,1,1,1);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 77,2,14,1,1,1,2);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 78,2,13,1,1,1,1);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 79,2,14,1,1,1,2);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 80,2,11,2,2,1,8);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 81,2,13,0,3,1,1);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 82,2,13,2,1,1,2);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(63, 83,2,7,2,1,1,null);


/*Georgia team season data*/
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 1,33,5,4,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 2,33,9,1,null,14,14);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 3,33,11,1,null,1,2);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 4,33,6,4,null,20,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 5,33,7,3,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 6,33,9,2,null,12,18);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 7,33,11,0,null,3,3);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 8,33,7,4,null,9,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 9,33,9,2,null,8,8);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 10,33,4,6,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 11,33,6,3,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 12,33,5,5,null,13,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 13,33,7,4,null,19,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 14,33,3,8,null,18,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 15,33,6,3,null,20,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 16,33,4,6,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 17,33,3,6,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 18,33,3,7,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 19,33,4,6,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 20,33,10,1,null,5,5);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 21,33,6,4,13,13,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 22,32,3,7,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 23,32,3,4,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 24,32,4,5,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 25,31,7,3,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 26,31,6,4,null,4,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 27,31,10,1,null,4,4);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 28,31,7,4,6,3,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 29,31,8,1,null,4,8);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 30,31,5,5,8,6,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 31,31,5,5,null,19,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 32,31,11,1,18,6,7);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 33,31,7,4,17,16,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 34,31,7,4,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 35,31,6,6,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 36,31,9,3,null,12,19);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 37,31,10,2,16,4,10);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 38,31,5,6,19,17,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 39,31,9,2,null,8,16);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 40,31,6,5,11,11,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 41,31,12,0,16,1,1);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 42,31,10,2,10,2,6);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 43,31,11,1,7,1,4);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 44,31,10,1,15,4,4);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 45,31,7,4,null,8,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 46,31,7,3,null,12,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 47,31,8,4,16,14,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 48,31,9,3,20,8,13);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 49,31,9,3,12,6,15);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 50,30,6,6,null,23,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 51,30,4,7,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 52,30,9,3,null,17,17);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 53,30,10,2,14,7,8);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 54,30,5,6,13,13,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 55,30,6,4,null,23,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 56,30,6,6,null,20,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 57,29,5,6,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 58,29,10,2,null,7,10);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 59,29,9,3,19,7,14);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 60,29,8,4,14,10,16);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 61,29,8,4,10,9,20);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 62,28,8,4,null,15,22);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 63,28,13,1,8,3,3);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 64,28,11,3,11,4,7);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 65,28,10,2,3,3,7);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 66,28,10,3,13,4,10);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 67,28,9,4,15,9,23);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 68,28,11,2,13,2,2);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 69,28,10,3,1,1,13);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 70,28,8,5,13,13,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 71,28,6,7,23,22,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 72,28,10,4,19,12,19);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 73,28,12,2,6,3,5);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 74,28,8,5,5,5,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 75,28,10,3,12,6,9);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 76,28,10,3,9,7,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 77,26,8,5,18,9,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 78,26,13,2,15,2,2);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 79,26,11,3,3,2,7);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 80,26,12,2,3,3,4);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 81,26,8,2,4,3,7);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 82,26,14,1,5,1,1);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(94, 83,26,10,0,3,1,null);


/*TCU team season data*/
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 1,66,3,7,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 2,66,7,3,null,19,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 3,66,7,3,null,9,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 4,66,2,6,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 5,66,7,3,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 6,66,5,5,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 7,66,2,7,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 8,66,4,5,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 9,66,4,5,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 10,66,6,3,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 11,66,5,5,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 12,66,6,5,null,11,11);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 13,66,4,4,9,9,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 14,65,3,7,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 15,65,4,6,null,17,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 16,65,9,2,null,6,6);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 17,65,8,3,7,4,14);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 18,65,5,4,null,17, NULL);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 19,65,8,2,8,6,10);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 20,65,8,3,13,7,7);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 21,65,4,4,11,11,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 22,65,3,5,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 23,65,6,4,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 24,65,4,5,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 25,65,4,6,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 26,65,6,5,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 27,65,2,8,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 28,64,4,6,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 29,64,3,7,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 30,64,4,6,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 31,64,4,6,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 32,63,6,4,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 33,62,5,6,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 34,62,3,8,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 35,61,1,10,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 36,61,1,10,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 37,61,0,11,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 38,60,2,9,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 39,60,2,9,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 40,60,2,8,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 41,60,1,10,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 42,60,2,7,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 43,60,3,8,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 44,59,1,8,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 45,59,8,4,null,12,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 46,59,3,8,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 47,59,3,8,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 48,59,5,6,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 49,59,4,7,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 50,59,4,7,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 51,59,5,6,null,24,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 52,59,7,4,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 53,58,2,8,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 54,58,4,7,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 55,58,7,5,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 56,58,6,5,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 57,58,4,7,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 58,58,1,10,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 59,57,7,5,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 60,57,8,4,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 61,57,10,2,20,9,21);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 62,56,6,6,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 63,56,10,2,null,22,23);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 64,56,11,2,25,10,25);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 65,56,5,6,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 66,56,11,1,null,11,11);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 67,56,11,2,22,16,22);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 68,56,8,5,22,19,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 69,56,11,2,null,7,7);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 70,56,12,1,17,3,6);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 71,56,13,0,6,2,2);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 72,56,11,2,14,14,14);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 73,56,7,6,20,15,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 74,56,4,8,20,20,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 75,56,12,1,null,3,3);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 76,56,11,2,2,2,7);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 77,56,6,7,13,13,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 78,56,11,3,null,4,9);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 79,56,7,6,16,15,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 80,56,5,7,null,25,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 81,56,6,4,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 82,56,5,7,null,null,null);
INSERT INTO teamseason (teamid, seasonid,coachid, wins,losses, ap_pre, ap_high, ap_post) VALUES(159, 83,55,10,0,null,4,null);

/*Team stats data*/


/*Alabama*/
INSERT INTO team_stats (offensive_rank, defensive_rank,off_total_yds, def_total_yds,off_passing_yds, off_passing_yds_game, off_rushing_yds, off_rushing_yds_game, off_points, off_points_game,def_passing_yds, def_passing_yds_game, def_rushing_yds, def_rushing_yds_game, def_points, def_points_game, tsid) VALUES(19, 16,4663,3135,2732,273,1931,193, 406, 41, 2008,201, 1127, 113, 189, 19, 166);
INSERT INTO team_stats (offensive_rank, defensive_rank,off_total_yds, def_total_yds,off_passing_yds, off_passing_yds_game, off_rushing_yds, off_rushing_yds_game, off_points, off_points_game,def_passing_yds, def_passing_yds_game, def_rushing_yds, def_rushing_yds_game, def_points, def_points_game, tsid) VALUES(7, 8,7323,3980,5073,338,2250,150, 594, 40, 2903,223, 1077, 83, 263, 20, 165);
INSERT INTO team_stats (offensive_rank, defensive_rank,off_total_yds, def_total_yds,off_passing_yds, off_passing_yds_game, off_rushing_yds, off_rushing_yds_game, off_points, off_points_game,def_passing_yds, def_passing_yds_game, def_rushing_yds, def_rushing_yds_game, def_points, def_points_game, tsid) VALUES(4, 32,7041,4579,4656,358,2385,184, 630, 49, 3109,239, 1470, 113, 252, 19, 164);

/*Georgia*/
INSERT INTO team_stats (offensive_rank, defensive_rank,off_total_yds, def_total_yds,off_passing_yds, off_passing_yds_game, off_rushing_yds, off_rushing_yds_game, off_points, off_points_game,def_passing_yds, def_passing_yds_game, def_rushing_yds, def_rushing_yds_game, def_points, def_points_game, tsid) VALUES(3, 6,5096,2698,3171,317,1925,193, 406, 41, 1873,187, 825, 83, 116, 12, 249);
INSERT INTO team_stats (offensive_rank, defensive_rank,off_total_yds, def_total_yds,off_passing_yds, off_passing_yds_game, off_rushing_yds, off_rushing_yds_game, off_points, off_points_game,def_passing_yds, def_passing_yds_game, def_rushing_yds, def_rushing_yds_game, def_points, def_points_game, tsid) VALUES(26, 2,6642,3557,3778,252,2864,191, 579, 39, 2239,172, 1062, 82, 124, 10, 248);
INSERT INTO team_stats (offensive_rank, defensive_rank,off_total_yds, def_total_yds,off_passing_yds, off_passing_yds_game, off_rushing_yds, off_rushing_yds_game, off_points, off_points_game,def_passing_yds, def_passing_yds_game, def_rushing_yds, def_rushing_yds_game, def_points, def_points_game, tsid) VALUES(41, 12,4241,3210,2499,250,1742,174, 323, 32, 2487,249, 723, 72, 200, 20, 247);

/*TCU*/
INSERT INTO team_stats (offensive_rank, defensive_rank,off_total_yds, def_total_yds,off_passing_yds, off_passing_yds_game, off_rushing_yds, off_rushing_yds_game, off_points, off_points_game,def_passing_yds, def_passing_yds_game, def_rushing_yds, def_rushing_yds_game, def_points, def_points_game, tsid) VALUES(12, 65,4861,3771,2725,273,2136,214, 405, 41, 2424,242, 1347, 135, 252, 25, 332);
INSERT INTO team_stats (offensive_rank, defensive_rank,off_total_yds, def_total_yds,off_passing_yds, off_passing_yds_game, off_rushing_yds, off_rushing_yds_game, off_points, off_points_game,def_passing_yds, def_passing_yds_game, def_rushing_yds, def_rushing_yds_game, def_points, def_points_game, tsid) VALUES(41, 118,5168,5541,2838,237,2330,194, 344, 29, 2877,240, 2664, 222, 419, 35, 331);
INSERT INTO team_stats (offensive_rank, defensive_rank,off_total_yds, def_total_yds,off_passing_yds, off_passing_yds_game, off_rushing_yds, off_rushing_yds_game, off_points, off_points_game,def_passing_yds, def_passing_yds_game, def_rushing_yds, def_rushing_yds_game, def_points, def_points_game, tsid) VALUES(51, 30,4110,3509,1963,196,2147,215, 308, 31, 2234,223, 1275, 128, 242, 24, 330);