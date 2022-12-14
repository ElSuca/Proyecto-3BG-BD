SELECT FAMILY.NAME , FAMILY.RECURRENCY, FAMILY.DOMAIN, FAMILY.TYPE, FAMILY.PARENT_ID, EVENT.NAME, EVENT.QUANT_PART, EVENT.DATE, TEAM.NAME, TEAM.IS_ASSOCIATED, PLAYER.NAME, PLAYER.LNAME1, PLAYER.LNAME2, PLAYER.STATUS, PLAYER.AGE, SCORE.TYPE, SCORE.QUANTITY, SCORE.CONTEXT, FOULS.TYPE, FOULS.QUANTITY, FOULS.CONTEXT, JUDGE.NAME, JUDGE.LNAME1, JUDGE.LNAME2
FROM OLYMPUS.EVENT STRAIGHT_JOIN 
(TIME, TMTI, TEAM, PLYR_TM, PLAYER, PLYR_TM_TI_SC, PLYR_TM_TIME_FL, SCORE, FOULS, JUDGE, JUD_FOUL, FAMILY, EVENT_FAMILY)
ON (EVENT.ID = TIME.ID_EVENT AND TIME.ID = TMTI.ID_TIME AND TMTI.ID_TEAM = TEAM.ID AND PLYR_TM.ID_TEAM = TEAM.ID AND PLYR_TM.ID_PLYR = PLAYER.ID AND TIME.ID = PLYR_TM_TI_SC.ID_TIME AND TEAM.ID = PLYR_TM_TI_SC.ID_TEAM AND SCORE.ID = PLYR_TM_TI_SC.ID_SC AND PLYR_TM_TIME_FL.ID_TIME = TIME.ID AND PLYR_TM_TIME_FL.ID_TEAM = TEAM.ID AND PLYR_TM_TIME_FL.ID_FL = FOULS.ID AND JUD_FOUL.ID_FL = FOULS.ID AND JUD_FOUL.ID_JUD = JUDGE.ID) ;

SELECT FAMILY.NAME , EVENT.NAME , SCORE.QUANTITY , TEAM.NAME FROM OLYMPUS.EVENT JOIN 
( TIME, TMTI, TEAM, PLYR_TM_TI_SC, SCORE, EVENT_FAMILY, FAMILY) ON (EVENT.ID = TIME.ID_EVENT AND TMTI.ID_TIME = TIME.ID AND TMTI.ID_TEAM = TEAM.ID AND PLYR_TM_TI_SC.ID_TIME = TIME.ID AND PLYR_TM_TI_SC.ID_TEAM = TEAM.ID AND PLYR_TM_TI_SC.ID_SC = SCORE.ID AND EVENT.ID = EVENT_FAMILY.ID_EVENT AND EVENT_FAMILY.ID_FAM = FAMILY.ID) ; 

SELECT * FROM TEAM;
INSERT INTO PLYR_TM(ID_PLYR, ID_TEAM) VALUES (28,4);

SELECT ID FROM OLYMPUS.EVENT;



Select * FROM plyr_address LIMIT 200000000;