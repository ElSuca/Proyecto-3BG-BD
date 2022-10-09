DROP DATABASE IF EXISTS OLYMPUS;
CREATE DATABASE OLYMPUS CHARSET utf8mb4;
USE OLYMPUS;

CREATE TABLE USER (
	ID INT(8) UNSIGNED AUTO_INCREMENT ,
    NAME VARCHAR(20),
    LNAME1 VARCHAR(20),
    LNAME2 VARCHAR(20),
    EMAIL VARCHAR(50) NOT NULL,
    UNAME VARCHAR(50) NOT NULL UNIQUE,
    PASS VARCHAR(100) NOT NULL,
    ROLE VARCHAR(50) NOT NULL,
    CITY VARCHAR(50),
    STREET VARCHAR(50),
    NUM INT(6),
    STATE VARCHAR(50),
    COUNTRY VARCHAR(50),
    PRIMARY KEY (ID));

CREATE TABLE MANAGER (
	ID INT(8) UNSIGNED auto_increment,
    NAME VARCHAR(20) NOT NULL,
    LNAME1 VARCHAR(20) NOT NULL,
    LNAME2 VARCHAR(20),
    BIRTHDATE VARCHAR(120),
    STATUS VARCHAR(20),
    NUM INT(6),
    STATE VARCHAR(50),
    COUNTRY VARCHAR(50),
    primary key(ID));
    
CREATE TABLE ASOC (
	ID INT(8) UNSIGNED auto_increment,
    NAME VARCHAR(50),
    STATUS VARCHAR(20),
    CITY VARCHAR(50),
    STREET VARCHAR(50),
    NUM INT(6),
    STATE VARCHAR(50),
    COUNTRY VARCHAR(50),
    primary key(ID));
    
CREATE TABLE PLAYER(
	ID INT(8) UNSIGNED auto_increment,
    NAME VARCHAR(60),
    LNAME1 VARCHAR(60),
    LNAME2 VARCHAR(60),
    STATUS VARCHAR(20),
    BIRTHDATE VARCHAR(120),
    CITY VARCHAR(50),
    STATE VARCHAR(50),
    COUNTRY VARCHAR(50),
	primary key(ID));
    
CREATE TABLE TEAM(
	ID INT(8) UNSIGNED auto_increment,
    NAME VARCHAR(60),
    CITY VARCHAR(50),
    STATE VARCHAR(50),
    COUNTRY VARCHAR(50),
    primary key(ID));
    
CREATE TABLE AD(
	ID INT(8) UNSIGNED auto_increment,
    NAME VARCHAR(60),
    CAT VARCHAR(40) NOT NULL,
    PATH VARCHAR(150) NOT NULL,
    primary key(ID));

CREATE TABLE EVENT(
	ID INT(8) UNSIGNED auto_increment,
    NAME VARCHAR(50),
	DATE VARCHAR(100) NOT NULL,
    CITY VARCHAR(50),
    STREET VARCHAR(50),
    NUM INT(6),
    STATE VARCHAR(50),
    COUNTRY VARCHAR(50)
    primary key(ID)
    );
    
CREATE TABLE FAMILY(
	ID INT(8) UNSIGNED auto_increment,
    NAME VARCHAR(60) NOT NULL,
    RECURRENCY VARCHAR(20),
    DOMAIN VARCHAR(20),
    TYPE VARCHAR(60),
    primary key(ID));
    
CREATE TABLE SPORT(
	ID INT(8) UNSIGNED auto_increment,
    NAME VARCHAR(60) NOT NULL,
    primary key(ID));

CREATE TABLE TIME (
    ID INT(8) UNSIGNED auto_increment,
    ID_EVENT INT(8) UNSIGNED,
    NUM INT(2) UNSIGNED,
    DESCR VARCHAR(150),
    primary key(ID),
    foreign key(ID_EVENT) REFERENCES EVENT(ID));


CREATE TABLE ACTION(
	ID INT(8) UNSIGNED auto_increment,
    ID_TM INT(8) UNSIGNED,
    ID_TI INT(8) UNSIGNED,
    ID_PLYR INT(8) UNSIGNED,
    QUANTITY INT(3) UNSIGNED NOT NULL,
    TYPE VARCHAR(40) NOT NULL,
    CONTEXT VARCHAR(200),
    CAT VARCHAR(30) NOT NULL,
    PRIMARY KEY(ID),
    FOREIGN KEY(ID_TM) REFERENCES TEAM(ID),
    FOREIGN KEY(ID_TI) REFERENCES TIME(ID),
    FOREIGN KEY(ID_PLYR) REFERENCES PLAYER(ID),
);
CREATE TABLE JUDGE (
	ID INT(8) UNSIGNED auto_increment,
    NAME VARCHAR(60) NOT NULL,
    LNAME1 VARCHAR(60) NOT NULL,
    LNAME2 VARCHAR(60),
    primary key(ID));
    
CREATE TABLE PHONES(
	ID_USER INT(8) UNSIGNED,
	NUM VARCHAR(40) ,
    PRIMARY KEY(ID_USER, NUM),
    FOREIGN KEY(ID_USER) REFERENCES USER(ID));
    
CREATE TABLE PAYMENT(
	ID_USER INT(8) UNSIGNED,
    NUM VARCHAR(20) NOT NULL ,
    SECNUM INT(5) NOT NULL,
    VENC VARCHAR(100),
    PRIMARY KEY (ID_USER),
    FOREIGN KEY (ID_USER) REFERENCES USER(ID));
    
CREATE TABLE USER_SUB_MANA(
	ID_MANA INT(8) UNSIGNED,
    ID_USER INT(8) UNSIGNED,
    PRIMARY KEY (ID_MANA, ID_USER),
    FOREIGN KEY (ID_MANA) REFERENCES MANAGER(ID),
    FOREIGN KEY (ID_USER) REFERENCES USER(ID));
    
CREATE TABLE USER_SUB_ASOC(
	ID_ASOC INT(8) UNSIGNED,
    ID_USER INT(8) UNSIGNED,
    PRIMARY KEY (ID_ASOC, ID_USER),
    FOREIGN KEY (ID_ASOC) REFERENCES ASOC(ID),
    FOREIGN KEY (ID_USER) REFERENCES USER(ID));

CREATE TABLE USER_SUB_PLYR(
	ID_PLYR INT(8) UNSIGNED,
    ID_USER INT(8) UNSIGNED,
    PRIMARY KEY (ID_PLYR, ID_USER),
    FOREIGN KEY (ID_PLYR) REFERENCES PLAYER(ID),
    FOREIGN KEY (ID_USER) REFERENCES USER(ID));

CREATE TABLE USER_SUB_FAM(
	ID_FAM INT(8) UNSIGNED,
    ID_USER INT(8) UNSIGNED,
    PRIMARY KEY (ID_FAM, ID_USER),
    FOREIGN KEY (ID_FAM) REFERENCES FAMILY(ID),
    FOREIGN KEY (ID_USER) REFERENCES USER(ID));

CREATE TABLE USER_SUB_SPO(
	ID_SPO INT(8) UNSIGNED,
    ID_USER INT(8) UNSIGNED,
    PRIMARY KEY (ID_SPO, ID_USER),
    FOREIGN KEY (ID_SPO) REFERENCES SPORT(ID),
    FOREIGN KEY (ID_USER) REFERENCES USER(ID));
    
CREATE TABLE TMTI(
	ID_TEAM INT(8) UNSIGNED,
    ID_TIME INT(8) UNSIGNED,
    SIDE VARCHAR(60),
    PRIMARY KEY (ID_TEAM, ID_TIME, SIDE),
    FOREIGN KEY (ID_TEAM) REFERENCES TEAM(ID),
    FOREIGN KEY (ID_TIME) REFERENCES TIME(ID));
    
CREATE TABLE EVENT_FAMILY(
	ID_FAM INT(8) UNSIGNED,
    ID_EVENT INT(8) UNSIGNED,
    PRIMARY KEY (ID_FAM, ID_EVENT),
    FOREIGN KEY (ID_FAM) REFERENCES FAMILY(ID),
    FOREIGN KEY (ID_EVENT) REFERENCES EVENT(ID));
    
CREATE TABLE PLYR_TM(
	ID_PLYR INT(8) UNSIGNED,
    ID_TEAM INT(8) UNSIGNED,
    ROLE VARCHAR(20),
    PRIMARY KEY (ID_PLYR, ID_TEAM, ROLE),
    FOREIGN KEY (ID_TEAM) REFERENCES TEAM(ID),
    FOREIGN KEY (ID_PLYR) REFERENCES PLAYER(ID));
    
CREATE TABLE TM_ASOC(
	ID_TEAM INT(8) UNSIGNED,
    ID_ASOC INT(8) UNSIGNED,
    PRIMARY KEY (ID_TEAM, ID_ASOC),
    FOREIGN KEY (ID_TEAM) REFERENCES TEAM(ID),
    FOREIGN KEY (ID_ASOC) REFERENCES ASOC(ID));
    
CREATE TABLE TM_SPO(
	ID_TEAM INT(8) UNSIGNED,
    ID_SPO INT(8) UNSIGNED,
    PRIMARY KEY (ID_TEAM, ID_SPO),
    FOREIGN KEY (ID_TEAM) REFERENCES TEAM(ID),
    FOREIGN KEY (ID_SPO) REFERENCES SPORT(ID));
    
CREATE TABLE EVENT_SPO(
	ID_EVENT INT(8) UNSIGNED,
    ID_SPO INT(8) UNSIGNED,
    PRIMARY KEY (ID_EVENT, ID_SPO),
    FOREIGN KEY (ID_EVENT) REFERENCES EVENT(ID),
    FOREIGN KEY (ID_SPO) REFERENCES SPORT(ID));
    
CREATE TABLE PLAYER_SPO(
	ID_PLYR INT(8) UNSIGNED,
    ID_SPO INT(8) UNSIGNED,
    PRIMARY KEY (ID_PLYR, ID_SPO),
    FOREIGN KEY (ID_PLYR) REFERENCES PLAYER(ID),
    FOREIGN KEY (ID_SPO) REFERENCES SPORT(ID));
    
CREATE TABLE ASOC_SPO(
	ID_ASOC INT(8) UNSIGNED,
    ID_SPO INT(8) UNSIGNED,
    PRIMARY KEY (ID_ASOC, ID_SPO),
    FOREIGN KEY (ID_ASOC) REFERENCES ASOC(ID),
    FOREIGN KEY (ID_SPO) REFERENCES SPORT(ID));
    
CREATE TABLE MANA_SPO(
	ID_MANA INT(8) UNSIGNED,
    ID_SPO INT(8) UNSIGNED,
    PRIMARY KEY (ID_MANA, ID_SPO),
    FOREIGN KEY (ID_MANA) REFERENCES MANAGER(ID),
    FOREIGN KEY (ID_SPO) REFERENCES SPORT(ID));
    
CREATE TABLE ASOC_PLYR(
	ID_ASOC INT(8) UNSIGNED,
    ID_PLYR INT(8) UNSIGNED,
    STARTDATE VARCHAR(150) NOT NULL,
    ENDDATE VARCHAR(150),
    PRIMARY KEY (ID_ASOC, ID_PLYR),
    FOREIGN KEY (ID_ASOC) REFERENCES ASOC(ID),
    FOREIGN KEY (ID_PLYR) REFERENCES PLAYER(ID));
    
CREATE TABLE MANA_PLYR(
	ID_MANA INT(8) UNSIGNED,
    ID_PLYR INT(8) UNSIGNED,
    PRIMARY KEY (ID_MANA, ID_PLYR),
    FOREIGN KEY (ID_MANA) REFERENCES MANAGER(ID),
    FOREIGN KEY (ID_PLYR) REFERENCES PLAYER(ID));
    
CREATE TABLE MANA_TEAM(
	ID_MANA INT(8) UNSIGNED,
    ID_TEAM INT(8) UNSIGNED,
    PRIMARY KEY (ID_MANA, ID_TEAM),
    FOREIGN KEY (ID_MANA) REFERENCES MANAGER(ID),
    FOREIGN KEY (ID_TEAM) REFERENCES TEAM(ID));
    
CREATE TABLE ASOC_STATUS(
    ID_ASOC INT(8) UNSIGNED,
    STARTDATE DATE ,
    ENDDATE DATE,
    SPORT INT(8) UNSIGNED,
    CAT VARCHAR(50) NOT NULL,
    QUANTITY INT(4) NOT NULL,
    PRIMARY KEY (ID_ASOC, STARTDATE, SPORT)
    FOREIGN KEY (ID_ASOC) REFERENCES ASOC(ID),
    FOREIGN KEY (SPORT) REFERENCES SPORT(ID)
	);
    
CREATE TABLE MANA_ASOC(
	ID_MANA INT(8) UNSIGNED,
    ID_ASOC INT(8) UNSIGNED,
    STARTDATE VARCHAR(100),
    ENDDATE VARCHAR(100),
    PRIMARY KEY (ID_MANA, ID_ASOC),
    FOREIGN KEY (ID_MANA) REFERENCES MANAGER(ID),
    FOREIGN KEY (ID_ASOC) REFERENCES ASOC(ID));

CREATE TABLE T_SPO(
	ID_SP INT(8) UNSIGNED,
	TYPE VARCHAR(20) ,
    PRIMARY KEY(ID_SP, TYPE),
    FOREIGN KEY(ID_SP) REFERENCES SPORT(ID));
    
CREATE TABLE JUD_FOUL(
	ID_JUD INT(8) UNSIGNED,
    ID_FL INT(8) UNSIGNED,
    PRIMARY KEY (ID_JUD, ID_FL),
    FOREIGN KEY (ID_JUD) REFERENCES JUDGE(ID),
    FOREIGN KEY (ID_FL) REFERENCES FOULS(ID));
