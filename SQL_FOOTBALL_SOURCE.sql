

Create database Football_League_Source;  ---Create Database
use Football_League_Source;  -- Use Database


----Query tp]o create Source table 1 : All_Football_Data
CREATE TABLE All_Football_Data (
  MatchId int,
  ResultDate varchar(50) DEFAULT NULL,
  hometeamName varchar(50) DEFAULT NULL,
  awayteamName varchar(50) DEFAULT NULL,
  FullTimeHomeTeamGoals int DEFAULT NULL,
  FullTimeAwayTeamGoals int DEFAULT NULL,
  FullTimeResult varchar(50) DEFAULT NULL,
  HalfTimeHomeTeamGoals int DEFAULT NULL,
  HalfTimeAwayTeamGoals int DEFAULT NULL,
  HalfTimeResult varchar(50) DEFAULT NULL,
  refereeName varchar(50) DEFAULT NULL,
  HomeTeamShots int DEFAULT NULL,
  AwayTeamShots int DEFAULT NULL,
  HomeTeamShotsOnTarget int DEFAULT NULL,
  AwayTeamShotsOnTarget int DEFAULT NULL,
  HomeTeamFouls int DEFAULT NULL,
  AwayTeamFouls int DEFAULT NULL,
  HomeTeamCorners int DEFAULT NULL,
  AwayTeamCorners int DEFAULT NULL,
  HomeTeamYellowCards int DEFAULT NULL,
  AwayTeamYellowCards int DEFAULT NULL,
  HomeTeamRedCards int DEFAULT NULL,
  AwayTeamRedCards int DEFAULT NULL,
  HomeTeamId int DEFAULT NULL,
  AwayTeamId int DEFAULT NULL,
  RefereeId int DEFAULT NULL,
  ResultYear varchar(50)
    CONSTRAINT pk_matchId PRIMARY KEY (MatchId)
    )


----Query tp]o create Source table 2 :Team_Data
create table Team_Data(
TeamId int  NOT NULL ,
TeamName varchar(50),
StadiumName  varchar(50),
CONSTRAINT pk_TeamId PRIMARY KEY (TeamId)
);
 
  
----Query tp]o create Source table 3 :Manager_Data
  create table Manager_Data(
  ManagerId int NOT NULL,
  ManagerName varchar(50),
  Club varchar(50),
  Nationality varchar(50),
  MatchYear varchar(50)
 CONSTRAINT pk_ManagerId PRIMARY KEY (ManagerId)  
  )





  



