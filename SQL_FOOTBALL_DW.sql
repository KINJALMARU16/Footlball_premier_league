create database Football_League_DW -- Create Datawarehouse Database
use Football_League_DW -- Use Database

-- Create Dim_Referee Table
create table Dim_Referee(
RefereeId int  not null ,
RefereeName varchar(50),
CONSTRAINT pk_RefereeId PRIMARY KEY (RefereeId)
);

-- Create Dim_Manager  Table 
Create table Dim_Manager (
ManagerYearKey int not null ,
ManagerName varchar(50),
Nationality varchar(50),
Club varchar(50),
Manageryear varchar(50),
CONSTRAINT pk_ManagerYearKey PRIMARY KEY (ManagerYearKey)
);

-- Create Dim_MatchStatistics  Table 
create table Dim_MatchStatistics (
MatchId int not null ,
ResultDate varchar(22),
HomeTeamShots int ,
AwayTeamShots int,
HomeTeamShotsOnTarget int,
AwayTeamShotsOnTarget int,
HomeTeamFouls int,
AwayTeamFouls int,
HomeTeamCorners int,
AwayTeamCorners int,
HomeTeamYellowCards int ,
AwayTeamYellowCards int,
HomeTeamRedCards int,
AwayTeamRedCards int,
CONSTRAINT pk_matchId PRIMARY KEY (MatchId)
);

-- Create Dim_Team Table
create table Dim_Team(
TeamId int  NOT NULL   ,
TeamName varchar(50),
StadiumName  varchar(50),
CONSTRAINT pk_TeamId PRIMARY KEY (TeamId),
);

--Create Fact_Result Table
create table Fact_Result(
MatchId int,
ManagerYearKey int,
RefereeId int,
HomeTeamId int,
AwayTeamId int,
FullTimeHomeTeamGoals int ,
FullTimeAwayTeamGoals int,
FullTimeResult varchar(50),
HalfTimeHomeTeamGoals int,
HalfTimeAwayTeamGoals int,
HalfTimeResult varchar(50),
foreign key (Matchid ) references Dim_MatchStatistics(MatchId),
foreign key (ManagerYearKey) references Dim_Manager(ManagerYearKey),
foreign key(RefereeId) references Dim_Referee(RefereeId),
foreign key (HomeTeamId) references Dim_Team(TeamId),
foreign key (AwayTeamId) references Dim_Team(TeamId)
);