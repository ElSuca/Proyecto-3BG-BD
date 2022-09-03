SELECT * FROM User;
SELECT * FROM User WHERE UNAME = @UNAME; /// Donde UNAME es un valor dado por el usuario del programa
SELECT * FROM phones WHERE id_user = @id /// Donde @id es un valor dado por el usuario del programa
SELECT * FROM user WHERE id = @id /// Donde @id es un valor dado por el usuario del programa
SELECT * FROM AD WHERE Ad_Name = @Ad_Name /// Donde @Ad_Name es un valor dado por el usuario del programa
SELECT * FROM AD WHERE id = @id /// Donde @id es un valor dado por el usuario del programa
INSERT INTO AD (PATH,CAT,AD_NAME) VALUES (@PATH,@CAT,@AD_NAME); /// Donde @PATH, @CAT, @AD_NAME son todos valores ingresados por el usuario del programa
INSERT INTO USER (NAME,LNAME1,LNAME2,EMAIL,UNAME,PASS,ROLE) VALUES (@NAME, @LASTNAME1, @LASTNAME2, @EMAIL, @USERNAME, @PASSWORD, @USERROLE) /// Donde @NAME, @LASTNAME1, @LASTNAME2, @EMAIL, @USERNAME, @PASSWORD, @USERROLE son valores ingresados por el usuario del programa
UPDATE USER SET NAME=@NAME, LNAME1=@LASTNAME1, LNAME2=@LASTNAME2, EMAIL=@EMAIL, UNAME=@USERNAME, PASS=@PASSWORD, ROLE=@USERROLE WHERE ID=@ID /// Donde @NAME, @LASTNAME1, @LASTNAME2, @EMAIL, @USERNAME, @PASSWORD, @USERROLE, @ID son valores ingresados por el usuario del programa
DELETE FROM USER WHERE ID=@ID /// Donde @ID es un valor ingresado por el usuario del programa
SELECT UNAME, PASS FROM USER WHERE UNAME=@USERNAME /// Donde @USERNAME es un valor ingresado por el usuario del programa
SELECT NAME, LNAME1, LNAME2, EMAIL, UNAME, PASS, ROLE FROM USER WHERE UNAME=@USERNAME /// Donde @USERNAME es un valor ingresado por el usuario del programa
SELECT ID_USER, NUM FROM PHONES WHERE ID_USER=@ID_USER /// Donde @ID_USER es un valor ingresado por el usuario del programa
SELECT id,UserName FROM User
SELECT * FROM User LEFT JOIN phones ON User.Id = phones.Id_User
SELECT PLAYER.NAME, PLAYER.LNAME1, PLAYER.LNAME2, PLAYER.STATUS, PLAYER.AGE FROM PLAYER WHERE PLAYER.NAME = @PlayerName /// Donde @PlayerName es un valor generado por el programa cuando el usuario busca un jugador
SELECT FAMILY.NAME , FAMILY.RECURRENCY, FAMILY.DOMAIN, " +
                "FAMILY.TYPE, FAMILY.PARENT_ID, EVENT.NAME, EVENT.DATE, TEAM.NAME, PLAYER.NAME, " +
                "PLAYER.LNAME1, PLAYER.STATUS, PLAYER.AGE, SCORE.TYPE, SCORE.QUANTITY, " +
                "SCORE.CONTEXT, FOULS.TYPE, FOULS.QUANTITY, FOULS.CONTEXT, JUDGE.NAME, JUDGE.LNAME1 " +
                "FROM OLYMPUS.EVENT STRAIGHT_JOIN(TIME, TMTI, TEAM, PLYR_TM, " +
                "PLAYER, PLYR_TM_TI_SC, PLYR_TM_TIME_FL, SCORE, FOULS, JUDGE, JUD_FOUL, FAMILY, EVENT_FAMILY) " +
                "ON(EVENT.ID = TIME.ID_EVENT AND TIME.ID = TMTI.ID_TIME AND TMTI.ID_TEAM = TEAM.ID " +
                "AND PLYR_TM.ID_TEAM = TEAM.ID AND PLYR_TM.ID_PLYR = PLAYER.ID AND TIME.ID = PLYR_TM_TI_SC.ID_TIME " +
                "AND TEAM.ID = PLYR_TM_TI_SC.ID_TEAM AND SCORE.ID = PLYR_TM_TI_SC.ID_SC AND PLYR_TM_TIME_FL.ID_TIME = TIME.ID " +
                "AND PLYR_TM_TIME_FL.ID_TEAM = TEAM.ID AND PLYR_TM_TIME_FL.ID_FL = FOULS.ID " +
                "AND JUD_FOUL.ID_FL = FOULS.ID AND JUD_FOUL.ID_JUD = JUDGE.ID) WHERE EVENT.NAME = @EventName /// Donde @EventName es el nombre que el usuario busca

SELECT FAMILY.NAME ," +
                " EVENT.NAME ," +
                " SCORE.QUANTITY ," +
                " TEAM.NAME FROM OLYMPUS.EVENT STRAIGHT_JOIN ( TIME, TMTI, TEAM, PLYR_TM_TI_SC, SCORE, EVENT_FAMILY, FAMILY) ON " +
                "(EVENT.ID = TIME.ID_EVENT AND TMTI.ID_TIME = TIME.ID AND TMTI.ID_TEAM = TEAM.ID AND PLYR_TM_TI_SC.ID_TIME = TIME.ID AND PLYR_TM_TI_SC.ID_TEAM" +
                " = TEAM.ID AND PLYR_TM_TI_SC.ID_SC = SCORE.ID AND EVENT.ID = EVENT_FAMILY.ID_EVENT AND EVENT_FAMILY.ID_FAM = FAMILY.ID) LIMIT 5000;

"INSERT INTO" +
                   "event (EventName,Date,PreEvent) " +
                   "VALUES (@EventName,@Date,@PreEvent)"; /// Donde @EventName, @Date, @PreEvent son valores ingresados por el usuario del programa

"UPDATE user SET " +
                "EventName = @EventName," +
                "Date = @Date," +
                "PreEvent = @PreEvent," +
                 "WHERE ID = @ID"; /// Donde @ID, @Date son valores ingresados por el usuario del programa
"SELECT * FROM event"
"SELECT * FROM asoc"