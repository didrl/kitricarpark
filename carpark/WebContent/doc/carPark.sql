--------------------------------------------------------
--  File created - �ݿ���-6��-17-2016   
--------------------------------------------------------
  DROP TABLE "AVGPOINT" cascade constraints;
  DROP TABLE "BOARD" cascade constraints;
  DROP TABLE "BOARDTYPE" cascade constraints;
  DROP TABLE "CALL" cascade constraints;
  DROP TABLE "CAR_INFO" cascade constraints;
  DROP TABLE "CITIES" cascade constraints;
  DROP TABLE "COIN" cascade constraints;
  DROP TABLE "EVALUATION" cascade constraints;
  DROP TABLE "FAQ" cascade constraints;
  DROP TABLE "FAVORITE" cascade constraints;
  DROP TABLE "GRADE" cascade constraints;
  DROP TABLE "MEMBER" cascade constraints;
  DROP TABLE "MEMBER_CAR" cascade constraints;
  DROP TABLE "MESSAGE" cascade constraints;
  DROP TABLE "PARKING" cascade constraints;
  DROP TABLE "PARKING_DETAIL" cascade constraints;
  DROP TABLE "PENALTY" cascade constraints;
  DROP TABLE "PICTURE" cascade constraints;
  DROP TABLE "REPORT" cascade constraints;
  DROP TABLE "RESERVATION" cascade constraints;
  DROP TABLE "REVIEW" cascade constraints;
  DROP TABLE "ZIPCODE" cascade constraints;
  DROP SEQUENCE "BOARD_NUM_SEQ";
  DROP SEQUENCE "BOARD_SEQ";
  DROP SEQUENCE "CALL_NUM_PCSEQ";
  DROP SEQUENCE "COIN_NUM_SEQ";
  DROP SEQUENCE "MESSAGE_NUM_MSEQ";
  DROP SEQUENCE "PIC_SEQ";
  DROP SEQUENCE "REPORT_NUM_CSEQ";
  DROP SEQUENCE "REVIEW_NUM_RSEQ";
--------------------------------------------------------
--  DDL for Sequence BOARD_NUM_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "BOARD_NUM_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 181 CACHE 20 NOORDER  NOCYCLE;
--------------------------------------------------------
--  DDL for Sequence BOARD_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "BOARD_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 761 CACHE 20 NOORDER  NOCYCLE;
--------------------------------------------------------
--  DDL for Sequence CALL_NUM_PCSEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CALL_NUM_PCSEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 321 CACHE 20 NOORDER  NOCYCLE;
--------------------------------------------------------
--  DDL for Sequence COIN_NUM_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "COIN_NUM_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 141 CACHE 20 NOORDER  NOCYCLE;
--------------------------------------------------------
--  DDL for Sequence MESSAGE_NUM_MSEQ
--------------------------------------------------------

   CREATE SEQUENCE  "MESSAGE_NUM_MSEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 281 CACHE 20 NOORDER  NOCYCLE;
--------------------------------------------------------
--  DDL for Sequence PIC_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIC_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE;
--------------------------------------------------------
--  DDL for Sequence REPORT_NUM_CSEQ
--------------------------------------------------------

   CREATE SEQUENCE  "REPORT_NUM_CSEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 61 CACHE 20 NOORDER  NOCYCLE;
--------------------------------------------------------
--  DDL for Sequence REVIEW_NUM_RSEQ
--------------------------------------------------------

   CREATE SEQUENCE  "REVIEW_NUM_RSEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 201 CACHE 20 NOORDER  NOCYCLE;
--------------------------------------------------------
--  DDL for Table AVGPOINT
--------------------------------------------------------

  CREATE TABLE "AVGPOINT" ("RSEQ" NUMBER, "SEQ" NUMBER, "PARK_ID" NUMBER, "AVGPOINT" NUMBER);
--------------------------------------------------------
--  DDL for Table BOARD
--------------------------------------------------------

  CREATE TABLE "BOARD" ("SEQ" NUMBER, "BCODE" NUMBER, "USER_ID" VARCHAR2(16), "SUBJECT" VARCHAR2(100), "CONTENTS" VARCHAR2(1000), "LOGTIME" DATE, "PHOTO_KEY" VARCHAR2(100));
--------------------------------------------------------
--  DDL for Table BOARDTYPE
--------------------------------------------------------

  CREATE TABLE "BOARDTYPE" ("BCODE" NUMBER, "BNAME" VARCHAR2(20));
--------------------------------------------------------
--  DDL for Table CALL
--------------------------------------------------------

  CREATE TABLE "CALL" ("PCALL_ID" NUMBER, "PCSEQ" NUMBER, "PCALL_ADDR" VARCHAR2(100), "PCALL_IMG" VARCHAR2(100), "PCALL_FLAG" NUMBER, "PCALL_NUM" NUMBER, "PCALL_OK" NUMBER DEFAULT 0, "pcall_latitude" NUMBER, "pcall_longtitude" NUMBER);
--------------------------------------------------------
--  DDL for Table CAR_INFO
--------------------------------------------------------

  CREATE TABLE "CAR_INFO" ("CAR_ID" VARCHAR2(20), "MAKER" VARCHAR2(20), "MODEL" VARCHAR2(20));
--------------------------------------------------------
--  DDL for Table CITIES
--------------------------------------------------------

  CREATE TABLE "CITIES" ("SGG_CODE" NUMBER, "EMD_CODE" NUMBER, "SGG_NAME" VARCHAR2(20), "EMD_NAME" VARCHAR2(20), "LAT" NUMBER, "LNG" NUMBER);
--------------------------------------------------------
--  DDL for Table COIN
--------------------------------------------------------

  CREATE TABLE "COIN" ("USER_ID" VARCHAR2(16), "CDATE" DATE, "COIN" NUMBER, "CFLAG" NUMBER, "CID" NUMBER, "RESER_ID" NUMBER);
--------------------------------------------------------
--  DDL for Table EVALUATION
--------------------------------------------------------

  CREATE TABLE "EVALUATION" ("PENALTY_CODE" NUMBER, "PENALTY_NAME" VARCHAR2(100), "PENALTY_CONTENT" VARCHAR2(100), "PENALTY_POINT" NUMBER);
--------------------------------------------------------
--  DDL for Table FAQ
--------------------------------------------------------

  CREATE TABLE "FAQ" ("FSEQ" NUMBER, "SUBJECT" VARCHAR2(100), "CONTET" CLOB);
--------------------------------------------------------
--  DDL for Table FAVORITE
--------------------------------------------------------

  CREATE TABLE "FAVORITE" ("PARK_ID" NUMBER, "USER_ID" VARCHAR2(16));
--------------------------------------------------------
--  DDL for Table GRADE
--------------------------------------------------------

  CREATE TABLE "GRADE" ("GRADE_ID" NUMBER, "GRADE_NAME" VARCHAR2(20), "AVGPOINT" NUMBER DEFAULT 0, "BENEFIT" NUMBER DEFAULT 0, "PENALTY" NUMBER DEFAULT 0);
--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

  CREATE TABLE "MEMBER" ("USER_ID" VARCHAR2(16), "USER_PASS" VARCHAR2(20), "GRADE_ID" NUMBER DEFAULT 3, "LOGIN_KEY" VARCHAR2(50), "HOST_FLAG" NUMBER DEFAULT 0, "COIN" NUMBER DEFAULT 0, "USER_AVGPOINT" NUMBER DEFAULT 0, "PENALTY" NUMBER DEFAULT 0, "USER_FLAG" NUMBER DEFAULT 0, "USER_NAME" VARCHAR2(40), "EMAIL" VARCHAR2(100), "TEL" NUMBER, "PROFILE_IMAGE" VARCHAR2(100), "LOGTIME" DATE) ;

--------------------------------------------------------
--  DDL for Table MEMBER_CAR
--------------------------------------------------------

  CREATE TABLE "MEMBER_CAR" ("CATEGORY" VARCHAR2(10), "REG_NUM" VARCHAR2(14), "CAR_ID" VARCHAR2(20), "USER_ID" VARCHAR2(16), "CAR_NAME" VARCHAR2(100));
--------------------------------------------------------
--  DDL for Table MESSAGE
--------------------------------------------------------

  CREATE TABLE "MESSAGE" ("MSEQ" NUMBER, "SEQ" NUMBER, "RECEIVER_ID" VARCHAR2(16), "MSG_FLAG" NUMBER DEFAULT 0, "DELETE_SEND" NUMBER, "DELETE_RECEI" NUMBER);
--------------------------------------------------------
--  DDL for Table PARKING
--------------------------------------------------------

  CREATE TABLE "PARKING" ("PARK_ID" NUMBER, "PARK_NAME" VARCHAR2(100), "PARK_CAPACITY" NUMBER, "OWNER_ID" VARCHAR2(16), "LATITUDE" NUMBER, "LONGITUDE" NUMBER, "PARK_TYPE" VARCHAR2(6), "EMD_CODE" NUMBER, "CONTENT" VARCHAR2(400), "DETAIL_ADDR" VARCHAR2(100), "PARK_PUBLIC" NUMBER);
--------------------------------------------------------
--  DDL for Table PARKING_DETAIL
--------------------------------------------------------

  CREATE TABLE "PARKING_DETAIL" ("PARK_ID" NUMBER, "PARK_FLAG" NUMBER DEFAULT 1, "PARK_AVGPOINT" NUMBER DEFAULT 0, "GET_STATUS" NUMBER, "CUR_PARKING" NUMBER, "PAY_YN" VARCHAR2(4), "SATUR_PAY_YN" VARCHAR2(4), "HOLI_PAY_YN" VARCHAR2(4), "FULLTIME_MONTHLY_PAY" NUMBER, "PARK_RATE" NUMBER, "PARK_TIME_RATE" NUMBER, "ADD_PARK_RATE" NUMBER, "DAY_MAX_PAY" NUMBER, "PARK_VISIT" NUMBER, "FACILITY" VARCHAR2(100));
--------------------------------------------------------
--  DDL for Table PENALTY
--------------------------------------------------------

  CREATE TABLE "PENALTY" ("PENALTY_NUM" NUMBER, "USER_ID" VARCHAR2(20), "PENALTY_CODE" NUMBER, "PENALTY_DATE" DATE, "PENALTY_MEMO" VARCHAR2(100), "SEQ" NUMBER);
--------------------------------------------------------
--  DDL for Table PICTURE
--------------------------------------------------------

  CREATE TABLE "PICTURE" ("PIC_SEQ" NUMBER, "PIC_NAME" VARCHAR2(100), "PIC_PATH" VARCHAR2(1000), "PIC_SAVEFOLDER" VARCHAR2(100), "PARK_ID" NUMBER, "USER_ID" VARCHAR2(16), "SEQ" NUMBER);
--------------------------------------------------------
--  DDL for Table REPORT
--------------------------------------------------------

  CREATE TABLE "REPORT" ("SEQ" NUMBER, "CSEQ" NUMBER, "PARK_ID" NUMBER, "USER_ID" VARCHAR2(16), "REPORT_FLAG" NUMBER(1,0));
--------------------------------------------------------
--  DDL for Table RESERVATION
--------------------------------------------------------

  CREATE TABLE "RESERVATION" ("RESER_ID" NUMBER, "PARK_ID" NUMBER, "USER_ID" VARCHAR2(16), "START_DATE" DATE, "END_DATE" DATE, "PAY" NUMBER, "RDATE" DATE);
--------------------------------------------------------
--  DDL for Table REVIEW
--------------------------------------------------------

  CREATE TABLE "REVIEW" ("RSEQ" NUMBER, "SEQ" NUMBER, "AVAL_CODE" NUMBER, "GET_POINT" NUMBER, "AVALED_ID" VARCHAR2(16), "HOST_FLAG" NUMBER DEFAULT 0);
--------------------------------------------------------
--  DDL for Table ZIPCODE
--------------------------------------------------------

  CREATE TABLE "ZIPCODE" ("CODE" NUMBER, "SIDO" VARCHAR2(100), "GUGUN" VARCHAR2(100), "STREET" VARCHAR2(200));

---------------------------------------------------
--   DATA FOR TABLE AVGPOINT
--   FILTER = none used
---------------------------------------------------
REM INSERTING into AVGPOINT
Insert into AVGPOINT (RSEQ,SEQ,PARK_ID,AVGPOINT) values (65,45,1371666,3.5);
Insert into AVGPOINT (RSEQ,SEQ,PARK_ID,AVGPOINT) values (103,83,781512,4);
Insert into AVGPOINT (RSEQ,SEQ,PARK_ID,AVGPOINT) values (123,103,1371306,1.5);
Insert into AVGPOINT (RSEQ,SEQ,PARK_ID,AVGPOINT) values (162,142,1371306,4);
Insert into AVGPOINT (RSEQ,SEQ,PARK_ID,AVGPOINT) values (163,143,1371306,4.25);
Insert into AVGPOINT (RSEQ,SEQ,PARK_ID,AVGPOINT) values (164,144,173578,5);
Insert into AVGPOINT (RSEQ,SEQ,PARK_ID,AVGPOINT) values (167,147,130531,3.5);
Insert into AVGPOINT (RSEQ,SEQ,PARK_ID,AVGPOINT) values (168,148,173333,3.5);
Insert into AVGPOINT (RSEQ,SEQ,PARK_ID,AVGPOINT) values (169,149,130531,4);
Insert into AVGPOINT (RSEQ,SEQ,PARK_ID,AVGPOINT) values (181,161,173359,4);
Insert into AVGPOINT (RSEQ,SEQ,PARK_ID,AVGPOINT) values (42,25,173530,4);
Insert into AVGPOINT (RSEQ,SEQ,PARK_ID,AVGPOINT) values (66,46,1367666,3.5);
Insert into AVGPOINT (RSEQ,SEQ,PARK_ID,AVGPOINT) values (67,47,1367666,3.5);
Insert into AVGPOINT (RSEQ,SEQ,PARK_ID,AVGPOINT) values (68,48,1367666,4);
Insert into AVGPOINT (RSEQ,SEQ,PARK_ID,AVGPOINT) values (104,84,1042405,2.5);
Insert into AVGPOINT (RSEQ,SEQ,PARK_ID,AVGPOINT) values (141,121,1366394,4);
Insert into AVGPOINT (RSEQ,SEQ,PARK_ID,AVGPOINT) values (161,141,1371306,5);
Insert into AVGPOINT (RSEQ,SEQ,PARK_ID,AVGPOINT) values (170,150,135938,3.5);
Insert into AVGPOINT (RSEQ,SEQ,PARK_ID,AVGPOINT) values (171,151,135938,3);
Insert into AVGPOINT (RSEQ,SEQ,PARK_ID,AVGPOINT) values (172,152,173591,4);
Insert into AVGPOINT (RSEQ,SEQ,PARK_ID,AVGPOINT) values (30,13,173530,5);
Insert into AVGPOINT (RSEQ,SEQ,PARK_ID,AVGPOINT) values (31,14,111804,4);
Insert into AVGPOINT (RSEQ,SEQ,PARK_ID,AVGPOINT) values (32,15,173530,4);
Insert into AVGPOINT (RSEQ,SEQ,PARK_ID,AVGPOINT) values (33,16,173530,4);
Insert into AVGPOINT (RSEQ,SEQ,PARK_ID,AVGPOINT) values (34,17,173530,4);
Insert into AVGPOINT (RSEQ,SEQ,PARK_ID,AVGPOINT) values (35,18,173530,5);
Insert into AVGPOINT (RSEQ,SEQ,PARK_ID,AVGPOINT) values (36,19,173530,5);
Insert into AVGPOINT (RSEQ,SEQ,PARK_ID,AVGPOINT) values (37,20,173530,4);
Insert into AVGPOINT (RSEQ,SEQ,PARK_ID,AVGPOINT) values (39,22,173530,5);
Insert into AVGPOINT (RSEQ,SEQ,PARK_ID,AVGPOINT) values (40,23,173530,5);
Insert into AVGPOINT (RSEQ,SEQ,PARK_ID,AVGPOINT) values (41,24,173530,5);
Insert into AVGPOINT (RSEQ,SEQ,PARK_ID,AVGPOINT) values (61,41,173530,5);
Insert into AVGPOINT (RSEQ,SEQ,PARK_ID,AVGPOINT) values (62,42,173530,4);
Insert into AVGPOINT (RSEQ,SEQ,PARK_ID,AVGPOINT) values (63,43,173530,4);
Insert into AVGPOINT (RSEQ,SEQ,PARK_ID,AVGPOINT) values (64,44,173530,4);
Insert into AVGPOINT (RSEQ,SEQ,PARK_ID,AVGPOINT) values (101,81,1371666,3);
Insert into AVGPOINT (RSEQ,SEQ,PARK_ID,AVGPOINT) values (102,82,1371666,3.5);
Insert into AVGPOINT (RSEQ,SEQ,PARK_ID,AVGPOINT) values (108,88,1366794,3);
Insert into AVGPOINT (RSEQ,SEQ,PARK_ID,AVGPOINT) values (109,89,173691,4);
Insert into AVGPOINT (RSEQ,SEQ,PARK_ID,AVGPOINT) values (121,101,173468,3);
Insert into AVGPOINT (RSEQ,SEQ,PARK_ID,AVGPOINT) values (122,102,173468,3);
Insert into AVGPOINT (RSEQ,SEQ,PARK_ID,AVGPOINT) values (166,146,111804,4.5);
Insert into AVGPOINT (RSEQ,SEQ,PARK_ID,AVGPOINT) values (173,153,173591,3.5);
Insert into AVGPOINT (RSEQ,SEQ,PARK_ID,AVGPOINT) values (174,154,173440,3);
Insert into AVGPOINT (RSEQ,SEQ,PARK_ID,AVGPOINT) values (81,61,1371666,3.5);
Insert into AVGPOINT (RSEQ,SEQ,PARK_ID,AVGPOINT) values (165,145,173329,3);
Insert into AVGPOINT (RSEQ,SEQ,PARK_ID,AVGPOINT) values (105,85,173447,4);
Insert into AVGPOINT (RSEQ,SEQ,PARK_ID,AVGPOINT) values (106,86,173359,3);
Insert into AVGPOINT (RSEQ,SEQ,PARK_ID,AVGPOINT) values (107,87,173359,3);

---------------------------------------------------
--   END DATA FOR TABLE AVGPOINT
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MEMBER_CAR
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MEMBER_CAR
Insert into MEMBER_CAR (CATEGORY,REG_NUM,CAR_ID,USER_ID,CAR_NAME) values ('����','44��4444','sm_001','IUGuest','MyCar');
Insert into MEMBER_CAR (CATEGORY,REG_NUM,CAR_ID,USER_ID,CAR_NAME) values ('����','88��8888','md_004','IUGuest','MyCar');
Insert into MEMBER_CAR (CATEGORY,REG_NUM,CAR_ID,USER_ID,CAR_NAME) values ('����','55��5959','bg_003','SZGuest','MyCar');
Insert into MEMBER_CAR (CATEGORY,REG_NUM,CAR_ID,USER_ID,CAR_NAME) values ('ȭ��','88��2288','tr_004','SZGuest','MyCar');
Insert into MEMBER_CAR (CATEGORY,REG_NUM,CAR_ID,USER_ID,CAR_NAME) values ('����','94��4944','bg_003','GdGuest','MyCar');
Insert into MEMBER_CAR (CATEGORY,REG_NUM,CAR_ID,USER_ID,CAR_NAME) values ('����','11��8888','bg_004','GdGuest','MyCar');
Insert into MEMBER_CAR (CATEGORY,REG_NUM,CAR_ID,USER_ID,CAR_NAME) values ('����','77��5559','sm_003','TopGuest','MyCar');
Insert into MEMBER_CAR (CATEGORY,REG_NUM,CAR_ID,USER_ID,CAR_NAME) values ('Ư��','88��2988','sp_001','TopGuest','MyCar');
Insert into MEMBER_CAR (CATEGORY,REG_NUM,CAR_ID,USER_ID,CAR_NAME) values ('����','31��2393',null,'SZGuest','�ų���');
Insert into MEMBER_CAR (CATEGORY,REG_NUM,CAR_ID,USER_ID,CAR_NAME) values ('����','99��9999',null,'IUGuest','��ѱ�');
Insert into MEMBER_CAR (CATEGORY,REG_NUM,CAR_ID,USER_ID,CAR_NAME) values ('����','99��9988',null,'IUGuest','���ģ��');
Insert into MEMBER_CAR (CATEGORY,REG_NUM,CAR_ID,USER_ID,CAR_NAME) values ('����','������',null,'IUGuest','������');
Insert into MEMBER_CAR (CATEGORY,REG_NUM,CAR_ID,USER_ID,CAR_NAME) values ('����','78��7878',null,'��ġȸ','������ĥ����');
Insert into MEMBER_CAR (CATEGORY,REG_NUM,CAR_ID,USER_ID,CAR_NAME) values ('����','09��0909',null,'IUGuest','����������');
Insert into MEMBER_CAR (CATEGORY,REG_NUM,CAR_ID,USER_ID,CAR_NAME) values ('����','22��2323',null,'suk','EE����');
Insert into MEMBER_CAR (CATEGORY,REG_NUM,CAR_ID,USER_ID,CAR_NAME) values ('����','10��1918',null,'SZGuest','����ȭ����');
Insert into MEMBER_CAR (CATEGORY,REG_NUM,CAR_ID,USER_ID,CAR_NAME) values ('����','10��1919',null,'SZGuest','��ġ�����');
Insert into MEMBER_CAR (CATEGORY,REG_NUM,CAR_ID,USER_ID,CAR_NAME) values ('����','11��9999',null,'��','������');
Insert into MEMBER_CAR (CATEGORY,REG_NUM,CAR_ID,USER_ID,CAR_NAME) values ('����','99��9999',null,'IUGuest','���³�');
Insert into MEMBER_CAR (CATEGORY,REG_NUM,CAR_ID,USER_ID,CAR_NAME) values ('����','98��8989',null,'��','�����»�����');
Insert into MEMBER_CAR (CATEGORY,REG_NUM,CAR_ID,USER_ID,CAR_NAME) values ('����','12��1212',null,'��','�����»�����');
Insert into MEMBER_CAR (CATEGORY,REG_NUM,CAR_ID,USER_ID,CAR_NAME) values ('����','44��4444',null,'��','������������');
Insert into MEMBER_CAR (CATEGORY,REG_NUM,CAR_ID,USER_ID,CAR_NAME) values ('����','88��8888',null,'�ų�������','������ģ��');
Insert into MEMBER_CAR (CATEGORY,REG_NUM,CAR_ID,USER_ID,CAR_NAME) values ('����','11��9999',null,'SZGuest','��ѱ�');
Insert into MEMBER_CAR (CATEGORY,REG_NUM,CAR_ID,USER_ID,CAR_NAME) values ('����','31��2323',null,'SZGuest','����ū����');
Insert into MEMBER_CAR (CATEGORY,REG_NUM,CAR_ID,USER_ID,CAR_NAME) values ('Ư��','19��1919',null,'Jennifer200','Ư��Ư����');

---------------------------------------------------
--   END DATA FOR TABLE MEMBER_CAR
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE EVALUATION
--   FILTER = none used
---------------------------------------------------
REM INSERTING into EVALUATION
Insert into EVALUATION (PENALTY_CODE,PENALTY_NAME,PENALTY_CONTENT,PENALTY_POINT) values (10,'��ģ��','��ģ���� ���� ��� ��',1);
Insert into EVALUATION (PENALTY_CODE,PENALTY_NAME,PENALTY_CONTENT,PENALTY_POINT) values (20,'�弳','�弳�� ���� ��� ��',3);
Insert into EVALUATION (PENALTY_CODE,PENALTY_NAME,PENALTY_CONTENT,PENALTY_POINT) values (30,'�������','������ݿ� ���� ��� ��',5);
Insert into EVALUATION (PENALTY_CODE,PENALTY_NAME,PENALTY_CONTENT,PENALTY_POINT) values (40,'���','��⿡ ���� ��� ��',10);

---------------------------------------------------
--   END DATA FOR TABLE EVALUATION
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE REPORT
--   FILTER = none used
---------------------------------------------------
REM INSERTING into REPORT
Insert into REPORT (SEQ,CSEQ,PARK_ID,USER_ID,REPORT_FLAG) values (619,191,1366394,'PublicPark',0);
Insert into REPORT (SEQ,CSEQ,PARK_ID,USER_ID,REPORT_FLAG) values (630,201,1371306,'PublicPark',1);
Insert into REPORT (SEQ,CSEQ,PARK_ID,USER_ID,REPORT_FLAG) values (621,193,173468,'PublicPark',1);
Insert into REPORT (SEQ,CSEQ,PARK_ID,USER_ID,REPORT_FLAG) values (620,192,173139,'PublicPark',0);

---------------------------------------------------
--   END DATA FOR TABLE REPORT
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE CALL
--   FILTER = none used
---------------------------------------------------
REM INSERTING into CALL
Insert into CALL (PCALL_ID,PCSEQ,PCALL_ADDR,PCALL_IMG,PCALL_FLAG,PCALL_NUM,PCALL_OK,"pcall_latitude","pcall_longtitude") values (521,186,'���� ������ õȣ1�� 106-(8)',null,0,null,1,null,null);
Insert into CALL (PCALL_ID,PCSEQ,PCALL_ADDR,PCALL_IMG,PCALL_FLAG,PCALL_NUM,PCALL_OK,"pcall_latitude","pcall_longtitude") values (524,189,'���� ������ ������  ',null,0,null,0,null,null);
Insert into CALL (PCALL_ID,PCSEQ,PCALL_ADDR,PCALL_IMG,PCALL_FLAG,PCALL_NUM,PCALL_OK,"pcall_latitude","pcall_longtitude") values (685,271,'����Ư���� ������ �ڰ 120-20',null,0,null,0,null,null);
Insert into CALL (PCALL_ID,PCSEQ,PCALL_ADDR,PCALL_IMG,PCALL_FLAG,PCALL_NUM,PCALL_OK,"pcall_latitude","pcall_longtitude") values (582,208,'���� ������ õȣ1�� 106-(8)',null,0,null,0,null,null);
Insert into CALL (PCALL_ID,PCSEQ,PCALL_ADDR,PCALL_IMG,PCALL_FLAG,PCALL_NUM,PCALL_OK,"pcall_latitude","pcall_longtitude") values (185,21,'����Ư���� ���Ǳ� �Ÿ���','dd.gif',0,12,1,6,4);
Insert into CALL (PCALL_ID,PCSEQ,PCALL_ADDR,PCALL_IMG,PCALL_FLAG,PCALL_NUM,PCALL_OK,"pcall_latitude","pcall_longtitude") values (575,204,'���� ������ õȣ1�� 106-(2)',null,0,null,0,null,null);
Insert into CALL (PCALL_ID,PCSEQ,PCALL_ADDR,PCALL_IMG,PCALL_FLAG,PCALL_NUM,PCALL_OK,"pcall_latitude","pcall_longtitude") values (186,22,'����Ư���� ���ı� ������','dd.gif',0,12,1,30,40);
Insert into CALL (PCALL_ID,PCSEQ,PCALL_ADDR,PCALL_IMG,PCALL_FLAG,PCALL_NUM,PCALL_OK,"pcall_latitude","pcall_longtitude") values (588,210,'���� ���ı� ��õ�� ����ñ���ȸ���ǹ�  ',null,0,null,0,null,null);
Insert into CALL (PCALL_ID,PCSEQ,PCALL_ADDR,PCALL_IMG,PCALL_FLAG,PCALL_NUM,PCALL_OK,"pcall_latitude","pcall_longtitude") values (688,283,'����Ư���� ���ı� ���̵� 38-1',null,0,null,1,null,null);
Insert into CALL (PCALL_ID,PCSEQ,PCALL_ADDR,PCALL_IMG,PCALL_FLAG,PCALL_NUM,PCALL_OK,"pcall_latitude","pcall_longtitude") values (641,221,'���� ���α� ����1��  ',null,0,null,0,null,null);
Insert into CALL (PCALL_ID,PCSEQ,PCALL_ADDR,PCALL_IMG,PCALL_FLAG,PCALL_NUM,PCALL_OK,"pcall_latitude","pcall_longtitude") values (349,132,'���� ������ �Ż絿 �ѱ����ձ�����߰���  ',null,0,null,1,null,null);

---------------------------------------------------
--   END DATA FOR TABLE CALL
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE PARKING
--   FILTER = none used
---------------------------------------------------
REM INSERTING into PARKING
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (781512,'���޷� ��ȭ�������� ����������(��)',211,'PublicPark',37.52904612,126.8488608,'NW',1150010300,'����������','������ ȭ� 890-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (968514,'�������� ����������(��)',80,'PublicPark',37.63322721,127.0207105,'NW',1130510300,'����������','���ϱ� ������ 49-7',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (75612,'��ī���� ������(��)',71,'PublicPark',37.64275111,127.0026298,'NS',1130510300,'����������','���ϱ� ������ 535-76',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (112411,'������ȣ�ڵ� ���������(��)',12,'PublicPark',37.52941646,126.9221318,'NS',1156011000,'����������','�������� ���ǵ��� 13-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1372454,'�븲���(��)',93,'PublicPark',37.4928472,126.8943315,'NW',1153010200,'����������','���α� ���ε� 120-5',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1373998,'���빮����2������Ʈ�� �̷��ڵ���������(��)',9,'PublicPark',37.56079136,126.9775538,'NS',1114011700,'����������, �̷��� ������','�߱� ���빮��4�� 3-6',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1374127,'�������� �̷��ڵ���������(��)',1,'PublicPark',37.5162643,126.9067409,'NS',1156010400,'����������, �̷��� ������','�������� ��������3�� 618-496',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1374138,'�������� �̷��ڵ���������(��)',1,'PublicPark',37.51631506,126.9068755,'NS',1156010400,'����������, �̷��� ������','�������� ��������3�� 618-496',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1377975,'���۴뱳(��)',50,'PublicPark',37.50515806,126.9807414,'NS',1159010600,'����������','���۱� ���۵� 316-3',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1380767,'â�Žֿ�2���� ���� �̷���������(��)',1,'PublicPark',37.5804908,127.0106024,'NS',1111017400,'����������, �̷��� ������','���α� â�ŵ� 37-16',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1384198,'���빮������(��)',1103,'PublicPark',37.56729802,127.0114499,'NW',1114016200,'����������','�߱� �Ŵ絿 251-7',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1392010,'test(��)',1,'PublicPark',0,0,'NS',1114011800,'����������','�߱� ���빮��5�� 459-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1398740,'�ű�����(��)',158,'PublicPark',37.58411794,126.9698478,'NW',1111010200,'����������','���α� �ű��� 66-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1410226,'�߰����������(��)',19,'PublicPark',37.56401514,127.0818405,'NW',1121510100,'����������','������ �߰ 221-15',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1025717,'���翪ȯ��������(��)',894,'PublicPark',37.48352522,127.034342,'NW',1165010200,'����������, ȯ�½ü� �ֺ�','���ʱ� ���絿 23-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1040011,'���2�� ����������(��)',108,'PublicPark',37.6567376,127.067531,'NW',1135010500,'����������','����� ��赿 373-13',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1041839,'�Ŵ絿 ����������(��)',24,'PublicPark',37.56204618,127.0144272,'NW',1114016200,'����������','�߱� �Ŵ絿 300-11',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1051019,'�����ʱ����ϰ���������(��)',110,'PublicPark',37.59220373,126.9066978,'NW',1138010900,'����������','���� �Ż絿 193-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1079122,'������ȯ��������(��)',147,'PublicPark',37.60423761,127.0258183,'NW',1129013600,'����������, ȯ�½ü� �ֺ�','���ϱ� �Ͽ�� 104-112',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1163648,'��õ����3(��)',74,'PublicPark',37.48815235,126.9302768,'NS',1162010200,'����������','���Ǳ� �Ÿ��� 1467-3',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1167439,'��ȯ����Ʈ(��)',1,'PublicPark',37.46482966,126.8916081,'NS',1154510200,'����������','��õ�� ���굿 1004-6',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1167707,'��ȯ����Ʈ(��)',1,'PublicPark',37.46479292,126.8906687,'NS',1154510200,'����������','��õ�� ���굿 1004-6',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1247678,'����1-2 ����������(��)',150,'PublicPark',37.55558459,126.9058731,'NW',1144012300,'����������','������ ������ 403-2',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1167764,'����������(��)',40,'PublicPark',37.4695239,126.8881527,'NS',1154510200,'����������','��õ�� ���굿 1081-2',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1167823,'�����߾�(��)',30,'PublicPark',37.46919643,126.8949944,'NS',1154510200,'����������','��õ�� ���굿 300-26',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1167832,'����������(��)',30,'PublicPark',37.47250848,126.8831407,'NS',1154510100,'����������','��õ�� ���굿 345-15',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1167932,'�Ｚ����~����ũ�ο��ǽ�(��)',28,'PublicPark',37.47394953,126.8817762,'NS',1154510100,'����������','��õ�� ���굿 345-26',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1167961,'��������-LG���ڵ�(��)',52,'PublicPark',37.47452057,126.890578,'NS',1154510100,'����������','��õ�� ���굿 237-101',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1168323,'��Ʒ�5��~õ�ֱ������(��)',11,'PublicPark',37.47353664,126.8907592,'NS',1154510100,'����������','��õ�� ���굿 237-123',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1168498,'��ȯ����Ʈ(��)',1,'PublicPark',37.46482287,126.8913749,'NS',1154510200,'����������','��õ�� ���굿 1004-6',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1168606,'��ȯ����Ʈ(��)',1,'PublicPark',37.46520196,126.8919153,'NS',1154510200,'����������','��õ�� ���굿 1004-6',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1168658,'�������(��)',17,'PublicPark',37.47477744,126.8859948,'NS',1154510100,'����������','��õ�� ���굿 60-33',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1168804,'��ȯ����Ʈ(��)',1,'PublicPark',37.46524701,126.8919038,'NS',1154510200,'����������','��õ�� ���굿 1004-6',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1168852,'��ȯ����Ʈ(��)',1,'PublicPark',37.46529223,126.8918924,'NS',1154510200,'����������','��õ�� ���굿 1004-6',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1168928,'SJ��ũ���(��)',37,'PublicPark',37.47963781,126.8837038,'NS',1154510100,'����������','��õ�� ���굿 60-19',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1168986,'��ȯ����Ʈ(��)',1,'PublicPark',37.46492033,126.8918331,'NS',1154510200,'����������','��õ�� ���굿 1004-6',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1169034,'��ȯ����Ʈ(��)',1,'PublicPark',37.4648245,126.8914321,'NS',1154510200,'����������','��õ�� ���굿 1004-6',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1169081,'��ȯ����Ʈ(��)',1,'PublicPark',37.46622271,126.8918229,'NS',1154510200,'����������','��õ�� ���굿 1004-6',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1169082,'��ȯ����Ʈ(��)',1,'PublicPark',37.4661765,126.8918222,'NS',1154510200,'����������','��õ�� ���굿 1004-6',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1169256,'�⸢����(��)',31,'PublicPark',37.47318065,126.8877596,'NS',1154510100,'����������','��õ�� ���굿 219-7',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1169364,'�븢2��(��)',45,'PublicPark',37.46917581,126.8857062,'NS',1154510100,'����������','��õ�� ���굿 338-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1169370,'�����Ǵٸ�(��)',14,'PublicPark',37.47641341,126.8830443,'NS',1154510100,'����������','��õ�� ���굿 371-31',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1169373,'�븢1��~����(��)',40,'PublicPark',37.46939239,126.8836362,'NS',1154510100,'����������','��õ�� ���굿 345-48',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1169446,'��ȯ����Ʈ(��)',1,'PublicPark',37.46497787,126.891925,'NS',1154510200,'����������','��õ�� ���굿 1004-6',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1169490,'�����ߵ�(��)',45,'PublicPark',37.46802676,126.8941181,'NS',1154510200,'����������','��õ�� ���굿 300-21',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1169706,'���굿��õ��(��)',50,'PublicPark',37.46577177,126.8871264,'NS',1154510100,'����������','��õ�� ���굿 691-3',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1169723,'���ΰ�������(��)',83,'PublicPark',37.47193628,126.8810481,'NS',1154510100,'����������','��õ�� ���굿 557-4',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1169896,'���Ͽ��~�ż��蹰������(��)',42,'PublicPark',37.46795327,126.8900681,'NS',1154510200,'����������','��õ�� ���굿 1001-2',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1169936,'��������-����Ǿ�(��)',27,'PublicPark',37.47123772,126.8916713,'NS',1154510200,'����������','��õ�� ���굿 303-2',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1169981,'ȭ��4����ٸ�������������(��)',90,'PublicPark',37.52992373,126.8588959,'NS',1150010300,'����������','������ ȭ� 842-11',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1170433,'���ϱ� ���������(��)',52,'PublicPark',37.56101193,126.8460011,'NS',1150010200,'����������','������ ���̵� 695-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1172364,'��ȯ����Ʈ(��)',1,'PublicPark',37.46479865,126.8908846,'NS',1154510200,'����������','��õ�� ���굿 1004-6',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1172612,'��ȯ����Ʈ(��)',1,'PublicPark',37.46478992,126.8904856,'NS',1154510200,'����������','��õ�� ���굿 1004-6',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1173072,'���д�� ���������(��)',62,'PublicPark',37.55055737,126.8502119,'NS',1150010300,'����������','������ ȭ� 980-19',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1174174,'��Ž��� ��������(��)',10,'PublicPark',37.57196725,126.8133448,'NS',1150010900,'����������','������ ��ȭ�� 858-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1174223,'ȭ��1����ٸ�������������(��)',295,'PublicPark',37.52827327,126.8420064,'NS',1150010300,'����������','������ ȭ� 914-3',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1174233,'Ȳ�ݳ�������(��)',81,'PublicPark',37.56277437,126.8622457,'NS',1150010400,'����������','������ ���絿 1485-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1175069,'��������(��)',88,'PublicPark',37.5289583,126.8554943,'NS',1150010300,'����������','������ ȭ� 947-3',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1175418,'ȭ��2����ٸ�������������(��)',201,'PublicPark',37.52987006,126.8575907,'NS',1150010300,'����������','������ ȭ� 881-14',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1177715,'�ޱ����� ���������(��)',29,'PublicPark',37.53298446,126.8369446,'NS',1150010300,'����������','������ ȭ� 361-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1180082,'���� ��� ����������(��)',92,'PublicPark',37.55344227,126.9027908,'NS',1144012300,'����������','������ ������ 397-20',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1180193,'�밭�� ��� ����������(��)',77,'PublicPark',37.54126245,126.9415381,'NS',1144010500,'����������','������ �밭�� 122-15',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1180642,'���� ��� ����������(��)',47,'PublicPark',37.54646105,126.9176589,'NS',1144012200,'����������','������ ������ 362-22',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1180721,'���� ��� ����������(��)',23,'PublicPark',37.54909204,126.9156279,'NS',1144012000,'����������','������ ������ 394-22',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1180833,'���� ��� ����������(��)',74,'PublicPark',37.56244533,126.9245432,'NS',1144012400,'����������','������ ������ 229-10',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1180914,'û��� ��� ����������(��)',86,'PublicPark',37.5565457,126.914407,'NS',1144012000,'����������','������ ������ 457-25',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1180915,'�泲 ��� ���������� (��)',22,'PublicPark',37.55414318,126.9191948,'NS',1144012000,'����������','������ ������ 353-7',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1184061,'ȫ�뼭�� ��� ����������(��)',174,'PublicPark',37.54901424,126.9206327,'NS',1144012000,'����������','������ ������ 366-19',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1188260,'�����������(��)',17,'PublicPark',37.56531716,127.0678192,'NS',1123010600,'����������','���빮�� ��ȵ� 436-3',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1189080,'������ ȣ�ڱ�(A) ����������(�ھ絿)(��)',46,'PublicPark',37.52974227,127.0902243,'NS',1121510500,'����������','������ �ھ絿 695-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1191037,'����û�� ���(��)',25,'PublicPark',37.57743669,127.0445453,'NS',1123010200,'����������','���빮�� ��ε� 38-5',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1191239,'������ ȣ�ڱ� ����������(�ھ絿)(��)',8,'PublicPark',37.54031631,127.0650544,'NS',1121510500,'����������','������ �ھ絿 695-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1191352,'�ż������(��)',1,'PublicPark',37.5548457,127.0934725,'NS',1121510300,'����������','������ ���ǵ� 558-11',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1192697,'�߰��õ ����������(B)(��)',37,'PublicPark',37.56017837,127.086011,'NS',1121510100,'����������','������ �߰ 277-20',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1193050,'�ż����� ���(��)',1,'PublicPark',37.55730537,127.0900425,'NS',1121510100,'����������','������ �߰ 83-23',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1193127,'��Ⱥ����������������(��)',12,'PublicPark',37.56602954,127.0657129,'NS',1123010600,'����������','���빮�� ��ȵ� 427-4',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1193858,'�߰��õ ����������(��)',41,'PublicPark',37.56048678,127.0858892,'NS',1121510100,'����������','������ �߰ 150-196',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1195466,'������ ȣ�ڱ� ����������(B)(��)',31,'PublicPark',37.53152342,127.091742,'NS',1121510500,'����������','������ �ھ絿 735-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1197273,'�ҵ����� ������������(��)',17,'PublicPark',37.53786712,127.0545095,'NS',1120011500,'����������','������ ������2�� 335-60',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1199786,'�������κ���ȸ�� �� ������������(��)',69,'PublicPark',37.56517761,127.0404795,'NS',1120010500,'����������','������ ���嵿 812-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1201024,'KT �����б� �� ������������(��)',202,'PublicPark',37.54396898,127.0608259,'NS',1120011500,'����������','������ ������2�� 277-43',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1203053,'ȿâ����1(��)',61,'PublicPark',37.5456828,126.9589008,'NS',1117011900,'����������','��걸 ȿâ�� 3-151',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1203572,'��û������ ����(��)',16,'PublicPark',37.58752476,126.9831718,'NS',1111014000,'����������','���α� ��û�� 25-11',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1203624,'������(��)',16,'PublicPark',37.5370422,126.9695609,'NS',1117012200,'����������','��걸 ���赿 12-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1204439,'��ű�ȸ(��)',23,'PublicPark',37.5201708,126.967087,'NS',1117012900,'����������','��걸 ���̵� 302-31',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1205225,'�Ѱ���2����(��)',24,'PublicPark',37.52956909,126.9694862,'NS',1117012500,'����������','��걸 �Ѱ���2�� 412-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1206059,'�ﰢ����(��)',12,'PublicPark',37.53456874,126.9737372,'NS',1117012400,'����������','��걸 �Ѱ���1�� 138-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1206133,'û��1-1(��)',12,'PublicPark',37.56942229,126.9923412,'NS',1111015400,'����������','���α� ��絿 236-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1206427,'ž�����(��)',15,'PublicPark',37.57172112,126.9877906,'NS',1111013800,'����������','���α� ����2�� 38-5',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1206606,'û��6��(��)(��)',33,'PublicPark',37.56997993,127.0121639,'NS',1111017400,'����������','���α� â�ŵ� 490-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1206688,'��������(��)',3,'PublicPark',37.57836684,126.9893319,'NS',1111014900,'����������','���α� ������ 206-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1207170,'ȿâ����2(��)',83,'PublicPark',37.54465658,126.9579624,'NS',1117011900,'����������','��걸 ȿâ�� 255-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1207907,'��ȭ������(��)',19,'PublicPark',37.57136605,126.9741163,'NS',1111011700,'����������','���α� ���ֵ� 40-9',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1207934,'����3����(��)',6,'PublicPark',37.57261866,126.9933833,'NS',1111015000,'����������','���α� ������ 38-2',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1208740,'û��5��(��)(��)',32,'PublicPark',37.56982801,127.0058559,'NS',1111016300,'����������','���α� ����5�� 490-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1210054,'��ȭ��(��)',16,'PublicPark',37.57231272,126.9846183,'NS',1111013600,'����������','���α� �λ絿 194-27',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1210056,'������(��)',20,'PublicPark',37.5732577,126.9879898,'NS',1111013700,'����������','���α� ������ 284-5',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1210451,'û��4��(��)(��)',22,'PublicPark',37.56925787,126.9989798,'NS',1111015800,'����������','���α� ������ 249-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1211476,'����󰡹�(��)',34,'PublicPark',37.56954051,126.9949831,'NS',1111015400,'����������','���α� ��絿 116-3',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1211874,'û��7��(��)',42,'PublicPark',0,0,'NS',1111017500,'����������','���α� ���ε� 233-8',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1216630,'����ȭ��(��)',36,'PublicPark',37.47368562,126.8863109,'NS',1154510100,'����������','��õ�� ���굿 336-25',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1219269,'�Ѱ�����(��)',15,'PublicPark',37.5206328,126.9714416,'NS',1117012900,'����������','��걸 ���̵� 301-5',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1219453,'��������(��)',14,'PublicPark',37.5782594,126.9893581,'NS',1111013000,'����������','���α� �ͷ浿 206-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1219470,'���¿���(��)',40,'PublicPark',37.53421992,126.99072,'NS',1117013000,'����������','��걸 ���¿��� 58-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1219530,'�̰���� ����������(��)',27,'PublicPark',37.59561139,127.06506,'NS',1123011000,'����������','���빮�� �̹��� 86-52',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1219995,'��������2����(��)',25,'PublicPark',37.47446983,126.9599805,'NS',1162010100,'����������','���Ǳ� ��õ�� 220-8',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1221864,'ũ���ȣ��(��)',61,'PublicPark',37.53169553,126.9932325,'NS',1117013000,'����������','��걸 ���¿��� 34-22',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1226038,'������û �� ���������(��)',19,'PublicPark',37.53051357,127.1234771,'NS',1174010800,'����������','������ ������ 540-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1228189,'�־���ξ�(��)',51,'PublicPark',37.55175646,127.1546494,'NS',1174010100,'����������','������ ���ϵ� 51-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1230128,'�־���ο� ���������(��)',45,'PublicPark',37.5526646,127.1529044,'NS',1174010100,'����������','������ ���ϵ� 47-21',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1232331,'�¼���(��)���(��)',44,'PublicPark',37.49274293,126.8214429,'NS',1153011000,'����������','���α� �¼��� 20-10',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1232531,'�¼���(��)���(��)',29,'PublicPark',37.49174292,126.8243285,'NS',1153011000,'����������','���α� �¼��� 51-26',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1233443,'������(����)(��)',34,'PublicPark',37.49352048,126.8560621,'NS',1153010700,'����������','���α� ������ 403-31',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1234228,'���������(��)',24,'PublicPark',37.49228707,126.8822879,'NS',1153010200,'����������','���α� ���ε� 414-13',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1234393,'���ΰ���(��)',11,'PublicPark',37.47942217,126.8894618,'NS',1153010300,'����������','���α� �������� 127-30',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1234449,'���浵��(��)',16,'PublicPark',37.49945907,126.8928604,'NS',1153010200,'����������','���α� ���ε� 69-5',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1235178,'û��8��(��)����(��)',19,'PublicPark',37.56985846,127.016945,'NS',1114016300,'����������','�߱� ���ε� 162-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1235360,'û��3-2(��)',12,'PublicPark',37.56745128,126.9980225,'NS',1114015200,'����������','�߱� �ֱ��� 123-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1235414,'�ѱ��������翷 ������������(��)',9,'PublicPark',37.56821708,126.9820245,'NS',1114010200,'����������','�߱� �ٵ� 18-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (302,'���ν� �ȳ�������',22,'IUGuest',37.48507812236727,126.89880945922654,null,null,'���ڵɲ�����','����Ư���� ���α� ���ε� 187-10  �ڿ��ս��̾𽺹븮1��',1);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1235434,'û��5��(��)5-2(��)',13,'PublicPark',37.56947833,127.0028182,'NS',1114015300,'����������','�߱� ��굿 5-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1235457,'û��2-1(��)',13,'PublicPark',37.56684412,126.9926535,'NS',1114015600,'����������','�߱� ������ 199-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1235467,'��������(��)',41,'PublicPark',37.56431447,126.9937159,'NS',1114016000,'����������','�߱� ������1�� 87-10',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1235668,'û��6��(��)(��)',24,'PublicPark',37.56958176,127.013032,'NS',1114016200,'����������','�߱� �Ŵ絿 217-91',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1235696,'�ѱ������ ������������(��)',22,'PublicPark',37.56238512,126.9790833,'NS',1114011300,'����������','�߱� ��â�� 93-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1235715,'û��4��(��)(��)',23,'PublicPark',37.56878808,126.9983756,'NS',1114015200,'����������','�߱� �ֱ��� 51-3',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1235721,'�������(��)',13,'PublicPark',37.56591795,126.9981258,'NS',1114013500,'����������','�߱� ������ 22-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1235943,'û��3-1(��)',25,'PublicPark',37.56873782,127.0022466,'NS',1114015300,'����������','�߱� ��굿 4-47',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1236067,'�����Ƿ���� ������������(��)',1,'PublicPark',37.56663102,127.0060269,'NS',1114014800,'����������','�߱� ������6�� 18-79',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1236068,'�����Ƿ���� ������������(��)',1,'PublicPark',37.56668132,127.0060408,'NS',1114014800,'����������','�߱� ������6�� 18-79',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1236120,'û��5-2(��)(��)',1,'PublicPark',37.56950204,127.0073071,'NS',1114015300,'����������','�߱� ��굿 52-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1236139,'��ȭ����(��)',50,'PublicPark',37.56551242,126.9928189,'NS',1114015500,'����������','�߱� ������3�� 296-24',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1236165,'������(��)',110,'PublicPark',37.56618265,126.990359,'NS',1114015000,'����������','�߱� ������4�� 187-17',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1236213,'�����Ƿ���� ������������(��)',1,'PublicPark',37.56678501,127.0060678,'NS',1114014800,'����������','�߱� ������6�� 18-79',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1236214,'�����Ƿ���� ������������(��)',1,'PublicPark',37.56699599,127.0061208,'NS',1114014800,'����������','�߱� ������6�� 18-79',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1236215,'�����Ƿ���� ������������(��)',1,'PublicPark',37.56704819,127.0061343,'NS',1114014800,'����������','�߱� ������6�� 18-79',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1236218,'�����Ƿ���� ������������(��)',1,'PublicPark',37.56709968,127.0061478,'NS',1114014800,'����������','�߱� ������6�� 18-79',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1236219,'�����Ƿ���� ������������(��)',1,'PublicPark',37.56715117,127.0061604,'NS',1114014800,'����������','�߱� ������6�� 18-79',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1236221,'�����Ƿ���� ������������(��)',1,'PublicPark',37.56716016,127.0065355,'NS',1114014800,'����������','�߱� ������6�� 18-79',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1236222,'�����Ƿ���� ������������(��)',1,'PublicPark',37.56719381,127.0063344,'NS',1114014800,'����������','�߱� ������6�� 18-79',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1236223,'�����Ƿ���� ������������(��)',1,'PublicPark',37.56712612,127.0067433,'NS',1114014800,'����������','�߱� ������6�� 18-79',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1236224,'�����Ƿ���� ������������(��)',1,'PublicPark',37.56717136,127.006467,'NS',1114014800,'����������','�߱� ������6�� 18-79',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1236225,'�����Ƿ���� ������������(��)',1,'PublicPark',37.56718258,127.0064002,'NS',1114014800,'����������','�߱� ������6�� 18-79',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1236226,'�����Ƿ���� ������������(��)',1,'PublicPark',37.56714901,127.0066077,'NS',1114014800,'����������','�߱� ������6�� 18-79',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1236227,'�����Ƿ���� ������������(��)',1,'PublicPark',37.56713828,127.0066741,'NS',1114014800,'����������','�߱� ������6�� 18-79',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1236309,'û��2��(��)(��)',17,'PublicPark',37.56800977,126.990053,'NS',1114011000,'����������','�߱� ��ǥ�� 65-4',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1236338,'û��5-2(��)(��)',36,'PublicPark',37.56948107,127.005121,'NS',1114015300,'����������','�߱� ��굿 52-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1236500,'�������̺�ī(��)',18,'PublicPark',37.55581513,126.9838329,'NS',1114012100,'����������','�߱� ȸ����1�� 1-19',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1236545,'��ȭ����� ������������(��)',13,'PublicPark',37.56503787,126.9686066,'NS',1114016800,'����������','�߱� ��ȭ�� 1-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1236552,'�������̺�ī ��(��)',3,'PublicPark',37.55557752,126.9838505,'NS',1114012100,'����������','�߱� ȸ����1�� 1-15',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1236616,'���빮 ȭ������ ������(��)',9,'PublicPark',37.56092391,126.9779415,'NS',1114011600,'����������','�߱� ���빮��3�� 30-15',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1236620,'�߸���(�츮����)(��)',19,'PublicPark',37.55668833,126.9684045,'NS',1114017300,'����������','�߱� ������1�� 33-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1236728,'�ٵ����� ������������(��)',7,'PublicPark',37.56794535,126.9800734,'NS',1114010200,'����������','�߱� �ٵ� 46-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1236747,'�߾��Ϻ���(��)',6,'PublicPark',37.56130762,126.9718927,'NS',1114016800,'����������','�߱� ��ȭ�� 84-2',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1237137,'�����鼼���� ������������(��)',18,'PublicPark',37.55614508,126.9751734,'NS',1114011800,'����������','�߱� ���빮��5�� 533-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1237146,'�׸������� ������������(��)',33,'PublicPark',37.55704862,126.9762476,'NS',1114011800,'����������','�߱� ���빮��5�� 267-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1237532,'û�ҳ�ȸ���� ������������(��)',9,'PublicPark',37.56722965,126.9903572,'NS',1114011000,'����������','�߱� ��ǥ�� 50-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1237609,'�ؿ�ͺ����� ������������(��)',9,'PublicPark',37.56302684,126.9807022,'NS',1114011100,'����������','�߱� �Ұ��� 59-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1237813,'���빮������ ���� ������������(��)',23,'PublicPark',37.55941884,126.974039,'NS',1114011900,'����������','�߱� ������1�� 83-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1237987,'����������μ���Ÿ�(��)',73,'PublicPark',37.6748631,127.0582494,'NS',1135010500,'����������','����� ��赿 1120',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1238115,'�����ö��(��)',90,'PublicPark',37.66636014,127.0759503,'NS',1135010500,'����������','����� ��赿 140-66',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1238138,'��û���ֺ�(��)',82,'PublicPark',37.65485548,127.0565208,'NS',1135010500,'����������','����� ��赿 701-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1238166,'�������(��)',25,'PublicPark',37.66573551,127.0756822,'NS',1135010500,'����������','����� ��赿 117-6',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1238209,'�ְ�12�����󰡵�(��)',22,'PublicPark',37.66691768,127.0578659,'NS',1135010500,'����������','����� ��赿 649-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1238304,'�ѽŵ�������Ʈ��(��)',16,'PublicPark',37.64000984,127.0741016,'NS',1135010400,'����������','����� �ϰ赿 256-7',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1238356,'�ְ�1~3�����ֺ�(��)',44,'PublicPark',37.65038533,127.0610432,'NS',1135010500,'����������','����� ��赿 765-2',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1238469,'(��)�Ϻ������ֺ�(��)',19,'PublicPark',37.61944961,127.0774617,'NS',1135010300,'����������','����� ������ 622-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1238542,'�����ȭ����(��)',34,'PublicPark',37.65025059,127.0777959,'NS',1135010600,'����������','����� �߰赿 364-16',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1238565,'�ְ�11�����󰡵�(��)',26,'PublicPark',37.666977,127.0565842,'NS',1135010500,'����������','����� ��赿 652-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1238808,'�ְ�5������(��)',31,'PublicPark',37.65172544,127.0764874,'NS',1135010600,'����������','����� �߰赿 359-16',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1238846,'�ְ�7������(��)',17,'PublicPark',37.65630312,127.0609682,'NS',1135010500,'����������','����� ��赿 692-2',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1238902,'�����(��)',35,'PublicPark',37.6704423,127.0804534,'NS',1135010500,'����������','����� ��赿 111-568',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1238941,'�ְ�4~6�����ֺ�(��)',23,'PublicPark',37.65143663,127.0620319,'NS',1135010500,'����������','����� ��赿 720-4',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1240475,'�������ǿ�(��)',31,'PublicPark',37.65139135,127.0775338,'NS',1135010600,'����������','����� �߰赿 366-14',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1247641,'õȣ2�����������(��)',13,'PublicPark',37.54032781,127.1230483,'NW',1174010900,'����������','������ õȣ�� 457-7',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1247661,'�����������(��)',30,'PublicPark',37.54764828,127.0740918,'NW',1121510900,'����������','������ ���ڵ� 374-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1247675,'�ϻ�1��(��)',112,'PublicPark',37.55284955,127.1380234,'NW',1174010700,'����������','������ �ϻ絿 59-2',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368570,'�������� �� ���������(��)',1,'PublicPark',37.52089663,126.8919885,'NS',1156011200,'����������','�������� ��굿2�� 71-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368575,'�������� �� ���������(��)',1,'PublicPark',37.5207704,126.8921188,'NS',1156011200,'����������','�������� ��굿2�� 71-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368576,'�������� �� ���������(��)',1,'PublicPark',37.52072872,126.8921638,'NS',1156011200,'����������','�������� ��굿2�� 71-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368577,'�������� �� ���������(��)',1,'PublicPark',37.52138646,126.8917257,'NS',1156011200,'����������','�������� ��굿2�� 71-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368626,'������ ���������(��)',42,'PublicPark',37.51230671,126.8976897,'NS',1156011900,'����������','�������� ������1�� 39-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368658,'�����󰡾հ���������(��)',33,'PublicPark',37.59166103,126.9439029,'NS',1141011100,'����������','���빮�� ȫ���� 294-46 ����� ���빮�� ȫ���� 294-4',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368670,'�οս���հ���������(��)',28,'PublicPark',37.59099808,126.9423688,'NS',1141011100,'����������','���빮�� ȫ���� 294-46 ����� ���빮�� ȫ���� 294-4',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368688,'�����󰡾հ���������(��)',1,'PublicPark',37.59136985,126.9436099,'NS',1141011100,'����������','���빮�� ȫ���� 294-46 ����� ���빮�� ȫ���� 294-4',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368698,'SK�������䵵�κ� ���������(��)',30,'PublicPark',37.51840733,126.900372,'NS',1156012100,'����������','�������� ������3�� 55-13',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368701,'�����󰡾հ���������(��)',1,'PublicPark',37.59156323,126.9442157,'NS',1141011100,'����������','���빮�� ȫ���� 294-46 ����� ���빮�� ȫ���� 294-4',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368749,'�ű�5������(��)',27,'PublicPark',37.50214567,126.9048479,'NW',1156013200,'����������','�������� �ű浿 400-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368765,'��ȯ����Ʈ �� ���������(��)',27,'PublicPark',37.5148844,126.8881935,'NS',1156012200,'����������','�������� ������4�� 41-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368782,'��������й븮�� ���������(��)',33,'PublicPark',37.51506465,126.8852977,'NS',1156012300,'����������','�������� ������5�� 5-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368816,'���������� ����������(��)',13,'PublicPark',37.56660034,126.9756854,'NS',1114016700,'����������','�߱� ���� 5-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368833,'�糲��Ÿ� �� ���������(��)',1,'PublicPark',37.52268925,126.8916422,'NS',1156011200,'����������','�������� ��굿2�� 30-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368838,'�糲��Ÿ� �� ���������(��)',8,'PublicPark',37.52226096,126.8913456,'NS',1156012500,'����������','�������� ����1�� 30-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368841,'�泲����Ʈ �� ���������(��)',1,'PublicPark',37.52435028,126.9020211,'NS',1156011300,'����������','�������� ��굿3�� 56-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368849,'�泲����Ʈ �� ���������(��)',19,'PublicPark',37.52362876,126.9020218,'NS',1156010800,'����������','�������� ��������7�� 56-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368870,'����ȭ������� ������������(��)',13,'PublicPark',37.5581772,126.9759947,'NS',1114011800,'����������','�߱� ���빮��5�� 145-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368885,'������ȣ�ھ� ������������(��)',16,'PublicPark',37.56817545,126.9786215,'NS',1114010300,'����������','�߱� �����1�� 18-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368948,'����ȣ�ھ� ������������(��)',12,'PublicPark',37.56389935,126.9800032,'NS',1114011100,'����������','�߱� �Ұ��� 87-3',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1369035,'��ǳ�󰡳�����������(��)',102,'PublicPark',37.5663183,126.995769,'NS',1114013400,'����������','�߱� ������2�� 56-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1369044,'������ı�(��)',13,'PublicPark',37.55668332,126.9853324,'NS',1114014200,'����������','�߱� ���嵿 8-172',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1369093,'���־���Ʈ �� ���������(��)',56,'PublicPark',37.51887945,126.9328883,'NS',1156011000,'����������','�������� ���ǵ��� 54-4',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1369233,'�븲�󰡳�����������(��)',66,'PublicPark',37.56741605,126.9956481,'NS',1114015700,'����������','�߱� �긲�� 174-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1369246,'ȭ�纸����ȸ �� ���������(��)',16,'PublicPark',37.52113141,126.9264017,'NS',1156011000,'����������','�������� ���ǵ��� 35-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1369265,'KBS������ ���������(��)',21,'PublicPark',37.51939762,126.9300556,'NS',1156011000,'����������','�������� ���ǵ��� 46-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1369351,'�����ؿ� �� ���������(��)',14,'PublicPark',37.52298583,126.9252869,'NS',1156011000,'����������','�������� ���ǵ��� 25-11',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1369380,'��������� ���������(��)',15,'PublicPark',37.52815206,126.919455,'NS',1156011000,'����������','�������� ���ǵ��� 15-22',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1369631,'��õ��û �ӽ�������(��)',120,'PublicPark',37.45682326,126.8952551,'NW',1154510300,'����������','��õ�� ���ﵿ 1020-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1369672,'����󰡳�����������(��)',102,'PublicPark',37.56316121,126.9960495,'NS',1114013400,'����������','�߱� ������2�� 181-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1369741,'�����ڿ���~skƮ��Ÿ��(��)',50,'PublicPark',37.47568219,126.8837707,'NS',1154510100,'����������','��õ�� ���굿 345-2',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1369853,'����4����(��)',154,'PublicPark',37.52692115,126.8596533,'NS',1147010100,'����������','��õ�� ������ 902',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1369928,'�۸� ���Ĵ�� ����������(C)(��)',32,'PublicPark',37.53711781,127.0769313,'NS',1121510500,'����������','������ �ھ絿 794-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1370000,'ȭ��8����ٸ�������������(��)',106,'PublicPark',37.52898504,126.8505675,'NS',1150010300,'����������','������ ȭ� 890-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1370001,'û���ٸ�����(��)',89,'PublicPark',37.44649527,127.056152,'NW',1165010400,'����������','���ʱ� ������ 355-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1370023,'LG�ڷ���(��)',43,'PublicPark',37.47438266,126.8866104,'NS',1154510100,'����������','��õ�� ���굿 60-36',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1370082,'���޷���(��)',59,'PublicPark',37.52683805,126.8368152,'NS',1147010300,'����������','��õ�� �ſ��� 217-25',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1370100,'���ϵ�����������(��)',72,'PublicPark',37.56645809,127.1722653,'NW',1174011000,'����������','������ ���ϵ� 292-2',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1370196,'�������43��(��)',35,'PublicPark',37.50967071,127.0398423,'NS',1168010800,'����������','������ ������ 276-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1370240,'����� ���(��)',19,'PublicPark',37.56627759,127.054056,'NS',1123010500,'����������','���빮�� ��ʸ��� 530-14',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1370284,'���빮�ҹ漭���(��)',15,'PublicPark',37.56368548,127.0667544,'NS',1123010600,'����������','���빮�� ��ȵ� 434-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1370392,'����õ�� ����������(��)',64,'PublicPark',37.58215416,127.0357136,'NS',1123010300,'����������','���빮�� ���⵿ 1159-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1370446,'��ʸ� ��ǰ�� ���(��)',75,'PublicPark',37.5645291,127.0585499,'NS',1123010500,'����������','���빮�� ��ʸ��� 959-10',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1370637,'���� �޻� ������(��)',168,'PublicPark',37.62514878,127.0336482,'NW',1130510200,'����������','���ϱ� ���� 148-376',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1370767,'��ȭ�����ֺ� ����������(��)',95,'PublicPark',37.58501075,127.0403308,'NS',1123010300,'����������','���빮�� ���⵿ 293-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1370819,'�߸�������� ���������(��)',34,'PublicPark',37.51997612,126.9107131,'NS',1156010300,'����������','�������� ��������2�� 222-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1370857,'���������������(��)',31,'PublicPark',0,0,'NW',1126010600,'����������','�߶��� �ų��� 123-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1370858,'�������� ��ǰ ����������(��)',62,'PublicPark',37.58227903,127.0405169,'NS',1123010300,'����������','���빮�� ���⵿ 846-38',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1370919,'�������� ����ä�Һ� ����������(��)',94,'PublicPark',37.58099119,127.0405066,'NS',1123010300,'����������','���빮�� ���⵿ 992-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1371037,'������깰���� �������Ʈ �� ������������(��)',29,'PublicPark',37.57030446,127.0429822,'NS',1120010500,'����������','������ ���嵿 804-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1371281,'����1�����������(��)',105,'PublicPark',37.49693614,126.8542333,'NW',1153010700,'����������','���α� ������ 416-175',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1371306,'��ġ��507-3(��)',27,'PublicPark',37.4935772,127.0632256,'NS',1168010600,'����������','������ ��ġ�� 506',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1371375,'�۸� ���Ĵ�� ����������(A)(��)',52,'PublicPark',37.53436938,127.075961,'NS',1121510500,'����������','������ �ھ絿 227-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1371458,'������깰���� ���� ������������(��)',76,'PublicPark',37.56638246,127.0391585,'NS',1120010500,'����������','������ ���嵿 805-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1371575,'���������� �� ������������(��)',105,'PublicPark',37.56944562,127.0397026,'NS',1120010500,'����������','������ ���嵿 494-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1371615,'�����ֹμ��� �� ������������(��)',55,'PublicPark',37.56538182,127.046962,'NS',1120010500,'����������','������ ���嵿 783-7',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1371666,'GSŸ���� ����������(��)',121,'PublicPark',37.50995115,127.0236997,'NW',1168010800,'����������','������ ������ 140-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1371671,'GSŸ���� ������(��)',19,'PublicPark',37.51251031,127.041695,'NW',1168010800,'����������','������ ������ 266-16',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1371688,'���ܺ���(��)',23,'PublicPark',37.53034734,126.8713663,'NW',1147010200,'����������','��õ�� �� 919-5',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1371689,'��õ��ȸ��ü���缾��(��)',22,'PublicPark',37.53187194,126.875464,'NW',1147010200,'����������','��õ�� �� 905-29',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1371690,'��Ÿ��Ȧ(��)',25,'PublicPark',37.53292894,126.8768775,'NW',1147010200,'����������','��õ�� �� 905-21',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1371733,'��ε�û�� ����������(��)',52,'PublicPark',37.57161153,127.0279777,'NS',1123010200,'����������','���빮�� ��ε� 255-13',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1371776,'�帪��745��(��)',246,'PublicPark',37.46870915,127.1194622,'NS',1168011300,'����������','������ ������ 101-13',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1371992,'������ȣ������(��)',57,'PublicPark',37.52850706,126.8321635,'NW',1147010300,'����������','��õ�� �ſ��� 268-19',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1372066,'��ġ������ü������(��)',99,'PublicPark',37.50443395,127.0685225,'NS',1168010600,'����������','������ ��ġ�� 78-24',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1372128,'��õ��3����������(��)',47,'PublicPark',37.49615427,127.1498486,'NW',1171011400,'����������','���ı� ��õ�� 128-4',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1372154,'���� ����������(��)',110,'PublicPark',37.49122463,127.1346929,'NW',1171010800,'����������','���ı� ������ 2-5',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1372161,'���ʼ������������(��)',37,'PublicPark',37.51347,127.1233614,'NS',1171011100,'����������','���ı� ���̵� 12-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1372243,'���ʼ������������(��)',48,'PublicPark',37.51568888,127.1171637,'NS',1171011100,'����������','���ı� ���̵� 12-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1372264,'��������� ����������(��)',96,'PublicPark',37.51575435,127.1039661,'NS',1171010200,'����������','���ı� ��õ�� 10-2',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1372289,'�񼮰Ÿ� ����������(��)',30,'PublicPark',37.49694733,127.1167277,'NS',1171010700,'����������','���ı� ������ 95-6',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1265901,'��躹��������2���� ������������(��)',99,'PublicPark',37.48347477,126.9825909,'NS',1165010100,'����������','���ʱ� ��赿 439-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1277150,'ȭ���뿪 ȯ��������(��)',280,'PublicPark',37.61997867,127.0866958,'NW',1126010400,'����������, ȯ�½ü� �ֺ�','�߶��� ���� 28-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1282112,'���߾Ȱ���������(��)',207,'PublicPark',37.61133346,127.0759693,'NS',1126010400,'����������','�߶��� ���� 250-39',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1423770,'�����ʵ��б�(����������)(��)',135,'PublicPark',37.48490117,126.9221154,'NW',1162010200,'����������','���Ǳ� �Ÿ��� 467-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1424710,'â��÷�1(��)',11,'PublicPark',37.58027818,126.9963581,'NS',1111013000,'����������','���α� �ͷ浿 2-86 (���α� â��÷�(â��� ������ ~ â��� ȫȭ��))',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1430967,'�����ޱ�(��)',24,'PublicPark',37.52033683,126.8690879,'NS',1147010100,'����������','��õ�� ������ 319-25',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1431652,'�ø���Ÿ�� ��(��)',1,'PublicPark',37.56151205,126.9727173,'NS',1114016600,'����������','�߱� ���ҹ��� 135-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1431661,'�ø���Ÿ�� ��(��)',1,'PublicPark',37.56164468,126.9730532,'NS',1114016600,'����������','�߱� ���ҹ��� 135-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1168040,'������������(��)',11,'PublicPark',37.47896464,126.8886263,'NS',1154510100,'����������','��õ�� ���굿 139-31',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1169033,'�����߰���~õ�����(��)',9,'PublicPark',37.47816474,126.882671,'NS',1154510100,'����������','��õ�� ���굿 371-57',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1169462,'��Ʒ�5��~õ�ֱ������(��)',23,'PublicPark',37.47120485,126.8891467,'NS',1154510200,'����������','��õ�� ���굿 336-3',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1172984,'���ױ� ���������(��)',67,'PublicPark',37.55260283,126.8512851,'NS',1150010300,'����������','������ ȭ� 1112-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1180535,'������ ��� ����������(��)',74,'PublicPark',37.5559566,126.9271355,'NS',1144012000,'����������','������ ������ 332-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1190582,'����õ ���� ����������(��)',19,'PublicPark',37.57517648,127.0281309,'NS',1123010200,'����������','���빮�� ��ε� 239-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1199510,'û��8��(��3)(��)',21,'PublicPark',37.57111555,127.0244304,'NS',1120010100,'����������','������ ��սʸ��� 12-47',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1206362,'��������(��)',13,'PublicPark',37.57536163,126.9787049,'NS',1111012500,'����������','���α� ���е� 111-0 ��',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1209617,'����3����(��)',5,'PublicPark',37.57262866,126.9919872,'NS',1111015100,'����������','���α� ���� 21-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1220136,'������ ��� ����������(��)',17,'PublicPark',37.55678542,126.9244292,'NS',1144012100,'����������','������ ������ 165-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1234251,'�븲��2(��)',35,'PublicPark',37.4963164,126.8935591,'NS',1153010200,'����������','���α� ���ε� 73-9',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1235505,'������(�߾�)(��)',29,'PublicPark',37.49422253,126.856264,'NS',1153010700,'����������','���α� ������ 403-10',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1236088,'û��3��(��)(��)',25,'PublicPark',37.56825056,126.9931294,'NS',1114015600,'����������','�߱� ������ 185-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1236220,'�����Ƿ���� ������������(��)',1,'PublicPark',37.56720506,127.0062694,'NS',1114014800,'����������','�߱� ������6�� 18-79',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1236472,'����������������� ������������(��)',18,'PublicPark',37.55738418,126.9745041,'NS',1114011800,'����������','�߱� ���빮��5�� 217-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1237723,'�������� ������������(��)',16,'PublicPark',37.56881712,127.0121712,'NS',1114016200,'����������','�߱� �Ŵ絿 213-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1238382,'�ְ�3�������ֺ�(��)',45,'PublicPark',37.65296625,127.0601911,'NS',1135010500,'����������','����� ��赿 735-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1247659,'����3�� ����������(��)',160,'PublicPark',37.5391245,127.0913897,'NW',1121510300,'����������','������ ���ǵ� 219-15',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368572,'�������� �� ���������(��)',1,'PublicPark',37.52080969,126.8920724,'NS',1156011200,'����������','�������� ��굿2�� 71-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368745,'�������ֹμ��� �� ���������(��)',13,'PublicPark',37.5168354,126.9001876,'NS',1156012100,'����������','�������� ������3�� 55-16',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368937,'����ȭ����� ������������(��)',28,'PublicPark',37.56903171,127.0115027,'NS',1114016200,'����������','�߱� �Ŵ絿 779-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1369485,'û�ʹ� �������� ������(��)',11,'PublicPark',37.5839096,126.9707367,'NS',1111010300,'����������','���α� ������ 12-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1370056,'â����(��)��û����(��)',30,'PublicPark',37.65249733,127.0498862,'NS',1132010700,'����������','������ â�� 6-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1370659,'ȸ�⿪�ֺ� ����������(��)',89,'PublicPark',37.59033244,127.060383,'NS',1123010900,'����������','���빮�� �ְ浿 262-2',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1371454,'�۸����Ĵ��(B) ����������(��)',17,'PublicPark',37.53105597,127.0749743,'NS',1121510500,'����������','������ �ھ絿 601-9',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1371916,'������3���ⱸ �� ������������(��)',91,'PublicPark',37.54350228,127.0568768,'NS',1120011500,'����������','������ ������2�� 276-5',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1374134,'�������� �̷��ڵ���������(��)',1,'PublicPark',37.51629595,126.9068261,'NS',1156010400,'����������, �̷��� ������','�������� ��������3�� 618-496',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1374135,'�������� �̷��ڵ���������(��)',1,'PublicPark',37.51630013,126.9068388,'NS',1156010400,'����������, �̷��� ������','�������� ��������3�� 618-496',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1374136,'�������� �̷��ڵ���������(��)',1,'PublicPark',37.51630432,126.9068508,'NS',1156010400,'����������, �̷��� ������','�������� ��������3�� 618-496',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1374137,'�������� �̷��ڵ���������(��)',1,'PublicPark',37.51630969,126.9068628,'NS',1156010400,'����������, �̷��� ������','�������� ��������3�� 618-496',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1374139,'�������� �̷��ڵ���������(��)',1,'PublicPark',37.51631984,126.9068882,'NS',1156010400,'����������, �̷��� ������','�������� ��������3�� 618-496',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1374140,'�������� �̷��ڵ���������(��)',1,'PublicPark',37.51632402,126.9069009,'NS',1156010400,'����������, �̷��� ������','�������� ��������3�� 618-496',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1374294,'�������� �̷��ڵ���������(��)',1,'PublicPark',37.51632821,126.9069144,'NS',1156010400,'����������, �̷��� ������','�������� ��������3�� 618-496',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1374326,'��꿪 �̷��ڵ���������(��)',33,'PublicPark',37.53359474,126.9017541,'NS',1156011500,'����������, �̷��� ������','�������� ��굿5�� 14-4',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1374473,'���빮������Ĺ����� �̷��ڵ���������(��)',50,'PublicPark',37.56042639,126.976493,'NS',1114011700,'����������, �̷��� ������','�߱� ���빮��4�� 3-6',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1375052,'�������ڵ������� ������������(��)',318,'PublicPark',37.55973425,127.065059,'NS',1120012200,'����������','������ ��䵿 225-13',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1376334,'õȣ��2����2������(��)',7,'PublicPark',37.53992877,127.1228238,'NS',1174010900,'����������','������ õȣ�� 457-11 õȣ�� 456-16',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1377117,'�������(��)',8,'PublicPark',37.57267895,126.9967579,'NS',1111015700,'����������','���α� ���ǵ� 107-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1377393,'���Ű��Ʒ�(��)',13,'PublicPark',37.56956316,126.9833711,'NS',1111013500,'����������','���α� ��ö�� 45-9',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1377416,'���̿������������������(��)',30,'PublicPark',37.55933566,126.9427449,'NW',1141011200,'����������','���빮�� ������ 121-9',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1380362,'���꼺���� �̷��ڵ���������(��)',7,'PublicPark',37.57169872,127.0096868,'NS',1111017400,'����������, �̷��� ������','���α� â�ŵ� 7-22',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1380394,'���꼺���� �̷��ڵ���������(��)',24,'PublicPark',37.57214991,127.009611,'NS',1111017400,'����������, �̷��� ������','���α� â�ŵ� 67-2',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1380556,'����40�� �̷��ڵ���������(��)',73,'PublicPark',37.57098421,127.0072876,'NS',1111016400,'����������, �̷��� ������','���α� ����6�� 318-3',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1380638,'�溹�ÿ� �̷���������(��)',5,'PublicPark',37.57620702,126.9723179,'NS',1111011400,'����������, �̷��� ������','���α� ���ڵ� 67-2',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1380752,'â�Žֿ�2���� ���� �̷���������(��)',1,'PublicPark',37.58041273,127.0105492,'NS',1111017400,'����������, �̷��� ������','���α� â�ŵ� 37-16',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1380762,'â�Žֿ�2���� ���� �̷���������(��)',1,'PublicPark',37.58045206,127.0105769,'NS',1111017400,'����������, �̷��� ������','���α� â�ŵ� 37-16',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1380764,'â�Žֿ�2���� ���� �̷���������(��)',1,'PublicPark',37.5804324,127.0105635,'NS',1111017400,'����������, �̷��� ������','���α� â�ŵ� 37-16',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1380768,'â�Žֿ�2���� ���� �̷���������(��)',1,'PublicPark',37.58051106,127.0106159,'NS',1111017400,'����������, �̷��� ������','���α� â�ŵ� 37-16',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1380769,'â�Žֿ�2���� ���� �̷���������(��)',1,'PublicPark',37.58053132,127.0106301,'NS',1111017400,'����������, �̷��� ������','���α� â�ŵ� 37-16',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1380770,'â�Žֿ�2���� ���� �̷���������(��)',1,'PublicPark',37.58055159,127.0106436,'NS',1111017400,'����������, �̷��� ������','���α� â�ŵ� 37-16',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1380772,'â�Žֿ�2���� ���� �̷���������(��)',1,'PublicPark',37.58057125,127.0106571,'NS',1111017400,'����������, �̷��� ������','���α� â�ŵ� 37-16',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1382791,'������ ���ǵ� 241-12(��)',1,'PublicPark',37.54052806,127.0870818,'NW',1121510300,'����������','������ ���ǵ� 241-12',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1382971,'�޳����� ���������(��)',59,'PublicPark',37.56086181,126.8470627,'NS',1150010200,'����������','������ ���̵� 701-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1384005,'���ΰ�� ������� ��������(��)',17,'PublicPark',37.53229671,126.8608012,'NW',1150010300,'����������','������ ȭ� 797-7',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1384007,'��ġ�� ������� ��������(��)',19,'PublicPark',37.53155891,126.847911,'NW',1150010300,'����������','������ ȭ� 342-16',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1384008,'��ȭ��� ������� ��������(��)',24,'PublicPark',37.54902277,126.8345687,'NW',1150010600,'����������','������ ���߻굿 720-4',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1384016,'���ΰ��������� ������(��)',501,'PublicPark',37.53780425,126.8397599,'NW',1150010300,'����������','������ ȭ� 379-14',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1384440,'��������Ʈ�� �̷��� ������(��)(��)',5,'PublicPark',37.5752189,127.0209494,'NS',1111017500,'����������, �̷��� ������','���α� ���ε� 766-2',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1384451,'����63���� �̷��ڵ���������(��)',4,'PublicPark',37.57725587,127.0186748,'NS',1111017500,'����������, �̷��� ������','���α� ���ε� 58-2',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1385009,'����û��(��)',95,'PublicPark',37.62149652,127.0288796,'NS',1130510100,'����������','���ϱ� �̾Ƶ� 137-19',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1385304,'û��5-2(��)',24,'PublicPark',37.57061436,126.9983341,'NS',1111015800,'����������','���α� ������ 2-2',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1385457,'�Ź��� ���������(��)',22,'PublicPark',37.57107424,126.9731669,'NW',1111012000,'����������','���α� �Ź���1�� 58-36',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1385828,'��������������(��)',128,'PublicPark',37.59662013,127.0759318,'NS',1126010300,'����������','�߶��� ��ȭ�� 304-36',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1386536,'�������(�۷ι�����)������(��)',45,'PublicPark',37.56972415,126.9815292,'NW',1111012300,'����������','���α� ������ 63-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1387193,'����������(��)',11,'PublicPark',37.57150771,126.9595036,'NS',1141010800,'����������','���빮�� ��õ�� 54-11',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1393591,'������� �ҿ���(��)',12,'PublicPark',37.55445944,126.9782972,'NS',1114011800,'����������','�߱� ���빮��5�� 450-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1395163,'�������(��)',63,'PublicPark',37.59567835,127.0896941,'NS',1126010200,'����������','�߶��� ����� 399-4',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1395291,'������(��)',48,'PublicPark',37.54249491,127.0172126,'NS',1120011300,'����������','������ ������ 343-4',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1396128,'���빮����;� �̷��ڵ��� ������(��)',10,'PublicPark',37.56646847,127.0128116,'NS',1114016200,'����������, �̷��� ������','�߱� �Ŵ絿 200-5',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1397591,'�����Ӱ���(���)(��)',159,'PublicPark',37.56156118,127.0553363,'NW',1120012200,'����������','������ ��䵿 180-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1397945,'���嵿��깰���� �Ϲ� ������������(��)',32,'PublicPark',37.57053707,127.0423898,'NS',1120010500,'����������','������ ���嵿 84-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1401516,'��ö�� ������(��)',7,'PublicPark',37.56854885,126.985901,'NS',1111013500,'����������','���α� ��ö�� 13-14',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1404649,'�����԰� ���� ������(��)',84,'PublicPark',37.4954652,126.8392484,'NW',1153010800,'����������','���α� ������ 6-11',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1405474,'�ż������(��)',1,'PublicPark',37.55467809,127.0937297,'NS',1121510300,'����������','������ ���ǵ� 558-11',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1405476,'�ż������(��)',1,'PublicPark',37.55464708,127.0937925,'NS',1121510300,'����������','������ ���ǵ� 558-11',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1405477,'�ż������(��)',1,'PublicPark',37.55461606,127.0938824,'NS',1121510300,'����������','������ ���ǵ� 558-11',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1405614,'�������������(��)',26,'PublicPark',37.55613128,127.091637,'NS',1121510100,'����������','������ �߰ 88-21',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1406805,'��ȯ����Ʈ(��)',1,'PublicPark',37.46564906,126.8918297,'NS',1154510200,'����������','��õ�� ���굿 1004-6',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1407803,'�ѹ̺�����(��)',10,'PublicPark',37.57149196,126.98461,'NS',1111012700,'����������','���α� ���� 283-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1412826,'�Ź�������������(��)',80,'PublicPark',37.58652245,126.9210871,'NW',1138010700,'����������','���� ���ϵ� 747-8',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1412862,'������ ����������(��)',39,'PublicPark',37.55163204,127.1008538,'NW',1121510400,'����������','������ ���嵿 369-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1413181,'���ϱ� ������ 1070-23(��)',12,'PublicPark',37.60512964,127.025378,'NW',1129013400,'����������','���ϱ� ������ 1070-23',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1415250,'â���� ����������� ����������(��)',28,'PublicPark',37.65309366,127.0517197,'NS',1132010700,'����������','������ â�� 15-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1415512,'���κ�����(��)',40,'PublicPark',37.58901131,127.0691229,'NW',1123010900,'����������','���빮�� �ְ浿 361-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1415929,'�ٸ��� ����������(��)',48,'PublicPark',37.47633196,126.9018971,'NW',1154510200,'����������','��õ�� ���굿 971-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1416322,'������������2����(���ű�2��)(��)',61,'PublicPark',37.51332538,126.9140778,'NW',1156013200,'����������','�������� �ű浿 186-355',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1416339,'���ο�����������(��)',129,'PublicPark',37.47997647,126.8880114,'NW',1154510300,'����������','��õ�� ���ﵿ 139-2',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1028245,'���е� ��������� ����������(��)',81,'PublicPark',37.6645806,127.0339057,'NW',1132010600,'����������','������ ���е� 632-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1032247,'������ȭ����(��)',143,'PublicPark',37.60573659,126.9231083,'NW',1138010200,'����������','���� ����� 153-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1033590,'�Ÿ�������������(��)',191,'PublicPark',37.48736246,126.9234342,'NW',1162010200,'����������','���Ǳ� �Ÿ��� 1456-3',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1033754,'�����ʱ�(��)',194,'PublicPark',37.47564571,127.052365,'NW',1168010300,'����������','������ ������ 1273-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1034344,'����2�� ����������(��)',62,'PublicPark',37.64603214,127.0219081,'NW',1130510300,'����������','���ϱ� ������ 660-30',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1034345,'���ߵ�(�ӽ�)����������(��)',6,'PublicPark',37.61105539,127.0334978,'NW',1130510100,'����������','���ϱ� �̾Ƶ� 860-123',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1037569,'�ٶ�����������(��)',186,'PublicPark',37.53033824,126.8742749,'NW',1147010200,'����������','��õ�� �� 919-8',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1037932,'���ε����д����� ȯ��������(��)',90,'PublicPark',37.48543179,126.9012433,'NW',1153010200,'����������, ȯ�½ü� �ֺ�','���α� ���ε� 810-3',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1040225,'������22��(��)',100,'PublicPark',37.48150119,127.0478133,'NW',1168010300,'����������','������ ������ 1266-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1040346,'�ſ����� ����������(��)',23,'PublicPark',37.53302124,126.8362542,'NW',1147010300,'����������','��õ�� �ſ��� 114-16',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1040347,'����������(��)',40,'PublicPark',37.51808843,126.8534823,'NW',1147010100,'����������','��õ�� ������ 1182-9',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1040348,'��ȭȸ�� ����������(��)',93,'PublicPark',37.5165589,126.8632978,'NW',1147010100,'����������','��õ�� ������ 322-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1040414,'�ſ�2���������(��)',10,'PublicPark',37.52261138,126.8499601,'NS',1147010300,'����������','��õ�� �ſ��� 503-3',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1040508,'�ſ�1����������1����(��)',61,'PublicPark',37.52837281,126.838519,'NS',1147010300,'����������','��õ�� �ſ��� 228-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1040564,'�ſ�1����������2����(��)',42,'PublicPark',37.53569096,126.8340656,'NS',1147010300,'����������','��õ�� �ſ��� 90-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1040665,'�ſ�5������������(��)',66,'PublicPark',37.53726549,126.8282626,'NS',1147010300,'����������','��õ�� �ſ��� 53-2',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1040712,'�ſ�1�� �Ȱ�����Ÿ�(��)',33,'PublicPark',37.5322909,126.8333739,'NS',1147010300,'����������','��õ�� �ſ��� 126-36',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1041840,'���굿 ����������(��)',49,'PublicPark',37.55923691,126.985624,'NW',1114012900,'����������','�߱� ���굿2�� 30-4',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1041991,'�Ҿϻ�(��)',61,'PublicPark',37.66192599,127.0793403,'NW',1135010600,'����������','����� �߰赿 26-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1042402,'����1�� ��ȭ����(��)',118,'PublicPark',37.49534845,127.0332376,'NW',1168010100,'����������','������ ���ﵿ 829-20',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1042406,'�Ｚ1�� ��ȭ����(��)',70,'PublicPark',37.51432707,127.0625522,'NW',1168010500,'����������','������ �Ｚ�� 161-2',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1042410,'�����ʱ�(��)',192,'PublicPark',37.50822463,127.0262625,'NW',1168010800,'����������','������ ������ 168-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1042421,'�����ʱ�(��)',191,'PublicPark',37.48664435,127.0370504,'NW',1168011800,'����������','������ ��� 922-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1042423,'������24��33(��)',36,'PublicPark',37.47716566,127.049807,'NW',1168010300,'����������','������ ������ 1204-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1051018,'�����ʱ����ϰ���������(��)',152,'PublicPark',37.62387156,126.9242215,'NW',1138010300,'����������','���� �ұ��� 400-6',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1051043,'���Ĺ߿� ȯ��������(��)',401,'PublicPark',37.63800702,126.9193218,'NW',1138011400,'����������, ȯ�½ü� �ֺ�','���� ������ 66-30',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1052723,'�����(���)(��)',103,'PublicPark',37.55384954,127.0482917,'NW',1120010600,'����������','������ ��ٵ� 104-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1052725,'��絿(���) ������(��)',22,'PublicPark',37.55464494,127.0388249,'NW',1120010700,'����������','������ ��絿 104-8',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1052737,'������(���)(��)',73,'PublicPark',37.55039155,127.0344811,'NW',1120010800,'����������','������ ������ 3-11',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1052741,'���嵿��깰(���)(��)',35,'PublicPark',37.57156287,127.0395315,'NW',1120010500,'����������','������ ���嵿 525-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1053712,'������� ���ϰ���������(��)',233,'PublicPark',37.54149242,126.844396,'NW',1150010300,'����������','������ ȭ� 98-99',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1056832,'�Ѵ���(��)',44,'PublicPark',37.47743578,126.9770784,'NW',1159010700,'����������','���۱� ��絿 1046-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1056834,'������������(��)',147,'PublicPark',37.50309257,126.9782686,'NW',1159010600,'����������','���۱� ���۵� 326-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1059009,'�Ż絿 ��1����������(��)',41,'PublicPark',37.4844443,126.915461,'NW',1162010200,'����������','���Ǳ� �Ÿ��� 511-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1140909,'������������������������(��)',95,'PublicPark',37.51638775,127.0163891,'NW',1165010600,'����������','���ʱ� ����� 10-33',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1140910,'����2�� ����������(��)',135,'PublicPark',37.50421414,126.9954231,'NW',1165010700,'����������','���ʱ� ������ 5-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1140911,'��������(��)',8,'PublicPark',37.49814931,126.9978319,'NW',1165010700,'����������','���ʱ� ������ 95-13',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1144569,'��ȭ����������(��)',101,'PublicPark',37.5766117,127.00553,'NW',1111016500,'����������','���α� ��ȭ�� 13-2',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1155460,'�Ÿ�10�������ΰ���������(��)',106,'PublicPark',37.46700135,126.9303556,'NS',1162010200,'����������','���Ǳ� �Ÿ��� 808-638',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1155752,'��������2����(��)',15,'PublicPark',37.4836479,126.9030268,'NS',1162010200,'����������','���Ǳ� �Ÿ��� 1675-8',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1155759,'������1����(��)',38,'PublicPark',37.48309314,126.927491,'NS',1162010200,'����������','���Ǳ� �Ÿ��� 1642-8',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1159004,'���ǻ�(�ӽ����)(��)',183,'PublicPark',37.46808488,126.9470172,'NS',1162010200,'����������','���Ǳ� �Ÿ��� 808-123',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1165319,'�Ѱ��뱳(��)(��)',24,'PublicPark',37.5133751,126.9566804,'NS',1159010400,'����������','���۱� ���� 5-5',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1165941,'����ź�����(��)',39,'PublicPark',37.49200184,126.9229383,'NS',1159010900,'����������','���۱� �Ŵ�浿 395-61',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1166037,'����������������(��)',52,'PublicPark',37.49612362,126.9826102,'NS',1159010600,'����������','���۱� ���۵� 102-65',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1167311,'�λ����A~B(��)',19,'PublicPark',37.47361614,126.8933543,'NS',1154510100,'����������','��õ�� ���굿 153-18',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1167315,'���������ȯ��(��)',41,'PublicPark',37.48377106,126.8818697,'NS',1154510100,'����������, ȯ�½ü� �ֺ�','��õ�� ���굿 35-2',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1167394,'��ȯ����Ʈ(��)',1,'PublicPark',37.46482619,126.8914899,'NS',1154510200,'����������','��õ�� ���굿 1004-6',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1167437,'��ȯ����Ʈ(��)',1,'PublicPark',37.46486348,126.8917424,'NS',1154510200,'����������','��õ�� ���굿 1004-6',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1167438,'��ȯ����Ʈ(��)',1,'PublicPark',37.46483708,126.8916677,'NS',1154510200,'����������','��õ�� ���굿 1004-6',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1167440,'��ȯ����Ʈ(��)',1,'PublicPark',37.46482789,126.891548,'NS',1154510200,'����������','��õ�� ���굿 1004-6',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1167443,'�츮����(��)',12,'PublicPark',37.47694387,126.8902889,'NS',1154510100,'����������','��õ�� ���굿 140-41',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1167444,'���л�~�뵿����(��)',45,'PublicPark',37.46806486,126.8869772,'NS',1154510100,'����������','��õ�� ���굿 660-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1167445,'��õ��(��)',22,'PublicPark',37.4728004,126.8975624,'NS',1154510200,'����������','��õ�� ���굿 152-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1167450,'����ö��~LG���ڿ�����(��)',25,'PublicPark',37.47218477,126.8851572,'NS',1154510100,'����������','��õ�� ���굿 319-15',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1167633,'��ȯ����Ʈ(��)',1,'PublicPark',37.46479622,126.8908266,'NS',1154510200,'����������','��õ�� ���굿 1004-6',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1167691,'��ȯ����Ʈ(��)',1,'PublicPark',37.46494902,126.8918789,'NS',1154510200,'����������','��õ�� ���굿 1004-6',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1167706,'��ȯ����Ʈ(��)',1,'PublicPark',37.46479461,126.8907412,'NS',1154510200,'����������','��õ�� ���굿 1004-6',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1167709,'��ȯ����Ʈ(��)',1,'PublicPark',37.46479102,126.8905528,'NS',1154510200,'����������','��õ�� ���굿 1004-6',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1167710,'��ȯ����Ʈ(��)',1,'PublicPark',37.4648919,126.8917877,'NS',1154510200,'����������','��õ�� ���굿 1004-6',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1167736,'����ȭ��(��)',16,'PublicPark',37.47144382,126.8873049,'NS',1154510200,'����������','��õ�� ���굿 336-25',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1247677,'��ȭ�� ����������(��)',133,'PublicPark',37.545733,126.9112039,'NW',1144012200,'����������','������ ������ 139-21',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1247680,'�ְ������� ����������(��)',90,'PublicPark',37.58908686,127.0697738,'NW',1123010900,'����������','���빮�� �ְ浿 348-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1247683,'����������(��)',77,'PublicPark',37.5623712,127.0687626,'NW',1123010600,'����������','���빮�� ��ȵ� 458-8',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1247684,'û��������(��)',122,'PublicPark',37.57223438,127.0342946,'NW',1123010200,'����������','���빮�� ��ε� 129-4',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1254863,'����������3����(��)',172,'PublicPark',37.51707492,126.9033429,'NW',1156010500,'����������','�������� ��������4�� 442-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1255517,'���δ�պϾ�����(��)',50,'PublicPark',37.6098523,126.9951151,'NS',1129013300,'����������','���ϱ� ������ 880-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1262521,'����߾ӷ� ������������(��)',54,'PublicPark',37.49616103,126.9855885,'NS',1165010100,'����������','���ʱ� ��赿 760-3',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1264599,'��������õ ������������(��)',39,'PublicPark',37.50440194,127.0099553,'NS',1165010700,'����������','���ʱ� ������ 57-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1265250,'�����ʱ��� ������������(��)',10,'PublicPark',37.49924383,127.0258934,'NS',1165010800,'����������','���ʱ� ���ʵ� 1310-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1266311,'��躹������ ��1���� ������������(��)',118,'PublicPark',37.48071164,126.9825295,'NS',1165010100,'����������','���ʱ� ��赿 443-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1267813,'�����Ա����� ������������(��)',27,'PublicPark',37.49329947,127.010736,'NS',1165010800,'����������','���ʱ� ���ʵ� 1704-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1268780,'û�ĵ�1��������(��)',105,'PublicPark',37.54294114,126.9684714,'NW',1117011100,'����������','��걸 û�ĵ�3�� 118-102',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1268812,'û�ĵ�û��(��)',32,'PublicPark',37.54549939,126.9699178,'NW',1117011000,'����������','��걸 û�ĵ�2�� 91-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1268813,'������ڻ�4(��)',114,'PublicPark',37.53388844,126.9600572,'NW',1117011700,'����������','��걸 ��ȿ��3�� 51-5',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1268816,'�ľϵ�������(��)',39,'PublicPark',37.55048874,126.9764859,'NW',1117010100,'����������','��걸 �ľϵ� 65-4',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1276799,'õ������������(��)',139,'PublicPark',37.50153445,127.1559879,'NW',1171011400,'����������','���ı� ��õ�� 2-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1277144,'��������û��(��)',193,'PublicPark',37.52490727,126.8951624,'NW',1156011300,'����������','�������� ��굿3�� 370-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1277145,'��ǿ�(��)',346,'PublicPark',37.5144736,127.1045577,'NW',1171010200,'����������','���ı� ��õ�� 29-5',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1277146,'���2�� ���������(��)',80,'PublicPark',37.5782752,127.070619,'NW',1123010600,'����������','���빮�� ��ȵ� 286-9',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1277151,'��ȭ�꿪(��) ȯ��������(��)',165,'PublicPark',37.61702687,127.092907,'NW',1126010600,'����������, ȯ�½ü� �ֺ�','�߶��� �ų��� 640-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1277152,'��â�� ������(��)',38,'PublicPark',37.60749827,126.9716793,'NW',1111018300,'����������','���α� ��â�� 148-18',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1277157,'�ع��̳��(��)',24,'PublicPark',37.54438297,126.9843042,'NW',1117010200,'����������','��걸 ��굿2�� 1-1497',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1277158,'������Ա�(��)',18,'PublicPark',37.61714694,127.0562518,'NW',1129013800,'����������','���ϱ� ������ 135-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1277160,'�����(��)',237,'PublicPark',37.52625064,126.8994538,'NW',1156011300,'����������','�������� ��굿3�� 2-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1277163,'���ϵ�(��)',11,'PublicPark',37.55361065,127.1559121,'NW',1174010100,'����������','������ ���ϵ� 47-9',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1278470,'���ΰ� ����������(��)',74,'PublicPark',37.59945988,127.095702,'NS',1126010500,'����������','�߶��� ���쵿 487-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1280770,'��ȭ����������(��)',30,'PublicPark',37.59502548,127.0893095,'NS',1126010200,'����������','�߶��� ����� 85-41',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1418248,'��迭����ȭ����(��)',109,'PublicPark',37.48895873,126.9923298,'NW',1165010100,'����������','���ʱ� ��赿 852-14',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1421476,'ǳ������������������(��)',234,'PublicPark',37.52529597,127.1060433,'NW',1171010300,'����������','���ı� ǳ���� 387-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1421499,'���� ������(��)',45,'PublicPark',37.64219198,127.0218598,'NS',1130510300,'����������','���ϱ� ������ 36-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1422117,'�����뱳(��) ������������(��)',1,'PublicPark',37.53807905,127.0615982,'NS',1120011500,'����������','������ ������2�� 231-24',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1422436,'�������(A) ����������(��)',1,'PublicPark',37.53376703,127.0915421,'NS',1121510300,'����������','������ ���ǵ� 695-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1422437,'������ ȣ�ڱ� ����������(�ھ絿)(��)',1,'PublicPark',37.53376703,127.0915421,'NS',1121510500,'����������','������ �ھ絿 695-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1423412,'�������26��(��)',13,'PublicPark',37.49939254,127.0362257,'NS',1168010100,'����������','������ ���ﵿ 737-0 ���ﵿ 737',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1423650,'���� �ӽ� ����������(��)',81,'PublicPark',37.55471517,126.9347023,'NW',1144011000,'����������','������ ���굿 49-55',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1423651,'�����뿪 ȯ�� ����������(��)',98,'PublicPark',37.55102716,126.9364628,'NW',1144011100,'����������, ȯ�½ü� �ֺ�','������ �ż��� 93-35',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1424206,'�ٻ��Ʈ����������(��)',76,'PublicPark',37.55167324,127.0047041,'NW',1114016200,'����������','�߱� �Ŵ絿 432-612',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1424463,'DDP���� �����(��)',4,'PublicPark',37.56819448,127.0109259,'NS',1114016200,'����������','�߱� �Ŵ絿 222-3 (�ƽ�Ÿ�� ������)',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1424465,'DDP���������(��)',2,'PublicPark',37.56776634,127.0116634,'NS',1114016200,'����������','�߱� �Ŵ絿 204-92 (�߱� ����� ������� ��)',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1424585,'���¿���(��)',20,'PublicPark',37.53605046,126.9998797,'NS',1117013100,'����������','��걸 �ѳ��� 738-29 (���¿��� ���ϱ�ȹ ��Ÿ� ~ ����̼��� ��Ÿ� ����)',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1424603,'���ķ�TBS��(��)',4,'PublicPark',37.55984682,126.9895662,'NS',1114014200,'����������','�߱� ���嵿 4-7 (�����û ����2û�� �� TBS ��)',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1424640,'â�ǹ���(��)',40,'PublicPark',37.59153528,126.9685204,'NS',1111010100,'����������','���α� û� 15-57 (��������� 9�� �� ~ û�����б� 100m ��)',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1424675,'������3(��)',6,'PublicPark',37.57477165,126.9680541,'NS',1111011500,'����������','���α� ������ 240-0 (������� ~ ǳ�������̽��� ����������)',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1424677,'������2(��)',9,'PublicPark',37.57591236,126.9705612,'NS',1111011400,'����������','���α� ���ڵ� 131-0 (���ڵ�131 ���� ~ ���� R)',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1424692,'������1(��)',15,'PublicPark',37.57615099,126.9707468,'NS',1111011400,'����������','���α� ���ڵ� 20-0 (���� R ~ �ʿ 227 �ݰ�)',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1425391,'��������û����û��(��)',77,'PublicPark',37.528464,126.89437,'NW',1156011300,'����������','�������� ��굿3�� 560',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1425816,'��������(��)',14,'PublicPark',37.56733736,126.9834345,'NW',1114010700,'����������','�߱� �ﰢ�� 111-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1427620,'DDP����(��)',21,'PublicPark',37.56629306,127.0114605,'NS',1114016200,'����������','�߱� �Ŵ絿 2-36 (�Ѿ���� ����)',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1427676,'�ڿ��պ����� ������������(��)',20,'PublicPark',37.5680535,126.9783736,'NS',1114010300,'����������','�߱� �����1�� 82-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1427774,'�����ȷ�2��(���������)(��)',8,'PublicPark',37.56892823,126.9716575,'NS',1111012100,'����������','���α� �Ź���2�� 106-9 (�����ȷ� 2��(��Ƽ���� �� ~ ����ť�� ������))',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1429954,'����ܷ�(��)',5,'PublicPark',37.54735334,127.0026562,'NS',1117013100,'����������','��걸 �ѳ��� 9-19',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1430037,'���빮 ����(��)',3,'PublicPark',37.5595425,126.9756064,'NS',1114011200,'����������','�߱� ��â�� 282-10 (���빮�� ���ʹ� ���忷)',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1430045,'���빮����(��)',4,'PublicPark',37.55962034,126.9759897,'NS',1114011200,'����������','�߱� ��â�� 51-4',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1430344,'���ο�����������(��)',129,'PublicPark',0,0,'NW',1154510300,'����������','��õ�� ���ﵿ 139-2',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1430643,'������� ���ķ�(��)',22,'PublicPark',37.55556498,126.9800707,'NS',1114011200,'����������','�߱� ��â�� 205-107',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1430676,'�����(��)',8,'PublicPark',37.56596397,126.9140316,'NS',1144012500,'����������','������ ���굿 117-1 (�𷡳��� ������ �Ϻ� ~ ����2�� ����������)',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1430941,'����41Ÿ����(��)',24,'PublicPark',37.52771987,126.8758523,'NS',1147010200,'����������','��õ�� �� 917-2',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1431018,'��õ������(��)',11,'PublicPark',37.51895511,126.868601,'NS',1147010100,'����������','��õ�� ������ 320-3',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1431644,'Ȳ�о�̰�������������(��)',113,'PublicPark',37.56754712,127.0181331,'NW',1114016500,'����������','�߱� Ȳ�е� 755-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1431647,'�ø���Ÿ�� ��(��)',1,'PublicPark',37.56147499,126.9726222,'NS',1114016600,'����������','�߱� ���ҹ��� 135-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1431648,'�ø���Ÿ�� ��(��)',1,'PublicPark',37.56148405,126.9726444,'NS',1114016600,'����������','�߱� ���ҹ��� 135-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1431649,'�ø���Ÿ�� ��(��)',1,'PublicPark',37.5614936,126.9726671,'NS',1114016600,'����������','�߱� ���ҹ��� 135-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1431650,'�ø���Ÿ�� ��(��)',1,'PublicPark',37.56151205,126.9727173,'NS',1114016600,'����������','�߱� ���ҹ��� 135-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1431651,'�ø���Ÿ�� ��(��)',1,'PublicPark',37.56150218,126.9726923,'NS',1114016600,'����������','�߱� ���ҹ��� 135-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1431653,'�ø���Ÿ�� ��(��)',1,'PublicPark',37.56153066,126.972761,'NS',1114016600,'����������','�߱� ���ҹ��� 135-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1431654,'�ø���Ÿ�� ��(��)',1,'PublicPark',37.56153972,126.9727838,'NS',1114016600,'����������','�߱� ���ҹ��� 135-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1431655,'�ø���Ÿ�� ��(��)',1,'PublicPark',37.56158409,126.9729047,'NS',1114016600,'����������','�߱� ���ҹ��� 135-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1431656,'�ø���Ÿ�� ��(��)',1,'PublicPark',37.56159411,126.9729305,'NS',1114016600,'����������','�߱� ���ҹ��� 135-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1431657,'�ø���Ÿ�� ��(��)',1,'PublicPark',37.5616046,126.9729568,'NS',1114016600,'����������','�߱� ���ҹ��� 135-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1431658,'�ø���Ÿ�� ��(��)',1,'PublicPark',37.5616151,126.972982,'NS',1114016600,'����������','�߱� ���ҹ��� 135-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1431659,'�ø���Ÿ�� ��(��)',1,'PublicPark',37.56162512,126.9730059,'NS',1114016600,'����������','�߱� ���ҹ��� 135-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1431660,'�ø���Ÿ�� ��(��)',1,'PublicPark',37.56163513,126.9730299,'NS',1114016600,'����������','�߱� ���ҹ��� 135-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1431662,'�ø���Ÿ�� ��(��)',1,'PublicPark',37.56165422,126.9730778,'NS',1114016600,'����������','�߱� ���ҹ��� 135-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1431734,'������ΰ����γ�����������(��)',57,'PublicPark',37.56222654,126.995853,'NS',1114013400,'����������','�߱� ������2�� 181-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1431739,'������ ����������(��)',2066,'PublicPark',37.49342938,127.1111612,'NW',1171010700,'����������','���ı� ������ 600-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1432333,'���￪ ���� �������� ������(��)',33,'PublicPark',37.55783875,126.9703091,'NW',1114012000,'����������','�߱� ������2�� 122-15',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1432682,'����4�� ���ð� ���� ������(��)',198,'PublicPark',37.48968656,126.886952,'NW',1153010200,'����������','���α� ���ε� 741-44',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1433547,'�ѳ�������������(��)',250,'PublicPark',37.53496611,127.0001918,'NW',1117013100,'����������','��걸 �ѳ��� 685-46',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (171953,'���ҹ� �Ｚ����� ����������(��)',51,'PublicPark',37.56174725,126.9743227,'NW',1114016600,'����������','�߱� ���ҹ��� 122-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172936,'����������(��)',46,'PublicPark',37.53545496,126.8793819,'NW',1147010200,'����������','��õ�� �� 907-19',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173474,'�����1(��)',94,'PublicPark',0,0,'NW',1168010300,'����������','������ ������ 567-25',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (112413,'�����Ϻ������ ���������(��)',21,'PublicPark',37.52940604,126.9245189,'NS',1156011000,'����������','�������� ���ǵ��� 12-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1167708,'��ȯ����Ʈ(��)',1,'PublicPark',37.46479198,126.8906111,'NS',1154510200,'����������','��õ�� ���굿 1004-6',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1208944,'û��3�� (��)(��)',25,'PublicPark',37.56894623,126.9973307,'NS',1111015400,'����������','���α� ��絿 47-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1238938,'�ְ�6�������ֺ�(��)',41,'PublicPark',37.65326495,127.0616501,'NS',1135010500,'����������','����� ��赿 720-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (122514,'���ǵ�����(�ӽ����)(��)',64,'PublicPark',37.52296053,126.9166289,'NS',1156011000,'����������','�������� ���ǵ��� 2-11',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (135938,'�������69��(��)',29,'PublicPark',37.50604338,127.0527194,'NS',1168010500,'����������','������ �Ｚ�� 142-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (171941,'�ٻ굿 ����������(��)',86,'PublicPark',37.55454233,127.0085243,'NW',1114016200,'����������','�߱� �Ŵ絿 432-1584',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172052,'�Ͽսʸ���(�ǹ�)(��)',101,'PublicPark',37.56039538,127.0279149,'NW',1120010200,'����������','������ �Ͽսʸ��� 955-34',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172540,'�����(��)',66,'PublicPark',37.61469255,127.0410032,'NW',1129013800,'����������','���ϱ� ������ 230-110',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172892,'���������(��)',45,'PublicPark',37.52437054,126.8450986,'NW',1147010300,'����������','��õ�� �ſ��� 482-11',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172957,'���� 2-1���ð�����������(��)',91,'PublicPark',37.54982067,126.8613437,'NW',1150010200,'����������','������ ���̵� 531-5',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173093,'���θ���������������(��)',203,'PublicPark',37.4908967,126.8916049,'NW',1153010200,'����������','���α� ���ε� 139-82',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173277,'�븲��̰������ϰ���(��)',198,'PublicPark',37.49120884,126.9034886,'NW',1156013300,'����������','�������� �븲�� 870-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1366395,'����1�� ���������(��)',134,'PublicPark',37.50001376,126.8510351,'NW',1153010700,'����������','���α� ������ 134-8',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1367264,'������ ������(��)',19,'PublicPark',37.57449014,126.9741859,'NW',1111010700,'����������','���α� ������ 140-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368529,'�������� �� ���������(��)',1,'PublicPark',37.52159254,126.8913949,'NS',1156012500,'����������','�������� ����1�� 71-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173573,'���ʿ�������������(����)(��)',102,'PublicPark',37.49053768,127.0089788,'NW',1165010800,'����������','���ʱ� ���ʵ� 1542-12',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173876,'�ſ� 1����������(��)',146,'PublicPark',37.49559091,127.1424683,'NW',1171011300,'����������','���ı� �ſ��� 12-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1013181,'���嵿(�ǹ�)(��)',55,'PublicPark',37.56993875,127.0351452,'NW',1120010500,'����������','������ ���嵿 463-2',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1374119,'�������� �̷��ڵ���������(��)',1,'PublicPark',37.51625116,126.9067035,'NS',1156010400,'����������, �̷��� ������','�������� ��������3�� 618-496',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1380766,'â�Žֿ�2���� ���� �̷���������(��)',1,'PublicPark',37.58047113,127.0105897,'NS',1111017400,'����������, �̷��� ������','���α� â�ŵ� 37-16',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1412893,'�ھ�������� ����������(��)',24,'PublicPark',37.53380375,127.0816039,'NW',1121510500,'����������','������ �ھ絿 631-18',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1042405,'����ʱ�(��)',226,'PublicPark',37.51999434,127.0456589,'NW',1168010400,'����������','������ û�㵿 27-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1155939,'�Ÿ�����2����(��)',33,'PublicPark',37.48427865,126.92552,'NS',1162010200,'����������','���Ǳ� �Ÿ��� 1472-4',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1247682,'���1��������ġ(���������)(��)',77,'PublicPark',37.56942934,127.0670228,'NW',1123010600,'����������','���빮�� ��ȵ� 392-11',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1421560,'�����ͱ� ������(��)',54,'PublicPark',37.63561554,127.0195223,'NS',1130510300,'����������','���ϱ� ������ 605-185',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1430933,'�ο��׸�(��)',16,'PublicPark',37.53705061,126.8813275,'NS',1147010200,'����������','��õ�� �� 908-27',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1167762,'���굿 ��õ��(��)',25,'PublicPark',37.46658332,126.8900979,'NS',1154510200,'����������','��õ�� ���굿 181-4',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1169670,'�λ����A~B(��)',14,'PublicPark',37.47324683,126.8942071,'NS',1154510200,'����������','��õ�� ���굿 298-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1184355,'�Ȱ�����Ÿ� ��� ����������(��)',14,'PublicPark',37.55557105,126.923807,'NS',1144012000,'����������','������ ������ 345-6',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1209555,'����3����(��)',48,'PublicPark',37.57262406,126.9925913,'NS',1111015200,'����������','���α� ���͵� 36-11',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1219434,'��̿����� ���(��)',27,'PublicPark',37.5693013,127.0507527,'NS',1123010500,'����������','���빮�� ��ʸ��� 530-6',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1235875,'û��5��(5-1)(��)',17,'PublicPark',37.56957005,127.0086598,'NS',1114014800,'����������','�߱� ������6�� 17-442',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1236558,'��������Ҿ�(��)',13,'PublicPark',37.55482813,126.9820832,'NS',1114012100,'����������','�߱� ȸ����1�� 147-32',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1247636,'�ż���(��)',102,'PublicPark',37.57252061,127.0242568,'NW',1123010100,'����������','���빮�� �ż��� 114-29',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368573,'�������� �� ���������(��)',1,'PublicPark',37.52085376,126.8920304,'NS',1156011200,'����������','�������� ��굿2�� 71-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1369476,'ž�����(��)',4,'PublicPark',37.57120031,126.9878016,'NS',1111013800,'����������','���α� ����2�� 38-4',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1370975,'�츲�������������(��)',53,'PublicPark',37.59584824,127.0997506,'NS',1126010500,'����������','�߶��� ���쵿 486-10',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (118477,'�浵�󰡾� ���������(��)',17,'PublicPark',37.51994739,126.9305195,'NS',1156011000,'����������','�������� ���ǵ��� 44-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (120789,'�泲����Ʈ �� ���������(��)',1,'PublicPark',37.52467882,126.9021361,'NS',1156011300,'����������','�������� ��굿3�� 56-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (122062,'�������� �� ���������(��)',1,'PublicPark',37.52143768,126.8914592,'NS',1156012500,'����������','�������� ����1�� 71-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (124068,'��ǳ��(��)',100,'PublicPark',37.50015077,126.9139362,'NS',1156013200,'����������','�������� �ű浿 3641-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (127129,'��ȣ�뱳(��)(��)',30,'PublicPark',37.53090302,127.0248662,'NS',1168011000,'����������','������ �б����� 434-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (132787,'���μ�ȯ��397��(��)',87,'PublicPark',37.49290842,127.0580781,'NS',1168010600,'����������','������ ��ġ�� 623-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (150259,'��õ������(��)',33,'PublicPark',37.51714151,126.8647397,'NS',1147010100,'����������','��õ�� ������ 321-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (171802,'â��1������������(â�ϰ���)(��)',89,'PublicPark',37.57488143,127.0150838,'NW',1111017400,'����������','���α� â�ŵ� 82-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (171945,'�������������(��)',83,'PublicPark',37.55634366,127.0159761,'NW',1114016200,'����������','�߱� �Ŵ絿 333-260',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (171956,'��ȭ����������(��)',31,'PublicPark',37.55654107,127.0109609,'NW',1114016200,'����������','�߱� �Ŵ絿 425-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172021,'������ڻ�2(��)',196,'PublicPark',37.53266756,126.9630887,'NW',1117012800,'����������','��걸 �Ѱ���3�� 14-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172083,'������(�ǹ�)(��)',73,'PublicPark',37.55334376,127.0307424,'NW',1120010700,'����������','������ ��絿 341-59',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172149,'��䵿(�ǹ�)(��)',158,'PublicPark',37.56458022,127.0543217,'NW',1120012200,'����������','������ ��䵿 4-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172321,'��ġ��������������(��)',180,'PublicPark',37.58344393,127.0873474,'NW',1126010100,'����������','�߶��� ��� 570-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172580,'�μ��� ����������(��)',89,'PublicPark',37.63608367,127.0184499,'NW',1130510300,'����������','���ϱ� ������ 126-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172650,'â1��1����������(��)',42,'PublicPark',37.64713168,127.0371994,'NW',1132010700,'����������','������ â�� 657-37',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172874,'�̱ٵ����(��)',27,'PublicPark',37.56225368,126.9683494,'NW',1141010400,'����������','���빮�� �̱ٵ� 267-3',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172908,'�ɰ�������(��)',61,'PublicPark',37.533186,126.8245522,'NW',1147010300,'����������','��õ�� �ſ��� 152-38',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172923,'����2-1 ����������(��)',59,'PublicPark',37.56479289,126.9067217,'NW',1144012500,'����������','������ ���굿 199-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172947,'�Ѽ� ����������(��)',113,'PublicPark',37.552871,126.9493333,'NW',1144010900,'����������','������ ������ 24-170',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172971,'��ȭ��(��)(��)',66,'PublicPark',37.57730116,126.8133148,'NW',1150010900,'����������','������ ��ȭ�� 830-4',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173005,'����3��(��)',54,'PublicPark',37.56033753,126.8597755,'NW',1150010400,'����������','������ ���絿 1488-12',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173047,'��������(��)',79,'PublicPark',37.56332959,126.8530818,'NW',1150010400,'����������','������ ���絿 1480-10',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173123,'����1������������(��)',66,'PublicPark',37.46497295,126.8948092,'NW',1154510200,'����������','��õ�� ���굿 1006-94',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173185,'����������(��)',69,'PublicPark',37.51631443,126.8877957,'NW',1156012300,'����������','�������� ������5�� 3-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173235,'�ű�4������(��)',28,'PublicPark',37.50528074,126.9120866,'NW',1156013200,'����������','�������� �ű浿 236-10',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173289,'����������(��)',60,'PublicPark',37.48879884,126.9078418,'NW',1159010900,'����������','���۱� �Ŵ�浿 607-45',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173362,'����1����������(�� ��õ6�� ��ġ����������)(��)',79,'PublicPark',37.47993264,126.9606751,'NW',1162010100,'����������','���Ǳ� ��õ�� 1677-10',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1284070,'������(���߶�������)(��)',1,'PublicPark',37.60560212,127.0769277,'NS',1126010400,'����������','�߶��� ���� 250-39',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1359629,'�ε����� ����������(��)',12,'PublicPark',37.49100492,127.1251197,'NS',1171010700,'����������','���ı� ������ 107-18',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1366489,'����4�� �ֹμ��� ����������(��)',51,'PublicPark',37.497486,127.0003389,'NW',1165010700,'����������','���ʱ� ������ 74-7',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1366602,'�Ͽ��ͳ�(��)',26,'PublicPark',37.48285728,127.079372,'NW',1168011400,'����������','������ �Ͽ��� 722-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1366794,'�̾Ƶ�����������(��)',155,'PublicPark',37.6285679,127.0223596,'NW',1130510100,'����������','���ϱ� �̾Ƶ� 222-100',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1367534,'������(��)',7,'PublicPark',37.58385232,126.9111327,'NS',1141011900,'����������','���빮�� �ϰ��µ� 329-35',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1367883,'û��8��(��2)(��)',44,'PublicPark',37.57001582,127.0282785,'NS',1120010200,'����������','������ �Ͽսʸ��� 291-11',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368453,'������ ȣ�ڱ� ����������(B)(��)',30,'PublicPark',37.53174471,127.091915,'NS',1121510300,'����������','������ ���ǵ� 735-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368544,'�������� �� ���������(��)',1,'PublicPark',37.52154194,126.8916522,'NS',1156011200,'����������','�������� ��굿2�� 71-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368554,'�������� �� ���������(��)',1,'PublicPark',37.5209165,126.8922113,'NS',1156011200,'����������','�������� ��굿2�� 71-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173498,'�����������������(��)',132,'PublicPark',37.47153994,127.0487626,'NW',1165010200,'����������','���ʱ� ���絿 399-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173590,'���������������(��)',107,'PublicPark',37.47419614,127.0459555,'NW',1165010200,'����������','���ʱ� ���絿 301-6',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173696,'�̵�����Ʈ����������(��)',182,'PublicPark',37.50003784,127.0104628,'NW',1165010700,'����������','���ʱ� ������ 49-8',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173779,'õȣ3�� ��2������(��)',92,'PublicPark',37.54075002,127.1340836,'NW',1174010900,'����������','������ õȣ�� 174-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173877,'���ĵ� ����������(��)',86,'PublicPark',37.50704487,127.1133641,'NW',1171010400,'����������','���ı� ���ĵ� 128-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172602,'â2��4����������(��)',82,'PublicPark',37.64124421,127.0362985,'NW',1132010700,'����������','������ â�� 582-22',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172605,'���̵� ����������(��)',82,'PublicPark',37.65671789,127.011637,'NW',1130510400,'����������','���ϱ� ���̵� 105-2',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172607,'���迪��(��)',29,'PublicPark',37.61572968,127.0651839,'NW',1135010200,'����������','����� ���赿 60-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172632,'������ (��)',57,'PublicPark',37.67528134,127.086413,'NW',1135010500,'����������','����� ��赿 31-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172634,'�����꿪 ȯ��������(��)',159,'PublicPark',37.67902582,127.0559142,'NW',1135010500,'����������, ȯ�½ü� �ֺ�','����� ��赿 1268-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172643,'����������������(��)',108,'PublicPark',37.58049896,126.8989315,'NW',1138010100,'����������','���� ������ 78-2',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172647,'â����(��)(��)',549,'PublicPark',37.6543748,127.0490621,'NW',1132010700,'����������','������ â�� 1-9',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172660,'������ ���������(��)',17,'PublicPark',37.62012931,127.0774361,'NW',1135010300,'����������','����� ������ 633-19',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172683,'��������������(��)',40,'PublicPark',37.62446275,126.9235464,'NW',1138010300,'����������','���� �ұ��� 480-352',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172695,'�ǿ���ȭ����(��)',137,'PublicPark',37.63958481,127.0651987,'NW',1135010600,'����������','����� �߰赿 507-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172696,'����ٸ�����(��)',151,'PublicPark',37.64027756,127.0676992,'NW',1135010600,'����������','����� �߰赿 508-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172703,'����3������������(��)',160,'PublicPark',37.59345156,126.9153949,'NW',1138010700,'����������','���� ���ϵ� 580-4',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172777,'����1������������(��)',61,'PublicPark',37.62648828,126.915338,'NW',1138010400,'����������','���� ������ 9-112',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172840,'����1-1 ����������(��)',82,'PublicPark',37.54738044,126.9609133,'NW',1144010200,'����������','������ ������ 11-243',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172844,'����������(��)',508,'PublicPark',37.53890027,126.9426686,'NW',1144010700,'����������','������ ������ 36-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172881,'���1 ����������(��)',141,'PublicPark',37.57727445,126.8972079,'NW',1144012700,'����������','������ ��ϵ� 1621-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172900,'����������(��)',20,'PublicPark',37.51540127,126.8627138,'NW',1147010100,'����������','��õ�� ������ 323-13',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172901,'������������(��)',23,'PublicPark',37.51619431,126.8613528,'NW',1147010100,'����������','��õ�� ������ 323-18',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172902,'��ȭȸ������(��)',23,'PublicPark',37.51635934,126.8625557,'NW',1147010100,'����������','��õ�� ������ 323-25',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172903,'�ϴ�������(��)',30,'PublicPark',37.51523307,126.8615113,'NW',1147010100,'����������','��õ�� ������ 323-33',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172904,'�񵿰���������(��)',1092,'PublicPark',37.52769445,126.8780567,'NW',1147010200,'����������','��õ�� �� 915-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172907,'����1-1 ����������(��)',69,'PublicPark',37.55602414,126.9000466,'NW',1144012300,'����������','������ ������ 418-39',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172909,'��︲������(��)',32,'PublicPark',37.52216678,126.869297,'NW',1147010100,'����������','��õ�� ������ 318-2',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172912,'���� ����������(��)',135,'PublicPark',37.54199792,126.9452373,'NW',1144010900,'����������','������ ������ 174-3',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172914,'��ȭȸ������(��)',112,'PublicPark',37.51706546,126.8638425,'NW',1147010100,'����������','��õ�� ������ 322-5',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172916,'��2�� ����(��)',79,'PublicPark',37.54595116,126.874623,'NW',1147010200,'����������','��õ�� �� 525-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172917,'������������(��)',18,'PublicPark',37.52165189,126.8605661,'NW',1147010100,'����������','��õ�� ������ 1018-3',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172918,'��������������(��)',114,'PublicPark',37.53065845,126.8332183,'NW',1147010300,'����������','��õ�� �ſ��� 129-6',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172919,'�絿��������(��)',15,'PublicPark',37.52770881,126.8507388,'NW',1147010100,'����������','��õ�� ������ 935-17',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172921,'�ų�������(��)',50,'PublicPark',37.51759953,126.845883,'NW',1147010300,'����������','��õ�� �ſ��� 595-14',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172927,'�ѵΰ���������(��)',39,'PublicPark',37.54881413,126.8662059,'NW',1147010200,'����������','��õ�� �� 610-5',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172928,'�ٶ���������(��)',102,'PublicPark',37.51614281,126.8496672,'NW',1147010100,'����������','��õ�� ������ 1158-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172934,'�츮������(��)',45,'PublicPark',37.53665073,126.8791772,'NW',1147010200,'����������','��õ�� �� 907-8',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172935,'���칰 ������(��)',79,'PublicPark',37.52379759,126.8514175,'NW',1147010100,'����������','��õ�� ������ 943-25',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172937,'��ü����(��)',50,'PublicPark',37.53679353,126.8806468,'NW',1147010200,'����������','��õ�� �� 908-26',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172941,'�޸���������(��)',30,'PublicPark',37.54437302,126.8716376,'NW',1147010200,'����������','��õ�� �� 532-18',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172943,'����2-1 ����������(��)',62,'PublicPark',37.55778757,126.9015162,'NW',1144012300,'����������','������ ������ 428-5',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172945,'����7�� �ѻ����ȸ ��(��)',125,'PublicPark',37.51483512,126.8601753,'NW',1147010100,'����������','��õ�� ������ 324-11',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172952,'��3�� �ؿ�������(��)',64,'PublicPark',37.54193427,126.8651302,'NW',1147010200,'����������','��õ�� �� 711-6',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172956,'��ƾ���Ʈ(��)',49,'PublicPark',37.57155732,126.8416529,'NW',1150010400,'����������','������ ���絿 1457-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172962,'ȭ��7-1 ���ð�����������(��)',86,'PublicPark',37.53601946,126.8391666,'NW',1150010300,'����������','������ ȭ� 370-63',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172965,'���޷�������(��)',107,'PublicPark',37.52954694,126.8360691,'NW',1147010300,'����������','��õ�� �ſ��� 226-9',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172967,'�ѿ�������(��)',21,'PublicPark',37.51995355,126.8317642,'NW',1147010300,'����������','��õ�� �ſ��� 957-10',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172968,'��ȭ��ü��(��)',18,'PublicPark',37.57955362,126.8146378,'NW',1150010900,'����������','������ ��ȭ�� 824-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172969,'���ֱ�������(��)',16,'PublicPark',37.52220036,126.8348431,'NW',1147010300,'����������','��õ�� �ſ��� 963-2',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172970,'��ȭ��(��)(��)',66,'PublicPark',37.57757395,126.8121746,'NW',1150010900,'����������','������ ��ȭ�� 829-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172972,'�賲������(��)',22,'PublicPark',37.51541161,126.8415256,'NW',1147010300,'����������','��õ�� �ſ��� 562-7',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172974,'�ſ�7��(��)',7,'PublicPark',37.5224254,126.8354223,'NW',1147010300,'����������','��õ�� �ſ��� 964-11',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172979,'��ȭ�꿪ȯ��(��)',331,'PublicPark',37.57224302,126.8051898,'NW',1150010900,'����������, ȯ�½ü� �ֺ�','������ ��ȭ�� 845-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172983,'�ſ�������(��)',107,'PublicPark',37.53444512,126.8285528,'NW',1147010300,'����������','��õ�� �ſ��� 166-23',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172992,'�Ű�������(��)',18,'PublicPark',37.5170616,126.8410381,'NW',1147010300,'����������','��õ�� �ſ��� 549-18',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172993,'ȭ��5-1 ���ð�����������(��)',27,'PublicPark',37.54391908,126.8397247,'NW',1150010300,'����������','������ ȭ� 1030-33',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173001,'���׵�(������)(��)',11,'PublicPark',37.56034439,126.8106649,'NW',1150010800,'����������','������ ���׵� 42-8',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173009,'ȭ��2-1 ���ð�����������(��)',60,'PublicPark',37.53604907,126.8524573,'NW',1150010300,'����������','������ ȭ� 167-10',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173013,'ȭ��6-1���ð�����������(��)',300,'PublicPark',37.55298682,126.8484342,'NW',1150010300,'����������','������ ȭ� 1103-6',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173014,'ȭ��5-2 ���ð�����������(��)',25,'PublicPark',37.54423955,126.8407541,'NW',1150010300,'����������','������ ȭ� 1056-2',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173018,'ȭ�-2 ���ð�����������(��)',100,'PublicPark',37.54432744,126.8484532,'NW',1150010300,'����������','������ ȭ� 46-127',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173019,'ȭ�-1 ���ð�����������(��)',99,'PublicPark',37.53975106,126.8497943,'NW',1150010300,'����������','������ ȭ� 56-127',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173020,'ȭ��8-2 ���ð�����������(��)',84,'PublicPark',37.53771095,126.8503608,'NW',1150010300,'����������','������ ȭ� 410-4',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173021,'ȭ�� 8-1 ���ð�����������(��)',53,'PublicPark',37.53851801,126.8488947,'NW',1150010300,'����������','������ ȭ� 410-60',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173028,'ȭ��5-3 ���ð�����������(��)',17,'PublicPark',37.54338824,126.8423255,'NW',1150010300,'����������','������ ȭ� 1060-18',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173048,'�����ٸ�������(��)',52,'PublicPark',37.52421803,126.8328852,'NW',1147010300,'����������','��õ�� �ſ��� 915-4',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173073,'����5����������������(��)',81,'PublicPark',37.50085863,126.8860481,'NW',1153010200,'����������','���α� ���ε� 549-73',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173077,'����3������������(��)',20,'PublicPark',37.48502453,126.8884429,'NW',1153010200,'����������','���α� ���ε� 797-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173089,'����������������(��)',37,'PublicPark',37.48257121,126.8897318,'NW',1153010300,'����������','���α� �������� 118-11',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173091,'ȿ������������(��)',69,'PublicPark',37.46077721,126.9109648,'NW',1154510300,'����������','��õ�� ���ﵿ 3-129',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173104,'��ô1����������������(��)',88,'PublicPark',37.50228328,126.8639327,'NW',1153010600,'����������','���α� ��ô�� 52-54',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173117,'��������� �������(��)',176,'PublicPark',37.48487296,126.8803933,'NW',1154510100,'����������','��õ�� ���굿 505-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173129,'����3������������(��)',50,'PublicPark',37.4794979,126.9063548,'NW',1154510200,'����������','��õ�� ���굿 898-24',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173139,'����2������������(��)',81,'PublicPark',37.4914815,126.8883121,'NW',1153010200,'����������','���α� ���ε� 317-187',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173141,'����1�� ����������(��)',81,'PublicPark',37.45065275,126.8967259,'NW',1154510300,'����������','��õ�� ���ﵿ 555-3',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173142,'����2�� ����������(��)',66,'PublicPark',37.46385909,126.9000615,'NW',1154510200,'����������','��õ�� ���굿 1050-17',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173150,'�ű�ȯ��(5ȣ��)(��)',88,'PublicPark',37.51775233,126.9146039,'NW',1156010200,'����������, ȯ�½ü� �ֺ�','�������� ��������1�� 35-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173152,'������������1����(��)',194,'PublicPark',37.51440196,126.9091795,'NW',1156010100,'����������','�������� �������� 592-10',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173153,'����3�� ����������(��)',44,'PublicPark',37.44294834,126.9057481,'NW',1154510300,'����������','��õ�� ���ﵿ 942-6',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173160,'���굿����������(��)',130,'PublicPark',37.47666086,126.8955775,'NW',1154510100,'����������','��õ�� ���굿 148-28',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173184,'�����ٸ���������(��)',50,'PublicPark',37.51544615,126.8937947,'NW',1156012100,'����������','�������� ������3�� 60-2',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173186,'����������1����(��)',34,'PublicPark',37.52091713,126.910092,'NW',1156010300,'����������','�������� ��������2�� 230-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173187,'����2������(��)',75,'PublicPark',37.53644937,126.8941338,'NW',1156012800,'����������','�������� ����4�� 96-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173192,'��������ûȯ��(��)',66,'PublicPark',37.52462558,126.8956473,'NW',1156011300,'����������, ȯ�½ü� �ֺ�','�������� ��굿3�� 370-4',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173193,'���1������(��)',91,'PublicPark',37.52376124,126.8996074,'NW',1156011300,'����������','�������� ��굿3�� 6-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173196,'�ű濪��(1ȣ��)(��)',25,'PublicPark',37.5160019,126.91747,'NW',1156013200,'����������','�������� �ű浿 54-2',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173208,'���2��(��)',30,'PublicPark',37.52824898,126.9077945,'NW',1156011700,'����������','�������� ��굿 121-105',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173218,'����������2����(��)',28,'PublicPark',37.52378399,126.9085816,'NW',1156010800,'����������','�������� ��������7�� 29-122',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173229,'�ű�6������(��)',132,'PublicPark',37.50267008,126.9113672,'NW',1156013200,'����������','�������� �ű浿 3203-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173238,'�븲3������(��)',105,'PublicPark',37.4980273,126.9004971,'NW',1156013300,'����������','�������� �븲�� 745-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173245,'�븲2������(��)',154,'PublicPark',37.49153125,126.8997271,'NW',1156013300,'����������','�������� �븲�� 1072-25',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173246,'�����ʵ��б�����(��)',145,'PublicPark',37.50810149,126.9074586,'NW',1156013200,'����������','�������� �ű浿 285-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173250,'�븲1������(��)',155,'PublicPark',37.49314103,126.9016337,'NW',1156013300,'����������','�������� �븲�� 834-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173261,'������ (���� ������ ���� ��� ������)(��)',47,'PublicPark',37.50858008,126.9629759,'NW',1159010500,'����������','���۱� �漮�� 105-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173262,'����������(��)',26,'PublicPark',37.50834696,126.8967964,'NW',1156011800,'����������','�������� ������ 226-13',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173285,'����������(��)',22,'PublicPark',37.49873369,126.9274502,'NW',1159010900,'����������','���۱� �Ŵ�浿 351-14',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173291,'������������(��)',40,'PublicPark',37.50018478,126.9262925,'NW',1159010800,'����������','���۱� ��浿 395-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173299,'�ű�4��1�����������ϰ���(��)',130,'PublicPark',37.50718232,126.9117476,'NW',1156013200,'����������','�������� �ű浿 232-20',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173317,'����Ż��(��)',78,'PublicPark',37.49039184,126.9234059,'NW',1159010900,'����������','���۱� �Ŵ�浿 431-3',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173329,'���Ű���������(��)',174,'PublicPark',37.469935,126.9292853,'NW',1162010200,'����������','���Ǳ� �Ÿ��� 366-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173333,'������ ��1����������(��)',108,'PublicPark',37.48108305,126.9057404,'NW',1162010200,'����������','���Ǳ� �Ÿ��� 571-6',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173350,'������25��32(��)',26,'PublicPark',0,0,'NW',1168010700,'����������','������ �Ż絿 564-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173353,'�������1����������(��)',133,'PublicPark',37.48858808,126.9345485,'NW',1162010100,'����������','���Ǳ� ��õ�� 110-4',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173359,'��ġ2��ȭ����(��)',159,'PublicPark',37.50227954,127.0642044,'NW',1168010600,'����������','������ ��ġ�� 980-9',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173364,'��������1����������(�������� �����ڿ켱������)(��)',65,'PublicPark',37.47570005,126.9792942,'NW',1162010300,'����������','���Ǳ� ������ 1063-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173389,'�����2(��)',132,'PublicPark',37.47725982,127.0664774,'NW',1168010300,'����������','������ ������ 126-2',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173405,'������������(��)',98,'PublicPark',37.47860952,127.0413691,'NW',1165010200,'����������','���ʱ� ���絿 90-2',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173424,'�Ͽ���(��)',67,'PublicPark',37.48468629,127.0840899,'NW',1168011400,'����������','������ �Ͽ��� 716-2',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173437,'źõ������(��)',996,'PublicPark',37.51443201,127.0662917,'NW',1168010500,'����������','������ �Ｚ�� 171-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173440,'������32��15(��)',21,'PublicPark',37.48430646,127.0434181,'NW',1168011800,'����������','������ ��� 516-2',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173447,'����� 421(��)',29,'PublicPark',37.49782255,127.0564863,'NW',1168010600,'����������','������ ��ġ�� 939-21',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173452,'��翪 ���������(��)',207,'PublicPark',37.47543791,126.9837737,'NW',1165010100,'����������','���ʱ� ��赿 507-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173468,'����������(��)',149,'PublicPark',37.48949036,127.0662384,'NW',1168010300,'����������','������ ������ 183-2',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173472,'��û��(��)',169,'PublicPark',37.49495555,127.0793237,'NW',1168010300,'����������','������ ������ 13-2',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173485,'�̼�����������(��)',162,'PublicPark',37.49609844,126.9852359,'NW',1165010100,'����������','���ʱ� ��赿 761-3',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1283042,'�ָ��Ÿ�����������(��)',26,'PublicPark',37.59382361,127.0776319,'NS',1126010200,'����������','�߶��� ����� 127-19',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1284245,'���ؾ�����������(��)',67,'PublicPark',37.59767034,127.0936699,'NS',1126010500,'����������','�߶��� ���쵿 490-21',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1344768,'����緯�����μ��;հ���������(��)',8,'PublicPark',37.56819143,126.9310626,'NS',1141011700,'����������','���빮�� ���� 131-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1356076,'����õ�� ����������(��)',77,'PublicPark',37.50728487,127.1362386,'NS',1171011200,'����������','���ı� ���ݵ� 97-68',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1359444,'�� ��ñ� ������(��)',54,'PublicPark',37.50917165,127.0797426,'NS',1171010100,'����������','���ı� ��ǵ� 177-8',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1362843,'�ε����� ����������(��)',37,'PublicPark',37.48931787,127.1223528,'NS',1171010800,'����������','���ı� ������ 3-2',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1364466,'�����21��7(��)',78,'PublicPark',0,0,'NW',1168010100,'����������','������ ���ﵿ 795-38',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1364468,'źõ��2ȣ(��)',314,'PublicPark',0,0,'NW',1168011400,'����������','������ �Ͽ��� 4-47',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1364472,'�����ʱ�(��)',187,'PublicPark',37.49192117,127.0812916,'NW',1168011400,'����������','������ �Ͽ��� 617-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368548,'�������� �� ���������(��)',1,'PublicPark',37.52121178,126.8918577,'NS',1156011200,'����������','�������� ��굿2�� 71-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368549,'�������� �� ���������(��)',1,'PublicPark',37.52116533,126.8918981,'NS',1156011200,'����������','�������� ��굿2�� 71-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368550,'�������� �� ���������(��)',1,'PublicPark',37.52112008,126.8919416,'NS',1156011200,'����������','�������� ��굿2�� 71-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368551,'�������� �� ���������(��)',1,'PublicPark',37.52101768,126.892063,'NS',1156011200,'����������','�������� ��굿2�� 71-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368552,'�������� �� ���������(��)',1,'PublicPark',37.52098435,126.8921079,'NS',1156011200,'����������','�������� ��굿2�� 71-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368553,'�������� �� ���������(��)',1,'PublicPark',37.52094983,126.8921588,'NS',1156011200,'����������','�������� ��굿2�� 71-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368557,'�������� �� ���������(��)',1,'PublicPark',37.52088675,126.8922637,'NS',1156011200,'����������','�������� ��굿2�� 71-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368558,'�������� �� ���������(��)',1,'PublicPark',37.520857,126.8923191,'NS',1156011200,'����������','�������� ��굿2�� 71-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368559,'�������� �� ���������(��)',1,'PublicPark',37.52083201,126.892367,'NS',1156011200,'����������','�������� ��굿2�� 71-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368568,'�������� �� ���������(��)',1,'PublicPark',37.52093831,126.8919435,'NS',1156011200,'����������','�������� ��굿2�� 71-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173488,'�ù��ǽ�����(����õ������ ����) ����������(��)',149,'PublicPark',37.4723039,127.0382265,'NW',1165010200,'����������','���ʱ� ���絿 237-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173499,'����� 327(��)',22,'PublicPark',37.496258,127.0517404,'NW',1168010100,'����������','������ ���ﵿ 765-22',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173521,'�������������������������(��)',94,'PublicPark',37.50486336,127.0183587,'NW',1165010700,'����������','���ʱ� ������ 730-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173522,'�߾ӷΰ�����������(��)',50,'PublicPark',37.48225393,126.9920358,'NW',1165010100,'����������','���ʱ� ��赿 977-17',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173528,'�𳲹�ȭü������(��)',93,'PublicPark',37.47217874,127.0443181,'NW',1165010200,'����������','���ʱ� ���絿 310-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173530,'������ ������ġ ��ġ������(��)',86,'PublicPark',37.50184688,127.0597343,'NW',1168010600,'����������','������ ��ġ�� 962-23',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173534,'ġ����������(��)',115,'PublicPark',37.5102479,127.0464583,'NW',1168010500,'����������','������ �Ｚ�� 113-26',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173553,'�������� ȯ��������(��)',656,'PublicPark',37.48801285,127.09995,'NW',1168011500,'����������, ȯ�½ü� �ֺ�','������ ������ 735-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173578,'�����1����������(���Ÿ�3�� ����������)(��)',119,'PublicPark',37.47220821,126.9231583,'NW',1162010200,'����������','���Ǳ� �Ÿ��� 626-82',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173582,'�𱸺���������(��)',58,'PublicPark',37.50474149,127.0209818,'NW',1165010700,'����������','���ʱ� ������ 741-3',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173591,'õȣ������ ������(��)',178,'PublicPark',37.54482977,127.1218993,'NW',1174010900,'����������','������ õȣ�� 329-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173646,'��õ������������(��)',222,'PublicPark',37.52231457,127.1029033,'NW',1171010200,'����������','���ı� ��õ�� 14-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173665,'����ȭ����������(��)',69,'PublicPark',37.49237053,127.0167808,'NW',1165010800,'����������','���ʱ� ���ʵ� 1666-17',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173673,'�����ٸ�����(��)',286,'PublicPark',37.48599491,127.1246487,'NW',1171010800,'����������','���ı� ������ 38-3',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173685,'���뿪����������(��)',32,'PublicPark',37.49383778,127.0155087,'NW',1165010800,'����������','���ʱ� ���ʵ� 1673-7',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173686,'õȣ1��(��)',192,'PublicPark',37.54490883,127.1364169,'NW',1174010900,'����������','������ õȣ�� 221-3',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173691,'�ذ�����������(��)',342,'PublicPark',37.54119808,127.128712,'NW',1174010900,'����������','������ õȣ�� 404-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173692,'��õ��1 ����������(��)',220,'PublicPark',37.49512534,127.1556049,'NW',1171011400,'����������','���ı� ��õ�� 214-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173698,'���긶������������(��)',122,'PublicPark',37.47009388,127.0443261,'NW',1165010200,'����������','���ʱ� ���絿 370-5',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173701,'������������������(��)',79,'PublicPark',37.49715662,126.9987789,'NW',1165010700,'����������','���ʱ� ������ 90-7',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173740,'õȣ3��(��)',190,'PublicPark',37.53890256,127.1332549,'NW',1174010900,'����������','������ õȣ�� 167-195',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173749,'���̵� ����������(��)',119,'PublicPark',37.51375908,127.1137851,'NW',1171011100,'����������','���ı� ���̵� 52-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173750,'���ϵ�(��)',254,'PublicPark',37.55097027,127.1429222,'NW',1174010100,'����������','������ ���ϵ� 312-250',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173752,'������ ȯ��������(��)',367,'PublicPark',37.4702319,127.1285805,'NW',1171010900,'����������, ȯ�½ü� �ֺ�','���ı� ������ 561-9',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173754,'�ƽþ�������(����������)(��)',108,'PublicPark',37.5102769,127.0762463,'NW',1171010100,'����������','���ı� ��ǵ� 84-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173759,'������ ����������(��)',25,'PublicPark',37.55756224,127.1571764,'NW',1174010200,'����������','������ ����� 300-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173776,'����1������(��)',54,'PublicPark',37.4944248,127.1188451,'NW',1171010700,'����������','���ı� ������ 98-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173810,'�Ͽ�1��(��)',64,'PublicPark',37.48948769,127.0817655,'NW',1168011400,'����������','������ �Ͽ��� 684-8',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173821,'��õ��2����������(��)',113,'PublicPark',37.49436437,127.1561092,'NW',1171011400,'����������','���ı� ��õ�� 364-5',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173828,'�����ѿ�����(��)',19,'PublicPark',37.56005799,126.9931608,'NW',1114013800,'����������','�߱� �ʵ�2�� 83-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173831,'������(��)',186,'PublicPark',37.68764419,127.0406603,'NW',1132010800,'����������','������ ������ 282-26',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173864,'�ʵ� ����������(��)',48,'PublicPark',37.5566019,126.9958942,'NW',1114013900,'����������','�߱� �ʵ�3�� 62-12',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173867,'õȣ��(��)',1430,'PublicPark',37.53693126,127.129051,'NW',1174010800,'����������','������ ������ 18-4',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173870,'����������������(��)',198,'PublicPark',37.50025109,127.0958954,'NW',1171010600,'����������','���ı� ������ 175-8',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173874,'�ȸ�(��)',174,'PublicPark',37.53150994,127.1299606,'NW',1174010800,'����������','������ ������ 512-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173880,'���̰�� ������(��)',62,'PublicPark',37.5019629,127.1022954,'NW',1171010500,'����������','���ı� ���̵� 248-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173885,'����2�� ����(��)',91,'PublicPark',37.49483782,127.119624,'NW',1171010700,'����������','���ı� ������ 80-2',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173890,'ǳ��2 ����������(��)',81,'PublicPark',37.53604678,127.116075,'NW',1171010300,'����������','���ı� ǳ���� 175-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173891,'ǳ��1����������(��)',65,'PublicPark',37.53551936,127.1202916,'NW',1171010300,'����������','���ı� ǳ���� 154-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (173896,'���ıٸ����� ������(��)',187,'PublicPark',37.50635304,127.1100041,'NW',1171010400,'����������','���ı� ���ĵ� 113-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (781508,'ȭ��3-1���ð�����������(��)',99,'PublicPark',37.54177892,126.8347325,'NW',1150010300,'����������','������ ȭ� 1045-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (781509,'ȭ��4-1���ð�����������(��)',138,'PublicPark',37.53431225,126.8610576,'NW',1150010300,'����������','������ ȭ� 809-26',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (781511,'ȭ��1-1 ���ð�����������(��)',98,'PublicPark',37.53142687,126.839887,'NW',1150010300,'����������','������ ȭ� 424-94',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (782904,'ȫ�� 1�� ��4 ���� ������(��)',105,'PublicPark',37.60142195,126.9489426,'NW',1141011800,'����������','���빮�� ȫ���� 11-23',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (788447,'âõ�߱� ����������(��)',280,'PublicPark',37.55473789,126.9394374,'NW',1144011000,'����������','������ ���굿 33-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (789092,'������������(��)',40,'PublicPark',37.52726441,126.855633,'NW',1147010100,'����������','��õ�� ������ 919-6',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (790441,'��ȭ ����������(��)',66,'PublicPark',37.54155295,126.9499337,'NW',1144010400,'����������','������ ��ȭ�� 557-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (881056,'������������(��)',48,'PublicPark',37.53344049,126.8766097,'NW',1147010200,'����������','��õ�� �� 905-32',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (892053,'��ȭ����������(��)',64,'PublicPark',37.49982342,126.9355137,'NW',1159010200,'����������','���۱� �󵵵� 244-183',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (911542,'���굿�����������ϰ���������(��)',77,'PublicPark',37.61475594,126.9084534,'NW',1138010500,'����������','���� ���굿 340-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (968455,'�������� ����������(��)',87,'PublicPark',37.62617605,127.0134424,'NW',1130510100,'����������','���ϱ� �̾Ƶ� 791-1360',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (968483,'������ ����������(��)',120,'PublicPark',37.64161672,127.0150126,'NW',1130510300,'����������','���ϱ� ������ 349-3',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (968503,'��縶���������� ����������(��)',95,'PublicPark',37.62274538,127.0184279,'NW',1130510100,'����������','���ϱ� �̾Ƶ� 748-2',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (980509,'���������(��)',37,'PublicPark',37.61217998,126.9565353,'NW',1111018200,'����������','���α� ���⵿ 139-9',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (984617,'�ŵ�����ȯ��������(��)',65,'PublicPark',37.50733447,126.8916532,'NW',1153010200,'����������, ȯ�½ü� �ֺ�','���α� ���ε� 1-4',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (984688,'���ξ�Ʈ�븮 ����������(��)',245,'PublicPark',37.4969958,126.8895983,'NW',1153010200,'����������','���α� ���ε� 102-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1010089,'�ʾȻ�ٸ�����������(��)',68,'PublicPark',37.64823358,127.0410103,'NW',1132010700,'����������','������ â�� 48-4',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1012254,'���齺Ÿ���(�ٸ�����)(��)',167,'PublicPark',37.64391748,127.0585674,'NW',1135010500,'����������','����� ��赿 770-2',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1025695,'���������ڰ���б����ϰ���(��)',98,'PublicPark',37.51520496,126.915116,'NW',1156013200,'����������','�������� �ű浿 184-3',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1025696,'���ٸ��������ϰ���(��)',190,'PublicPark',37.52552609,126.8957941,'NW',1156011300,'����������','�������� ��굿3�� 385-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1025697,'�븲���(��)',192,'PublicPark',37.49965667,126.8948384,'NW',1156013300,'����������','�������� �븲�� 780-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (76357,'ū������(��)',43,'PublicPark',37.62355035,127.0250239,'NS',1130510100,'����������','���ϱ� �̾Ƶ� 309-14',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (77533,'����õ ������(��)',69,'PublicPark',37.64366774,127.0245742,'NS',1130510300,'����������','���ϱ� ������ 181-40',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (110855,'���ǵ�������3 ���������(��)',6,'PublicPark',37.52806593,126.9240465,'NS',1156011000,'����������','�������� ���ǵ��� 16-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (111189,'���ǵ�������2 ���������(��)',14,'PublicPark',37.52739599,126.9229692,'NS',1156011000,'����������','�������� ���ǵ��� 16-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (111283,'�������� ���������(��)',11,'PublicPark',37.5272794,126.9198031,'NS',1156011000,'����������','�������� ���ǵ��� 16-0 ����Ư���� ���������ü���������',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (111643,'������� �ճ��������(��)',13,'PublicPark',37.53016114,126.925017,'NS',1156011000,'����������','�������� ���ǵ��� 10',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (111804,'���ƺ����� ���������(��)',10,'PublicPark',37.52951529,126.9201422,'NS',1156011000,'����������','�������� ���ǵ��� 14-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (112111,'�߼ұ���������վ� ���������(��)',5,'PublicPark',37.52840888,126.9216278,'NS',1156011000,'����������','�������� ���ǵ��� 16-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (113205,'�泲����Ʈ �� ���������(��)',1,'PublicPark',37.52456958,126.9020972,'NS',1156011300,'����������','�������� ��굿3�� 56-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (113229,'�泲����Ʈ �� ���������(��)',1,'PublicPark',37.52451496,126.9020778,'NS',1156011300,'����������','�������� ��굿3�� 56-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (114389,'�泲����Ʈ �� ���������(��)',1,'PublicPark',37.52446034,126.9020584,'NS',1156011300,'����������','�������� ��굿3�� 56-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (114486,'�泲����Ʈ �� ���������(��)',1,'PublicPark',37.52440572,126.902039,'NS',1156011300,'����������','�������� ��굿3�� 56-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (116070,'�Ե�ĳ���� ���������(��)',9,'PublicPark',37.52036023,126.9269076,'NS',1156011000,'����������','�������� ���ǵ��� 36',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (116072,'������(��)',23,'PublicPark',37.53249683,126.900769,'NS',1156011500,'����������','�������� ��굿5�� 4-9',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1372387,'������� ����������(��)',79,'PublicPark',37.48672823,127.1248481,'NS',1171010800,'����������','���ı� ������ 39-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1372518,'���⵿139(��)',19,'PublicPark',37.61431133,126.9551308,'NS',1111018200,'����������','���α� ���⵿ 139-28',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1372581,'��������(��)',15,'PublicPark',37.61115994,126.9569011,'NS',1111018200,'����������','���α� ���⵿ 139-28',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1372649,'���꼺�� �������� ������(��)',9,'PublicPark',37.58044952,127.0091014,'NS',1111017400,'����������','���α� â�ŵ� 615-62',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1372691,'û��5��(��)-ȭ����������(��)',4,'PublicPark',37.5702697,127.0068391,'NS',1111016400,'����������','���α� ����6�� 315-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1372873,'�����꿪 ȯ��������(��)',364,'PublicPark',37.68972069,127.0448386,'NW',1132010800,'����������, ȯ�½ü� �ֺ�','������ ������ 288-19',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1373954,'����ȸ���� �̷��ڵ���������(��)',20,'PublicPark',37.56825454,127.0061965,'NS',1114014800,'����������, �̷��� ������','�߱� ������6�� 18-14',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1373985,'�߾��Ƿ���� �̷��ڵ��� ������(��)',12,'PublicPark',37.56733814,127.007245,'NS',1114014800,'����������, �̷��� ������','�߱� ������6�� 18-79',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1374001,'���빮����3������Ʈ �̷��ڵ���������(��)',9,'PublicPark',37.56095726,126.9783051,'NS',1114011600,'����������, �̷��� ������','�߱� ���빮��3�� 13-3',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1374036,'���빮���������󰡾� �̷���������(��)',14,'PublicPark',37.5611823,126.9796944,'NS',1114011600,'����������, �̷��� ������','�߱� ���빮��3�� 13-3',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1374070,'���빮���忬���󰡾� �̷��ڵ���������(��)',19,'PublicPark',37.55769657,126.9765723,'NS',1114011200,'����������, �̷��� ������','�߱� ��â�� 235-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1374088,'���ｺ��������� �̷��ڵ���������(��)',10,'PublicPark',37.55583139,126.9732847,'NS',1114012000,'����������, �̷��� ������','�߱� ������2�� 125-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1374090,'�������� ȯ��������(��)',81,'PublicPark',37.4868589,127.1011147,'NW',1168011500,'����������, ȯ�½ü� �ֺ�','������ ������ 727-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1374110,'�߾ӿ�ü���� �̷��ڵ���������(��)',19,'PublicPark',37.56198039,126.9818433,'NS',1114012400,'����������, �̷��� ������','�߱� �湫��1�� 15-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1374115,'�������� �̷��ڵ���������(��)',1,'PublicPark',37.51623742,126.9066653,'NS',1156010400,'����������, �̷��� ������','�������� ��������3�� 618-496',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1374116,'�������� �̷��ڵ���������(��)',1,'PublicPark',37.5162416,126.906678,'NS',1156010400,'����������, �̷��� ������','�������� ��������3�� 618-496',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1374118,'�������� �̷��ڵ���������(��)',1,'PublicPark',37.51624638,126.9066915,'NS',1156010400,'����������, �̷��� ������','�������� ��������3�� 618-496',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1374120,'�������� �̷��ڵ���������(��)',1,'PublicPark',37.51625534,126.9067162,'NS',1156010400,'����������, �̷��� ������','�������� ��������3�� 618-496',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1374126,'�������� �̷��ڵ���������(��)',1,'PublicPark',37.51626012,126.9067289,'NS',1156010400,'����������, �̷��� ������','�������� ��������3�� 618-496',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1374128,'�������� �̷��ڵ���������(��)',1,'PublicPark',37.51626848,126.9067536,'NS',1156010400,'����������, �̷��� ������','�������� ��������3�� 618-496',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1374129,'�������� �̷��ڵ���������(��)',1,'PublicPark',37.51627326,126.9067655,'NS',1156010400,'����������, �̷��� ������','�������� ��������3�� 618-496',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1374130,'�������� �̷��ڵ���������(��)',1,'PublicPark',37.51627804,126.9067775,'NS',1156010400,'����������, �̷��� ������','�������� ��������3�� 618-496',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1374131,'�������� �̷��ڵ���������(��)',1,'PublicPark',37.51628222,126.9067902,'NS',1156010400,'����������, �̷��� ������','�������� ��������3�� 618-496',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1374132,'�������� �̷��ڵ���������(��)',1,'PublicPark',37.5162864,126.9068022,'NS',1156010400,'����������, �̷��� ������','�������� ��������3�� 618-496',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1374133,'�������� �̷��ڵ���������(��)',1,'PublicPark',37.51629177,126.9068134,'NS',1156010400,'����������, �̷��� ������','�������� ��������3�� 618-496',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1366393,'�ϴð���������(��)',198,'PublicPark',37.48713079,126.8808015,'NW',1153010300,'����������','���α� �������� 1-11',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1366394,'����1������������(��)',111,'PublicPark',37.50455714,126.8460846,'NW',1153010700,'����������','���α� ������ 416-2',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1366430,'���ΰ���������(��)',376,'PublicPark',37.5371074,126.8290595,'NW',1147010300,'����������','��õ�� �ſ��� 263-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1366487,'����ù��ǽ�(����)�� ����������(��)',50,'PublicPark',37.47037133,127.0385513,'NW',1165010200,'����������','���ʱ� ���絿 237-2',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1366504,'����������������(��)',122,'PublicPark',37.549976,127.0680728,'NW',1120011800,'����������','������ ������ 68-57',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1366527,'���۴뱳(��)',93,'PublicPark',37.5186554,126.9830878,'NW',1117012900,'����������','��걸 ���̵� 301-160',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1366541,'����Ʒ�(��)',130,'PublicPark',37.6687411,127.0778095,'NW',1135010500,'����������','����� ��赿 65-40',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1366575,'������ ��� ����������(��)',13,'PublicPark',37.55955924,126.9066011,'NW',1144012300,'����������','������ ������ 478-10',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1366576,'��ȭ�� ȯ��������(��)',399,'PublicPark',37.57645065,126.7985426,'NW',1150011000,'����������, ȯ�½ü� �ֺ�','������ ��ȭ�� 663-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1366590,'�Ŵ�濪���(��)',62,'PublicPark',37.4869656,126.9130705,'NW',1162010200,'����������','���Ǳ� �Ÿ��� 498-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1366593,'���ε����д�����(��)(��)',33,'PublicPark',37.48481135,126.9032339,'NW',1162010200,'����������','���Ǳ� �Ÿ��� 1677-5',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1366600,'�п��￪ ȯ��������(��)',182,'PublicPark',37.49705092,127.0723954,'NW',1168010600,'����������, ȯ�½ü� �ֺ�','������ ��ġ�� 514-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1366601,'�Ͽ���(��)',21,'PublicPark',37.49134485,127.0884278,'NW',1168011400,'����������','������ �Ͽ��� 711-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1366720,'����2����2����������(��)',58,'PublicPark',37.67187408,127.0444086,'NW',1132010800,'����������','������ ������ 637-115',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1366722,'�������κ�����(��)',23,'PublicPark',37.67457411,127.045399,'NW',1132010800,'����������','������ ������ 637-74',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1366729,'������������ġ����1ȣ������(��)',100,'PublicPark',37.5107062,127.0246145,'NW',1168010800,'����������','������ ������ 123-11',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1366731,'������������ġ����3ȣ������(��)',214,'PublicPark',37.5169618,127.0385816,'NW',1168010800,'����������','������ ������ 117-7',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1366732,'������ ������ġ û��������(��)',84,'PublicPark',37.52371281,127.0486412,'NW',1168010400,'����������','������ û�㵿 49-3',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1366757,'������ ȣ�ڱ�(A) ����������(�ھ絿)(��)',1,'PublicPark',37.53072104,127.0915836,'NS',1121510500,'����������','������ �ھ絿 695-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1366791,'��õ������������(��)',59,'PublicPark',37.61458475,127.0251644,'NW',1130510100,'����������','���ϱ� �̾Ƶ� 439-138',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1366792,'�����ϰ�������������(��)',91,'PublicPark',37.63061186,127.0174307,'NW',1130510300,'����������','���ϱ� ������ 605-407',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1366795,'�����������������������(��)',19,'PublicPark',37.63207449,127.0236192,'NW',1130510300,'����������','���ϱ� ������ 612-6',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1366869,'������б����� (����������)(��)',159,'PublicPark',37.49190539,126.9330035,'NW',1162010100,'����������','���Ǳ� ��õ�� 682-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1366894,'ȸ���Ե�ĳ���� ����������(��)',27,'PublicPark',37.55894473,126.9822538,'NW',1114012200,'����������','�߱� ȸ����2�� 88-3',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1366903,'���迪(��)',73,'PublicPark',37.61548758,127.0623719,'NW',1135010200,'����������','����� ���赿 50-9',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1367218,'�Ѹ���������(��)',474,'PublicPark',37.53067739,126.8778804,'NW',1147010200,'����������','��õ�� �� 914-5',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1367258,'�������� �������� ������(��)',9,'PublicPark',37.57487794,126.9780136,'NW',1111011900,'����������','���α� ������ 76-14',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1367347,'û�� 2��(��)(��)',11,'PublicPark',37.56829211,126.9885708,'NS',1111013500,'����������','���α� ��ö�� 25-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1367460,'������(�ӽ����)(��)',31,'PublicPark',37.51796508,127.105013,'NS',1171010200,'����������','���ı� ��õ�� 11-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1367579,'�ر����ξ�(��)',24,'PublicPark',37.50428864,126.9209204,'NS',1156013200,'����������','�������� �ű浿 812-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1367625,'��������(��)',38,'PublicPark',37.53532648,126.878161,'NS',1147010200,'����������','��õ�� �� 907-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1367666,'����6����(��)',39,'PublicPark',37.49438672,127.0711345,'NS',1168010600,'����������','������ ��ġ�� 513-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1367686,'�ĸ�����(��)',42,'PublicPark',37.53396081,126.8761556,'NS',1147010200,'����������','��õ�� �� 906-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1367709,'��ȿ�뱳����(��)',18,'PublicPark',37.52225515,126.9368413,'NS',1156011000,'����������','�������� ���ǵ��� 5-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1367753,'��ȭ��(�ӽ����)(��)',35,'PublicPark',37.59441807,127.0726059,'NS',1126010300,'����������','�߶��� ��ȭ�� 61-2',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1367801,'����(��)(��)',9,'PublicPark',37.53964752,126.8903106,'NS',1156012900,'����������','�������� ����5�� 44-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1367842,'û��8��(��)(��)',22,'PublicPark',37.57181765,127.0240901,'NS',1123010100,'����������','���빮�� �ż��� 109-2',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368281,'��ȭ����������(��)',4,'PublicPark',0,0,'NS',1126010200,'����������','�߶��� ����� 85',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368329,'�������(A) ����������(��)',14,'PublicPark',37.53413509,127.0915612,'NS',1121510300,'����������','������ ���ǵ� 695-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368353,'�������(A) ����������(�ھ絿)(��)',46,'PublicPark',37.53335132,127.0917525,'NS',1121510500,'����������','������ �ھ絿 695-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368357,'������� ����������(B)(��)',1,'PublicPark',37.53315717,127.0915778,'NS',1121510300,'����������','������ ���ǵ� 695-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368359,'������� ����������(B)(��)',31,'PublicPark',37.5330472,127.0915882,'NS',1121510500,'����������','������ �ھ絿 735-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368440,'������ ȣ�ڱ� ����������(�ھ絿)(��)',1,'PublicPark',37.53141346,127.0917531,'NS',1121510500,'����������','������ �ھ絿 695-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368441,'������ ȣ�ڱ� ����������(�ھ絿)(��)',1,'PublicPark',37.53135862,127.0917587,'NS',1121510500,'����������','������ �ھ絿 695-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368446,'������� ����������(B)(��)',30,'PublicPark',37.5325392,127.0918327,'NS',1121510300,'����������','������ ���ǵ� 735-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368482,'û���ǿ�����Ʈ��(��)',44,'PublicPark',37.65034494,127.0754639,'NS',1135010600,'����������','����� �߰赿 360-2',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368504,'�������б����ϰ���������(��)',137,'PublicPark',37.6232864,126.9250857,'NW',1138010300,'����������','���� �ұ��� 400-4',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368507,'�����Ϻ������(��)',1,'PublicPark',37.52944116,126.9245749,'NS',1156011000,'����������','�������� ���ǵ��� 1-2',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368516,'��û��(��)',20,'PublicPark',37.63875947,127.0252192,'NS',1130510300,'����������','���ϱ� ������ 191-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368534,'�������� �� ���������(��)',1,'PublicPark',37.52181005,126.8915635,'NS',1156011200,'����������','�������� ��굿2�� 71-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368540,'�������� �� ���������(��)',1,'PublicPark',37.52170041,126.8915906,'NS',1156011200,'����������','�������� ��굿2�� 71-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368541,'�������� �� ���������(��)',1,'PublicPark',37.52175523,126.891574,'NS',1156011200,'����������','�������� ��굿2�� 71-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368542,'�������� �� ���������(��)',1,'PublicPark',37.52164679,126.8916101,'NS',1156011200,'����������','�������� ��굿2�� 71-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368543,'�������� �� ���������(��)',1,'PublicPark',37.52159437,126.8916311,'NS',1156011200,'����������','�������� ��굿2�� 71-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368545,'�������� �� ���������(��)',1,'PublicPark',37.52148952,126.8916747,'NS',1156011200,'����������','�������� ��굿2�� 71-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368546,'�������� �� ���������(��)',1,'PublicPark',37.52143829,126.8916987,'NS',1156011200,'����������','�������� ��굿2�� 71-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (1368547,'�������� �� ���������(��)',1,'PublicPark',37.52125704,126.8918187,'NS',1156011200,'����������','�������� ��굿2�� 71-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (116359,'ȣ�������� ���������(��)',22,'PublicPark',37.52014323,126.9293498,'NS',1156011000,'����������','�������� ���ǵ��� 44-22',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (117301,'KBS�������� ���������(��)',59,'PublicPark',37.5264928,126.9147403,'NS',1156011000,'����������','�������� ���ǵ��� 18-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (117304,'KBS���� �� ���������(��)',64,'PublicPark',37.52646975,126.9169996,'NS',1156011000,'����������','�������� ���ǵ��� 17-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (117849,'MBC��۱��� ���������(��)',58,'PublicPark',37.52402273,126.9309071,'NS',1156011000,'����������','�������� ���ǵ��� 31-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (117851,'���ǵ�������1 ���������(��)',14,'PublicPark',37.52401149,126.9175287,'NS',1156011000,'����������','�������� ���ǵ��� 17-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (117856,'�������Ǿ� ���������(��)',15,'PublicPark',37.52398214,126.9270137,'NS',1156011000,'����������','�������� ���ǵ��� 24-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (118387,'���翹���� �� ���������(��)',7,'PublicPark',37.5200086,126.928245,'NS',1156011000,'����������','�������� ���ǵ��� 45-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (118701,'���Ǽ���(��)',107,'PublicPark',37.53330826,126.9118122,'NS',1156011000,'����������','�������� ���ǵ��� 8-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (119300,'�糲��Ÿ� �� ���������(��)',1,'PublicPark',37.52241801,126.8915761,'NS',1156011200,'����������','�������� ��굿2�� 30-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (119528,'�������� �� ���������(��)',1,'PublicPark',37.52157165,126.8914055,'NS',1156012500,'����������','�������� ����1�� 71-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (119538,'�������� �� ���������(��)',1,'PublicPark',37.52154932,126.8914145,'NS',1156012500,'����������','�������� ����1�� 71-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (119730,'�糲��Ÿ� �� ���������(��)',1,'PublicPark',37.52274409,126.8916541,'NS',1156011200,'����������','�������� ��굿2�� 30-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (120258,'����1��(��)',11,'PublicPark',37.51354019,126.896996,'NS',1156012100,'����������','�������� ������3�� 54-12',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (120343,'ȫ������� ���������(��)',11,'PublicPark',37.52139515,126.9300739,'NS',1156011000,'����������','�������� ���ǵ��� 43-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (120687,'���ֺ��� �� ���������(��)',16,'PublicPark',37.51183873,126.9226111,'NS',1156013200,'����������','�������� �ű浿 451-2',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (120736,'�븲��(��)',17,'PublicPark',37.49300061,126.8954249,'NS',1156013300,'����������','�������� �븲�� 1053-21',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (120935,'�泲����Ʈ �� ���������(��)',1,'PublicPark',37.5246242,126.9021167,'NS',1156011300,'����������','�������� ��굿3�� 56-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (121146,'��ȣ������ ���������(��)',10,'PublicPark',37.52371925,126.9258851,'NS',1156011000,'����������','�������� ���ǵ��� 25-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (121751,'��������Ÿ��(��)',13,'PublicPark',37.51809596,126.9113409,'NS',1156010400,'����������','�������� ��������3�� 1-22',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (121824,'��Ž��� ���������(��)',33,'PublicPark',37.51079268,126.917207,'NS',1156013200,'����������','�������� �ű浿 116-15',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (121955,'KBS������ ���������(��)',26,'PublicPark',37.51940108,126.9293286,'NS',1156011000,'����������','�������� ���ǵ��� 45-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (122011,'�̷����º��� �� ���������(��)',23,'PublicPark',37.51920124,126.9280645,'NS',1156011000,'����������','�������� ���ǵ��� 45-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (122027,'�������� �� ���������(��)',1,'PublicPark',37.52150467,126.8914324,'NS',1156012500,'����������','�������� ����1�� 71-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (122038,'�������� �� ���������(��)',1,'PublicPark',37.52148234,126.8914413,'NS',1156012500,'����������','�������� ����1�� 71-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (122052,'�������� �� ���������(��)',1,'PublicPark',37.52146001,126.8914503,'NS',1156012500,'����������','�������� ����1�� 71-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (122602,'�糲��Ÿ� �� ���������(��)',1,'PublicPark',37.52290803,126.8916921,'NS',1156011200,'����������','�������� ��굿2�� 30-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (122610,'�糲��Ÿ� �� ���������(��)',1,'PublicPark',37.52285339,126.8916803,'NS',1156011200,'����������','�������� ��굿2�� 30-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (122621,'�糲��Ÿ� �� ���������(��)',1,'PublicPark',37.52279873,126.8916673,'NS',1156011200,'����������','�������� ��굿2�� 30-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (122652,'�������� ���������(��)',13,'PublicPark',37.52103085,126.8924946,'NS',1156011200,'����������','�������� ��굿2�� 21-26',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (122662,'�¾������ ���������(��)',11,'PublicPark',37.52101906,126.9294632,'NS',1156011000,'����������','�������� ���ǵ��� 44-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (122663,'���ǵ���ȭ�� �� ���������(��)',19,'PublicPark',37.52101603,126.9272812,'NS',1156011000,'����������','�������� ���ǵ��� 36-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (122669,'�������� �� ���������(��)',1,'PublicPark',37.5209471,126.8917164,'NS',1156012500,'����������','�������� ����1�� 71-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (122758,'�������� �� ���������(��)',1,'PublicPark',37.52089562,126.8917049,'NS',1156012500,'����������','�������� ����1�� 71-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (123621,'�ѱ��ŷ��Ҿ� ���������(��)',33,'PublicPark',37.52214771,126.9278991,'NS',1156011000,'����������','�������� ���ǵ��� 33-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (124423,'�糲��Ÿ� �� ���������(��)',1,'PublicPark',37.52236224,126.8915625,'NS',1156011200,'����������','�������� ��굿2�� 30-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (124434,'�糲��Ÿ� �� ���������(��)',1,'PublicPark',37.52230644,126.8915491,'NS',1156011200,'����������','�������� ��굿2�� 30-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (124525,'�������߾ӽ��� ���������(��)',8,'PublicPark',37.52228468,126.9085015,'NS',1156010800,'����������','�������� ��������7�� 5-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (124830,'������146��(��)',33,'PublicPark',37.52172937,127.0400925,'NS',1168010400,'����������','������ û�㵿 23-3',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (125895,'������45��(��)',46,'PublicPark',37.52376646,127.0353884,'NS',1168010700,'����������','������ �Ż絿 651-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (126607,'������132��(��)',17,'PublicPark',37.51824654,127.0429996,'NS',1168010400,'����������','������ û�㵿 42-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (126730,'������131��(��)',22,'PublicPark',37.51431964,127.0292681,'NS',1168010800,'����������','������ ������ 58-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (126804,'���ַ�171��(��)',27,'PublicPark',37.52759995,127.0319899,'NS',1168010700,'����������','������ �Ż絿 621-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (127356,'�б�����2(��)',19,'PublicPark',37.52572441,127.0283609,'NS',1168010700,'����������','������ �Ż絿 581-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (129301,'�б�����1(��)',21,'PublicPark',37.52611867,127.0283832,'NS',1168010700,'����������','������ �Ż絿 581-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (129703,'���ַ�147��(��)',13,'PublicPark',37.51983461,127.0333997,'NS',1168010800,'����������','������ ������ 63-16',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (130531,'�������150��(��)',9,'PublicPark',37.51567989,127.0201682,'NS',1168010800,'����������','������ ������ 1-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (131151,'�������64��(��)',12,'PublicPark',37.50373864,127.0515014,'NS',1168010600,'����������','������ ��ġ�� 890-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (131640,'������109��(��)',39,'PublicPark',37.49372649,127.0766328,'NS',1168010300,'����������','������ ������ 14-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (132111,'�������106��(��)',63,'PublicPark',37.5134226,127.0620536,'NS',1168010500,'����������','������ �Ｚ�� 162-23',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (132897,'�������85��(��)',96,'PublicPark',37.50653998,127.0608139,'NS',1168010600,'����������','������ ��ġ�� 942-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (135714,'�������96��(��)',81,'PublicPark',37.51031084,127.0641485,'NS',1168010500,'����������','������ �Ｚ�� 169-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (136358,'������28��(��)',70,'PublicPark',37.4839636,127.0449667,'NS',1168011800,'����������','������ ��� 517-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (140146,'�������(��)',29,'PublicPark',37.53884451,126.8850227,'NS',1147010200,'����������','��õ�� �� 900-8',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (140610,'����4�� �ε�����(��)',56,'PublicPark',37.52845783,126.8609125,'NS',1147010100,'����������','��õ�� ������ 890',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (144303,'����󰡰���������(��)',17,'PublicPark',37.66825197,127.0464457,'NS',1132010600,'����������','������ ���е� 720-33',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (144474,'�ѱ����(��)',28,'PublicPark',37.52831161,126.8715192,'NS',1147010200,'����������','��õ�� �� 924-5',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (146238,'��õ��û(��)',76,'PublicPark',37.51784578,126.8667965,'NS',1147010100,'����������','��õ�� ������ 321-4',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (151725,'����3���и������(��)',31,'PublicPark',37.50696808,126.8446118,'NS',1147010100,'����������','��õ�� ������ 857-3',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (167964,'������ ������(��)',34,'PublicPark',37.63325719,127.0191783,'NS',1130510300,'����������','���ϱ� ������ 49-27',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (170995,'�������68��(��)',78,'PublicPark',37.50957029,127.0517672,'NS',1168010500,'����������','������ �Ｚ�� 123-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (171467,'�б�����29��(��)',175,'PublicPark',37.53028089,127.0278227,'NS',1168011000,'����������','������ �б����� 445-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (171721,'������������(��)',1164,'PublicPark',37.57340269,126.9758843,'NW',1111011900,'����������','���α� ������ 80-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (171724,'���λ縶�����(��)',45,'PublicPark',37.57352191,126.9838041,'NW',1111012900,'����������','���α� ������ 85-18',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (171730,'����������(��)',1418,'PublicPark',37.57150398,126.9949689,'NW',1111015000,'����������','���α� ������ 2-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (171778,'����ȸ����������(��)',9,'PublicPark',37.58674056,126.9964757,'NW',1111017300,'����������','���α� ���3�� 12-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (171830,'�ٵ����� ��4���� ����������(��)',15,'PublicPark',37.56823533,126.9802511,'NW',1114010200,'����������','�߱� �ٵ� 39-3',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (171901,'������������ ����������(��)',502,'PublicPark',37.56379141,126.9997956,'NW',1114013300,'����������','�߱� �湫��5�� 21-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (171914,'�ʵ� ����������(��)',73,'PublicPark',37.56416856,126.9921356,'NW',1114015900,'����������','�߱� �ʵ� 64-11',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (171924,'��ȭ������������(��)',129,'PublicPark',37.56137409,127.0190004,'NW',1114016200,'����������','�߱� �Ŵ絿 52-7',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (171931,'�Ŵ翪����������(��)',26,'PublicPark',37.56535145,127.0206965,'NW',1114016200,'����������','�߱� �Ŵ絿 140-29',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (171932,'��������������(��)',46,'PublicPark',37.55054127,127.0048432,'NW',1114016200,'����������','�߱� �Ŵ絿 432-2026',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (171933,'û������������(��)',51,'PublicPark',37.55897429,127.0134054,'NW',1114016200,'����������','�߱� �Ŵ絿 330-17',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (171939,'��������������(��)',111,'PublicPark',37.55220869,127.0056811,'NW',1114016200,'����������','�߱� �Ŵ絿 432-462',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (171944,'��Ƽ ����������(��)',92,'PublicPark',37.54909105,127.0059107,'NW',1114016200,'����������','�߱� �Ŵ絿 432-1693',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (171950,'���ҹ� ����(��)',898,'PublicPark',37.56089537,126.9694414,'NW',1114017200,'����������','�߱� ���ַ�2�� 16-72',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (171965,'�Ŵ��Ÿ�����������(��)',45,'PublicPark',37.56512357,127.0170201,'NW',1114016200,'����������','�߱� �Ŵ絿 110-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (171966,'���������������(��)',90,'PublicPark',37.55222214,127.0133576,'NW',1114016200,'����������','�߱� �Ŵ絿 349-234',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (171971,'�������������(��)',106,'PublicPark',37.56001,127.0013165,'NW',1114014400,'����������','�߱� ���浿2�� 193-39',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (171975,'�ձ���ü������ ����������(��)',162,'PublicPark',37.55559696,126.9649733,'NW',1114017400,'����������','�߱� ������2�� 6-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172005,'��â��(��)',112,'PublicPark',37.5353106,126.9552132,'NW',1117011400,'����������','��걸 ��â�� 53-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172007,'�빮��������(��)',42,'PublicPark',37.53894931,126.9575677,'NW',1117012000,'����������','��걸 ������ 4-5',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172015,'������ڻ�3(��)',158,'PublicPark',37.53258192,126.9603249,'NW',1117012800,'����������','��걸 �Ѱ���3�� 19-2',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172018,'������ڻ�5(��)',42,'PublicPark',37.53381412,126.9634154,'NW',1117012800,'����������','��걸 �Ѱ���3�� 2-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172027,'������ڻ�1(��)',202,'PublicPark',37.53204956,126.96478,'NW',1117012800,'����������','��걸 �Ѱ���3�� 12-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172041,'���¿�2�� ����������(��)',112,'PublicPark',37.54036638,126.9926584,'NW',1117013000,'����������','��걸 ���¿��� 227-9',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172051,'�Ѱ�����(��)',181,'PublicPark',37.53952175,127.0025796,'NW',1117013100,'����������','��걸 �ѳ��� 728-27',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172059,'��������Ÿ��(��)',487,'PublicPark',37.53251996,126.9899031,'NW',1117013000,'����������','��걸 ���¿��� 34-87',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172065,'�����������(��)',595,'PublicPark',37.53436379,126.9654182,'NW',1117012500,'����������','��걸 �Ѱ���2�� 12-9',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172068,'���2���ҿ�������(��)',56,'PublicPark',37.54621474,126.9855822,'NW',1117010200,'����������','��걸 ��굿2�� 11-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172070,'�ﰢ��������������(��)',12,'PublicPark',37.53409224,126.9733629,'NW',1117012400,'����������','��걸 �Ѱ���1�� 231-42',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172077,'��ȣ4��������(���)(��)',90,'PublicPark',37.54569925,127.0251233,'NW',1120011200,'����������','������ ��ȣ��4�� 56-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172084,'������(����)(��)',186,'PublicPark',37.565567,127.0316914,'NW',1120010300,'����������','������ ȫ�͵� 369-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172089,'ȫ�͵�(�ǹ�)(��)',85,'PublicPark',37.56563909,127.033905,'NW',1120010300,'����������','������ ȫ�͵� 252-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172097,'��ȣ�ʵ��б�(�ǹ�)(��)',125,'PublicPark',37.55257521,127.0201586,'NW',1120011000,'����������','������ ��ȣ��2�� 511-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172118,'����1��2��(���) ����������(��)',21,'PublicPark',37.55002966,127.0497667,'NW',1120011400,'����������','������ ������1�� 13-22',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172120,'����1��1�� ����������(��)',94,'PublicPark',37.53996228,127.0463849,'NW',1120011400,'����������','������ ������1�� 656-260',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172130,'����2��3�� (�ǹ�)(��)',196,'PublicPark',37.54913662,127.0551983,'NW',1120011500,'����������','������ ������2�� 299-19',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172134,'����2��1�� (�ǹ�)(��)',161,'PublicPark',37.53716718,127.0561968,'NW',1120011500,'����������','������ ������2�� 571-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172144,'����(�ǹ�)(��)',102,'PublicPark',37.53696583,127.0490425,'NW',1120011400,'����������','������ ������1�� 366-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172184,'������ ���������(��)',25,'PublicPark',37.53352006,127.0913292,'NW',1121510300,'����������','������ ���ǵ� 598-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172198,'����1�� ����������(��)',172,'PublicPark',37.53828214,127.0878917,'NW',1121510300,'����������','������ ���ǵ� 243-78',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172204,'�ɵ�����������(��)',77,'PublicPark',37.55402858,127.0802703,'NW',1121510200,'����������','������ �ɵ� 205-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172215,'ȭ�絿 ����(��)',44,'PublicPark',37.54530284,127.0712188,'NW',1121510700,'����������','������ ȭ�絿 63-2',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172218,'�ھ�4�� ����(��)',86,'PublicPark',37.53867795,127.0682434,'NW',1121510500,'����������','������ �ھ絿 5-5',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172228,'�ܴ뿪�������� ����(��)',84,'PublicPark',37.59504107,127.0626248,'NW',1123011000,'����������','���빮�� �̹��� 306-14',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172318,'�븶������������������(��)',72,'PublicPark',37.57337582,127.0911424,'NW',1126010100,'����������','�߶��� ��� 1-4',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172382,'��ȭ�꿪(��)(��)',85,'PublicPark',37.61642995,127.0919719,'NW',1126010600,'����������','�߶��� �ų��� 647-0',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172384,'�����������������(��)',26,'PublicPark',37.58987969,127.0931487,'NW',1126010100,'����������','�߶��� ��� 74-33',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172459,'�ó׸���������������(��)',99,'PublicPark',37.59916722,127.014741,'NW',1129010300,'����������','���ϱ� ���ϵ� 538-59',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172480,'��������(��)',98,'PublicPark',37.61717024,127.0533551,'NW',1129013800,'����������','���ϱ� ������ 77-79',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172530,'��������� ����������(��)',47,'PublicPark',37.62016376,127.0203164,'NW',1130510100,'����������','���ϱ� �̾Ƶ� 703-8',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172550,'���ߵ� ����������(��)',53,'PublicPark',37.61165492,127.0336362,'NW',1130510100,'����������','���ϱ� �̾Ƶ� 48-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172562,'�ù� ����������(��)',45,'PublicPark',37.64005648,127.0259585,'NW',1130510300,'����������','���ϱ� ������ 190-11',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172563,'���л����������(��)',76,'PublicPark',37.62216136,127.0311844,'NW',1130510100,'����������','���ϱ� �̾Ƶ� 133-100',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172564,'��õ�� ����������(��)',103,'PublicPark',37.62400561,127.0195385,'NW',1130510100,'����������','���ϱ� �̾Ƶ� 756-1',0);
Insert into PARKING (PARK_ID,PARK_NAME,PARK_CAPACITY,OWNER_ID,LATITUDE,LONGITUDE,PARK_TYPE,EMD_CODE,CONTENT,DETAIL_ADDR,PARK_PUBLIC) values (172594,'���뱤�� ����������(��)',56,'PublicPark',37.66224744,127.0088542,'NW',1130510400,'����������','���ϱ� ���̵� 265-0',0);

---------------------------------------------------
--   END DATA FOR TABLE PARKING
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE ZIPCODE
--   FILTER = none used
---------------------------------------------------
REM INSERTING into ZIPCODE
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1120011200,'����Ư����','������','��ȣ��4��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1120011000,'����Ư����','������','��ȣ��2��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1120011100,'����Ư����','������','��ȣ��3��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1120010100,'����Ư����','������','��սʸ���');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1120010300,'����Ư����','������','ȫ�͵�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1120010500,'����Ư����','������','���嵿');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1120010700,'����Ư����','������','��絿');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1120010600,'����Ư����','������','��ٵ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1120010400,'����Ư����','������','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1120010200,'����Ư����','������','�Ͽսʸ���');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1120011300,'����Ư����','������','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1120010900,'����Ư����','������','��ȣ��1��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1120010800,'����Ư����','������','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1121510100,'����Ư����','������','�߰');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1121510900,'����Ư����','������','���ڵ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1121510200,'����Ư����','������','�ɵ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1121510300,'����Ư����','������','���ǵ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1121510400,'����Ư����','������','���嵿');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1121510500,'����Ư����','������','�ھ絿');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1121510700,'����Ư����','������','ȭ�絿');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1123010100,'����Ư����','���빮��','�ż���');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1123010200,'����Ư����','���빮��','��ε�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1123010500,'����Ư����','���빮��','��ʸ���');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1123010600,'����Ư����','���빮��','��ȵ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1123010400,'����Ư����','���빮��','����');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1123010300,'����Ư����','���빮��','���⵿');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1123010900,'����Ư����','���빮��','�ְ浿');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1123011000,'����Ư����','���빮��','�̹���');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1123010800,'����Ư����','���빮��','ȸ�⵿');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1123010700,'����Ư����','���빮��','û������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1126010100,'����Ư����','�߶���','���');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1126010200,'����Ư����','�߶���','�����');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1126010300,'����Ư����','�߶���','��ȭ��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1126010400,'����Ư����','�߶���','����');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1126010500,'����Ư����','�߶���','���쵿');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1126010600,'����Ư����','�߶���','�ų���');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1129012900,'����Ư����','���ϱ�','������7��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1129012600,'����Ư����','���ϱ�','������4��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1129012700,'����Ư����','���ϱ�','������5��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1129013000,'����Ư����','���ϱ�','������1��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1129013100,'����Ư����','���ϱ�','������2��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1129011500,'����Ư����','���ϱ�','�Ｑ��5��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1129011400,'����Ư����','���ϱ�','�Ｑ��4��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1129011100,'����Ư����','���ϱ�','�Ｑ��1��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1129010200,'����Ư����','���ϱ�','���ϵ�1��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1129012400,'����Ư����','���ϱ�','�Ⱦϵ�4��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1129012500,'����Ư����','���ϱ�','�Ⱦϵ�5��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1129013500,'����Ư����','���ϱ�','���ϵ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1129013600,'����Ư����','���ϱ�','�Ͽ��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1129013900,'����Ư����','���ϱ�','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1129013800,'����Ư����','���ϱ�','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1129013400,'����Ư����','���ϱ�','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1129013300,'����Ư����','���ϱ�','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1129013700,'����Ư����','���ϱ�','����');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1129010100,'����Ư����','���ϱ�','���ϵ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1129010300,'����Ư����','���ϱ�','���ϵ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1129011900,'����Ư����','���ϱ�','������4��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1129010500,'����Ư����','���ϱ�','���ҹ���2��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1129010400,'����Ư����','���ϱ�','���ҹ���1��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1129010700,'����Ư����','���ϱ�','���ҹ���4��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1129010600,'����Ư����','���ϱ�','���ҹ���3��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1129010900,'����Ư����','���ϱ�','���ҹ���6��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1129010800,'����Ư����','���ϱ�','���ҹ���5��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1129011600,'����Ư����','���ϱ�','������1��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1129011200,'����Ư����','���ϱ�','�Ｑ��2��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1129011300,'����Ư����','���ϱ�','�Ｑ��3��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1129012000,'����Ư����','���ϱ�','������5��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1129011000,'����Ư����','���ϱ�','���ҹ���7��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1129012200,'����Ư����','���ϱ�','�Ⱦϵ�2��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1129012300,'����Ư����','���ϱ�','�Ⱦϵ�3��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1129011700,'����Ư����','���ϱ�','������2��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1129011800,'����Ư����','���ϱ�','������3��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1129012800,'����Ư����','���ϱ�','������6��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1129012100,'����Ư����','���ϱ�','�Ⱦϵ�1��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1129013200,'����Ư����','���ϱ�','������3��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1130510300,'����Ư����','���ϱ�','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1130510100,'����Ư����','���ϱ�','�̾Ƶ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1130510200,'����Ư����','���ϱ�','����');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1130510400,'����Ư����','���ϱ�','���̵�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1132010700,'����Ư����','������','â��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1132010500,'����Ư����','������','�ֹ���');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1132010600,'����Ư����','������','���е�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1132010800,'����Ư����','������','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1135010300,'����Ư����','�����','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1135010600,'����Ư����','�����','�߰赿');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1135010500,'����Ư����','�����','��赿');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1135010200,'����Ư����','�����','���赿');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1135010400,'����Ư����','�����','�ϰ赿');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1138011400,'����Ư����','����','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1138010200,'����Ư����','����','�����');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1138010800,'����Ư����','����','���̵�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1138010600,'����Ư����','����','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1138010500,'����Ư����','����','���굿');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1138010400,'����Ư����','����','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1138010700,'����Ư����','����','���ϵ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1138010300,'����Ư����','����','�ұ���');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1138010900,'����Ư����','����','�Ż絿');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1138010100,'����Ư����','����','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1138011000,'����Ư����','����','���굿');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1141010400,'����Ư����','���빮��','�̱ٵ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1141010100,'����Ư����','���빮��','������2��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1141010500,'����Ư����','���빮��','��õ��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1141010600,'����Ư����','���빮��','õ����');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1141010700,'����Ư����','���빮��','��õ��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1141010800,'����Ư����','���빮��','��õ��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1141010900,'����Ư����','���빮��','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1141011100,'����Ư����','���빮��','ȫ����');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1141011800,'����Ư����','���빮��','ȫ����');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1141010200,'����Ư����','���빮��','������3��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1141010300,'����Ư����','���빮��','�յ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1141011700,'����Ư����','���빮��','����');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1141012000,'����Ư����','���빮��','�����µ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1141011900,'����Ư����','���빮��','�ϰ��µ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1141011600,'����Ư����','���빮��','âõ��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1141011200,'����Ư����','���빮��','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1141011000,'����Ư����','���빮��','�Ͼ�����');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1141011300,'����Ư����','���빮��','��ŵ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1141011400,'����Ư����','���빮��','���̵�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1141011500,'����Ư����','���빮��','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1144012700,'����Ư����','������','��ϵ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1144010700,'����Ư����','������','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1144010400,'����Ư����','������','��ȭ��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1144010200,'����Ư����','������','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1144010100,'����Ư����','������','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1144011000,'����Ư����','������','���굿');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1144011100,'����Ư����','������','�ż���');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1144010800,'����Ư����','������','���ﵿ');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1144010900,'����Ư����','������','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1144012100,'����Ư����','������','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1144012500,'����Ư����','������','���굿');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1144010300,'����Ư����','������','�Ű�����');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1144012200,'����Ư����','������','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1144012300,'����Ư����','������','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1144012000,'����Ư����','������','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1144012400,'����Ư����','������','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1144011200,'����Ư����','������','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1144010500,'����Ư����','������','�밭��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1144011500,'����Ư����','������','�����');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1144011400,'����Ư����','������','â����');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1144011300,'����Ư����','������','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1144011700,'����Ư����','������','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1144012600,'����Ư����','������','�ߵ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1144011800,'����Ư����','������','���ε�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1144011600,'����Ư����','������','���ߵ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1144010600,'����Ư����','������','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1147010300,'����Ư����','��õ��','�ſ���');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1147010200,'����Ư����','��õ��','��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1147010100,'����Ư����','��õ��','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1150010800,'����Ư����','������','���׵�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1150010700,'����Ư����','������','�ܹ߻굿');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1150010500,'����Ư����','������','���');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1150010600,'����Ư����','������','���߻굿');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1150010200,'����Ư����','������','���̵�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1150010300,'����Ư����','������','ȭ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1150010100,'����Ư����','������','��â��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1150010900,'����Ư����','������','��ȭ��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1150011000,'����Ư����','������','��ȭ��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1150011300,'����Ư����','������','���赿');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1150010400,'����Ư����','������','���絿');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1150011200,'����Ư����','������','���');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1153010200,'����Ư����','���α�','���ε�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1153010300,'����Ư����','���α�','��������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1153010600,'����Ư����','���α�','��ô��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1153011000,'����Ư����','���α�','�¼���');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1153010900,'����Ư����','���α�','�õ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1153010800,'����Ư����','���α�','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1153011200,'����Ư����','���α�','�׵�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1153011100,'����Ư����','���α�','õ�յ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1153010700,'����Ư����','���α�','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1153010100,'����Ư����','���α�','�ŵ�����');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1154510100,'����Ư����','��õ��','���굿');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1154510200,'����Ư����','��õ��','���굿');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1154510300,'����Ư����','��õ��','���ﵿ');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1156011400,'����Ư����','��������','��굿4��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1156011300,'����Ư����','��������','��굿3��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1156010900,'����Ư����','��������','��������8��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1156010800,'����Ư����','��������','��������7��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1156011000,'����Ư����','��������','���ǵ���');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1156013300,'����Ư����','��������','�븲��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1156013200,'����Ư����','��������','�ű浿');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1156012000,'����Ư����','��������','������2��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1156011900,'����Ư����','��������','������1��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1156012100,'����Ư����','��������','������3��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1156010500,'����Ư����','��������','��������4��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1156010100,'����Ư����','��������','��������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1156010400,'����Ư����','��������','��������3��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1156010200,'����Ư����','��������','��������1��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1156012300,'����Ư����','��������','������5��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1156012500,'����Ư����','��������','����1��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1156012700,'����Ư����','��������','����3��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1156012800,'����Ư����','��������','����4��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1156011700,'����Ư����','��������','��굿');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1156013100,'����Ư����','��������','��ȭ��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1156011800,'����Ư����','��������','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1156012200,'����Ư����','��������','������4��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1156011100,'����Ư����','��������','��굿1��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1156011200,'����Ư����','��������','��굿2��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1156011500,'����Ư����','��������','��굿5��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1156011600,'����Ư����','��������','��굿6��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1156012400,'����Ư����','��������','������6��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1156010300,'����Ư����','��������','��������2��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1156012600,'����Ư����','��������','����2��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1156010700,'����Ư����','��������','��������6��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1156010600,'����Ư����','��������','��������5��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1156012900,'����Ư����','��������','����5��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1156013400,'����Ư����','��������','����');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1156013000,'����Ư����','��������','����6��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1159010700,'����Ư����','���۱�','��絿');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1159010600,'����Ư����','���۱�','���۵�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1159010900,'����Ư����','���۱�','�Ŵ�浿');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1159010200,'����Ư����','���۱�','�󵵵�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1159010300,'����Ư����','���۱�','��1��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1159010800,'����Ư����','���۱�','��浿');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1159010100,'����Ư����','���۱�','�뷮����');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1159010400,'����Ư����','���۱�','����');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1159010500,'����Ư����','���۱�','�漮��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1162010200,'����Ư����','���Ǳ�','�Ÿ���');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1162010100,'����Ư����','���Ǳ�','��õ��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1162010300,'����Ư����','���Ǳ�','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1165010100,'����Ư����','���ʱ�','��赿');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1165010800,'����Ư����','���ʱ�','���ʵ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1165010200,'����Ư����','���ʱ�','���絿');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1165010700,'����Ư����','���ʱ�','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1165010600,'����Ư����','���ʱ�','�����');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1165011100,'����Ư����','���ʱ�','�ſ���');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1165010400,'����Ư����','���ʱ�','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1165011000,'����Ư����','���ʱ�','���');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1165010900,'����Ư����','���ʱ�','���');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1165010300,'����Ư����','���ʱ�','��鵿');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1168011800,'����Ư����','������','���');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1168010600,'����Ư����','������','��ġ��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1168011400,'����Ư����','������','�Ͽ���');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1168011500,'����Ư����','������','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1168010300,'����Ư����','������','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1168010100,'����Ư����','������','���ﵿ');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1168010800,'����Ư����','������','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1168010700,'����Ư����','������','�Ż絿');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1168010400,'����Ư����','������','û�㵿');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1168010500,'����Ư����','������','�Ｚ��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1168011100,'����Ư����','������','���');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1168011300,'����Ư����','������','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1168011200,'����Ư����','������','�ڰ');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1168011000,'����Ư����','������','�б�����');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1171010900,'����Ư����','���ı�','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1171011200,'����Ư����','���ı�','���ݵ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1171011100,'����Ư����','���ı�','���̵�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1171010700,'����Ư����','���ı�','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1171010400,'����Ư����','���ı�','���ĵ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1171010500,'����Ư����','���ı�','���̵�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1171010100,'����Ư����','���ı�','��ǵ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1171010800,'����Ư����','���ı�','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1171011300,'����Ư����','���ı�','�ſ���');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1171011400,'����Ư����','���ı�','��õ��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1171010600,'����Ư����','���ı�','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1171010200,'����Ư����','���ı�','��õ��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1171010300,'����Ư����','���ı�','ǳ����');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1174010600,'����Ư����','������','���̵�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1174010800,'����Ư����','������','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1174010500,'����Ư����','������','�浿');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1174010900,'����Ư����','������','õȣ��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1174010100,'����Ư����','������','���ϵ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1174010300,'����Ư����','������','���ϵ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1174010200,'����Ư����','������','�����');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1174010700,'����Ư����','������','�ϻ絿');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1174011000,'����Ư����','������','���ϵ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111012000,'����Ư����','���α�','�Ź���1��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111011900,'����Ư����','���α�','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111012300,'����Ư����','���α�','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111013500,'����Ư����','���α�','��ö��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111013600,'����Ư����','���α�','�λ絿');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111013700,'����Ư����','���α�','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111013400,'����Ư����','���α�','��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111013200,'����Ư����','���α�','��ϵ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111011300,'����Ư����','���α�','�ʿ');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111011000,'����Ư����','���α�','���ϵ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111011100,'����Ư����','���α�','���ε�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111010800,'����Ư����','���α�','���ε�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111010200,'����Ư����','���α�','�ű���');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111017600,'����Ư����','���α�','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111017800,'����Ư����','���α�','�ۿ���');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111017900,'����Ư����','���α�','ȫ�ĵ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111018000,'����Ư����','���α�','���ϵ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111018700,'����Ư����','���α�','���ǵ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111016300,'����Ư����','���α�','����5��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111017500,'����Ư����','���α�','���ε�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111017700,'����Ư����','���α�','��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111012100,'����Ư����','���α�','�Ź���2��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111011700,'����Ư����','���α�','���ֵ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111018500,'����Ư����','���α�','ȫ����');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111015500,'����Ư����','���α�','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111013800,'����Ư����','���α�','����2��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111017400,'����Ư����','���α�','â�ŵ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111015800,'����Ư����','���α�','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111016100,'����Ư����','���α�','����4��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111015700,'����Ư����','���α�','���ǵ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111015900,'����Ư����','���α�','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111016000,'����Ư����','���α�','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111017200,'����Ư����','���α�','���4��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111017100,'����Ư����','���α�','���2��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111016900,'����Ư����','���α�','��ȭ��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111016800,'����Ư����','���α�','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111016200,'����Ư����','���α�','ȿ����');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111016700,'����Ư����','���α�','��ŵ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111016600,'����Ư����','���α�','���ǵ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111015400,'����Ư����','���α�','��絿');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111015100,'����Ư����','���α�','����');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111015600,'����Ư����','���α�','����3��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111013000,'����Ư����','���α�','�ͷ浿');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111014700,'����Ư����','���α�','�絿');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111014600,'����Ư����','���α�','��ȸ��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111014300,'����Ư����','���α�','ȭ��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111014800,'����Ư����','���α�','�赿');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111014900,'����Ư����','���α�','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111014000,'����Ư����','���α�','��û��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111018100,'����Ư����','���α�','���̵�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111011500,'����Ư����','���α�','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111011400,'����Ư����','���α�','���ڵ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111010700,'����Ư����','���α�','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111012200,'����Ư����','���α�','û����');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111012400,'����Ư����','���α�','���۵�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111012700,'����Ư����','���α�','����');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111014400,'����Ư����','���α�','�簣��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111014200,'����Ư����','���α�','�Ұݵ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111013900,'����Ư����','���α�','���ǵ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111017300,'����Ư����','���α�','���3��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111017000,'����Ư����','���α�','���1��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111012900,'����Ư����','���α�','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111012800,'����Ư����','���α�','���Ƶ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111012500,'����Ư����','���α�','���е�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111014100,'����Ư����','���α�','�ȱ���');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111013100,'����Ư����','���α�','�ǳ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111016500,'����Ư����','���α�','��ȭ��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111016400,'����Ư����','���α�','����6��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111018400,'����Ư����','���α�','�ξϵ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111011200,'����Ư����','���α�','ü�ε�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111010600,'����Ư����','���α�','���ǵ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111010500,'����Ư����','���α�','â����');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111010400,'����Ư����','���α�','ȿ�ڵ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111010300,'����Ư����','���α�','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111010100,'����Ư����','���α�','û�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111018600,'����Ư����','���α�','�ſ���');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111012600,'����Ư����','���α�','����1��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111015200,'����Ư����','���α�','���͵�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111015000,'����Ư����','���α�','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111018300,'����Ư����','���α�','��â��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111018200,'����Ư����','���α�','���⵿');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111011800,'����Ư����','���α�','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111015300,'����Ư����','���α�','���ǵ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111013300,'����Ư����','���α�','�ͼ���');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111011600,'����Ư����','���α�','���ŵ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1111010900,'����Ư����','���α�','����');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114011800,'����Ư����','�߱�','���빮��5��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114012000,'����Ư����','�߱�','������2��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114011900,'����Ư����','�߱�','������1��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114011300,'����Ư����','�߱�','��â��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114011400,'����Ư����','�߱�','�����2��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114016700,'����Ư����','�߱�','����');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114010300,'����Ư����','�߱�','�����1��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114010100,'����Ư����','�߱�','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114013100,'����Ư����','�߱�','����1��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114010500,'����Ư����','�߱�','������2��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114016900,'����Ư����','�߱�','���ַ�1��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114016200,'����Ư����','�߱�','�Ŵ絿');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114014400,'����Ư����','�߱�','���浿2��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114014300,'����Ư����','�߱�','���浿1��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114013600,'����Ư����','�߱�','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114014700,'����Ư����','�߱�','�ָ���');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114015400,'����Ư����','�߱�','���嵿');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114015100,'����Ư����','�߱�','������5��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114015300,'����Ư����','�߱�','��굿');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114017000,'����Ư����','�߱�','������1��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114012500,'����Ư����','�߱�','�湫��2��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114015800,'����Ư����','�߱�','�湫��3��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114016100,'����Ư����','�߱�','����2��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114015500,'����Ư����','�߱�','������3��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114011000,'����Ư����','�߱�','��ǥ��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114013200,'����Ư����','�߱�','�湫��4��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114013500,'����Ư����','�߱�','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114013400,'����Ư����','�߱�','������2��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114015000,'����Ư����','�߱�','������4��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114015200,'����Ư����','�߱�','�ֱ���');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114016300,'����Ư����','�߱�','���ε�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114016500,'����Ư����','�߱�','Ȳ�е�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114017100,'����Ư����','�߱�','�߸���');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114016800,'����Ư����','�߱�','��ȭ��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114016600,'����Ư����','�߱�','���ҹ���');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114010600,'����Ư����','�߱�','���빮��1��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114010900,'����Ư����','�߱�','�屳��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114015600,'����Ư����','�߱�','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114015700,'����Ư����','�߱�','�긲��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114014800,'����Ư����','�߱�','������6��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114011700,'����Ư����','�߱�','���빮��4��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114011600,'����Ư����','�߱�','���빮��3��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114011200,'����Ư����','�߱�','��â��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114012100,'����Ư����','�߱�','ȸ����1��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114011100,'����Ư����','�߱�','�Ұ���');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114012700,'����Ư����','�߱�','��2��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114011500,'����Ư����','�߱�','���빮��2��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114012600,'����Ư����','�߱�','��1��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114010400,'����Ư����','�߱�','������1��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114010700,'����Ư����','�߱�','�ﰢ��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114015900,'����Ư����','�߱�','�ʵ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114016000,'����Ư����','�߱�','������1��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114014500,'����Ư����','�߱�','����1��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114014600,'����Ư����','�߱�','����2��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114013300,'����Ư����','�߱�','�湫��5��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114013900,'����Ư����','�߱�','�ʵ�3��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114012200,'����Ư����','�߱�','ȸ����2��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114012400,'����Ư����','�߱�','�湫��1��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114014200,'����Ư����','�߱�','���嵿');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114012900,'����Ư����','�߱�','���굿2��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114013000,'����Ư����','�߱�','���굿3��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114014900,'����Ư����','�߱�','������7��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114013700,'����Ư����','�߱�','�ʵ�1��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114017200,'����Ư����','�߱�','���ַ�2��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114012300,'����Ư����','�߱�','ȸ����3��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114012800,'����Ư����','�߱�','���굿1��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114014100,'����Ư����','�߱�','���ڵ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114013800,'����Ư����','�߱�','�ʵ�2��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114016400,'����Ư����','�߱�','���е�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114017400,'����Ư����','�߱�','������2��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114017300,'����Ư����','�߱�','������1��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114010200,'����Ư����','�߱�','�ٵ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114014000,'����Ư����','�߱�','���е�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1114010800,'����Ư����','�߱�','���ϵ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1117013500,'����Ư����','��걸','��굿6��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1117013000,'����Ư����','��걸','���¿���');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1117010300,'����Ư����','��걸','��굿4��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1117010200,'����Ư����','��걸','��굿2��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1117012800,'����Ư����','��걸','�Ѱ���3��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1117012500,'����Ư����','��걸','�Ѱ���2��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1117012400,'����Ư����','��걸','�Ѱ���1��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1117010400,'����Ư����','��걸','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1117010500,'����Ư����','��걸','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1117010700,'����Ư����','��걸','���ڵ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1117013100,'����Ư����','��걸','�ѳ���');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1117011900,'����Ư����','��걸','ȿâ��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1117012100,'����Ư����','��걸','�빮��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1117011300,'����Ư����','��걸','��ȿ��2��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1117011200,'����Ư����','��걸','��ȿ��1��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1117012300,'����Ư����','��걸','�Ű赿');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1117012200,'����Ư����','��걸','���赿');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1117012000,'����Ư����','��걸','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1117011800,'����Ư����','��걸','��ȿ��4��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1117011500,'����Ư����','��걸','��õ��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1117011600,'����Ư����','��걸','û�ϵ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1117011400,'����Ư����','��걸','��â��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1117011100,'����Ư����','��걸','û�ĵ�3��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1117011000,'����Ư����','��걸','û�ĵ�2��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1117010800,'����Ư����','��걸','���赿');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1117010100,'����Ư����','��걸','�ľϵ�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1117011700,'����Ư����','��걸','��ȿ��3��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1117010900,'����Ư����','��걸','û�ĵ�1��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1117013600,'����Ư����','��걸','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1117012700,'����Ư����','��걸','��굿5��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1117013300,'����Ư����','��걸','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1117013200,'����Ư����','��걸','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1117012900,'����Ư����','��걸','���̵�');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1117012600,'����Ư����','��걸','��굿3��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1117010600,'����Ư����','��걸','��굿1��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1117013400,'����Ư����','��걸','�ּ���');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1120012200,'����Ư����','������','��䵿');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1120011500,'����Ư����','������','������2��');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1120011800,'����Ư����','������','������');
Insert into ZIPCODE (CODE,SIDO,GUGUN,STREET) values (1120011400,'����Ư����','������','������1��');

---------------------------------------------------
--   END DATA FOR TABLE ZIPCODE
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE PARKING_DETAIL
--   FILTER = none used
---------------------------------------------------
REM INSERTING into PARKING_DETAIL
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173877,1,3.5,0,0,'Y','N','N',60000,300,10,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173880,1,3.5,0,0,'Y','N','N',30000,300,30,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173885,1,3.5,0,0,'Y','N','N',180000,500,10,1500,24000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173891,1,3.5,0,0,'Y','N','N',60000,100,10,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173896,1,3.5,0,0,'Y','N','N',50000,200,10,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (781508,1,3.5,0,0,'Y','Y','Y',50000,50,5,300,2000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (781509,1,3.5,0,0,'Y','Y','Y',50000,50,5,300,2000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (781511,1,3.5,0,0,'Y','Y','Y',50000,50,5,300,2000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (781512,1,3.5,0,0,'Y','N','Y',80000,100,5,600,5000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (782904,1,3.5,0,0,'Y','N','N',0,100,10,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (789092,1,3.5,0,0,'Y','N','Y',70000,300,10,900,9000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (790441,1,3.5,0,0,'Y','N','N',170000,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (881056,1,3.5,0,0,'Y','N','Y',70000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (892053,1,3.5,0,0,'Y','N','N',100000,300,10,900,35000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (911542,1,3.5,0,0,'Y','N','N',70000,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (968455,1,3.5,0,0,'Y','N','N',60000,150,5,900,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (968483,1,3.5,0,0,'Y','N','N',60000,150,5,900,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (968514,1,3.5,0,0,'Y','N','N',100000,200,5,1200,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (980509,1,3.5,0,0,'Y','N','N',100000,900,30,900,6000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (984617,1,3.5,0,0,'Y','N','N',70000,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (984688,1,3.5,0,0,'Y','N','N',112000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1010089,1,3.5,0,0,'Y','N','N',0,0,0,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1012254,1,3.5,0,0,'Y','N','N',100000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1013181,1,3.5,0,0,'Y','N','N',50000,50,5,300,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1025696,1,3.5,0,0,'Y','N','N',100000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1025697,1,3.5,0,0,'Y','N','N',65000,50,5,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (75612,1,3.5,0,0,'Y','N','N',100000,200,5,1200,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (76357,1,3.5,0,0,'Y','N','N',100000,200,5,1200,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (77533,1,3.5,0,0,'Y','N','N',100000,200,5,1200,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (110855,1,3.5,0,0,'Y','N','Y',200000,1000,10,3000,20000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (111189,1,3.5,0,0,'Y','N','Y',200000,1000,10,3000,20000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (111643,1,3.5,0,0,'Y','N','Y',200000,1000,10,3000,20000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (111804,1,4,0,0,'Y','N','Y',200000,1000,10,3000,20000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (112111,1,3.5,0,0,'Y','N','Y',200000,1000,10,3000,20000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (112411,1,3.5,0,0,'Y','N','Y',200000,1000,10,3000,20000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (112413,1,3.5,0,0,'Y','N','Y',200000,1000,10,3000,20000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (113205,1,3.5,0,0,'Y','N','N',50000,200,10,600,6000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (113229,1,3.5,0,0,'Y','N','N',50000,200,10,600,6000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (114486,1,3.5,0,0,'Y','N','N',50000,200,10,600,6000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (116070,1,3.5,0,0,'Y','N','Y',200000,1000,10,3000,20000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (116072,1,3.5,3,0,'Y','N','Y',0,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (116359,1,3.5,0,0,'Y','N','Y',200000,1000,10,3000,20000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (117301,1,3.5,0,0,'Y','N','Y',200000,1000,10,3000,20000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (117304,1,3.5,0,0,'Y','N','Y',200000,1000,10,3000,20000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (117849,1,3.5,0,0,'Y','N','N',200000,1000,10,3000,20000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (117856,1,3.5,0,0,'Y','N','Y',200000,1000,1,3000,20000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (118387,1,3.5,0,0,'Y','N','Y',200000,1000,10,3000,20000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (118477,1,3.5,0,0,'Y','N','Y',200000,1000,10,3000,20000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (118701,1,3.5,3,0,'Y','N','Y',0,350,5,2100,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (119300,1,3.5,0,0,'Y','N','N',100000,500,10,150,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (119528,1,3.5,0,0,'Y','N','N',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (119538,1,3.5,0,0,'Y','N','N',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (120258,1,3.5,0,0,'Y','N','Y',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (120343,1,3.5,0,0,'Y','N','Y',200000,1000,10,3000,20000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (120687,1,3.5,0,0,'Y','N','Y',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (120736,1,3.5,3,0,'Y','N','Y',0,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (120789,1,3.5,0,0,'Y','N','N',50000,200,10,600,6000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (120935,1,3.5,0,0,'Y','N','N',50000,200,10,600,6000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (121146,1,3.5,0,0,'Y','N','Y',200000,1000,10,3000,20000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (121824,1,3.5,0,0,'Y','N','N',50000,200,10,600,6000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (121955,1,3.5,0,0,'Y','N','Y',200000,1000,100,3000,20000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (122011,1,3.5,0,0,'Y','N','Y',200000,1000,10,3000,20000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (122027,1,3.5,0,0,'Y','N','N',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (122038,1,3.5,0,0,'Y','N','N',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (122052,1,3.5,0,0,'Y','N','N',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (122062,1,3.5,0,0,'Y','N','N',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (122602,1,3.5,0,0,'Y','N','N',100000,500,10,150,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (122610,1,3.5,0,0,'Y','N','N',100000,500,10,150,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (122621,1,3.5,0,0,'Y','N','N',100000,500,10,150,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (122652,1,3.5,0,0,'Y','N','N',80000,300,10,900,9000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (122662,1,3.5,0,0,'Y','N','Y',200000,1000,10,3000,20000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (122663,1,3.5,0,0,'Y','N','Y',200000,1000,10,3000,20000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (122669,1,3.5,0,0,'Y','N','N',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (123621,1,3.5,0,0,'Y','N','Y',200000,1000,10,3000,20000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (124068,1,3.5,3,0,'Y','N','Y',0,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (124423,1,3.5,0,0,'Y','N','N',100000,500,10,150,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (124434,1,3.5,0,0,'Y','N','N',100000,500,10,150,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (124525,1,3.5,0,0,'Y','N','N',50000,200,10,600,6000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (124830,1,3.5,0,0,'Y','Y','Y',150000,350,5,168,30000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (125895,1,3.5,0,0,'Y','Y','Y',150000,350,5,168,30000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (126730,1,3.5,0,0,'Y','Y','Y',150000,350,5,168,30000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (126804,1,3.5,0,0,'Y','Y','Y',150000,350,5,168,30000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (127129,1,3.5,3,0,'Y','N','Y',0,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (127356,1,3.5,3,0,'Y','N','N',0,500,5,3000,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (129301,1,3.5,3,0,'Y','N','N',0,500,5,3000,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (129703,1,3.5,0,0,'Y','Y','Y',150000,350,5,168,30000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (130531,1,3.75,0,0,'Y','Y','Y',0,400,5,192,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (131151,1,3.5,0,0,'Y','Y','Y',0,350,5,168,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (132111,1,3.5,0,0,'Y','Y','Y',120000,250,5,120,24000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (132787,1,3.5,0,0,'Y','Y','Y',120000,250,5,120,24000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (132897,1,3.5,0,0,'Y','Y','Y',150000,350,5,168,30000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (135714,1,3.5,0,0,'Y','Y','Y',120000,250,5,120,24000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (135938,1,3.25,0,0,'Y','Y','Y',150000,350,5,168,30000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (136358,1,3.5,0,0,'Y','Y','Y',120000,250,5,120,24000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (140146,1,3.5,0,0,'Y','N','Y',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (144303,1,3.5,0,0,'Y','N','Y',0,500,10,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (144474,1,3.5,3,0,'Y','N','Y',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (146238,1,3.5,3,0,'Y','N','Y',40000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (171924,1,3.5,0,0,'Y','N','Y',140000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (171931,1,3.5,0,0,'Y','N','Y',240000,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (171932,1,3.5,0,0,'Y','N','Y',140000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (171933,1,3.5,0,0,'Y','N','Y',240000,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (171939,1,3.5,0,0,'Y','N','Y',140000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (171941,1,3.5,0,0,'Y','N','Y',140000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (171944,1,3.5,0,0,'Y','Y','Y',140000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (171945,1,3.5,0,0,'Y','N','Y',140000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (171950,1,3.5,0,0,'Y','N','N',120000,1500,30,1500,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (171953,1,3.5,0,0,'Y','N','N',350000,400,5,2400,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (171956,1,3.5,0,0,'Y','N','Y',140000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (171965,1,3.5,0,0,'Y','N','Y',240000,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (171971,1,3.5,0,0,'Y','N','Y',140000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (171975,1,3.5,0,0,'Y','N','N',90000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172005,1,3.5,0,0,'Y','N','N',140000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172007,1,3.5,0,0,'Y','N','N',98000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172015,1,3.5,0,0,'Y','N','N',130000,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173488,1,3.5,0,0,'Y','N','N',140000,500,10,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173498,1,3.5,0,0,'Y','N','N',120000,300,10,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173521,1,3.5,0,0,'Y','N','N',120000,300,10,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173522,1,3.5,0,0,'Y','N','N',120000,300,10,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173528,1,3.5,0,0,'Y','N','N',120000,300,10,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173530,1,3.5,0,0,'Y','N','N',110000,1500,30,1500,30000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173534,1,3.5,0,0,'Y','N','N',175000,200,5,1200,20000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173553,1,3.5,1,155,'Y','N','N',65000,100,5,600,28800,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173573,1,3.5,0,0,'Y','N','N',180000,500,10,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173578,1,4.25,0,0,'Y','N','N',0,300,30,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173590,1,3.5,0,0,'Y','N','N',120000,300,10,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173591,1,3.625,1,1338,'Y','N','N',70000,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173646,1,3.5,0,0,'Y','N','Y',110000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173665,1,3.5,0,0,'Y','N','N',180000,500,10,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173673,1,3.5,0,0,'Y','N','N',98000,300,10,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (302,0,3,null,null,'0','0','0',222,100,1,100,1000,0,'�ֺ� CCTV 1��, ������, �Ĵ� ��');
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173685,1,3.5,0,0,'Y','N','N',250000,800,10,2400,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173691,1,3.5,1,1967,'Y','N','N',98000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173692,1,3.5,0,0,'Y','N','N',60000,100,10,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173696,1,3.5,0,0,'Y','N','N',120000,300,10,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173698,1,3.5,0,0,'Y','N','N',180000,500,10,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173701,1,3.5,0,0,'Y','N','N',120000,300,10,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173740,1,3.5,1,1137,'Y','N','N',80000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173749,1,3.5,0,0,'Y','N','N',0,100,10,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173750,1,3.5,1,204,'Y','N','N',100000,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173754,1,3.5,0,0,'Y','N','N',168000,500,10,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173759,1,3.5,0,0,'Y','N','N',0,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173776,1,3.5,0,0,'Y','N','N',180000,500,10,1500,24000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173779,1,3.5,0,0,'Y','N','N',80000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173810,1,3.5,0,0,'Y','N','N',70000,100,5,600,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173821,1,3.5,0,0,'Y','N','N',60000,100,10,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173828,1,3.5,0,0,'Y','N','N',180000,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173831,1,3.5,1,186,'Y','N','N',180000,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173867,1,3.5,1,565,'Y','N','N',50000,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173870,1,3.5,0,0,'Y','N','N',60000,100,10,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173874,1,3.5,1,686,'Y','N','N',90000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173876,1,3.5,0,0,'Y','N','N',50000,200,10,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1169670,1,3.5,0,0,'Y','Y','Y',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1268812,1,3.5,0,0,'Y','N','N',98000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1169706,1,3.5,3,0,'Y','N','Y',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1169723,1,3.5,0,0,'Y','Y','Y',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1169936,1,3.5,0,0,'Y','Y','Y',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1169981,1,3.5,0,0,'Y','N','Y',120000,200,5,1200,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1170433,1,3.5,0,0,'Y','N','Y',120000,250,5,1500,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1172364,1,3.5,0,0,'Y','Y','Y',100000,1500,30,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1172612,1,3.5,0,0,'Y','Y','Y',100000,1500,30,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1172984,1,3.5,0,0,'Y','N','Y',0,250,5,1500,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1173072,1,3.5,0,0,'Y','N','Y',120000,250,5,1500,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1174223,1,3.5,0,0,'Y','N','Y',120000,250,5,1500,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1174233,1,3.5,0,0,'Y','N','Y',50000,100,5,600,5000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1175069,1,3.5,3,0,'Y','N','Y',0,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1175418,1,3.5,0,0,'Y','N','Y',120000,200,5,1200,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1177715,1,3.5,0,0,'Y','N','N',120000,250,5,1500,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1180082,1,3.5,0,0,'Y','Y','Y',100000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1180193,1,3.5,0,0,'Y','N','Y',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1180642,1,3.5,0,0,'Y','Y','Y',120000,300,5,1800,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1180721,1,3.5,0,0,'Y','N','N',0,300,5,1800,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1180833,1,3.5,0,0,'Y','N','Y',150000,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1180914,1,3.5,0,0,'Y','Y','Y',120000,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1180915,1,3.5,0,0,'Y','N','Y',150000,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1184061,1,3.5,0,0,'Y','N','N',0,300,5,1800,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1184355,1,3.5,0,0,'Y','Y','Y',0,300,5,1800,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1189080,1,3.5,0,0,'Y','N','Y',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1190582,1,3.5,0,0,'Y','N','Y',120000,500,10,1500,36000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1191037,1,3.5,3,0,'Y','N','N',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1191239,1,3.5,0,0,'Y','N','Y',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1191352,1,3.5,0,0,'Y','N','Y',0,500,10,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1192697,1,3.5,0,0,'Y','N','Y',0,200,5,1200,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1193050,1,3.5,0,0,'Y','N','Y',100000,1500,30,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1193127,1,3.5,0,0,'Y','N','Y',120000,500,10,1500,36000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1195466,1,3.5,0,0,'Y','N','Y',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1197273,1,3.5,0,0,'Y','N','Y',80000,250,5,1500,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1199510,1,3.5,0,0,'Y','N','Y',0,500,5,3900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1199786,1,3.5,0,0,'Y','N','Y',80000,250,5,1500,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1201024,1,3.5,0,0,'Y','N','Y',80000,250,5,1500,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1203053,1,3.5,0,0,'Y','N','Y',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1203572,1,3.5,0,0,'Y','N','Y',180000,500,10,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1204439,1,3.5,0,0,'Y','N','Y',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1205225,1,3.5,0,0,'Y','N','Y',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1206059,1,3.5,0,0,'Y','N','Y',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1206133,1,3.5,0,0,'Y','N','Y',0,500,5,3900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1206362,1,3.5,0,0,'Y','N','Y',250000,1000,10,3000,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1206427,1,3.5,0,0,'Y','N','N',250000,1000,10,3000,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1206606,1,3.5,0,0,'Y','N','Y',0,500,5,3900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1207170,1,3.5,0,0,'Y','N','Y',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1207907,1,3.5,0,0,'Y','N','Y',250000,1000,10,3000,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1207934,1,3.5,0,0,'Y','N','Y',250000,1000,10,3000,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1208740,1,3.5,0,0,'Y','N','Y',0,500,5,3900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1208944,1,3.5,1,12,'Y','N','Y',0,500,5,3900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1209555,1,3.5,0,0,'Y','N','Y',250000,1000,10,3000,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1209617,1,3.5,0,0,'Y','N','Y',250000,1000,10,3000,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1210056,1,3.5,3,0,'Y','N','Y',0,500,5,3000,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1210451,1,3.5,1,12,'Y','N','Y',0,500,5,3900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1211476,1,3.5,0,0,'Y','N','Y',250000,1000,10,3000,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1211874,1,3.5,0,0,'Y','N','Y',0,500,5,3900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1216630,1,3.5,0,0,'Y','Y','Y',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1219269,1,3.5,0,0,'Y','N','Y',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1219434,1,3.5,0,0,'Y','N','Y',120000,500,10,1500,36000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1219470,1,3.5,3,0,'Y','N','N',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1219530,1,3.5,0,0,'Y','N','Y',120000,500,10,1500,36000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1219995,1,3.5,0,0,'Y','N','Y',0,0,30,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1220136,1,3.5,0,0,'Y','N','N',0,300,5,1800,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1221864,1,3.5,0,0,'Y','N','Y',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1226038,1,3.5,0,0,'Y','N','N',100000,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1228189,1,3.5,0,0,'Y','N','N',100000,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1232331,1,3.5,0,0,'Y','N','Y',65000,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1232531,1,3.5,3,0,'Y','N','Y',65000,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1233443,1,3.5,3,0,'Y','N','Y',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1234228,1,3.5,3,0,'Y','N','Y',0,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1234251,1,3.5,0,0,'Y','N','Y',0,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1234393,1,3.5,0,0,'Y','N','Y',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1234449,1,3.5,0,0,'Y','N','Y',0,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1235178,1,3.5,0,0,'Y','N','Y',0,500,5,3900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1235414,1,3.5,0,0,'Y','N','Y',250000,500,5,3000,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1235434,1,3.5,1,8,'Y','N','Y',0,500,5,3900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1235457,1,3.5,0,0,'Y','N','Y',0,500,5,3900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1235467,1,3.5,3,0,'Y','N','Y',0,650,5,3900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1235505,1,3.5,0,0,'Y','N','Y',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1235668,1,3.5,3,0,'Y','N','Y',0,500,5,3900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1235696,1,3.5,0,0,'Y','N','Y',250000,500,5,3000,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1235715,1,3.5,1,11,'Y','N','Y',0,500,5,3900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1235721,1,3.5,3,0,'Y','N','Y',0,650,5,3900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1235875,1,3.5,0,0,'Y','N','Y',0,500,5,3900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1235943,1,3.5,0,0,'Y','N','Y',0,500,5,3900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1236067,1,3.5,0,0,'Y','N','Y',0,350,5,2100,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1236068,1,3.5,0,0,'Y','N','Y',0,350,5,2100,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1236088,1,3.5,1,9,'Y','N','Y',0,500,5,3900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1236120,1,3.5,0,0,'Y','N','Y',0,500,5,3900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1236139,1,3.5,3,0,'Y','N','Y',0,650,5,3900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1236165,1,3.5,3,0,'Y','N','Y',0,650,5,3900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1236213,1,3.5,0,0,'Y','N','Y',0,350,5,2100,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1236214,1,3.5,0,0,'Y','N','Y',0,350,5,2100,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1236215,1,3.5,0,0,'Y','N','Y',0,350,5,2100,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1236218,1,3.5,0,0,'Y','N','Y',0,350,5,2100,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1236219,1,3.5,0,0,'Y','N','Y',0,350,5,2100,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1236220,1,3.5,0,0,'Y','N','Y',0,350,5,2100,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1236221,1,3.5,0,0,'Y','N','Y',0,350,5,2100,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1236222,1,3.5,0,0,'Y','N','Y',0,350,5,2100,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1236223,1,3.5,0,0,'Y','N','Y',0,350,5,2100,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1236224,1,3.5,0,0,'Y','N','Y',0,350,5,2100,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1236225,1,3.5,0,0,'Y','N','Y',0,350,5,2100,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1236226,1,3.5,0,0,'Y','N','Y',0,350,5,2100,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1236227,1,3.5,0,0,'Y','N','Y',0,350,5,2100,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1236309,1,3.5,1,5,'Y','N','Y',0,500,5,3900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1236338,1,3.5,0,0,'Y','N','Y',0,500,5,3900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1236472,1,3.5,0,0,'Y','N','Y',250000,500,5,3000,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1236500,1,3.5,0,0,'Y','N','N',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1236545,1,3.5,0,0,'Y','N','Y',180000,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1236552,1,3.5,1,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1236558,1,3.5,3,0,'Y','N','Y',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1236616,1,3.5,0,0,'Y','N','N',0,250,5,3000,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1236620,1,3.5,3,0,'Y','N','Y',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1236728,1,3.5,0,0,'Y','N','Y',250000,500,5,3000,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1236747,1,3.5,1,3,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1237137,1,3.5,0,0,'Y','N','Y',180000,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1237146,1,3.5,0,0,'Y','N','Y',180000,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1237532,1,3.5,0,0,'Y','N','Y',250000,500,5,3000,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1237609,1,3.5,0,0,'Y','N','Y',250000,500,5,3000,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1237723,1,3.5,0,0,'Y','Y','Y',250000,500,5,3000,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1237813,1,3.5,0,0,'Y','N','Y',250000,500,5,3000,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1237987,1,3.5,0,0,'Y','N','Y',100000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1238115,1,3.5,3,0,'Y','N','Y',0,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1238138,1,3.5,0,0,'Y','Y','Y',150000,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1238166,1,3.5,0,0,'Y','N','Y',100000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1238209,1,3.5,0,0,'Y','N','Y',150000,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1238304,1,3.5,0,0,'Y','N','Y',150000,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1238356,1,3.5,0,0,'Y','N','Y',150000,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1238382,1,3.5,0,0,'Y','N','Y',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1238469,1,3.5,0,0,'Y','Y','Y',150000,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1238542,1,3.5,0,0,'Y','N','Y',150000,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1238565,1,3.5,0,0,'Y','N','Y',150000,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1238808,1,3.5,0,0,'Y','N','Y',150000,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1238846,1,3.5,0,0,'Y','N','Y',150000,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1238902,1,3.5,3,0,'Y','N','Y',0,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1238938,1,3.5,0,0,'Y','N','Y',150000,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1238941,1,3.5,0,0,'Y','N','Y',150000,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1240475,1,3.5,0,0,'Y','N','Y',150000,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1247636,1,3.5,0,0,'Y','N','N',50000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1247641,1,3.5,0,0,'Y','N','N',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1247659,1,3.5,0,0,'Y','N','N',80000,800,60,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1247661,1,3.5,0,0,'Y','N','N',120000,500,10,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1247675,1,3.5,1,741,'Y','N','N',80000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1247677,1,3.5,0,0,'Y','N','N',50000,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1247678,1,3.5,0,0,'Y','N','N',50000,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1247680,1,3.5,0,0,'Y','N','N',170000,500,10,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1247682,1,3.5,0,0,'Y','N','N',100000,1500,30,1500,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1247683,1,3.5,0,0,'Y','N','N',110000,1000,30,900,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1247684,1,3.5,0,0,'Y','N','Y',250000,1500,30,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1254863,1,3.5,0,0,'Y','N','N',120000,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1255517,1,3.5,0,0,'Y','N','Y',80000,150,5,900,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1262521,1,3.5,0,0,'Y','N','Y',0,0,0,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1264599,1,3.5,0,0,'Y','N','Y',0,0,0,2400,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1265250,1,3.5,0,0,'Y','N','Y',0,0,0,2400,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1265901,1,3.5,0,0,'Y','N','Y',0,500,10,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1266311,1,3.5,0,0,'Y','N','Y',0,0,0,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1267813,1,3.5,0,0,'Y','Y','Y',0,0,0,2400,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1268780,1,3.5,0,0,'Y','N','N',98000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1268813,1,3.5,0,0,'Y','N','N',130000,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1268816,1,3.5,0,0,'Y','N','N',140000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1276799,1,3.5,0,0,'Y','N','N',60000,100,10,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1277144,1,3.5,1,88,'Y','N','N',80000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1277145,1,3.5,1,44,'Y','N','N',100000,400,5,2400,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1277146,1,3.5,0,0,'Y','N','N',50000,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1277150,1,3.5,1,30,'Y','N','N',39000,50,5,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1277151,1,3.5,1,21,'Y','N','N',39000,50,5,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1277152,1,3.5,0,0,'Y','N','Y',50000,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1277157,1,3.5,3,0,'Y','N','N',100000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1277158,1,3.5,0,0,'Y','N','Y',50000,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1277160,1,3.5,1,0,'Y','N','N',100000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1277163,1,3.5,3,0,'Y','N','Y',180000,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1278470,1,3.5,0,0,'Y','N','Y',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1280770,1,3.5,0,0,'Y','N','Y',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1282112,1,3.5,0,0,'Y','N','N',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1418248,1,3.5,0,0,'Y','N','N',160000,500,10,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1421476,1,3.5,0,0,'Y','N','N',0,0,30,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1421499,1,3.5,0,0,'Y','N','N',100000,200,5,1200,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1421560,1,3.5,0,0,'Y','N','N',100000,200,5,1200,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1422117,1,3.5,0,0,'Y','N','Y',0,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1422436,1,3.5,0,0,'Y','N','Y',0,500,10,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1422437,1,3.5,0,0,'Y','N','Y',0,500,10,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1423412,1,3.5,0,0,'Y','Y','Y',0,400,5,192,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1423650,1,3.5,0,0,'Y','N','N',0,300,5,1800,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1423651,1,3.5,0,0,'Y','N','N',50000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1423770,1,3.5,0,0,'Y','N','N',0,300,30,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1424206,1,3.5,0,0,'Y','N','N',140000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1424463,1,3.5,1,3,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1424465,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1424585,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1424603,1,3.5,1,3,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1424640,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1424675,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1424677,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1424692,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1424710,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1425391,1,3.5,0,0,'Y','Y','Y',84000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1425816,1,3.5,0,0,'Y','N','Y',0,500,5,3000,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1427620,1,3.5,1,15,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1427676,1,3.5,0,0,'Y','N','Y',250000,500,5,3000,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1427774,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1429954,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1430037,1,3.5,1,3,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1430045,1,3.5,1,2,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1430344,1,3.5,0,0,'Y','N','N',100000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1430643,1,3.5,1,13,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1430676,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1430933,1,3.5,1,2,'Y','N','N',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1430941,1,3.5,0,0,'Y','N','N',70000,300,10,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1430967,1,3.5,0,0,'Y','N','Y',100000,300,10,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1431018,1,3.5,0,0,'Y','N','Y',70000,300,10,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1431644,1,3.5,0,0,'Y','N','N',180000,200,5,1200,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1431647,1,3.5,0,0,'Y','N','Y',200000,400,5,2400,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1431648,1,3.5,0,0,'Y','N','Y',200000,400,5,2400,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1431649,1,3.5,0,0,'Y','N','Y',200000,400,5,2400,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1431650,1,3.5,0,0,'Y','N','Y',200000,400,5,2400,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1431651,1,3.5,0,0,'Y','N','Y',200000,400,5,2400,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1431652,1,3.5,0,0,'Y','N','Y',200000,400,5,2400,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1431653,1,3.5,0,0,'Y','N','Y',200000,400,5,2400,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1431654,1,3.5,0,0,'Y','N','Y',200000,400,5,2400,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1431655,1,3.5,0,0,'Y','N','Y',200000,400,5,2400,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1431656,1,3.5,0,0,'Y','N','Y',200000,400,5,2400,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1431657,1,3.5,0,0,'Y','N','Y',200000,400,5,2400,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1431658,1,3.5,0,0,'Y','N','Y',200000,400,5,2400,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1431659,1,3.5,0,0,'Y','N','Y',200000,400,5,2400,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1431660,1,3.5,0,0,'Y','N','Y',200000,400,5,2400,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1431661,1,3.5,0,0,'Y','N','Y',200000,400,5,2400,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1431662,1,3.5,0,0,'Y','N','Y',200000,400,5,2400,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1431734,1,3.5,0,0,'Y','N','N',250000,500,5,3000,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1431739,1,3.5,0,0,'Y','N','N',0,1000,120,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1432333,1,3.5,1,0,'Y','N','N',0,2000,60,2100,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1432682,1,3.5,0,0,'Y','N','N',75000,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1433547,1,3.5,0,0,'Y','N','N',180000,250,5,1500,72000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1367460,1,3.5,0,0,'Y','N','Y',100000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1395291,1,3.5,3,0,'Y','N','Y',90000,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (171966,1,3.5,0,0,'Y','N','Y',140000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173499,1,3.5,0,0,'Y','Y','Y',175000,200,5,1200,20000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173582,1,3.5,0,0,'Y','N','N',120000,300,10,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173686,1,3.5,1,1283,'Y','N','N',90000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173752,1,3.5,1,96,'Y','N','N',65000,100,5,600,28800,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173864,1,3.5,0,0,'Y','N','Y',140000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173890,1,3.5,0,0,'Y','N','N',60000,100,10,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (788447,1,3.5,0,0,'Y','N','N',80000,200,5,1200,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (968503,1,3.5,0,0,'Y','N','N',100000,200,5,1200,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1025695,1,3.5,0,0,'Y','N','N',65000,50,5,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (111283,1,3.5,0,0,'Y','N','Y',200000,1000,10,3000,20000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (114389,1,3.5,0,0,'Y','N','N',50000,200,10,600,6000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (117851,1,3.5,0,0,'Y','N','Y',200000,1000,10,3000,20000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (119730,1,3.5,0,0,'Y','N','N',100000,500,10,150,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (121751,1,3.5,3,0,'Y','N','Y',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (122514,1,3.5,0,0,'Y','N','Y',0,500,5,3000,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (122758,1,3.5,0,0,'Y','N','N',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (126607,1,3.5,0,0,'Y','Y','Y',150000,350,5,168,30000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (131640,1,3.5,0,0,'Y','Y','Y',120000,300,5,144,24000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (140610,1,3.5,0,0,'Y','N','N',0,300,10,900,9000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (171467,1,3.5,0,0,'Y','Y','Y',80000,150,5,72,16000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (171914,1,3.5,0,0,'Y','N','Y',200000,400,5,2400,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172065,1,3.5,1,92,'Y','N','N',180000,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172097,1,3.5,0,0,'Y','N','N',70000,100,5,600,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172198,1,3.5,0,0,'Y','N','N',80000,0,0,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172382,1,3.5,1,85,'Y','N','N',30000,50,5,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172563,1,3.5,0,0,'Y','N','N',60000,150,5,900,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172643,1,3.5,0,0,'Y','N','N',70000,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172703,1,3.5,0,0,'Y','N','N',70000,200,10,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172901,1,3.5,0,0,'Y','N','Y',100000,300,10,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172914,1,3.5,0,0,'Y','N','Y',70000,300,10,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172928,1,3.5,0,0,'Y','N','N',50000,100,10,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172945,1,3.5,0,0,'Y','N','Y',0,300,10,900,9000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172968,1,3.5,0,0,'Y','N','Y',50000,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172992,1,3.5,0,0,'Y','N','N',50000,100,10,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173019,1,3.5,0,0,'Y','Y','Y',50000,50,5,300,2000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173089,1,3.5,0,0,'Y','N','N',50000,50,5,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173139,1,3.5,0,0,'Y','N','N',60000,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173185,1,3.5,0,0,'Y','Y','Y',98000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173229,1,3.5,0,0,'Y','Y','Y',65000,50,5,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173277,1,3.5,0,0,'Y','N','N',70000,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173350,1,3.5,0,0,'Y','Y','Y',175000,200,5,1200,20000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173437,1,3.5,0,0,'Y','N','N',70000,100,5,600,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1283042,1,3.5,0,0,'Y','N','Y',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1364466,1,3.5,0,0,'Y','N','N',175000,200,5,1200,20000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1366504,1,3.5,0,0,'Y','N','N',70000,100,5,600,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1366601,1,3.5,3,0,'Y','N','Y',30000,50,5,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1366791,1,3.5,0,0,'Y','N','N',60000,150,5,900,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1367264,1,3.5,1,19,'Y','N','N',0,500,5,3000,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1367579,1,3.5,3,0,'Y','N','Y',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1367883,1,3.5,0,0,'Y','N','Y',0,500,5,3900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368446,1,3.5,0,0,'Y','N','Y',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368540,1,3.5,0,0,'Y','N','N',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368548,1,3.5,0,0,'Y','N','N',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368559,1,3.5,0,0,'Y','N','N',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368626,1,3.5,0,0,'Y','N','N',50000,200,10,600,6000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368782,1,3.5,0,0,'Y','N','N',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368937,1,3.5,0,0,'Y','Y','Y',250000,500,5,3000,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1369351,1,3.5,0,0,'Y','N','Y',200000,1000,10,3000,20000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1369928,1,3.5,0,0,'Y','N','Y',90000,400,10,1200,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1370240,1,3.5,0,0,'Y','N','Y',120000,500,10,1500,36000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1370858,1,3.5,0,0,'Y','N','Y',84000,500,10,1500,36000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1371575,1,3.5,0,0,'Y','N','Y',80000,250,5,1500,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1371776,1,3.5,0,0,'Y','Y','Y',100000,250,5,120,24000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1372289,1,3.5,0,0,'Y','N','N',70000,200,10,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1373954,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1374090,1,3.5,1,13,'Y','N','N',65000,100,5,600,28800,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1374128,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1374135,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1374326,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1377975,1,3.5,0,0,'Y','N','N',0,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1380766,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1382971,1,3.5,0,0,'Y','N','Y',120000,250,5,1500,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1385304,1,3.5,0,0,'Y','N','Y',0,500,5,3900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1396128,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1405476,1,3.5,0,0,'Y','N','Y',0,500,10,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1412893,1,3.5,0,0,'Y','N','N',0,500,10,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1025717,1,3.5,0,0,'Y','N','N',120000,1500,30,1500,20000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1040011,1,3.5,0,0,'Y','N','N',100000,150,5,900,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1040665,1,3.5,0,0,'Y','N','Y',70000,300,10,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1042410,1,3.5,0,0,'Y','N','N',120000,200,5,1200,57600,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1052741,1,3.5,0,0,'Y','N','N',240000,250,5,1500,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1140911,1,3.5,0,0,'Y','N','Y',90000,300,10,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1165319,1,3.5,0,0,'Y','N','Y',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1167439,1,3.5,0,0,'Y','Y','Y',100000,1500,30,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1167707,1,3.5,0,0,'Y','Y','Y',100000,1500,30,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1167832,1,3.5,0,0,'Y','Y','Y',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1168852,1,3.5,0,0,'Y','Y','Y',100000,1500,30,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1169364,1,3.5,0,0,'Y','Y','Y',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1169896,1,3.5,0,0,'Y','Y','Y',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1174174,1,3.5,0,0,'Y','N','Y',60000,500,10,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1180535,1,3.5,0,0,'Y','N','N',120000,300,5,1800,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1188260,1,3.5,0,0,'Y','N','Y',120000,500,10,1500,36000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1193858,1,3.5,0,0,'Y','N','Y',100000,750,30,750,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1203624,1,3.5,3,0,'Y','N','Y',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1206688,1,3.5,0,0,'Y','N','Y',180000,500,10,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1210054,1,3.5,0,0,'Y','N','Y',250000,1000,10,3000,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1219453,1,3.5,0,0,'Y','N','Y',180000,500,10,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1230128,1,3.5,0,0,'Y','N','N',100000,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1235360,1,3.5,0,0,'Y','N','Y',0,500,5,3900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1284070,1,3.5,0,0,'Y','N','Y',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (150259,1,3.5,3,0,'Y','N','Y',40000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (151725,1,3.5,0,0,'Y','N','Y',40000,100,10,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (167964,1,3.5,0,0,'Y','N','N',100000,200,5,1200,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (170995,1,3.5,0,0,'Y','Y','Y',150000,350,5,168,30000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (171721,1,3.5,1,105,'Y','N','N',180000,300,5,1800,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (171724,1,3.5,0,0,'Y','N','N',250000,800,10,2400,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (171730,1,3.5,1,172,'Y','N','N',185000,400,5,2400,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (171778,1,3.5,0,0,'Y','N','N',180000,1500,30,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (171802,1,3.5,0,0,'Y','N','N',0,2000,240,250,5000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (171830,1,3.5,0,0,'Y','N','N',350000,400,5,2400,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (171901,1,3.5,0,0,'Y','N','N',180000,400,5,2400,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172018,1,3.5,0,0,'Y','N','N',130000,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172021,1,3.5,0,0,'Y','N','N',130000,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172027,1,3.5,0,0,'Y','N','N',130000,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172041,1,3.5,0,0,'Y','N','N',120000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172051,1,3.5,1,56,'Y','N','N',100000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172052,1,3.5,0,0,'Y','N','N',70000,100,5,600,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172059,1,3.5,0,0,'Y','N','N',120000,1000,30,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172068,1,3.5,0,0,'Y','N','N',140000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172070,1,3.5,0,0,'Y','N','Y',0,1500,30,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172077,1,3.5,0,0,'Y','N','N',120000,150,5,900,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172083,1,3.5,0,0,'Y','N','N',50000,50,5,300,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172084,1,3.5,0,0,'Y','N','N',70000,100,5,600,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172089,1,3.5,0,0,'Y','N','N',70000,100,5,600,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172118,1,3.5,0,0,'Y','N','N',50000,50,5,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172120,1,3.5,0,0,'Y','N','N',70000,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172130,1,3.5,0,0,'Y','N','N',70000,100,5,600,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172134,1,3.5,0,0,'Y','N','N',70000,100,5,600,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172144,1,3.5,0,0,'Y','N','N',70000,100,5,600,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172149,1,3.5,0,0,'Y','N','N',70000,100,5,600,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172184,1,3.5,0,0,'Y','N','Y',100000,0,30,1500,30000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172204,1,3.5,0,0,'Y','N','N',0,0,0,450,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172215,1,3.5,0,0,'Y','N','N',120000,0,30,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172218,1,3.5,0,0,'Y','N','N',100000,300,10,900,72000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172228,1,3.5,0,0,'Y','N','N',120000,500,10,1500,20000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172318,1,3.5,0,0,'Y','N','N',70000,100,5,600,3000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172321,1,3.5,0,0,'Y','N','N',0,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172384,1,3.5,0,0,'Y','N','N',0,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172459,1,3.5,0,0,'Y','N','N',86000,300,10,900,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172480,1,3.5,0,0,'Y','N','N',96000,150,5,900,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172530,1,3.5,0,0,'Y','N','N',100000,200,5,1200,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172540,1,3.5,0,0,'Y','N','N',0,300,10,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172550,1,3.5,0,0,'Y','N','N',100000,200,5,1200,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172562,1,3.5,0,0,'Y','N','N',150000,250,5,1500,20000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172564,1,3.5,0,0,'Y','N','N',100000,200,5,1200,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172580,1,3.5,0,0,'Y','N','N',100000,200,5,1200,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172594,1,3.5,0,0,'Y','N','N',100000,200,5,1200,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172602,1,3.5,0,0,'Y','N','N',0,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172605,1,3.5,0,0,'Y','N','N',60000,150,5,900,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172607,1,3.5,0,0,'Y','N','Y',50000,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172632,1,3.5,0,0,'Y','N','Y',100000,150,5,900,27000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172634,1,3.5,1,43,'Y','N','N',65000,100,5,600,28800,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172647,1,3.5,1,174,'Y','N','N',65000,100,5,600,28800,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172650,1,3.5,0,0,'Y','N','N',0,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172660,1,3.5,0,0,'Y','Y','Y',150000,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172683,1,3.5,0,0,'Y','N','N',0,200,10,600,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172695,1,3.5,0,0,'Y','N','N',150000,250,5,1500,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172696,1,3.5,0,0,'Y','N','N',150000,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172777,1,3.5,0,0,'Y','N','N',0,600,30,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172840,1,3.5,0,0,'Y','N','N',0,1000,60,500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172844,1,3.5,1,175,'Y','N','N',130000,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172874,1,3.5,0,0,'Y','N','Y',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172881,1,3.5,0,0,'Y','N','N',100000,200,5,1200,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172892,1,3.5,0,0,'Y','N','N',50000,100,10,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172900,1,3.5,0,0,'Y','N','Y',70000,300,10,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172902,1,3.5,0,0,'Y','N','Y',70000,300,10,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172903,1,3.5,0,0,'Y','N','N',100000,300,10,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172904,1,3.5,0,0,'Y','N','N',70000,300,10,900,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172907,1,3.5,0,0,'Y','N','N',0,1000,60,500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172908,1,3.5,0,0,'Y','N','N',50000,100,10,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172909,1,3.5,0,0,'Y','N','Y',100000,300,10,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172912,1,3.5,0,0,'Y','N','N',170000,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172916,1,3.5,0,0,'Y','N','N',50000,100,10,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172917,1,3.5,0,0,'Y','N','N',50000,100,10,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172918,1,3.5,0,0,'Y','N','N',50000,100,10,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172919,1,3.5,0,0,'Y','N','N',50000,100,10,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172921,1,3.5,0,0,'Y','N','N',50000,100,10,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172923,1,3.5,0,0,'Y','N','N',0,1000,60,500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172927,1,3.5,0,0,'Y','N','N',50000,100,10,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172934,1,3.5,0,0,'Y','N','Y',100000,300,10,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172935,1,3.5,0,0,'Y','N','N',100000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172936,1,3.5,0,0,'Y','N','Y',100000,300,10,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172937,1,3.5,1,1,'Y','N','N',180000,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172941,1,3.5,0,0,'Y','N','N',50000,100,10,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172943,1,3.5,0,0,'Y','N','N',0,1000,60,500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172947,1,3.5,0,0,'Y','N','N',0,1000,60,500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172952,1,3.5,0,0,'Y','N','N',50000,100,10,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172956,1,3.5,3,0,'Y','N','Y',50000,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172957,1,3.5,0,0,'Y','Y','Y',5000,50,5,300,2000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172962,1,3.5,0,0,'Y','Y','Y',50000,50,5,300,2000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172965,1,3.5,0,0,'Y','N','N',50000,100,10,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172967,1,3.5,0,0,'Y','N','N',50000,100,10,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172969,1,3.5,0,0,'Y','N','N',50000,1000,30,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172970,1,3.5,1,18,'Y','N','N',50000,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172971,1,3.5,1,0,'Y','N','N',50000,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172972,1,3.5,0,0,'Y','N','N',50000,100,10,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172974,1,3.5,0,0,'Y','N','N',50000,100,10,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172979,1,3.5,1,70,'Y','N','N',50000,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172983,1,3.5,0,0,'Y','N','N',50000,100,10,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (172993,1,3.5,0,0,'Y','Y','Y',50000,50,5,300,2000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173001,1,3.5,0,0,'Y','N','Y',100000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173005,1,3.5,1,6,'Y','N','Y',100000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173009,1,3.5,0,0,'Y','Y','Y',50000,50,5,300,2000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173013,1,3.5,0,0,'Y','N','Y',70000,100,5,600,5000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173014,1,3.5,0,0,'Y','Y','Y',50000,50,5,300,2000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173018,1,3.5,0,0,'Y','Y','Y',50000,50,5,300,2000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173020,1,3.5,0,0,'Y','Y','Y',50000,50,5,300,2000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173021,1,3.5,0,0,'Y','Y','Y',50000,50,5,300,2000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173028,1,3.5,0,0,'Y','Y','Y',50000,50,5,300,2000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173047,1,3.5,1,79,'Y','N','N',100000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173048,1,3.5,0,0,'Y','N','N',50000,100,10,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173073,1,3.5,0,0,'Y','N','N',60000,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173077,1,3.5,0,0,'Y','N','N',50000,50,5,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173091,1,3.5,0,0,'Y','N','N',50000,0,30,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173093,1,3.5,0,0,'Y','N','N',98000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173104,1,3.5,0,0,'Y','N','N',60000,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173117,1,3.5,0,0,'Y','Y','Y',100000,300,10,900,9000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173123,1,3.5,0,0,'Y','N','N',50000,0,30,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173129,1,3.5,0,0,'Y','N','N',50000,0,30,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173141,1,3.5,0,0,'Y','N','N',50000,100,10,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173142,1,3.5,0,0,'Y','N','N',50000,0,30,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173150,1,3.5,0,0,'Y','Y','Y',70000,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173152,1,3.5,0,0,'Y','N','N',70000,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173153,1,3.5,0,0,'Y','N','N',50000,0,30,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173160,1,3.5,0,0,'Y','N','N',50000,0,30,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173184,1,3.5,0,0,'Y','Y','Y',100000,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173186,1,3.5,0,0,'Y','N','N',140000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173187,1,3.5,0,0,'Y','N','N',70000,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173192,1,3.5,0,0,'Y','Y','Y',84000,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173193,1,3.5,0,0,'Y','N','N',70000,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173196,1,3.5,0,0,'Y','N','N',70000,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173208,1,3.5,0,0,'Y','Y','Y',140000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173218,1,3.5,0,0,'Y','N','N',70000,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173235,1,3.5,0,0,'Y','Y','Y',65000,50,5,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173238,1,3.5,0,0,'Y','Y','Y',65000,20,5,120,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173245,1,3.5,0,0,'Y','N','N',65000,50,5,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173246,1,3.5,0,0,'Y','N','N',65000,50,5,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173250,1,3.5,0,0,'Y','N','N',70000,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173261,1,3.5,0,0,'Y','N','N',100000,300,10,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173262,1,3.5,0,0,'Y','Y','Y',65000,50,5,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173285,1,3.5,0,0,'Y','N','Y',90000,300,10,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173289,1,3.5,0,0,'Y','N','N',100000,300,10,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173291,1,3.5,0,0,'Y','N','N',100000,300,10,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173299,1,3.5,0,0,'Y','N','N',65000,50,5,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173317,1,3.5,1,0,'Y','N','N',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173329,1,3.25,0,0,'Y','N','N',50000,300,30,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173333,1,3.5,0,0,'Y','N','N',0,300,30,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173353,1,3.5,0,0,'Y','N','N',0,300,30,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173359,1,3.75,0,0,'Y','N','N',120000,150,5,900,16000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173362,1,3.5,0,0,'Y','N','N',0,300,30,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173364,1,3.5,0,0,'Y','N','N',0,1500,30,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173389,1,3.5,0,0,'Y','Y','Y',70000,150,5,900,14000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173405,1,3.5,0,0,'Y','N','N',120000,300,10,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173424,1,3.5,1,8,'Y','N','Y',50000,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173440,1,3.25,0,0,'Y','Y','Y',120000,150,5,900,16000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173447,1,3.5,0,0,'Y','Y','Y',175000,200,5,1200,20000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173452,1,3.5,1,105,'Y','N','N',130000,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173468,1,3.5,0,0,'Y','N','N',70000,150,5,900,14000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173472,1,3.5,0,0,'Y','N','N',70000,100,5,600,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173474,1,3.5,0,0,'Y','Y','Y',70000,150,5,900,14000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (173485,1,3.5,0,0,'Y','N','N',120000,300,10,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1374036,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1284245,1,3.5,0,0,'Y','N','Y',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1344768,1,3.5,0,0,'Y','N','Y',0,500,10,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1356076,1,3.5,0,0,'Y','N','N',0,100,10,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1359444,1,3.5,0,0,'Y','N','N',0,500,10,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1359629,1,3.5,0,0,'Y','N','N',0,300,10,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1362843,1,3.5,0,0,'Y','N','N',0,300,10,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1364468,1,3.5,0,0,'Y','N','N',70000,100,5,600,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1364472,1,3.5,0,0,'Y','N','N',70000,100,5,600,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1366393,1,3.5,0,0,'Y','N','N',70000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1366394,1,3.5,0,0,'Y','N','N',50000,50,5,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1366395,1,3.5,0,0,'Y','N','N',70000,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1366430,1,3.5,0,0,'Y','N','N',70000,300,10,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1366487,1,3.5,0,0,'Y','N','N',140000,500,10,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1366489,1,3.5,0,0,'Y','N','N',120000,300,10,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1366527,1,3.5,1,50,'Y','N','N',50000,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1366541,1,3.5,1,27,'Y','N','N',100000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1366575,1,3.5,0,0,'Y','N','Y',50000,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1366576,1,3.5,1,43,'Y','N','N',65000,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1366590,1,3.5,1,39,'Y','N','N',120000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1366593,1,3.5,0,0,'Y','N','N',0,600,30,600,12000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1366600,1,3.5,1,32,'Y','N','N',65000,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1366602,1,3.5,0,0,'Y','N','Y',50000,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1366720,1,3.5,0,0,'Y','N','N',0,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1366722,1,3.5,0,0,'Y','N','N',50000,200,10,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1366729,1,3.5,0,0,'Y','N','N',0,1800,30,1800,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1366731,1,3.5,0,0,'Y','N','N',0,1800,30,1800,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1366732,1,3.5,0,0,'Y','N','N',0,1800,30,1800,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1366757,1,3.5,0,0,'Y','N','Y',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1366792,1,3.5,0,0,'Y','N','N',100000,200,5,1200,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1366794,1,3.5,0,0,'Y','N','N',60000,150,5,900,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1366795,1,3.5,0,0,'Y','N','N',150000,250,5,1500,30000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1366869,1,3.5,0,0,'Y','N','N',50000,300,30,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1366894,1,3.5,0,0,'Y','N','Y',240000,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1366903,1,3.5,1,0,'Y','N','N',100000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1367218,1,3.5,0,0,'Y','N','N',70000,300,10,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1367258,1,3.5,1,1,'Y','N','N',0,2000,60,2100,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1367347,1,3.5,1,8,'Y','N','Y',0,500,5,3900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1367534,1,3.5,0,0,'Y','N','Y',0,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1367625,1,3.5,3,0,'Y','N','Y',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1367666,1,3.5,3,0,'Y','N','N',0,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1367686,1,3.5,0,0,'Y','N','Y',0,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1367709,1,3.5,0,0,'Y','N','Y',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1367753,1,3.5,0,0,'Y','N','Y',0,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1367801,1,3.5,0,0,'Y','N','Y',0,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1367842,1,3.5,0,0,'Y','N','Y',0,500,5,3900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368281,1,3.5,0,0,'Y','N','Y',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368329,1,3.5,0,0,'Y','N','Y',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368353,1,3.5,0,0,'Y','N','Y',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368357,1,3.5,0,0,'Y','N','Y',0,500,10,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368359,1,3.5,0,0,'Y','N','Y',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368440,1,3.5,0,0,'Y','N','Y',0,500,10,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368441,1,3.5,0,0,'Y','N','Y',0,500,10,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368453,1,3.5,0,0,'Y','N','Y',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368482,1,3.5,0,0,'Y','N','Y',150000,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368504,1,3.5,0,0,'Y','N','N',0,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368507,1,3.5,0,0,'Y','N','Y',0,0,30,3000,5000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368516,1,3.5,0,0,'Y','N','N',100000,250,5,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368529,1,3.5,0,0,'Y','N','N',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368534,1,3.5,0,0,'Y','N','N',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368541,1,3.5,0,0,'Y','N','N',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368542,1,3.5,0,0,'Y','N','N',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368543,1,3.5,0,0,'Y','N','N',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368544,1,3.5,0,0,'Y','N','N',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368545,1,3.5,0,0,'Y','N','N',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368546,1,3.5,0,0,'Y','N','N',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368547,1,3.5,0,0,'Y','N','N',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368549,1,3.5,0,0,'Y','N','N',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368550,1,3.5,0,0,'Y','N','N',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368551,1,3.5,0,0,'Y','N','N',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368552,1,3.5,0,0,'Y','N','N',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368553,1,3.5,0,0,'Y','N','N',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368554,1,3.5,0,0,'Y','N','N',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368557,1,3.5,0,0,'Y','N','N',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368558,1,3.5,0,0,'Y','N','N',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368568,1,3.5,0,0,'Y','N','N',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368570,1,3.5,0,0,'Y','N','N',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368572,1,3.5,0,0,'Y','N','N',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368573,1,3.5,0,0,'Y','N','N',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368575,1,3.5,0,0,'Y','N','N',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368576,1,3.5,0,0,'Y','N','N',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368577,1,3.5,0,0,'Y','N','N',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368658,1,3.5,0,0,'Y','N','Y',0,500,10,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368670,1,3.5,0,0,'Y','N','Y',0,500,10,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368688,1,3.5,0,0,'Y','N','Y',0,500,10,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368698,1,3.5,0,0,'Y','N','N',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368701,1,3.5,0,0,'Y','N','Y',0,500,10,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368745,1,3.5,0,0,'Y','N','N',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368749,1,3.5,0,0,'Y','N','N',140000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368765,1,3.5,0,0,'Y','N','N',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368816,1,3.5,0,0,'Y','N','Y',250000,600,5,3600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368833,1,3.5,0,0,'Y','N','N',100000,500,10,150,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368838,1,3.5,0,0,'Y','N','N',100000,500,10,150,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368841,1,3.5,0,0,'Y','N','N',50000,200,10,600,6000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368849,1,3.5,0,0,'Y','N','N',50000,200,10,600,6000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368870,1,3.5,0,0,'Y','N','Y',250000,500,5,3000,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368885,1,3.5,0,0,'Y','N','Y',250000,500,5,3000,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1368948,1,3.5,0,0,'Y','N','Y',250000,500,5,3000,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1369035,1,3.5,0,0,'Y','N','Y',250000,500,5,3000,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1369044,1,3.5,0,0,'Y','N','N',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1369093,1,3.5,0,0,'Y','N','Y',200000,1000,10,3000,20000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1369233,1,3.5,0,0,'Y','N','Y',250000,500,5,3000,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1369246,1,3.5,0,0,'Y','N','Y',200000,1000,10,3000,20000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1369265,1,3.5,0,0,'Y','N','Y',200000,1000,10,3000,20000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1369380,1,3.5,0,0,'Y','N','Y',200000,1000,10,3000,20000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1369476,1,3.5,1,1,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1369485,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1369631,1,3.5,0,0,'Y','Y','Y',50000,200,10,600,6000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1369672,1,3.5,0,0,'Y','N','Y',250000,500,5,3000,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1369741,1,3.5,0,0,'Y','Y','Y',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1369853,1,3.5,0,0,'Y','N','Y',130000,300,10,900,9000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1370000,1,3.5,0,0,'Y','N','Y',120000,200,5,1200,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1370001,1,3.5,0,0,'Y','N','N',40000,200,10,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1370023,1,3.5,0,0,'Y','N','N',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1370056,1,3.5,0,0,'Y','N','N',0,500,10,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1370082,1,3.5,0,0,'Y','N','Y',70000,300,10,900,9000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1370100,1,3.5,1,1254,'Y','N','N',80000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1370196,1,3.5,0,0,'Y','Y','Y',150000,350,5,168,30000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1370284,1,3.5,0,0,'Y','N','Y',120000,500,1,1500,36000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1370392,1,3.5,0,0,'Y','N','Y',120000,500,10,1500,36000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1370446,1,3.5,0,0,'Y','N','Y',120000,500,10,1500,36000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1370637,1,3.5,0,0,'Y','N','N',60000,150,5,900,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1370659,1,3.5,0,0,'Y','N','Y',50000,200,10,600,12000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1370767,1,3.5,0,0,'Y','N','Y',84000,500,10,1500,36000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1370819,1,3.5,0,0,'Y','N','Y',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1370857,1,3.5,0,0,'Y','Y','Y',0,150,5,900,3000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1370919,1,3.5,0,0,'Y','N','Y',0,500,10,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1370975,1,3.5,0,0,'Y','N','Y',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1371037,1,3.5,0,0,'Y','N','Y',80000,250,5,1500,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1371281,1,3.5,0,0,'Y','N','N',60000,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1371306,1,3.5,0,0,'Y','Y','Y',120000,250,5,120,24000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1371375,1,3.5,0,0,'Y','N','Y',90000,400,10,1200,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1371454,1,3.5,0,0,'Y','N','Y',0,200,5,1200,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1371458,1,3.5,0,0,'Y','N','Y',80000,250,5,1500,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1371615,1,3.5,0,0,'Y','N','Y',80000,250,5,1500,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1371666,1,3.5,0,0,'Y','N','N',165000,2000,30,1500,25000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1371671,1,3.5,0,0,'Y','N','N',180000,2000,30,3000,20000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1371688,1,3.5,0,0,'Y','Y','Y',70000,300,10,900,9000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1371689,1,3.5,0,0,'Y','Y','Y',70000,300,10,9000,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1371690,1,3.5,0,0,'Y','Y','Y',70000,300,10,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1371733,1,3.5,0,0,'Y','N','Y',120000,500,10,1500,36000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1371916,1,3.5,0,0,'Y','N','Y',80000,250,5,1500,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1371992,1,3.5,0,0,'Y','N','N',0,100,10,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1372066,1,3.5,0,0,'Y','Y','Y',80000,150,5,72,16000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1372128,1,3.5,0,0,'Y','N','N',75000,200,10,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1372154,1,3.5,0,0,'Y','N','N',50000,200,10,600,18000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1372161,1,3.5,0,0,'Y','N','N',0,500,10,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1372243,1,3.5,0,0,'Y','N','N',0,500,10,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1372264,1,3.5,0,0,'Y','N','N',0,500,10,1500,24000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1372387,1,3.5,0,0,'Y','N','N',0,300,10,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1372454,1,3.5,0,0,'Y','N','N',100000,150,5,900,18000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1372518,1,3.5,0,0,'Y','N','N',0,300,10,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1372581,1,3.5,0,0,'Y','N','N',0,300,10,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1372649,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1372691,1,3.5,0,0,'Y','N','Y',0,250,5,3000,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1372873,1,3.5,0,0,'Y','N','N',65000,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1373985,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1373998,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1374001,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1374070,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1374088,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1169490,1,3.5,0,0,'Y','Y','Y',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1374110,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1374115,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1374116,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1374118,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1374119,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1374120,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1374126,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1374127,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1374129,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1374130,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1374131,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1374132,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1374133,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1374134,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1374136,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1374137,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1374138,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1374139,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1374140,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1374294,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1374473,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1375052,1,3.5,0,0,'Y','N','Y',80000,250,5,1500,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1376334,1,3.5,0,0,'Y','N','N',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1377117,1,3.5,1,6,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1377393,1,3.5,0,0,'Y','N','Y',250000,1000,10,3000,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1377416,1,3.5,0,0,'Y','N','N',0,700,10,2100,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1380362,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1380394,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1380556,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1380638,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1380752,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1380762,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1380764,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1380767,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1380768,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1380769,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1380770,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1380772,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1382791,1,3.5,0,0,'Y','Y','Y',0,2,1,40,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1384005,1,3.5,0,0,'Y','N','Y',60000,500,10,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1384007,1,3.5,0,0,'Y','N','Y',60000,500,10,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1384008,1,3.5,0,0,'Y','N','Y',60000,500,10,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1384016,1,3.5,0,0,'Y','N','Y',60000,100,5,600,5000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1384198,1,3.5,1,891,'Y','N','N',180000,400,5,2400,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1384440,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1384451,1,3.5,0,0,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1385009,1,3.5,0,0,'Y','N','N',100000,200,5,1200,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1385457,1,3.5,0,0,'Y','N','N',150000,500,5,3000,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1385828,1,3.5,0,0,'Y','N','N',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1386536,1,3.5,0,0,'Y','Y','Y',200000,400,5,2400,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1387193,1,3.5,3,0,'Y','N','Y',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1392010,1,3.5,0,0,'Y','N','N',6,2,1,40,5,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1393591,1,3.5,1,10,'N','Y','Y',0,0,0,0,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1395163,1,3.5,0,0,'Y','N','Y',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1397591,1,3.5,0,0,'Y','N','N',100000,150,5,900,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1397945,1,3.5,0,0,'Y','N','Y',80000,250,5,1500,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1398740,1,3.5,0,0,'Y','N','N',60000,300,10,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1401516,1,3.5,0,0,'Y','N','Y',0,2000,30,3000,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1404649,1,3.5,0,0,'Y','N','N',60000,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1405474,1,3.5,0,0,'Y','N','Y',0,500,10,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1405477,1,3.5,0,0,'Y','N','Y',0,500,10,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1405614,1,3.5,0,0,'Y','N','Y',100000,1500,30,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1406805,1,3.5,0,0,'Y','Y','Y',100000,1500,30,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1407803,1,3.5,0,0,'Y','N','Y',250000,1000,10,3000,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1410226,1,3.5,0,0,'Y','N','N',0,1500,30,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1412826,1,3.5,0,0,'Y','N','N',70000,200,10,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1412862,1,3.5,0,0,'Y','N','N',0,300,10,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1413181,1,3.5,0,0,'Y','Y','Y',0,2000,60,1000,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1415250,1,3.5,0,0,'Y','N','N',0,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1415512,1,3.5,0,0,'Y','N','N',120000,500,10,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1415929,1,3.5,0,0,'Y','N','N',0,100,10,300,14400,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1416322,1,3.5,0,0,'Y','N','N',65000,50,10,150,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1416339,1,3.5,1,103,'Y','N','N',100000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1028245,1,3.5,0,0,'Y','N','N',0,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1032247,1,3.5,0,0,'Y','N','N',120000,300,10,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1033590,1,3.5,0,0,'Y','N','N',0,300,30,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1033754,1,3.5,0,0,'Y','N','N',70000,150,5,900,14000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1034344,1,3.5,0,0,'Y','N','N',60000,150,5,900,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1034345,1,3.5,0,0,'Y','N','N',100000,200,5,1200,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1037569,1,3.5,0,0,'Y','N','N',70000,300,10,900,9000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1037932,1,3.5,1,43,'Y','N','N',65000,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1040225,1,3.5,0,0,'Y','Y','Y',70000,150,5,900,14000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1040346,1,3.5,0,0,'Y','N','Y',50000,300,10,900,9000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1040347,1,3.5,0,0,'Y','N','Y',70000,300,10,900,9000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1040348,1,3.5,0,0,'Y','N','Y',70000,300,10,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1040414,1,3.5,0,0,'Y','N','Y',40000,0,10,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1040508,1,3.5,0,0,'Y','N','Y',70000,300,10,900,9000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1040564,1,3.5,0,0,'Y','N','Y',70000,300,10,900,9000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1040712,1,3.5,0,0,'Y','N','Y',70000,300,10,900,9000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1041839,1,3.5,0,0,'Y','N','N',240000,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1041840,1,3.5,0,0,'Y','N','N',240000,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1041991,1,3.5,0,0,'Y','N','Y',100000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1042402,1,3.5,0,0,'Y','N','N',175000,200,5,1200,20000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1042405,1,3.5,0,0,'Y','N','N',120000,150,5,900,16000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1042406,1,3.5,0,0,'Y','Y','Y',175000,400,5,2400,20000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1042421,1,3.5,0,0,'Y','N','N',70000,150,5,900,14000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1042423,1,3.5,0,0,'Y','Y','Y',70000,150,5,900,14000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1051018,1,3.5,0,0,'Y','N','N',0,200,10,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1051019,1,3.5,0,0,'Y','N','N',0,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1051043,1,3.5,1,49,'Y','N','N',65000,100,5,600,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1052723,1,3.5,0,0,'Y','N','N',50000,50,5,300,5000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1052725,1,3.5,0,0,'Y','N','N',70000,100,5,600,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1052737,1,3.5,0,0,'Y','N','N',70000,100,5,600,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1053712,1,3.5,0,0,'Y','N','Y',60000,100,5,600,5000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1056832,1,3.5,0,0,'Y','N','N',100000,300,10,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1056834,1,3.5,0,0,'Y','N','N',50000,200,10,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1059009,1,3.5,0,0,'Y','N','N',0,300,30,300,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1079122,1,3.5,0,0,'Y','N','N',120000,150,5,900,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1140909,1,3.5,0,0,'Y','N','N',120000,300,10,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1140910,1,3.5,0,0,'Y','N','N',120000,300,10,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1144569,1,3.5,0,0,'Y','N','N',0,2000,240,250,5000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1155460,1,3.5,0,0,'Y','N','Y',80000,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1155752,1,3.5,0,0,'Y','N','Y',120000,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1155759,1,3.5,0,0,'Y','N','N',0,1500,30,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1155939,1,3.5,0,0,'Y','N','N',100000,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1159004,1,3.5,0,0,'Y','N','N',0,150,5,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1163648,1,3.5,3,0,'Y','N','Y',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1165941,1,3.5,0,0,'Y','N','N',130000,3000,60,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1166037,1,3.5,0,0,'Y','N','Y',80000,300,10,900,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1167311,1,3.5,0,0,'Y','Y','Y',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1167315,1,3.5,0,0,'Y','Y','Y',65000,200,10,600,10000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1167394,1,3.5,0,0,'Y','Y','Y',100000,1500,30,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1167437,1,3.5,0,0,'Y','Y','Y',100000,1500,30,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1167438,1,3.5,0,0,'Y','Y','Y',100000,1500,30,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1167440,1,3.5,0,0,'Y','Y','Y',100000,1500,30,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1167443,1,3.5,0,0,'Y','N','N',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1167444,1,3.5,0,0,'Y','Y','Y',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1167445,1,3.5,0,0,'Y','Y','Y',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1167450,1,3.5,0,0,'Y','Y','Y',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1167633,1,3.5,0,0,'Y','Y','Y',100000,1500,30,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1167691,1,3.5,0,0,'Y','Y','Y',100000,1500,30,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1167706,1,3.5,0,0,'Y','Y','Y',100000,1500,30,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1167708,1,3.5,0,0,'Y','Y','Y',100000,1500,30,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1167709,1,3.5,0,0,'Y','Y','Y',100000,1500,30,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1167710,1,3.5,0,0,'Y','Y','Y',100000,1500,30,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1167736,1,3.5,0,0,'Y','Y','Y',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1167762,1,3.5,3,0,'Y','N','Y',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1167764,1,3.5,0,0,'Y','Y','Y',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1167823,1,3.5,0,0,'Y','Y','Y',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1167932,1,3.5,0,0,'Y','Y','Y',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1167961,1,3.5,0,0,'Y','Y','Y',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1168040,1,3.5,0,0,'Y','N','N',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1168323,1,3.5,0,0,'Y','Y','Y',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1168498,1,3.5,0,0,'Y','Y','Y',100000,1500,30,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1168606,1,3.5,0,0,'Y','Y','Y',100000,1500,30,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1168658,1,3.5,0,0,'Y','Y','Y',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1168804,1,3.5,0,0,'Y','Y','Y',100000,1500,30,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1168928,1,3.5,0,0,'Y','N','N',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1168986,1,3.5,0,0,'Y','Y','Y',100000,1500,30,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1169033,1,3.5,0,0,'Y','Y','Y',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1169034,1,3.5,0,0,'Y','Y','Y',100000,1500,30,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1169081,1,3.5,0,0,'Y','Y','Y',100000,1500,30,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1169082,1,3.5,0,0,'Y','Y','Y',100000,1500,30,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1169256,1,3.5,0,0,'Y','Y','Y',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1169370,1,3.5,0,0,'Y','N','Y',0,250,5,1500,0,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1169373,1,3.5,0,0,'Y','Y','Y',100000,500,10,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1169446,1,3.5,0,0,'Y','Y','Y',100000,1500,30,1500,15000,1,null);
Insert into PARKING_DETAIL (PARK_ID,PARK_FLAG,PARK_AVGPOINT,GET_STATUS,CUR_PARKING,PAY_YN,SATUR_PAY_YN,HOLI_PAY_YN,FULLTIME_MONTHLY_PAY,PARK_RATE,PARK_TIME_RATE,ADD_PARK_RATE,DAY_MAX_PAY,PARK_VISIT,FACILITY) values (1169462,1,3.5,0,0,'Y','Y','Y',100000,500,10,1500,15000,1,null);

---------------------------------------------------
--   END DATA FOR TABLE PARKING_DETAIL
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE PICTURE
--   FILTER = none used
---------------------------------------------------
REM INSERTING into PICTURE

---------------------------------------------------
--   END DATA FOR TABLE PICTURE
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE GRADE
--   FILTER = none used
---------------------------------------------------
REM INSERTING into GRADE
Insert into GRADE (GRADE_ID,GRADE_NAME,AVGPOINT,BENEFIT,PENALTY) values (0,'����������',0,0,0);
Insert into GRADE (GRADE_ID,GRADE_NAME,AVGPOINT,BENEFIT,PENALTY) values (1,'�ο�������',0,0,0);
Insert into GRADE (GRADE_ID,GRADE_NAME,AVGPOINT,BENEFIT,PENALTY) values (2,'�ҷ���',2,0,10);
Insert into GRADE (GRADE_ID,GRADE_NAME,AVGPOINT,BENEFIT,PENALTY) values (3,'�Ϲݰ�',3,10,0);
Insert into GRADE (GRADE_ID,GRADE_NAME,AVGPOINT,BENEFIT,PENALTY) values (4,'�����',4,20,0);
Insert into GRADE (GRADE_ID,GRADE_NAME,AVGPOINT,BENEFIT,PENALTY) values (5,'�ֿ����',5,30,0);

---------------------------------------------------
--   END DATA FOR TABLE GRADE
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MESSAGE
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MESSAGE
Insert into MESSAGE (MSEQ,SEQ,RECEIVER_ID,MSG_FLAG,DELETE_SEND,DELETE_RECEI) values (199,628,'PublicPark',0,0,0);
Insert into MESSAGE (MSEQ,SEQ,RECEIVER_ID,MSG_FLAG,DELETE_SEND,DELETE_RECEI) values (223,686,'PublicPark',0,0,0);
Insert into MESSAGE (MSEQ,SEQ,RECEIVER_ID,MSG_FLAG,DELETE_SEND,DELETE_RECEI) values (194,623,'RgPark',0,0,0);
Insert into MESSAGE (MSEQ,SEQ,RECEIVER_ID,MSG_FLAG,DELETE_SEND,DELETE_RECEI) values (195,624,'IUGuest',1,0,0);
Insert into MESSAGE (MSEQ,SEQ,RECEIVER_ID,MSG_FLAG,DELETE_SEND,DELETE_RECEI) values (93,213,'IUGuest',1,0,0);
Insert into MESSAGE (MSEQ,SEQ,RECEIVER_ID,MSG_FLAG,DELETE_SEND,DELETE_RECEI) values (197,626,'didrl',1,0,0);
Insert into MESSAGE (MSEQ,SEQ,RECEIVER_ID,MSG_FLAG,DELETE_SEND,DELETE_RECEI) values (200,629,'PublicPark',0,0,0);
Insert into MESSAGE (MSEQ,SEQ,RECEIVER_ID,MSG_FLAG,DELETE_SEND,DELETE_RECEI) values (263,745,'PublicPark',0,0,0);
Insert into MESSAGE (MSEQ,SEQ,RECEIVER_ID,MSG_FLAG,DELETE_SEND,DELETE_RECEI) values (57,157,'didrl2',1,0,0);
Insert into MESSAGE (MSEQ,SEQ,RECEIVER_ID,MSG_FLAG,DELETE_SEND,DELETE_RECEI) values (83,203,'RgPark',1,0,0);
Insert into MESSAGE (MSEQ,SEQ,RECEIVER_ID,MSG_FLAG,DELETE_SEND,DELETE_RECEI) values (196,625,'didrl',1,0,0);
Insert into MESSAGE (MSEQ,SEQ,RECEIVER_ID,MSG_FLAG,DELETE_SEND,DELETE_RECEI) values (202,632,'RgPark',1,0,0);
Insert into MESSAGE (MSEQ,SEQ,RECEIVER_ID,MSG_FLAG,DELETE_SEND,DELETE_RECEI) values (187,615,'PublicPark',0,0,0);
Insert into MESSAGE (MSEQ,SEQ,RECEIVER_ID,MSG_FLAG,DELETE_SEND,DELETE_RECEI) values (84,204,'RgPark',1,0,0);
Insert into MESSAGE (MSEQ,SEQ,RECEIVER_ID,MSG_FLAG,DELETE_SEND,DELETE_RECEI) values (91,211,'RgPark',0,0,0);
Insert into MESSAGE (MSEQ,SEQ,RECEIVER_ID,MSG_FLAG,DELETE_SEND,DELETE_RECEI) values (261,742,'RgPark',1,1,0);
Insert into MESSAGE (MSEQ,SEQ,RECEIVER_ID,MSG_FLAG,DELETE_SEND,DELETE_RECEI) values (186,614,'IUGuest',1,0,0);
Insert into MESSAGE (MSEQ,SEQ,RECEIVER_ID,MSG_FLAG,DELETE_SEND,DELETE_RECEI) values (81,201,'RgPark',0,0,0);
Insert into MESSAGE (MSEQ,SEQ,RECEIVER_ID,MSG_FLAG,DELETE_SEND,DELETE_RECEI) values (198,627,'RgPark',1,0,0);
Insert into MESSAGE (MSEQ,SEQ,RECEIVER_ID,MSG_FLAG,DELETE_SEND,DELETE_RECEI) values (101,221,'RgPark',1,0,0);
Insert into MESSAGE (MSEQ,SEQ,RECEIVER_ID,MSG_FLAG,DELETE_SEND,DELETE_RECEI) values (121,223,'PublicPark',1,0,0);
Insert into MESSAGE (MSEQ,SEQ,RECEIVER_ID,MSG_FLAG,DELETE_SEND,DELETE_RECEI) values (221,661,'IUGuest',1,0,0);
Insert into MESSAGE (MSEQ,SEQ,RECEIVER_ID,MSG_FLAG,DELETE_SEND,DELETE_RECEI) values (222,662,'IUGuest',1,0,0);
Insert into MESSAGE (MSEQ,SEQ,RECEIVER_ID,MSG_FLAG,DELETE_SEND,DELETE_RECEI) values (262,743,'��',1,0,0);
Insert into MESSAGE (MSEQ,SEQ,RECEIVER_ID,MSG_FLAG,DELETE_SEND,DELETE_RECEI) values (181,0,'IUGuest',0,0,0);
Insert into MESSAGE (MSEQ,SEQ,RECEIVER_ID,MSG_FLAG,DELETE_SEND,DELETE_RECEI) values (182,536,'PublicPark',1,0,0);

---------------------------------------------------
--   END DATA FOR TABLE MESSAGE
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE FAQ
--   FILTER = none used
---------------------------------------------------
REM INSERTING into FAQ

---------------------------------------------------
--   END DATA FOR TABLE FAQ
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE CITIES
--   FILTER = none used
---------------------------------------------------
REM INSERTING into CITIES
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11650,11650101,'���ʱ�','��赿',37.4790075,126.9959106);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11560,11560116,'��������','��굿6��',37.5347504,126.9031696);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11350,11350105,'�����','��赿',37.6664734,127.0723256);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110125,'���α�','���е�',37.575195,126.9799525);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110103,'���α�','������',37.5849071,126.9724098);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11380,11380107,'����','���ϵ�',37.5926842,126.9257987);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110158,'���α�','������',37.5695052,126.9984624);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110171,'���α�','���2��',37.5846181,126.9991755);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110134,'���α�','��',37.5752459,126.9864011);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110127,'���α�','����',37.5713261,126.9832337);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110122,'���α�','û����',37.5715373,126.9802941);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11590,11590104,'���۱�','����',37.5124878,126.9551134);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110108,'���α�','���ε�',37.5798178,126.9700653);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11320,11320107,'������','â��',37.6463131,127.0433803);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11230,11230107,'���빮��','û������',37.5883148,127.0460902);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11230,11230104,'���빮��','����',37.5802851,127.0556712);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11230,11230110,'���빮��','�̹���',37.5994013,127.0624711);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11230,11230109,'���빮��','�ְ浿',37.5881848,127.0643275);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11590,11590102,'���۱�','�󵵵�',37.4996854,126.9455507);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11545,11545102,'��õ��','���굿',37.4663645,126.8975781);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11545,11545103,'��õ��','���ﵿ',37.4497033,126.9106968);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11530,11530107,'���α�','������',37.4946532,126.8517614);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11530,11530102,'���α�','���ε�',37.4937929,126.8853184);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140162,'�߱�','�Ŵ絿',37.556819,127.0154307);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11305,11305101,'���ϱ�','�̾Ƶ�',37.6219876,127.023568);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110114,'���α�','���ڵ�',37.575276,126.9718272);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140110,'�߱�','��ǥ��',37.5674664,126.9894374);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11260,11260106,'�߶���','�ų���',37.6102524,127.1011554);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11500,11500109,'������','��ȭ��',37.5773667,126.8147523);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11620,11620102,'���Ǳ�','�Ÿ���',37.4630314,126.9347748);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11620,11620101,'���Ǳ�','��õ��',37.4750363,126.9490877);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110142,'���α�','�Ұݵ�',37.5797855,126.9810122);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110109,'���α�','����',37.5802364,126.9623726);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110139,'���α�','���ǵ�',37.5827295,126.9805798);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110107,'���α�','������',37.5752845,126.9739372);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11680,11680108,'������','������',37.5138347,127.0317065);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110111,'���α�','���ε�',37.5835524,126.9641937);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11380,11380104,'����','������',37.6210985,126.9132644);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110123,'���α�','������',37.569505,126.9803081);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110153,'���α�','���ǵ�',37.5720312,126.990647);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11500,11500111,'������','���ص�',37.5662169,126.7883552);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11500,11500108,'������','���׵�',37.5528356,126.8112165);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11590,11590108,'���۱�','��浿',37.5067515,126.9277457);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110118,'���α�','������',37.5733668,126.9721018);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11590,11590105,'���۱�','�漮��',37.5052783,126.9638235);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11320,11320105,'������','�ֹ���',37.6525541,127.027372);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11320,11320106,'������','���е�',37.6646494,127.033485);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110105,'���α�','â����',37.580573,126.9723678);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11320,11320108,'������','������',37.6852416,127.0298659);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11230,11230103,'���빮��','���⵿',37.5847824,127.0368408);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11380,11380105,'����','���굿',37.6122006,126.9088195);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11230,11230105,'���빮��','��ʸ���',37.5699332,127.0551219);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11230,11230102,'���빮��','��ε�',37.5762335,127.0348719);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110141,'���α�','�ȱ���',37.5774765,126.9838448);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11230,11230108,'���빮��','ȸ�⵿',37.594437,127.0521254);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11530,11530112,'���α�','�׵�',37.4810222,126.8236565);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110119,'���α�','������',37.5794898,126.9770088);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110121,'���α�','�Ź���2��',37.5710316,126.9692512);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110140,'���α�','��û��',37.5898785,126.9813801);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11230,11230101,'���빮��','�ż���',37.5748049,127.0255932);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110130,'���α�','�ͷ浿',37.5809142,126.9927446);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110148,'���α�','�赿',37.5829045,126.9868775);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110104,'���α�','ȿ�ڵ�',37.5827038,126.9718984);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110126,'���α�','����1��',37.5706982,126.9803342);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11230,11230106,'���빮��','��ȵ�',37.5711171,127.0674268);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11590,11590107,'���۱�','��絿',37.4851779,126.9717962);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11545,11545101,'��õ��','���굿',37.4754693,126.884239);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11530,11530103,'���α�','��������',37.4830168,126.8882519);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140137,'�߱�','�ʵ�1��',37.561147,126.9924131);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11530,11530106,'���α�','��ô��',37.5024055,126.8586175);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11530,11530101,'���α�','�ŵ�����',37.5105874,126.8830737);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11530,11530108,'���α�','������',37.4922507,126.8372032);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11260,11260104,'�߶���','����',37.6125348,127.0803391);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11380,11380102,'����','�����',37.6041196,126.9344915);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110115,'���α�','������',37.5753838,126.9658266);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11380,11380101,'����','������',37.5849864,126.8928479);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110101,'���α�','û�',37.5890286,126.968516);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11380,11380103,'����','�ұ���',37.6191932,126.9351343);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110117,'���α�','���ֵ�',37.5715788,126.9738254);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11380,11380108,'����','���̵�',37.60508,126.9121449);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11380,11380109,'����','�Ż絿',37.5959208,126.9074635);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110112,'���α�','ü�ε�',37.5778624,126.9710384);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11380,11380110,'����','���굿',37.583179,126.9061071);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11590,11590103,'���۱�','��1��',37.5032399,126.9498624);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11590,11590109,'���۱�','�Ŵ�浿',37.4921384,126.9166602);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11380,11380114,'����','������',37.6422519,126.9340853);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140163,'�߱�','���ε�',37.5676493,127.0160094);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110156,'���α�','����3��',37.5703825,126.9923931);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140149,'�߱�','������7��',37.566416,127.0095184);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110159,'���α�','������',37.575484,126.9976457);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140164,'�߱�','���е�',37.5642292,127.0152231);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110135,'���α�','��ö��',37.5691978,126.9859068);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140130,'�߱�','���굿3��',37.5600001,126.9873838);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110133,'���α�','�ͼ���',37.574232,126.9897105);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110147,'���α�','�絿',37.5781586,126.9852531);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140141,'�߱�','���ڵ�',37.5606513,126.9893973);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11440,11440106,'������','������',37.5388869,126.9396829);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110155,'���α�','������',37.5690609,126.9904498);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110151,'���α�','����',37.5725522,126.9918441);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110154,'���α�','��絿',37.5692358,126.9942546);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140123,'�߱�','ȸ����3��',37.560059,126.9840944);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140133,'�߱�','�湫��5��',37.5625808,126.999591);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110132,'���α�','��ϵ�',37.576392,126.9883162);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11380,11380106,'����','������',37.6126506,126.9243915);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11530,11530110,'���α�','�¼���',37.4936808,126.8204195);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110113,'���α�','�ʿ',37.5768799,126.9677042);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110173,'���α�','���3��',37.5873096,126.993071);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11260,11260102,'�߶���','�����',37.6001601,127.0832215);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11305,11305102,'���ϱ�','����',37.6292269,127.0363793);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11680,11680112,'������','�ڰ',37.4766387,127.1001172);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110128,'���α�','���Ƶ�',37.5741579,126.9847962);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110174,'���α�','â�ŵ�',37.5760033,127.0135248);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110175,'���α�','���ε�',37.5766752,127.0190654);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140153,'�߱�','��굿',37.5685483,127.0031306);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140140,'�߱�','���е�',37.5605244,126.9909108);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140158,'�߱�','�湫��3��',37.5622482,126.9919615);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140109,'�߱�','�屳��',37.5674834,126.9870581);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11260,11260101,'�߶���','���',37.5819253,127.0902098);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110162,'���α�','ȿ����',37.5733424,127.0034709);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11500,11500105,'������','���',37.574112,126.8309814);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11500,11500112,'������','���',37.5534112,126.7831645);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11350,11350103,'�����','������',37.6304774,127.0884819);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11290,11290103,'���ϱ�','���ϵ�',37.5971818,127.0178327);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140152,'�߱�','�ֱ���',37.5682735,126.9989423);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110106,'���α�','���ǵ�',37.5779984,126.9727227);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110161,'���α�','����4��',37.5706899,126.9979795);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110152,'���α�','���͵�',37.572373,126.9930164);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110144,'���α�','�簣��',37.5772363,126.9805782);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11260,11260103,'�߶���','��ȭ��',37.600464,127.078447);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11260,11260105,'�߶���','���쵿',37.6003767,127.1056494);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11530,11530109,'���α�','�õ�',37.5009522,126.8286616);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11530,11530111,'���α�','õ�յ�',37.4801779,126.8394455);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11500,11500103,'������','ȭ�',37.5421699,126.8468434);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140157,'�߱�','�긲��',37.5676122,126.9961712);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110176,'���α�','������',37.5684349,126.9644742);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140166,'�߱�','���ҹ���',37.5629167,126.9739585);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110166,'���α�','���ǵ�',37.5784882,126.9996745);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110169,'���α�','��ȭ��',37.587822,127.0023231);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110160,'���α�','������',37.5737459,127.0001197);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140128,'�߱�','���굿1��',37.5591789,126.9847191);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140108,'�߱�','���ϵ�',37.5674173,126.9846423);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140171,'�߱�','�߸���',37.5591646,126.965563);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11680,11680101,'������','���ﵿ',37.4998676,127.0386903);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11440,11440104,'������','��ȭ��',37.5395606,126.9506257);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140113,'�߱�','��â��',37.5624854,126.9782512);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110167,'���α�','��ŵ�',37.574766,127.0059177);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110178,'���α�','�ۿ���',37.5701811,126.9653069);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110164,'���α�','����6��',37.5722418,127.0072742);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110165,'���α�','��ȭ��',37.5773254,127.0054708);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140120,'�߱�','������2��',37.5567475,126.9713415);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110129,'���α�','������',37.5737344,126.983095);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110137,'���α�','������',37.5725546,126.9886249);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110138,'���α�','����2��',37.5707645,126.9863064);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110131,'���α�','�ǳ�',37.576109,126.9917567);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140139,'�߱�','�ʵ�3��',37.5577553,126.9973741);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140121,'�߱�','ȸ����1��',37.5571575,126.9816996);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110145,'���α�','������',37.5770464,126.9819272);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110163,'���α�','����5��',37.5707296,127.0033505);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110177,'���α�','��',37.5676735,126.9668356);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140111,'�߱�','�Ұ���',37.5638976,126.9799894);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110170,'���α�','���1��',37.5889535,126.9974082);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110157,'���α�','���ǵ�',37.5726289,126.9980207);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110143,'���α�','ȭ��',37.5806863,126.9826104);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140126,'�߱�','��1��',37.5644525,126.9844716);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140107,'�߱�','�ﰢ��',37.5679302,126.9847935);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140112,'�߱�','��â��',37.5580671,126.9775971);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110183,'���α�','��â��',37.6139675,126.9743019);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11305,11305104,'���ϱ�','���̵�',37.6632405,126.9992184);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11740,11740102,'������','�����',37.5655385,127.1576826);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140136,'�߱�','������',37.5614488,127.0005455);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110146,'���α�','��ȸ��',37.5828064,126.984865);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110149,'���α�','������',37.5841834,126.9880869);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110136,'���α�','�λ絿',37.5720605,126.9859557);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110120,'���α�','�Ź���1��',37.5703732,126.9740725);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140156,'�߱�','������',37.5677264,126.9927713);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140119,'�߱�','������1��',37.5589096,126.9729617);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140124,'�߱�','�湫��1��',37.5610267,126.9826401);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140118,'�߱�','���빮��5��',37.5563671,126.9763019);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140135,'�߱�','������',37.5640814,126.998038);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110110,'���α�','���ϵ�',37.5793623,126.9680058);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110124,'���α�','���۵�',37.5738606,126.98058);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110150,'���α�','������',37.5742191,126.994071);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110168,'���α�','������',37.58161,127.0051706);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140106,'�߱�','���빮��1��',37.5675948,126.9831124);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140168,'�߱�','��ȭ��',37.5623459,126.9708091);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140101,'�߱�','������',37.5680651,126.9788677);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140165,'�߱�','Ȳ�е�',37.5685914,127.0204708);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140125,'�߱�','�湫��2��',37.5617555,126.9877462);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11215,11215102,'������','�ɵ�',37.5511329,127.0818924);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11500,11500101,'������','��â��',37.5559718,126.8712411);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140161,'�߱�','����2��',37.5643088,126.9899009);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140151,'�߱�','������5��',37.5668186,127.0021804);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11680,11680110,'������','�б�����',37.52883,127.0295048);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140173,'�߱�','������1��',37.5558883,126.9669835);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140122,'�߱�','ȸ����2��',37.5585169,126.9827614);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110172,'���α�','���4��',37.5823905,126.9998063);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11440,11440118,'������','���ε�',37.5447269,126.9194339);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11680,11680106,'������','��ġ��',37.4989487,127.0646585);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11740,11740107,'������','�ϻ絿',37.5577912,127.1295094);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11215,11215109,'������','���ڵ�',37.5532424,127.0734926);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140155,'�߱�','������3��',37.5665987,126.9924035);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140114,'�߱�','�����2��',37.5632359,126.9764071);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140150,'�߱�','������4��',37.566393,126.9977072);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140169,'�߱�','���ַ�1��',37.5637065,126.9684918);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140148,'�߱�','������6��',37.567505,127.0070798);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11680,11680105,'������','�Ｚ��',37.5147968,127.0550898);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11410,11410116,'���빮��','âõ��',37.558812,126.9341472);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140172,'�߱�','���ַ�2��',37.5606655,126.9695135);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11680,11680113,'������','������',37.4717408,127.1114704);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11290,11290135,'���ϱ�','���ϵ�',37.596525,127.0332814);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140117,'�߱�','���빮��4��',37.5606911,126.9755028);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11440,11440116,'������','���ߵ�',37.543806,126.927945);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11650,11650103,'���ʱ�','��鵿',37.4660631,127.0178631);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11680,11680104,'������','û�㵿',37.5255867,127.0522749);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140115,'�߱�','���빮��2��',37.5638636,126.98204);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140129,'�߱�','���굿2��',37.5583248,126.9858851);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140131,'�߱�','����1��',37.5642498,126.9878916);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140145,'�߱�','����1��',37.5650378,127.0051839);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140146,'�߱�','����2��',37.5639442,127.0083469);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140143,'�߱�','���浿1��',37.5610374,127.0076401);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11740,11740110,'������','���ϵ�',37.5676689,127.1720394);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11500,11500110,'������','��ȭ��',37.5865739,126.8031384);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11500,11500104,'������','���絿',37.5679849,126.8444363);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140144,'�߱�','���浿2��',37.5552599,127.0003344);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11410,11410119,'���빮��','�ϰ��µ�',37.5791085,126.911718);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140102,'�߱�','�ٵ�',37.5678826,126.9811939);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11680,11680118,'������','���',37.4881299,127.0440336);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11740,11740103,'������','���ϵ�',37.5508013,127.1698692);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11410,11410115,'���빮��','������',37.5726345,126.9472296);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110182,'���α�','���⵿',37.6179518,126.9621627);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140138,'�߱�','�ʵ�2��',37.5577913,126.9949769);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140167,'�߱�','����',37.5661453,126.9733065);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140132,'�߱�','�湫��4��',37.5623108,126.9959752);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11740,11740106,'������','���̵�',37.5289353,127.1469441);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11215,11215101,'������','�߰',37.5630636,127.0883255);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140142,'�߱�','���嵿',37.5551793,126.9897764);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110186,'���α�','�ſ���',37.6030533,126.9618057);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11680,11680103,'������','������',37.4824461,127.0627324);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140116,'�߱�','���빮��3��',37.5616684,126.9794388);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11500,11500107,'������','�ܹ߻굿',37.5495179,126.8203069);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11305,11305103,'���ϱ�','������',37.6371315,127.0075443);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110181,'���α�','���̵�',37.5744857,126.9626524);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11500,11500102,'������','���̵�',37.5519877,126.8527944);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140170,'�߱�','������1��',37.5668791,126.9680887);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11680,11680114,'������','�Ͽ���',37.487919,127.0852159);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11680,11680111,'������','���',37.4644483,127.1066382);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11680,11680107,'������','�Ż絿',37.522901,127.0246551);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11410,11410117,'���빮��','����',37.5725293,126.9312651);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11740,11740109,'������','õȣ��',37.5431857,127.1265646);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11440,11440109,'������','������',37.5492254,126.9472148);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11650,11650102,'���ʱ�','���絿',37.468455,127.0362469);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11410,11410102,'���빮��','������3��',37.5622877,126.9621682);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11740,11740101,'������','���ϵ�',37.5485893,127.1517553);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11440,11440125,'������','���굿',37.5662175,126.9039251);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110184,'���α�','�ξϵ�',37.5934957,126.9672855);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11410,11410111,'���빮��','ȫ����',37.5873266,126.9472803);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11740,11740108,'������','������',37.5304064,127.1288445);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11440,11440115,'������','�����',37.5470257,126.9243738);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11350,11350102,'�����','���赿',37.6295557,127.0562535);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11440,11440102,'������','������',37.5473874,126.9555578);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11680,11680115,'������','������',37.4855136,127.0984645);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11500,11500113,'������','���赿',37.5435569,126.7978766);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140104,'�߱�','������1��',37.5659055,126.980572);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11440,11440101,'������','������',37.554422,126.9559629);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11650,11650111,'���ʱ�','�ſ���',37.4451504,127.0596524);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11410,11410118,'���빮��','ȫ����',37.5933419,126.9395754);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11440,11440127,'������','��ϵ�',37.5715459,126.8778772);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11410,11410105,'���빮��','��õ��',37.5674955,126.9620155);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11410,11410114,'���빮��','���̵�',37.5651557,126.9433454);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11410,11410120,'���빮��','�����µ�',37.5766943,126.9185077);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11440,11440120,'������','������',37.5536496,126.9200806);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11650,11650104,'���ʱ�','������',37.4449934,127.0495943);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140147,'�߱�','�ָ���',37.5637681,127.0045499);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140105,'�߱�','������2��',37.5657158,126.9862633);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140160,'�߱�','������1��',37.5645365,126.9945524);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110185,'���α�','ȫ����',37.6005798,126.9567853);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11440,11440108,'������','���ﵿ',37.5498968,126.9427936);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140103,'�߱�','�����1��',37.5675677,126.9773829);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11410,11410101,'���빮��','������2��',37.5649689,126.9639848);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140159,'�߱�','�ʵ�',37.564601,126.992348);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11620,11620103,'���Ǳ�','������',37.4630565,126.9776247);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140127,'�߱�','��2��',37.5630105,126.9852883);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110179,'���α�','ȫ�ĵ�',37.5711594,126.9641517);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11410,11410112,'���빮��','������',37.5613992,126.9453107);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140174,'�߱�','������2��',37.5542553,126.9643234);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11650,11650107,'���ʱ�','������',37.5045831,127.002177);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11440,11440124,'������','������',37.5626693,126.9223736);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11650,11650108,'���ʱ�','���ʵ�',37.4885178,127.0171251);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11290,11290106,'���ϱ�','���ҹ���3��',37.5903924,127.0116172);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11290,11290127,'���ϱ�','������5��',37.5824037,127.0201561);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11710,11710112,'���ı�','���ݵ�',37.5037347,127.1339178);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11440,11440117,'������','������',37.5432645,126.9306675);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11200,11200122,'������','��䵿',37.5624296,127.0550854);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11290,11290114,'���ϱ�','�Ｑ��4��',37.5898185,127.0133533);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11290,11290129,'���ϱ�','������7��',37.5796096,127.0223215);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11290,11290109,'���ϱ�','���ҹ���6��',37.5936325,127.0140289);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11290,11290138,'���ϱ�','������',37.6160358,127.0503368);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11560,11560131,'��������','��ȭ��',37.5489947,126.8900755);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11470,11470101,'��õ��','������',37.5163358,126.853025);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11470,11470102,'��õ��','��',37.5367323,126.8764168);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11290,11290105,'���ϱ�','���ҹ���2��',37.5888166,127.0081301);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11560,11560114,'��������','��굿4��',37.5291366,126.8991346);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11440,11440103,'������','�Ű�����',37.5443996,126.9556066);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11290,11290124,'���ϱ�','�Ⱦϵ�4��',37.5805404,127.0246074);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11440,11440126,'������','�ߵ�',37.5716735,126.9067459);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11410,11410109,'���빮��','������',37.5741171,126.954731);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11410,11410107,'���빮��','��õ��',37.5692019,126.9591259);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11290,11290132,'���ϱ�','������3��',37.584334,127.0165173);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11290,11290102,'���ϱ�','���ϵ�1��',37.5895393,127.004033);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11290,11290123,'���ϱ�','�Ⱦϵ�3��',37.5839528,127.0236731);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11290,11290117,'���ϱ�','������2��',37.5900467,127.0197109);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11440,11440113,'������','������',37.5460069,126.9323383);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11650,11650110,'���ʱ�','���',37.4631455,127.0527371);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140134,'�߱�','������2��',37.5641432,126.9962714);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11740,11740105,'������','�浿',37.5397058,127.1470069);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11350,11350104,'�����','�ϰ赿',37.638495,127.0715073);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11440,11440112,'������','������',37.5422601,126.9345409);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11410,11410106,'���빮��','õ����',37.5678141,126.9597567);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11170,11170135,'��걸','��굿6��',37.5168611,126.9842131);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11350,11350106,'�����','�߰赿',37.6508772,127.0775079);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11440,11440114,'������','â����',37.5498986,126.9290711);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110187,'���α�','���ǵ�',37.5767914,126.9582278);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11410,11410113,'���빮��','��ŵ�',37.5646453,126.9439075);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11215,11215103,'������','���ǵ�',37.5436014,127.093166);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11200,11200102,'������','�Ͽսʸ���',37.5643661,127.0285936);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11290,11290133,'���ϱ�','������',37.6167753,126.9983572);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11710,11710109,'���ı�','������',37.4785724,127.1320172);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11560,11560132,'��������','�ű浿',37.5058261,126.9126517);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11560,11560134,'��������','����',37.5326108,126.8899611);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11560,11560117,'��������','��굿',37.534892,126.9024682);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11290,11290126,'���ϱ�','������4��',37.5829039,127.0213823);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11290,11290118,'���ϱ�','������3��',37.5941547,127.0204851);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11290,11290131,'���ϱ�','������2��',37.5858495,127.018301);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11710,11710104,'���ı�','���ĵ�',37.5049182,127.1138537);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11290,11290104,'���ϱ�','���ҹ���1��',37.5901376,127.0072562);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11200,11200113,'������','������',37.5420259,127.0219998);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11200,11200105,'������','���嵿',37.5670762,127.0407448);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11290,11290130,'���ϱ�','������1��',37.5864995,127.0196092);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11560,11560118,'��������','������',37.5082421,126.90154);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11170,11170110,'��걸','û�ĵ�2��',37.5462385,126.9666853);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11170,11170118,'��걸','��ȿ��4��',37.532933,126.9506459);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11560,11560101,'��������','��������',37.5134157,126.9067838);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11170,11170119,'��걸','ȿâ��',37.543576,126.9607224);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11170,11170101,'��걸','�ľϵ�',37.5503851,126.9805052);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11440,11440122,'������','������',37.5478042,126.9079932);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11710,11710113,'���ı�','�ſ���',37.4893748,127.147023);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11290,11290139,'���ϱ�','������',37.6079392,127.0611742);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11170,11170130,'��걸','���¿���',37.5388621,126.9922784);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11170,11170128,'��걸','�Ѱ���3��',37.5280447,126.9632302);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11200,11200109,'������','��ȣ��1��',37.5530419,127.0213785);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11200,11200115,'������','������2��',37.5407489,127.0571066);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11440,11440110,'������','���굿',37.5540256,126.938245);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11200,11200107,'������','��絿',37.5591737,127.03525);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11710,11710108,'���ı�','������',37.4856663,127.1237435);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11440,11440123,'������','������',37.5559402,126.8999197);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11560,11560127,'��������','����3��',37.5296813,126.8897891);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11170,11170109,'��걸','û�ĵ�1��',37.5488937,126.9671724);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11170,11170125,'��걸','�Ѱ���2��',37.5312807,126.9686038);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11170,11170102,'��걸','��굿2��',37.5430767,126.9858634);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11560,11560111,'��������','��굿1��',37.5214443,126.8985373);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11170,11170111,'��걸','û�ĵ�3��',37.5433004,126.9666029);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11200,11200110,'������','��ȣ��2��',37.5525166,127.0217887);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11710,11710111,'���ı�','���̵�',37.5163579,127.1260691);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11215,11215104,'������','���嵿',37.5477291,127.1042144);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11710,11710107,'���ı�','������',37.4942803,127.1176314);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11560,11560130,'��������','����6��',37.5427197,126.889431);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11200,11200106,'������','��ٵ�',37.5589469,127.0467523);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11290,11290134,'���ϱ�','������',37.6084879,127.0223926);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11470,11470103,'��õ��','�ſ���',37.5290519,126.837064);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11170,11170129,'��걸','���̵�',37.5188354,126.9651355);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11170,11170136,'��걸','������',37.526885,127.0017006);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11170,11170131,'��걸','�ѳ���',37.5374384,127.0060974);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11290,11290120,'���ϱ�','������5��',37.5963264,127.0168846);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11290,11290128,'���ϱ�','������6��',37.5806329,127.0192952);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11710,11710103,'���ı�','ǳ����',37.5335451,127.1132244);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11710,11710101,'���ı�','��ǵ�',37.5111559,127.0858095);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11290,11290110,'���ϱ�','���ҹ���7��',37.5963137,127.0142975);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11200,11200111,'������','��ȣ��3��',37.5499287,127.0195555);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11650,11650106,'���ʱ�','�����',37.5153035,127.0093895);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11170,11170124,'��걸','�Ѱ���1��',37.5358426,126.9730994);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11215,11215107,'������','ȭ�絿',37.5435023,127.0736984);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11200,11200104,'������','������',37.5634228,127.0332234);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11560,11560115,'��������','��굿5��',37.5321286,126.9010103);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11710,11710105,'���ı�','���̵�',37.502828,127.1041072);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11560,11560104,'��������','��������3��',37.5181304,126.9084001);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11560,11560108,'��������','��������7��',37.5242607,126.9071887);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11170,11170120,'��걸','������',37.538784,126.9562612);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11440,11440111,'������','�ż���',37.5480088,126.9372621);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11410,11410108,'���빮��','��õ��',37.5701581,126.9583202);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11290,11290108,'���ϱ�','���ҹ���5��',37.5915119,127.0150678);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11440,11440105,'������','�밭��',37.5412913,126.9404517);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11560,11560112,'��������','��굿2��',37.5224645,126.8938154);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11290,11290115,'���ϱ�','�Ｑ��5��',37.5885476,127.0160023);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11290,11290113,'���ϱ�','�Ｑ��3��',37.5867502,127.0134422);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11290,11290107,'���ϱ�','���ҹ���4��',37.5918678,127.0106032);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11170,11170107,'��걸','���ڵ�',37.5515203,126.9729157);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11170,11170121,'��걸','�빮��',37.5377219,126.9597101);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11560,11560109,'��������','��������8��',37.5290851,126.9050152);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11560,11560125,'��������','����1��',37.5231837,126.8886738);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11560,11560106,'��������','��������5��',37.5210399,126.9068178);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11170,11170112,'��걸','��ȿ��1��',37.5399032,126.967552);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11200,11200103,'������','ȫ�͵�',37.5671038,127.0327206);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11170,11170105,'��걸','������',37.5428503,126.9733902);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11710,11710106,'���ı�','������',37.5018103,127.0897701);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11560,11560123,'��������','������5��',37.5163676,126.88352);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11440,11440107,'������','������',37.536882,126.9436223);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11410,11410103,'���빮��','�յ�',37.5613616,126.9662488);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11410,11410104,'���빮��','�̱ٵ�',37.5635697,126.9673975);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11440,11440121,'������','������',37.5580953,126.9258052);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11170,11170117,'��걸','��ȿ��3��',37.5343201,126.9577325);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11170,11170132,'��걸','������',37.5235803,126.9951773);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11290,11290119,'���ϱ�','������4��',37.5951321,127.018831);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11290,11290137,'���ϱ�','����',37.6060556,127.0475391);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11290,11290125,'���ϱ�','�Ⱦϵ�5��',37.5884384,127.0295871);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11200,11200112,'������','��ȣ��4��',37.5452026,127.0229979);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11170,11170104,'��걸','������',37.5449357,126.9730567);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11650,11650109,'���ʱ�','���',37.4583407,127.0770854);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11410,11410110,'���빮��','�Ͼ�����',37.5636974,126.9549005);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11290,11290136,'���ϱ�','�Ͽ��',37.6041679,127.0378888);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11200,11200114,'������','������1��',37.5431193,127.0416557);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11215,11215105,'������','�ھ絿',37.5323755,127.0744813);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11290,11290101,'���ϱ�','���ϵ�',37.5963213,126.9925434);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11170,11170106,'��걸','��굿1��',37.5402662,126.9769712);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11170,11170115,'��걸','��õ��',37.5357088,126.9515063);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11170,11170113,'��걸','��ȿ��2��',37.5363505,126.9634641);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11560,11560124,'��������','������6��',37.5200428,126.8841715);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11290,11290111,'���ϱ�','�Ｑ��1��',37.5843841,127.0075168);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11560,11560113,'��������','��굿3��',37.526241,126.8974286);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11170,11170114,'��걸','��â��',37.5358397,126.9549629);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11560,11560102,'��������','��������1��',37.517729,126.912671);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11290,11290121,'���ϱ�','�Ⱦϵ�1��',37.5887176,127.02229);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11290,11290122,'���ϱ�','�Ⱦϵ�2��',37.5868415,127.0232698);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11560,11560122,'��������','������4��',37.5144685,126.890154);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11560,11560126,'��������','����2��',37.5233387,126.8839348);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11560,11560120,'��������','������2��',37.5127162,126.8935378);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11200,11200101,'������','��սʸ���',37.5684665,127.0255502);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11560,11560107,'��������','��������6��',37.5222528,126.9030391);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11290,11290112,'���ϱ�','�Ｑ��2��',37.5848587,127.0118859);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11710,11710102,'���ı�','��õ��',37.5250784,127.0921993);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11560,11560105,'��������','��������4��',37.517862,126.9038988);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11170,11170127,'��걸','��굿5��',37.5256032,126.9740052);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11560,11560129,'��������','����5��',37.5389197,126.8929397);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11560,11560119,'��������','������1��',37.5118742,126.8975741);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11560,11560110,'��������','���ǵ���',37.5284328,126.9273756);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11560,11560128,'��������','����4��',37.536431,126.8962335);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11200,11200108,'������','������',37.5505366,127.0348589);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11710,11710114,'���ı�','��õ��',37.497466,127.1515613);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11200,11200118,'������','������',37.5541037,127.0621617);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11170,11170123,'��걸','�Ű赿',37.535453,126.9646997);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11170,11170133,'��걸','������',37.5191265,126.9914013);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110102,'���α�','�ű���',37.584442,126.9676999);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110116,'���α�','���ŵ�',37.5727248,126.9746765);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11590,11590101,'���۱�','�뷮����',37.5115,126.9415121);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11590,11590106,'���۱�','���۵�',37.4999089,126.973677);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11140,11140154,'�߱�','���嵿',37.5644435,127.0010471);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11110,11110180,'���α�','���ϵ�',37.5714262,126.9613044);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11500,11500106,'������','���߻굿',37.5536081,126.8346846);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11170,11170134,'��걸','�ּ���',37.5215716,127.0002871);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11170,11170122,'��걸','���赿',37.5371288,126.9690036);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11170,11170103,'��걸','��굿4��',37.5305892,126.9858837);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11560,11560133,'��������','�븲��',37.4970578,126.9009238);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11290,11290116,'���ϱ�','������1��',37.5924569,127.0182089);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11170,11170126,'��걸','��굿3��',37.5321655,126.97629);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11170,11170116,'��걸','û�ϵ�',37.5342588,126.9468781);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11560,11560103,'��������','��������2��',37.5208906,126.91267);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11560,11560121,'��������','������3��',37.5171092,126.8959578);
Insert into CITIES (SGG_CODE,EMD_CODE,SGG_NAME,EMD_NAME,LAT,LNG) values (11170,11170108,'��걸','���赿',37.5526054,126.9665242);

---------------------------------------------------
--   END DATA FOR TABLE CITIES
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE FAVORITE
--   FILTER = none used
---------------------------------------------------
REM INSERTING into FAVORITE
Insert into FAVORITE (PARK_ID,USER_ID) values (111283,'IUGuest');
Insert into FAVORITE (PARK_ID,USER_ID) values (172607,'SZGuest');
Insert into FAVORITE (PARK_ID,USER_ID) values (172634,'SZGuest');
Insert into FAVORITE (PARK_ID,USER_ID) values (171721,'TopGuest');
Insert into FAVORITE (PARK_ID,USER_ID) values (167964,'TopGuest');
Insert into FAVORITE (PARK_ID,USER_ID) values (124830,'GdGuest');
Insert into FAVORITE (PARK_ID,USER_ID) values (172647,'GdGuest');
Insert into FAVORITE (PARK_ID,USER_ID) values (1163648,'IUGuest');
Insert into FAVORITE (PARK_ID,USER_ID) values (1366393,'IUGuest');
Insert into FAVORITE (PARK_ID,USER_ID) values (173139,'��');
Insert into FAVORITE (PARK_ID,USER_ID) values (173005,'IUGuest');
Insert into FAVORITE (PARK_ID,USER_ID) values (136358,'IUGuest');
Insert into FAVORITE (PARK_ID,USER_ID) values (781512,'��');
Insert into FAVORITE (PARK_ID,USER_ID) values (1366593,'��');
Insert into FAVORITE (PARK_ID,USER_ID) values (173553,'��ġȸ');
Insert into FAVORITE (PARK_ID,USER_ID) values (1371306,'IUGuest');
Insert into FAVORITE (PARK_ID,USER_ID) values (1371666,'IUGuest');
Insert into FAVORITE (PARK_ID,USER_ID) values (1366394,'��');
Insert into FAVORITE (PARK_ID,USER_ID) values (1368516,'suk');
Insert into FAVORITE (PARK_ID,USER_ID) values (173691,'��');
Insert into FAVORITE (PARK_ID,USER_ID) values (111804,'IUGuest');
Insert into FAVORITE (PARK_ID,USER_ID) values (132897,'��');
Insert into FAVORITE (PARK_ID,USER_ID) values (173468,'IUGuest');
Insert into FAVORITE (PARK_ID,USER_ID) values (1371306,'�ų�������');
Insert into FAVORITE (PARK_ID,USER_ID) values (1366729,'IUGuest');
Insert into FAVORITE (PARK_ID,USER_ID) values (173447,'Jennifer200');
Insert into FAVORITE (PARK_ID,USER_ID) values (1247675,'Jennifer200');
Insert into FAVORITE (PARK_ID,USER_ID) values (1232331,'��ġȸ');

---------------------------------------------------
--   END DATA FOR TABLE FAVORITE
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE COIN
--   FILTER = none used
---------------------------------------------------
REM INSERTING into COIN
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('GdHost',to_timestamp('16/06/09 08:17:26.000000000','RR/MM/DD HH24:MI:SS.FF'),100,2,12345,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('IUGuest',to_timestamp('16/06/10 04:05:46.000000000','RR/MM/DD HH24:MI:SS.FF'),50,2,40,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('IUGuest',to_timestamp('16/06/10 04:09:51.000000000','RR/MM/DD HH24:MI:SS.FF'),50,2,41,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('IUGuest',to_timestamp('16/06/10 04:10:34.000000000','RR/MM/DD HH24:MI:SS.FF'),100,2,42,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('IUGuest',to_timestamp('16/06/10 05:57:39.000000000','RR/MM/DD HH24:MI:SS.FF'),50,2,62,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('IUGuest',to_timestamp('16/06/10 05:57:54.000000000','RR/MM/DD HH24:MI:SS.FF'),50,2,63,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('IUGuest',to_timestamp('16/06/10 05:58:19.000000000','RR/MM/DD HH24:MI:SS.FF'),50,2,64,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('��',to_timestamp('16/06/10 05:59:01.000000000','RR/MM/DD HH24:MI:SS.FF'),100,2,65,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('RgPark',to_timestamp('16/06/10 06:59:53.000000000','RR/MM/DD HH24:MI:SS.FF'),50,2,67,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('��ġȸ',to_timestamp('16/06/15 08:04:25.000000000','RR/MM/DD HH24:MI:SS.FF'),100,2,102,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('IUGuest',to_timestamp('16/06/10 00:23:49.000000000','RR/MM/DD HH24:MI:SS.FF'),50,2,34,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('IUGuest',to_timestamp('16/06/10 03:56:36.000000000','RR/MM/DD HH24:MI:SS.FF'),50,2,35,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('IUGuest',to_timestamp('16/06/10 03:58:59.000000000','RR/MM/DD HH24:MI:SS.FF'),100,2,36,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('IUGuest',to_timestamp('16/06/10 03:59:56.000000000','RR/MM/DD HH24:MI:SS.FF'),100,2,37,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('IUGuest',to_timestamp('16/06/10 04:00:34.000000000','RR/MM/DD HH24:MI:SS.FF'),100,2,38,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('IUGuest',to_timestamp('16/06/10 07:25:50.000000000','RR/MM/DD HH24:MI:SS.FF'),50,2,68,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('IUGuest',to_timestamp('16/06/13 13:37:20.000000000','RR/MM/DD HH24:MI:SS.FF'),50,2,81,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('IUGuest',to_timestamp('16/06/09 19:12:58.000000000','RR/MM/DD HH24:MI:SS.FF'),50,2,2,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('IUGuest',to_timestamp('16/06/09 19:13:55.000000000','RR/MM/DD HH24:MI:SS.FF'),50,2,3,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('IUGuest',to_timestamp('16/06/09 19:17:43.000000000','RR/MM/DD HH24:MI:SS.FF'),50,2,4,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('IUGuest',to_timestamp('16/06/09 19:19:26.000000000','RR/MM/DD HH24:MI:SS.FF'),50,2,5,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('IUGuest',to_timestamp('16/06/09 19:19:54.000000000','RR/MM/DD HH24:MI:SS.FF'),50,2,6,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('IUGuest',to_timestamp('16/06/09 19:19:58.000000000','RR/MM/DD HH24:MI:SS.FF'),50,2,7,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('IUGuest',to_timestamp('16/06/09 19:20:09.000000000','RR/MM/DD HH24:MI:SS.FF'),50,2,8,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('IUGuest',to_timestamp('16/06/09 19:20:22.000000000','RR/MM/DD HH24:MI:SS.FF'),50,2,9,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('IUGuest',to_timestamp('16/06/09 19:20:38.000000000','RR/MM/DD HH24:MI:SS.FF'),50,2,10,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('IUGuest',to_timestamp('16/06/09 19:20:55.000000000','RR/MM/DD HH24:MI:SS.FF'),50,2,11,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('IUGuest',to_timestamp('16/06/09 19:21:35.000000000','RR/MM/DD HH24:MI:SS.FF'),50,2,12,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('IUGuest',to_timestamp('16/06/09 19:22:07.000000000','RR/MM/DD HH24:MI:SS.FF'),50,2,13,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('IUGuest',to_timestamp('16/06/09 19:23:13.000000000','RR/MM/DD HH24:MI:SS.FF'),50,2,14,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('IUGuest',to_timestamp('16/06/09 19:24:46.000000000','RR/MM/DD HH24:MI:SS.FF'),50,2,15,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('IUGuest',to_timestamp('16/06/09 19:25:43.000000000','RR/MM/DD HH24:MI:SS.FF'),50,2,16,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('IUGuest',to_timestamp('16/06/09 19:25:58.000000000','RR/MM/DD HH24:MI:SS.FF'),50,2,17,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('IUGuest',to_timestamp('16/06/09 19:26:12.000000000','RR/MM/DD HH24:MI:SS.FF'),50,2,18,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('IUGuest',to_timestamp('16/06/09 19:27:01.000000000','RR/MM/DD HH24:MI:SS.FF'),50,2,19,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('IUGuest',to_timestamp('16/06/09 19:27:21.000000000','RR/MM/DD HH24:MI:SS.FF'),50,2,20,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('IUGuest',to_timestamp('16/06/09 19:27:44.000000000','RR/MM/DD HH24:MI:SS.FF'),50,2,21,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('IUGuest',to_timestamp('16/06/09 19:27:59.000000000','RR/MM/DD HH24:MI:SS.FF'),50,2,22,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('IUGuest',to_timestamp('16/06/09 19:30:36.000000000','RR/MM/DD HH24:MI:SS.FF'),50,2,23,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('IUGuest',to_timestamp('16/06/10 04:01:26.000000000','RR/MM/DD HH24:MI:SS.FF'),50,2,39,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('IUGuest',to_timestamp('16/06/10 05:01:59.000000000','RR/MM/DD HH24:MI:SS.FF'),100,2,43,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('IUGuest',to_timestamp('16/06/10 05:45:37.000000000','RR/MM/DD HH24:MI:SS.FF'),50,2,61,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('190175867',to_timestamp('16/06/17 06:23:19.000000000','RR/MM/DD HH24:MI:SS.FF'),50,2,121,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('IUGuest',to_timestamp('16/06/09 18:59:06.000000000','RR/MM/DD HH24:MI:SS.FF'),50,2,1,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('IUGuest',to_timestamp('16/06/09 19:54:22.000000000','RR/MM/DD HH24:MI:SS.FF'),50,2,24,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('IUGuest',to_timestamp('16/06/09 19:56:11.000000000','RR/MM/DD HH24:MI:SS.FF'),50,2,25,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('IUGuest',to_timestamp('16/06/09 19:57:00.000000000','RR/MM/DD HH24:MI:SS.FF'),50,2,26,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('IUGuest',to_timestamp('16/06/09 19:59:11.000000000','RR/MM/DD HH24:MI:SS.FF'),50,2,27,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('IUGuest',to_timestamp('16/06/09 19:59:17.000000000','RR/MM/DD HH24:MI:SS.FF'),90,2,28,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('IUGuest',to_timestamp('16/06/09 19:59:23.000000000','RR/MM/DD HH24:MI:SS.FF'),50,2,29,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('IUGuest',to_timestamp('16/06/09 20:05:44.000000000','RR/MM/DD HH24:MI:SS.FF'),50,2,30,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('IUGuest',to_timestamp('16/06/09 20:07:19.000000000','RR/MM/DD HH24:MI:SS.FF'),100,2,31,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('IUGuest',to_timestamp('16/06/09 20:08:51.000000000','RR/MM/DD HH24:MI:SS.FF'),50,2,32,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('IUGuest',to_timestamp('16/06/09 20:12:51.000000000','RR/MM/DD HH24:MI:SS.FF'),50,2,33,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('IUGuest',to_timestamp('16/06/10 06:07:51.000000000','RR/MM/DD HH24:MI:SS.FF'),50,2,66,null);
Insert into COIN (USER_ID,CDATE,COIN,CFLAG,CID,RESER_ID) values ('��ġȸ',to_timestamp('16/06/15 02:07:30.000000000','RR/MM/DD HH24:MI:SS.FF'),100,2,101,null);

---------------------------------------------------
--   END DATA FOR TABLE COIN
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE RESERVATION
--   FILTER = none used
---------------------------------------------------
REM INSERTING into RESERVATION
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (20160609161343985781512,781512,'��',to_timestamp('16/06/13 00:00:00.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/06/14 00:00:00.000000000','RR/MM/DD HH24:MI:SS.FF'),50,to_timestamp('16/06/09 16:13:43.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (201606091448218601174233,1174233,'��',to_timestamp('16/06/16 00:00:00.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/06/17 00:00:00.000000000','RR/MM/DD HH24:MI:SS.FF'),50,to_timestamp('16/06/09 14:48:21.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (20160609144901357781512,781512,'��',to_timestamp('16/06/09 00:00:00.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/06/10 00:00:00.000000000','RR/MM/DD HH24:MI:SS.FF'),50,to_timestamp('16/06/09 14:49:01.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (201606100719040591371306,1371306,'IUGuest',to_timestamp('16/06/15 00:00:00.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/06/22 00:00:00.000000000','RR/MM/DD HH24:MI:SS.FF'),1698,to_timestamp('16/06/10 07:19:04.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (20160615080543480173333,173333,'��ġȸ',to_timestamp('16/06/15 00:00:00.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/06/16 00:00:00.000000000','RR/MM/DD HH24:MI:SS.FF'),18,to_timestamp('16/06/15 08:05:43.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (20160617052530970173359,173359,'IUGuest',to_timestamp('16/06/17 00:00:00.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/06/18 00:00:00.000000000','RR/MM/DD HH24:MI:SS.FF'),160,to_timestamp('16/06/17 05:25:30.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (20160610061101453173468,173468,'IUGuest',to_timestamp('16/06/11 00:00:00.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/06/12 00:00:00.000000000','RR/MM/DD HH24:MI:SS.FF'),140,to_timestamp('16/06/10 06:11:01.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (20160615102227101173333,173333,'��ġȸ',to_timestamp('16/06/16 00:00:00.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/06/17 00:00:00.000000000','RR/MM/DD HH24:MI:SS.FF'),18,to_timestamp('16/06/15 10:22:27.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (201606090804288181371666,1371666,'��',to_timestamp('16/06/10 00:00:00.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/06/11 00:00:00.000000000','RR/MM/DD HH24:MI:SS.FF'),25,to_timestamp('16/06/09 08:04:28.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (201606090956053621366593,1366593,'��',to_timestamp('16/06/09 00:00:00.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/06/10 00:00:00.000000000','RR/MM/DD HH24:MI:SS.FF'),120,to_timestamp('16/06/09 09:56:05.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (20160601151528475111804,111804,'IUGuest',to_timestamp('16/05/17 03:15:28.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/05/18 03:15:28.000000000','RR/MM/DD HH24:MI:SS.FF'),150,to_timestamp('16/05/17 15:15:28.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (20160601151528444111804,111804,'IUGuest',to_timestamp('16/05/12 03:15:28.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/05/13 03:15:28.000000000','RR/MM/DD HH24:MI:SS.FF'),150,to_timestamp('16/05/12 15:15:28.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (20160601151528473111804,111804,'IUGuest',to_timestamp('16/05/22 03:15:28.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/05/23 03:15:28.000000000','RR/MM/DD HH24:MI:SS.FF'),150,to_timestamp('16/05/22 15:15:28.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (20160601151528478111804,111804,'IUGuest',to_timestamp('16/05/14 03:15:28.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/05/15 03:15:28.000000000','RR/MM/DD HH24:MI:SS.FF'),150,to_timestamp('16/05/12 15:15:28.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (20160601151528495112411,112411,'IUGuest',to_timestamp('16/05/21 03:15:28.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/05/23 03:15:28.000000000','RR/MM/DD HH24:MI:SS.FF'),150,to_timestamp('16/05/21 15:15:28.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (20160601151532457111283,111283,'IUGuest',to_timestamp('16/05/08 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/05/10 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),150,to_timestamp('16/05/08 15:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (20160601151532460111283,111283,'IUGuest',to_timestamp('16/05/02 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/05/06 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),150,to_timestamp('16/05/02 15:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (20160601151532478111283,111283,'IUGuest',to_timestamp('16/05/10 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/05/11 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),150,to_timestamp('16/05/10 15:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (20160601151532488172607,172607,'SZGuest',to_timestamp('16/05/12 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/05/13 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),150,to_timestamp('16/05/12 15:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (20160601151532506172607,172607,'SZGuest',to_timestamp('16/05/12 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/05/23 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),150,to_timestamp('16/05/22 15:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (20160601151532510172634,172634,'SZGuest',to_timestamp('16/05/17 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/05/18 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),150,to_timestamp('16/05/17 15:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (20160601151532530172634,172634,'SZGuest',to_timestamp('16/05/29 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/05/31 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),150,to_timestamp('16/05/29 15:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (20160601151532533172634,172634,'SZGuest',to_timestamp('16/05/24 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/05/26 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),150,to_timestamp('16/05/24 15:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (20160601151532536172904,172904,'SZGuest',to_timestamp('16/05/20 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/05/21 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),150,to_timestamp('16/05/20 15:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (20160601151532533172904,172904,'SZGuest',to_timestamp('16/05/08 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/05/09 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),150,to_timestamp('16/05/08 15:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (20160601151532532127356,127356,'SZGuest',to_timestamp('16/04/30 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/05/02 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),150,to_timestamp('16/04/30 15:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (20160601151532550127356,127356,'SZGuest',to_timestamp('16/05/05 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/05/06 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),150,to_timestamp('16/05/05 15:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (20160601151532564111804,172580,'GdGuest',to_timestamp('16/05/12 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/05/13 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),150,to_timestamp('16/05/12 15:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (20160601151532582111804,172580,'GdGuest',to_timestamp('16/05/22 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/05/23 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),150,to_timestamp('16/05/22 15:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (20160601151532585111804,172647,'GdGuest',to_timestamp('16/05/17 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/05/18 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),150,to_timestamp('16/05/17 15:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (20160601151532588111804,172647,'GdGuest',to_timestamp('16/05/14 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/05/15 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),150,to_timestamp('16/05/12 15:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (20160601151532605112411,172647,'GdGuest',to_timestamp('16/05/21 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/05/23 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),150,to_timestamp('16/05/21 15:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (20160601151532619112411,124830,'GdGuest',to_timestamp('16/05/27 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/05/30 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),150,to_timestamp('16/05/27 15:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (20160601151532608111283,124830,'GdGuest',to_timestamp('16/05/08 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/05/10 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),150,to_timestamp('16/05/08 15:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (20160601151532610111283,126607,'GdGuest',to_timestamp('16/05/02 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/05/06 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),150,to_timestamp('16/05/02 15:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (20160601151532626111283,126607,'GdGuest',to_timestamp('16/05/10 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/05/11 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),150,to_timestamp('16/05/10 15:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (20160601151532636172607,171721,'TopGuest',to_timestamp('16/05/12 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/05/13 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),150,to_timestamp('16/05/12 15:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (20160601151532654172607,171721,'TopGuest',to_timestamp('16/05/22 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/05/23 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),150,to_timestamp('16/05/22 15:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (20160601151532657172634,171721,'TopGuest',to_timestamp('16/05/17 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/05/18 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),150,to_timestamp('16/05/17 15:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (20160601151532682172634,171721,'TopGuest',to_timestamp('16/05/29 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/05/31 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),150,to_timestamp('16/05/29 15:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (20160601151532687172634,167964,'TopGuest',to_timestamp('16/05/24 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/05/26 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),150,to_timestamp('16/05/24 15:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (20160601151532692172904,167964,'TopGuest',to_timestamp('16/05/20 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/05/21 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),150,to_timestamp('16/05/20 15:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (20160601151532690172904,167964,'TopGuest',to_timestamp('16/05/08 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/05/09 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),150,to_timestamp('16/05/08 15:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (20160601151532691127356,167964,'TopGuest',to_timestamp('16/04/30 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/05/02 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),150,to_timestamp('16/04/30 15:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (20160601151532706127356,144474,'TopGuest',to_timestamp('16/05/05 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/05/06 03:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'),150,to_timestamp('16/05/05 15:15:32.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (201606100500481491366394,1366394,'IUGuest',to_timestamp('16/06/10 00:00:00.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/06/11 00:00:00.000000000','RR/MM/DD HH24:MI:SS.FF'),18,to_timestamp('16/06/10 05:00:48.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (201606100545294581371306,1371306,'IUGuest',to_timestamp('16/06/16 00:00:00.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/06/17 00:00:00.000000000','RR/MM/DD HH24:MI:SS.FF'),240,to_timestamp('16/06/10 05:45:29.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (20160615011548407173591,173591,'��',to_timestamp('16/06/15 00:00:00.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/06/17 00:00:00.000000000','RR/MM/DD HH24:MI:SS.FF'),36,to_timestamp('16/06/15 01:15:48.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (201606100027105821366794,1366794,'suk',to_timestamp('16/06/10 00:00:00.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/06/11 00:00:00.000000000','RR/MM/DD HH24:MI:SS.FF'),100,to_timestamp('16/06/10 00:27:10.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (20160610044759469173691,173691,'��',to_timestamp('16/06/10 00:00:00.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/06/11 00:00:00.000000000','RR/MM/DD HH24:MI:SS.FF'),54,to_timestamp('16/06/10 04:47:59.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (201606161704278731371306,1371306,'�ų�������',to_timestamp('16/06/17 00:00:00.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/06/18 00:00:00.000000000','RR/MM/DD HH24:MI:SS.FF'),240,to_timestamp('16/06/16 17:04:27.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (20160615021357936173329,173329,'��ġȸ',to_timestamp('16/06/17 00:00:00.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/06/18 00:00:00.000000000','RR/MM/DD HH24:MI:SS.FF'),18,to_timestamp('16/06/15 02:13:57.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (20160609162448657173447,173447,'Jennifer200',to_timestamp('16/06/10 00:00:00.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/06/13 00:00:00.000000000','RR/MM/DD HH24:MI:SS.FF'),600,to_timestamp('16/06/09 16:24:48.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (20160609162631146173359,173359,'Jennifer200',to_timestamp('16/06/19 00:00:00.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/06/20 00:00:00.000000000','RR/MM/DD HH24:MI:SS.FF'),160,to_timestamp('16/06/09 16:26:31.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (201606091638070651370100,1370100,'Jennifer200',to_timestamp('16/06/29 00:00:00.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/06/30 00:00:00.000000000','RR/MM/DD HH24:MI:SS.FF'),54,to_timestamp('16/06/09 16:38:07.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into RESERVATION (RESER_ID,PARK_ID,USER_ID,START_DATE,END_DATE,PAY,RDATE) values (201606091638428511247675,1247675,'Jennifer200',to_timestamp('16/06/24 00:00:00.000000000','RR/MM/DD HH24:MI:SS.FF'),to_timestamp('16/06/26 00:00:00.000000000','RR/MM/DD HH24:MI:SS.FF'),54,to_timestamp('16/06/09 16:38:42.000000000','RR/MM/DD HH24:MI:SS.FF'));

---------------------------------------------------
--   END DATA FOR TABLE RESERVATION
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MEMBER
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MEMBER
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('suk','123',3,null,0,900,3,0,0,'��','kitri@kitri.com',100001234,null,to_timestamp('16/06/04 08:31:50.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('�ų�������','123123',3,null,0,60,3,0,0,'�ȳ�','zs@sdfm.com',100001234,null,to_timestamp('16/05/31 08:31:26.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('��ģ���³�','123123',3,null,0,300,3,0,0,'��ġȸ','asd@asd.com',100001234,null,to_timestamp('16/05/31 08:31:26.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('didrl','didrl',3,null,0,300,3,0,0,'���','sefef',100001234,null,to_timestamp('16/05/18 08:29:10.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('�������','1111',3,null,0,300,3,0,0,'���μ�','kk@naver.com',100001234,null,to_timestamp('16/05/18 08:29:10.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('SemsungPark','spark',1,null,0,300,3,0,1,'����������','kitri@kitri.com',100001234,null,to_timestamp('16/05/18 08:29:10.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('RgPark','rgpark',1,null,0,350,3,0,1,'����������','rgpark@rg.park',11111,null,to_timestamp('16/05/26 08:30:56.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('RottePark','rotpark',1,null,0,300,3,0,1,'����������','rottepark@rotte.park',21116312,null,to_timestamp('16/05/26 08:30:56.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('GdHost','ghost',4,null,1,1600,4.2,0,0,'��������','hostgd@host.gd',1022223333,null,to_timestamp('16/05/26 08:30:56.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('TopHost','thost',2,null,1,100,2.2,4,0,'����ž','hosttop@host.top',1032141234,null,to_timestamp('16/05/26 08:30:56.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('IUHost','iuhost',4,null,1,700,4.3,0,0,'���ξ�����','hostiu@host.iu',1025869874,null,to_timestamp('16/05/26 08:30:56.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('SZHost','szhost',3,null,1,500,3.2,1,0,'���μ���','hostsz@host.sz',1022228789,null,to_timestamp('16/05/26 08:30:56.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('GdGuest','gguest',3,null,0,300,3.4,1,0,'�մ�����','guestgd@guest.gd',1055653321,null,to_timestamp('16/05/26 08:30:56.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('TopGuest','tguest',3,null,0,100,3.2,1,0,'�մ�ž','guesttop@guest.top',102221133,null,to_timestamp('16/05/26 08:30:56.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('IUGuest','iuguest',5,null,0,4044,5,0,0,'�մԾ�����','guestiu@guest.iu',1011444411,null,to_timestamp('16/05/26 08:30:56.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('SZGuest','szguest',2,null,0,100,2.5,3,0,'�մԼ���','guestsz@guest.sz',108798789,null,to_timestamp('16/05/26 08:30:56.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('kangnam17','kangnam17',1,null,1,300,4.8,0,1,'������ġ17','kangnam12@kangnam.com',29802345,null,to_timestamp('16/05/26 08:30:56.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('gogo','jjum90@hamail.net',3,null,0,300,3,0,0,'������','CPark@kitri.com',100001234,null,to_timestamp('16/05/18 08:29:10.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('chun','chun@naver.com',3,null,0,300,3,0,0,'������','CPark@kitri.com',100001234,null,to_timestamp('16/05/18 08:29:10.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('mong','mong@naver.com',3,null,0,300,3,0,0,'������','CPark@kitri.com',100001234,null,to_timestamp('16/05/18 08:29:10.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('ung','ung@naver.com',3,null,0,300,3,0,0,'����','CPark@kitri.com',100001234,null,to_timestamp('16/05/18 08:29:10.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('didrl2','didrl',3,null,0,300,3,0,0,'didrl2','sdfsdfs@fsfesf',100001234,null,to_timestamp('16/05/18 08:29:10.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('3��','123',3,null,0,300,3,0,0,'3��','3��@naver.com',100001234,null,to_timestamp('16/06/04 08:31:50.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('jjum90','123',3,null,0,300,3,0,0,'�μ�','jjum90@naver.com',100001234,null,to_timestamp('16/06/04 08:31:50.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('catlove','asdf',3,null,0,300,3,0,0,'��ġȸ','asdf',100001234,null,to_timestamp('16/05/18 08:29:10.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('gogok12','123',3,null,0,0,3,0,0,'dfd','CPark@kitri.com',100001234,null,to_timestamp('16/06/07 16:16:27.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('doglove','123',3,null,0,0,3,0,0,'dfdf11','CarPark@kitri.com',100001234,null,to_timestamp('16/06/07 16:16:27.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('mongyong','123',3,null,0,0,3,0,0,'�̸���','123@naver.com',100001234,null,to_timestamp('16/06/07 16:16:27.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('hyang','123',3,null,0,0,3,0,0,'�ⵯ','jms@nate.com',100001234,null,to_timestamp('16/06/07 16:16:27.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('gong','123',3,null,0,0,3,0,0,'��','CPark@kitri.com',100001234,null,to_timestamp('16/06/07 16:16:27.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('������','123123',3,null,0,150,0,0,0,'�����','adll@dllle@net',null,null,to_timestamp('16/06/17 00:22:03.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('nameME','123123',3,null,0,150,0,0,0,'�̸�','zms0529@naver.com',null,null,to_timestamp('16/06/17 00:22:34.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('191980464','P191980464',3,null,0,150,0,0,0,'kakao������','Kakao@email.com',10111111,null,to_timestamp('16/06/17 06:04:35.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('Steven100','100100aa',3,null,0,300,3,0,0,'Steven','SKING@kcompany.com',151234567,null,to_timestamp('16/05/21 08:30:14.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('Neena101','100100aa',3,null,0,300,3,0,0,'Neena','NKOCHHAR@kcompany.com',151234568,null,to_timestamp('16/05/21 08:30:14.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('Lex102','100100aa',3,null,0,300,3,0,0,'Lex','LDEHAAN@kcompany.com',151234569,null,to_timestamp('16/05/21 08:30:14.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('Alexander103','100100aa',3,null,0,300,3,0,0,'Alexander','AHUNOLD@kcompany.com',904234567,null,to_timestamp('16/05/21 08:30:14.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('Bruce104','100100aa',3,null,0,300,3,0,0,'Bruce','BERNST@kcompany.com',904234568,null,to_timestamp('16/05/21 08:30:14.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('Diana107','100100aa',3,null,0,300,3,0,0,'Diana','DLORENTZ@kcompany.com',904235567,null,to_timestamp('16/05/21 08:30:14.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('Kevin124','100100aa',3,null,0,300,3,0,0,'Kevin','KMOURGOS@kcompany.com',501235234,null,to_timestamp('16/05/21 08:30:14.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('Trenna141','100100aa',3,null,0,300,3,0,0,'Trenna','TRAJS@kcompany.com',501218009,null,to_timestamp('16/05/21 08:30:14.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('Curtis142','100100aa',3,null,0,300,3,0,0,'Curtis','CDAVIES@kcompany.com',501212994,null,to_timestamp('16/05/21 08:30:14.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('Randall143','100100aa',3,null,0,300,3,0,0,'Randall','RMATOS@kcompany.com',501212874,null,to_timestamp('16/05/21 08:30:14.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('Peter144','100100aa',3,null,0,300,3,0,0,'Peter','PVARGAS@kcompany.com',501212004,null,to_timestamp('16/05/21 08:30:14.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('Eleni149','100100aa',3,null,0,300,3,0,0,'Eleni','EZLOTKEY@kcompany.com',114413444,null,to_timestamp('16/05/21 08:30:14.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('Ellen174','100100aa',3,null,0,300,3,0,0,'Ellen','EABEL@kcompany.com',114416444,null,to_timestamp('16/05/21 08:30:14.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('Jonathon176','100100aa',3,null,0,300,3,0,0,'Jonathon','JTAYLOR@kcompany.com',111649265,null,to_timestamp('16/05/21 08:30:14.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('Kimberely178','100100aa',3,null,0,300,3,0,0,'Kimberely','KGRANT@kcompany.com',164290263,null,to_timestamp('16/05/21 08:30:14.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('Jennifer200','100100aa',3,null,0,1378,3,0,0,'Jennifer','JWHALEN@kcompany.com',151234444,null,to_timestamp('16/05/21 08:30:14.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('Michael201','100100aa',3,null,0,300,3,0,0,'Michael','MHARTSTE@kcompany.com',151235555,null,to_timestamp('16/05/21 08:30:14.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('Pat202','100100aa',3,null,0,300,3,0,0,'Pat','PFAY@kcompany.com',31236666,null,to_timestamp('16/05/21 08:30:14.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('Shelley205','100100aa',3,null,0,300,3,0,0,'Shelley','SHIGGINS@kcompany.com',151238080,null,to_timestamp('16/05/21 08:30:14.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('William206','100100aa',3,null,0,300,3,0,0,'William','WGIETZ@kcompany.com',151238181,null,to_timestamp('16/05/21 08:30:14.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('MSKIM207','100100aa',3,null,0,300,3,0,0,'MS','MSKIM@kcompany.com',151232345,null,to_timestamp('16/05/21 08:30:14.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('admin','admin',3,null,0,300,3,0,10,'�����Ͱ�����','parkingc16@gmail.com',100001234,null,to_timestamp('16/05/18 08:29:10.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('seokseok','1234',3,null,0,300,3,0,0,'����','jjum90@hamail.net',100001234,null,to_timestamp('16/05/18 08:29:10.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('catTower','123',3,null,0,300,3,0,0,'adf','asd@asd.com',100001234,null,to_timestamp('16/06/04 08:31:50.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('190175867','111',3,null,0,200,0,0,0,'kakao','Kakao@email.com',10111111,null,to_timestamp('16/06/17 02:22:38.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('PublicPark','ppark',0,null,0,300,3,null,2,'����������','kitri@kitri.com',100001234,null,to_timestamp('16/05/18 08:29:10.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('��','456',3,null,0,210,3,0,0,'��','bong@naver.com',100001234,null,to_timestamp('16/05/18 08:29:10.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('dddd','ddd',3,null,0,300,3,0,0,'ddd','123123',100001234,null,to_timestamp('16/05/18 08:29:10.000000000','RR/MM/DD HH24:MI:SS.FF'));
Insert into MEMBER (USER_ID,USER_PASS,GRADE_ID,LOGIN_KEY,HOST_FLAG,COIN,USER_AVGPOINT,PENALTY,USER_FLAG,USER_NAME,EMAIL,TEL,PROFILE_IMAGE,LOGTIME) values ('��ġȸ','123123',3,null,0,1622,3,0,0,'��ġȸ','��@����.��',100001234,null,to_timestamp('16/06/15 04:00:39.000000000','RR/MM/DD HH24:MI:SS.FF'));

---------------------------------------------------
--   END DATA FOR TABLE MEMBER
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE PENALTY
--   FILTER = none used
---------------------------------------------------
REM INSERTING into PENALTY
Insert into PENALTY (PENALTY_NUM,USER_ID,PENALTY_CODE,PENALTY_DATE,PENALTY_MEMO,SEQ) values (21,'PublicPark',20,to_timestamp('16/06/15 15:12:38.000000000','RR/MM/DD HH24:MI:SS.FF'),'û���ʿ�',630);
Insert into PENALTY (PENALTY_NUM,USER_ID,PENALTY_CODE,PENALTY_DATE,PENALTY_MEMO,SEQ) values (41,'PublicPark',20,to_timestamp('16/06/16 15:55:33.000000000','RR/MM/DD HH24:MI:SS.FF'),'�ü���������',621);

---------------------------------------------------
--   END DATA FOR TABLE PENALTY
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE BOARD
--   FILTER = none used
---------------------------------------------------
REM INSERTING into BOARD
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (1,0,'IUGuest','����������','��������',to_timestamp('16/05/06 14:10:46.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (629,2,'IUGuest','�ָ��� ������ ��ݹ���','�󸶿���>?',to_timestamp('16/06/10 07:17:12.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (521,1,'IUGuest','õȣ���� ���� �帳�ϴ�','������ �ΰ� ������ ���� �͵� �����ϴ�.',to_timestamp('16/06/09 09:12:18.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (142,0,'��','����������� �����ıⳲ���','������ �ȵ���',to_timestamp('16/06/15 01:39:36.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (144,0,'��','���� ���ε�?','��������

������ �� �ðԿ�',to_timestamp('16/06/15 01:52:17.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (213,2,'RgPark','�� �̿��߾��','�� �̿��߾��',to_timestamp('16/06/01 17:44:30.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (45,0,'SZGuest','���� ������ ����','�±�',to_timestamp('16/06/05 02:12:26.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (524,1,'IUGuest','������','����������',to_timestamp('16/06/09 09:14:09.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (83,0,'��','���� ������ ����','������ �ʳ׿�

������ ��ȸ�Ǹ� �ٽ� �̿��ҰԿ�!',to_timestamp('16/06/09 15:03:08.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (143,0,'��','�ٽôٽ�','�����ϱ� �ѹ���',to_timestamp('16/06/15 01:42:13.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (619,3,'IUGuest','�������� �ʹ� ��������','û���� �ϼ���',to_timestamp('16/06/10 06:05:26.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (623,2,'IUGuest','���� ������ �����?','�����幮��',to_timestamp('16/06/10 06:23:23.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (332,2,'IUGuest','����','����',to_timestamp('16/06/06 12:54:04.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (624,2,'RgPark','���ù���?','�������� ��������',to_timestamp('16/06/10 06:24:18.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (626,2,'IUGuest','������','������',to_timestamp('16/06/10 06:51:08.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (628,2,'RgPark','���������� ����׿�','������ �ü� ������ ��Ź�帳�ϴ�.',to_timestamp('16/06/10 06:58:17.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (630,3,'IUGuest','������ ��������','������',to_timestamp('16/06/10 07:17:34.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (103,0,'IUGuest','������ ������','������',to_timestamp('16/06/10 07:18:01.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (147,0,'��ġȸ','�� ������ �ʾƿ�','�±�!',to_timestamp('16/06/15 05:57:24.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (148,0,'��','���� �����?','�����!',to_timestamp('16/06/15 06:07:58.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (149,0,'��','���ƿ�!','�±�!',to_timestamp('16/06/15 06:12:38.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (685,1,'IUGuest','������ ��ó ����','���� ������',to_timestamp('16/06/15 07:58:30.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (686,2,'��ġȸ','�������� ȯ��������(��)      ������ ������ 735-0','���� �����ؿ�?',to_timestamp('16/06/15 08:03:51.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (161,0,'IUGuest','�츮���̶� �������','������ �� �ðԿ�!',to_timestamp('16/06/17 05:24:35.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (745,2,'IUGuest','���� �̿��ߴµ�','������ ���',to_timestamp('16/06/17 05:24:52.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (25,0,'Trenna141','���ڱ� ���������� �η��η� �� ������ ���µ�','������ �����ϱ� ���� �� �Ȱ����� �ٴϴµ�, ���ڱ� ������ ������ �� �� ���� �� ������ �����. ������ ���̽��� ģ���� �Ұ����༭ �� ���񽺸� �˰�� �־��ŵ��.�ٷ� �����ϴϱ� �ǳ׿�. �� �������� ���ο� �ǽð� �ý����̶� ������ ���� �ٷ� �ߴ��󱸿�. ���ؿ�.',to_timestamp('16/05/26 17:01:37.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (157,2,'didrl2','�� �̿��߾�� �±� ������','�� �̿��߾�� ģ�������׵� ��õ�ҰԿ�!',to_timestamp('16/05/28 13:04:57.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (203,2,'RgPark','�޾ƶ�','��������',to_timestamp('16/05/31 07:42:54.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (621,3,'IUGuest','���� �������ϴ�','������ �ü������� �����Դϴ�.',to_timestamp('16/06/10 06:13:07.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (615,2,'IUGuest','�氡����','�߾��Կ�',to_timestamp('16/06/10 04:57:33.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (625,2,'IUGuest','�������','�����',to_timestamp('16/06/10 06:37:38.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (183,1,'RgPark','�������������','�Ż翪 ��ó�� �γ��ؼ� �����մϴ�!!.',to_timestamp('16/05/30 06:42:54.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (184,1,'RgPark','������ ��ó ������','���� ��ó�ε� �μ� �����մϴ�!!.',to_timestamp('16/05/30 06:43:42.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (204,2,'RgPark','�ƴϾƴ�','������?',to_timestamp('16/05/31 07:43:18.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (211,2,'jjum90','������','123123',to_timestamp('16/06/01 17:28:57.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (632,2,'IUGuest','���� ������ ��?','���� ���� ������ ����',to_timestamp('16/06/10 07:21:01.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (46,0,'SZGuest','���� ������ ����','�±�!

������ �� �ðԿ�!',to_timestamp('16/06/05 02:13:23.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (47,0,'SZGuest','���� ������ ����','�±�!

������ �� �ðԿ�!',to_timestamp('16/06/05 02:13:31.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (48,0,'SZGuest','���� ������ ����','��������',to_timestamp('16/06/05 02:16:34.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (306,0,'IUGuest','�� �̿��߾�� �±� ������','��������',to_timestamp('16/06/06 04:25:52.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (309,0,'IUGuest','�� �̿��߾�� �±� ������','��������',to_timestamp('16/06/06 05:48:51.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (84,0,'IUGuest','�ʱ��� ����','���������ϰ� �����ؿ�',to_timestamp('16/06/09 15:09:42.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (121,0,'IUGuest','�±�!','�� �ðԿ�',to_timestamp('16/06/14 10:42:56.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (582,1,'IUGuest','�����ؿ�!','���� ���Ӥ�',to_timestamp('16/06/10 04:28:31.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (141,0,'��','�ȴ����� ������','���� ������������',to_timestamp('16/06/15 01:31:47.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (150,0,'��','���ƿ�?','�����!',to_timestamp('16/06/15 06:15:35.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (151,0,'��','�ä�','�ä�',to_timestamp('16/06/15 06:16:02.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (152,0,'��','�̸� ��!','���!',to_timestamp('16/06/15 06:19:20.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (742,2,'190175867','������ ��ݹ���','�Ѵ� ������� �󸶳� �մϱ�? ���ε� �մϱ�?',to_timestamp('16/06/17 03:55:39.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (13,0,'Alexander103','�ѱ��� ��Ծ�� ������ ���ƿ�.',' �� ���� ��ƿ�. �ѱ��� ģ�� �̾߱��߾��. ���￡ �� ���ƿ�. ������ �����. ������ �� �̸� ���� ���� �����߾��. �� �����߾��. �� �⻼���.',to_timestamp('16/05/07 16:07:45.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (14,0,'Steven100','�����ö����� �̰��� �Ϳ� ','�̸� �����ϸ� �������� ������ �ʹ� ���ƿ�.',to_timestamp('16/05/06 16:31:44.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (15,0,'SZGuest','�ʺ������̶� ������ �����','���������� �о ���ƿ�. ���濡 �����ϴ��� ������ �ʿ䵵 �����. ��ġ�������� ���⿡ ����!',to_timestamp('16/05/07 16:32:27.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (16,0,'GdHost','���������� �г׿�','������ ã�⵵ ���� ������ �о��.���ã�� �߰��صξ����ϴ�!',to_timestamp('16/05/11 16:32:32.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (17,0,'TopGuest','����ģ���� ����Ʈ �Ҷ� ����߾��','������ ������� ���׿�. �̸� �����ؼ� ������ ã���� �� ��� �ʿ䵵 ���� ',to_timestamp('16/05/26 16:32:37.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (18,0,'IUGuest','���� ����� �����߾��','ȸ�簡 ��ó�� �� ����� �����߾��. ���������� ����ϳ׿�. ���ϱǺ���',to_timestamp('16/05/26 16:32:41.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (19,0,'Neena101','���̻� ���� �������ص� �ǳ׿�','���� �� ���� ������ ã���� ��ʺ� �Һ��� ���� �־��µ�, ���� �׷� �ʿ� ���׿�. �ָ��� ���� �̸� ���ุ�س����� �Ǵϱ�. ���� ���� �� ������ ���� �ʿ䵵 ���׿�. �ڵ�ȭ�� �������̶�.',to_timestamp('16/05/16 16:57:25.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (20,0,'Diana107','���� �� �ܾ������ �������ص� ��','���� ��¿ �� ���� ��� �����ߴٰ� �� ���� �ܾ���� ���� �ӻ��ߴµ�, ���� ���� ����ϰ� �Ǿ��ֳ׿�.',to_timestamp('16/05/16 16:57:25.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (22,0,'Ellen174','�ʹ� ���ƿ�.','�ڵ�ȭ�� ������ �ý���! �ֿ��ҵ�',to_timestamp('16/05/26 16:57:29.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (23,0,'Bruce104','�ٸ��� ���������Ǻ��� �����ؿ�','���� �̺�Ʈ ���̶� ���⼭ �����ϸ� �������� �شٰ� �ؼ� ��þ��.ȸ��ǹ� �����Ǻ��� �����ؿ�.',to_timestamp('16/05/26 16:57:29.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (24,0,'Curtis142','���� �� �Ǿ����� ���','�������̶� �� ���� �ٷ� ���̶� ��ġ ���ƿ�. ',to_timestamp('16/05/26 16:57:29.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (182,1,'RgPark','���� ������','���� ȸ�� ��ó�ε� �γ��ؼ� �����մϴ�!!.',to_timestamp('16/05/30 06:41:32.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (185,1,'RgPark','���� ������','���� ������ ��ó�ε� �ΰ� �����Ƽ� �����մϴ�!!.',to_timestamp('16/05/30 08:09:17.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (614,2,'��','�ȳ�?','�ݰ���',to_timestamp('16/06/10 04:49:39.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (101,0,'IUGuest','���ⱸ����','������ ����',to_timestamp('16/06/10 06:15:26.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (181,1,'RgPark','���� ������','���� ������ ��ó�ε� �ΰ� �����Ƽ� �����մϴ�!!.',to_timestamp('16/05/30 06:38:31.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (186,1,'RgPark','���� ������','���� ȸ�� ��ó�ε� �γ��ؼ� �����մϴ�!!.',to_timestamp('16/05/30 08:09:17.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (223,2,'IUGuest','���������� ����?','����? �ð��� ��?',to_timestamp('16/06/02 16:34:29.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (89,0,'��','���� ����!!','�ٸ��е鵵 �̿��غ�����!����',to_timestamp('16/06/10 04:47:42.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (146,0,'IUGuest','���� ����!','���� �̿��ϴµ� �̿��� ������ �����մϴ� ����

������ �ΰ������� 4.5�� �帳�ϴ�!',to_timestamp('16/06/15 03:36:04.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (81,0,'IUGuest','�����̳׿�!~','���� ������ ����!~',to_timestamp('16/06/09 14:19:38.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (201,2,'RgPark','snsnsnsn','sssss',to_timestamp('16/05/31 05:53:28.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (221,2,'IUGuest','123123','123123123',to_timestamp('16/06/02 00:00:09.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (661,2,'��','��¥ ������?','�����',to_timestamp('16/06/15 01:14:14.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (41,0,'Curtis142','����?','�� �̿��߾����.',to_timestamp('16/06/05 00:30:22.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (42,0,'SZGuest','����ϳ׿� ��õ�帳�ϴ�.','�������� �� ���� �ͳ׿�',to_timestamp('16/06/05 02:04:06.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (43,0,'SZGuest','������ �г׿�.','���ڰ� �����ϱ� ���ƿ�',to_timestamp('16/06/05 02:04:10.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (44,0,'SZGuest','�±�!~','������ �߿� �ְ�׿�!~',to_timestamp('16/06/05 02:09:44.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (82,0,'IUGuest','����','��������',to_timestamp('16/06/09 14:20:17.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (88,0,'suk','����ϳ׿�','�׳ɱ׳� ����������?',to_timestamp('16/06/10 00:27:35.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (320,0,'IUGuest','�� �̿��߾�� �±� ������','��������',to_timestamp('16/06/06 08:50:33.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (575,1,'IUGuest','������ �־ ��õ�մϴ�!','���� ������ ���׿�!

���� �����ؿ�!

Ī����!',to_timestamp('16/06/10 04:26:26.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (588,1,'IUGuest','���� ���� ���ּ���','���� ������',to_timestamp('16/06/10 04:32:35.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (102,0,'IUGuest','���ⱸ����','������ ����',to_timestamp('16/06/10 06:15:36.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (662,2,'��','������?','���ڴ�..',to_timestamp('16/06/15 01:14:26.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (627,2,'IUGuest','���� ���뱹�� ���','�ڵ��� ������� ������ �����ε� ����',to_timestamp('16/06/10 06:55:28.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (153,0,'��','��?','��?',to_timestamp('16/06/15 06:19:56.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (154,0,'IUGuest','���� �����׿�','����ϰ� ������ �оƼ� ���׿� !~',to_timestamp('16/06/15 07:30:40.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (688,1,'IUGuest','���̵� ������ ����','���� �ѹ� �����غ��ϴ�.',to_timestamp('16/06/15 16:29:08.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (743,2,'IUGuest','������','����',to_timestamp('16/06/17 05:18:59.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (0,2,'admin','������������ ����帳�ϴ�.!~','�̹� ������ ����帳�ϴ�. ������ ������ 3000������ ������ �帮�ڽ��ϴ�.',to_timestamp('16/06/09 08:34:35.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (620,3,'IUGuest','����� �ʹ� ��ο�','����� �����ּ���',to_timestamp('16/06/10 06:07:29.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (536,2,'IUGuest','������ �˴ϴ�!~','3200�� ��?',to_timestamp('16/06/09 09:21:31.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (641,1,'IUGuest','���ο� �ڿ��� ������ ����','������ �ڿ��ջ��̾� 1�� ������ �����Դϴ�.',to_timestamp('16/06/13 13:33:43.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (145,0,'��ġȸ','�׳ɱ׳�','������

������ �ʾƿ�',to_timestamp('16/06/15 02:14:20.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (61,0,'IUGuest','�����Ű�����','�ٸ��е��� ���?',to_timestamp('16/06/07 01:47:51.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (349,2,'IUGuest','�츮ȸ�簳��','����������',to_timestamp('16/06/06 16:11:06.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (86,0,'Jennifer200','���� �� �̿��Ұǵ�','����������?

�̿��غ� �е� �����?',to_timestamp('16/06/09 16:27:05.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (87,0,'Jennifer200','���� �� �̿��Ұǵ�','����������?

�̿��غ� �е� �����?',to_timestamp('16/06/09 16:27:05.000000000','RR/MM/DD HH24:MI:SS.FF'),null);
Insert into BOARD (SEQ,BCODE,USER_ID,SUBJECT,CONTENTS,LOGTIME,PHOTO_KEY) values (85,0,'Jennifer200','ã�⵵ ���� ������ �г׿�!','���� �̿��ϰ� �� �� ���ƿ�!

�����Ѱɺ��� �ٸ�������� ���� �𸣳����䤻����',to_timestamp('16/06/09 16:25:45.000000000','RR/MM/DD HH24:MI:SS.FF'),null);

---------------------------------------------------
--   END DATA FOR TABLE BOARD
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE CAR_INFO
--   FILTER = none used
---------------------------------------------------
REM INSERTING into CAR_INFO
Insert into CAR_INFO (CAR_ID,MAKER,MODEL) values ('sm_001','�����ڵ���','����Ʈ');
Insert into CAR_INFO (CAR_ID,MAKER,MODEL) values ('sm_002','������','Ʈ����');
Insert into CAR_INFO (CAR_ID,MAKER,MODEL) values ('sm_003','������','����ũ');
Insert into CAR_INFO (CAR_ID,MAKER,MODEL) values ('md_001','�����ڵ���','�Ÿ');
Insert into CAR_INFO (CAR_ID,MAKER,MODEL) values ('md_002','�����ڵ���','����');
Insert into CAR_INFO (CAR_ID,MAKER,MODEL) values ('md_003','�����ڵ���','�ƹݶ�');
Insert into CAR_INFO (CAR_ID,MAKER,MODEL) values ('md_004','������','������');
Insert into CAR_INFO (CAR_ID,MAKER,MODEL) values ('bg_001','�����ڵ���','�׷���');
Insert into CAR_INFO (CAR_ID,MAKER,MODEL) values ('bg_002','�����ڵ���','���׽ý�');
Insert into CAR_INFO (CAR_ID,MAKER,MODEL) values ('bg_003','JEEP','���ϰ��̵�');
Insert into CAR_INFO (CAR_ID,MAKER,MODEL) values ('bg_004','JEEP','���н�');
Insert into CAR_INFO (CAR_ID,MAKER,MODEL) values ('sp_001','�����ڵ���','���䳪');
Insert into CAR_INFO (CAR_ID,MAKER,MODEL) values ('sp_002','�����ڵ���','����');
Insert into CAR_INFO (CAR_ID,MAKER,MODEL) values ('sp_003','�����ڵ���','����');
Insert into CAR_INFO (CAR_ID,MAKER,MODEL) values ('tr_001','�����ڵ���','���Ƽ');
Insert into CAR_INFO (CAR_ID,MAKER,MODEL) values ('tr_002','�����ڵ���','����2');
Insert into CAR_INFO (CAR_ID,MAKER,MODEL) values ('tr_003','�����ڵ���','����3');
Insert into CAR_INFO (CAR_ID,MAKER,MODEL) values ('tr_004','�����ڵ���','���þ�Ʈ');

---------------------------------------------------
--   END DATA FOR TABLE CAR_INFO
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE BOARDTYPE
--   FILTER = none used
---------------------------------------------------
REM INSERTING into BOARDTYPE
Insert into BOARDTYPE (BCODE,BNAME) values (0,'review');
Insert into BOARDTYPE (BCODE,BNAME) values (1,'call');
Insert into BOARDTYPE (BCODE,BNAME) values (2,'message');
Insert into BOARDTYPE (BCODE,BNAME) values (3,'report');

---------------------------------------------------
--   END DATA FOR TABLE BOARDTYPE
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE REVIEW
--   FILTER = none used
---------------------------------------------------
REM INSERTING into REVIEW
Insert into REVIEW (RSEQ,SEQ,AVAL_CODE,GET_POINT,AVALED_ID,HOST_FLAG) values (65,45,0,3.5,'PublicPark',0);
Insert into REVIEW (RSEQ,SEQ,AVAL_CODE,GET_POINT,AVALED_ID,HOST_FLAG) values (103,83,0,4,'PublicPark',0);
Insert into REVIEW (RSEQ,SEQ,AVAL_CODE,GET_POINT,AVALED_ID,HOST_FLAG) values (123,103,0,1.5,'PublicPark',0);
Insert into REVIEW (RSEQ,SEQ,AVAL_CODE,GET_POINT,AVALED_ID,HOST_FLAG) values (162,142,0,3.75,'PublicPark',0);
Insert into REVIEW (RSEQ,SEQ,AVAL_CODE,GET_POINT,AVALED_ID,HOST_FLAG) values (163,143,0,4.25,'PublicPark',0);
Insert into REVIEW (RSEQ,SEQ,AVAL_CODE,GET_POINT,AVALED_ID,HOST_FLAG) values (164,144,0,5,'PublicPark',0);
Insert into REVIEW (RSEQ,SEQ,AVAL_CODE,GET_POINT,AVALED_ID,HOST_FLAG) values (167,147,0,3.5,'PublicPark',0);
Insert into REVIEW (RSEQ,SEQ,AVAL_CODE,GET_POINT,AVALED_ID,HOST_FLAG) values (168,148,0,3.5,'PublicPark',0);
Insert into REVIEW (RSEQ,SEQ,AVAL_CODE,GET_POINT,AVALED_ID,HOST_FLAG) values (169,149,0,4,'PublicPark',0);
Insert into REVIEW (RSEQ,SEQ,AVAL_CODE,GET_POINT,AVALED_ID,HOST_FLAG) values (181,161,0,4,'PublicPark',0);
Insert into REVIEW (RSEQ,SEQ,AVAL_CODE,GET_POINT,AVALED_ID,HOST_FLAG) values (42,25,0,4,'kangnam17',0);
Insert into REVIEW (RSEQ,SEQ,AVAL_CODE,GET_POINT,AVALED_ID,HOST_FLAG) values (66,46,0,3.5,'PublicPark',0);
Insert into REVIEW (RSEQ,SEQ,AVAL_CODE,GET_POINT,AVALED_ID,HOST_FLAG) values (67,47,0,3.5,'PublicPark',0);
Insert into REVIEW (RSEQ,SEQ,AVAL_CODE,GET_POINT,AVALED_ID,HOST_FLAG) values (68,48,0,4,'PublicPark',0);
Insert into REVIEW (RSEQ,SEQ,AVAL_CODE,GET_POINT,AVALED_ID,HOST_FLAG) values (104,84,0,2.5,'PublicPark',0);
Insert into REVIEW (RSEQ,SEQ,AVAL_CODE,GET_POINT,AVALED_ID,HOST_FLAG) values (141,121,0,4,'PublicPark',0);
Insert into REVIEW (RSEQ,SEQ,AVAL_CODE,GET_POINT,AVALED_ID,HOST_FLAG) values (161,141,0,4.25,'PublicPark',0);
Insert into REVIEW (RSEQ,SEQ,AVAL_CODE,GET_POINT,AVALED_ID,HOST_FLAG) values (170,150,0,3.5,'PublicPark',0);
Insert into REVIEW (RSEQ,SEQ,AVAL_CODE,GET_POINT,AVALED_ID,HOST_FLAG) values (171,151,0,3,'PublicPark',0);
Insert into REVIEW (RSEQ,SEQ,AVAL_CODE,GET_POINT,AVALED_ID,HOST_FLAG) values (172,152,0,4,'PublicPark',0);
Insert into REVIEW (RSEQ,SEQ,AVAL_CODE,GET_POINT,AVALED_ID,HOST_FLAG) values (30,13,0,5,'kangnam17',0);
Insert into REVIEW (RSEQ,SEQ,AVAL_CODE,GET_POINT,AVALED_ID,HOST_FLAG) values (31,14,0,4,'PublicPark',0);
Insert into REVIEW (RSEQ,SEQ,AVAL_CODE,GET_POINT,AVALED_ID,HOST_FLAG) values (32,15,0,4,'kangnam17',0);
Insert into REVIEW (RSEQ,SEQ,AVAL_CODE,GET_POINT,AVALED_ID,HOST_FLAG) values (33,16,0,4,'kangnam17',0);
Insert into REVIEW (RSEQ,SEQ,AVAL_CODE,GET_POINT,AVALED_ID,HOST_FLAG) values (34,17,0,4,'kangnam17',0);
Insert into REVIEW (RSEQ,SEQ,AVAL_CODE,GET_POINT,AVALED_ID,HOST_FLAG) values (35,18,0,5,'kangnam17',0);
Insert into REVIEW (RSEQ,SEQ,AVAL_CODE,GET_POINT,AVALED_ID,HOST_FLAG) values (36,19,0,5,'kangnam17',0);
Insert into REVIEW (RSEQ,SEQ,AVAL_CODE,GET_POINT,AVALED_ID,HOST_FLAG) values (37,20,0,4,'kangnam17',0);
Insert into REVIEW (RSEQ,SEQ,AVAL_CODE,GET_POINT,AVALED_ID,HOST_FLAG) values (39,22,0,5,'kangnam17',0);
Insert into REVIEW (RSEQ,SEQ,AVAL_CODE,GET_POINT,AVALED_ID,HOST_FLAG) values (40,23,0,5,'kangnam17',0);
Insert into REVIEW (RSEQ,SEQ,AVAL_CODE,GET_POINT,AVALED_ID,HOST_FLAG) values (41,24,0,5,'kangnam17',0);
Insert into REVIEW (RSEQ,SEQ,AVAL_CODE,GET_POINT,AVALED_ID,HOST_FLAG) values (61,41,0,5,'kangnam17',0);
Insert into REVIEW (RSEQ,SEQ,AVAL_CODE,GET_POINT,AVALED_ID,HOST_FLAG) values (62,42,0,4,'kangnam17',0);
Insert into REVIEW (RSEQ,SEQ,AVAL_CODE,GET_POINT,AVALED_ID,HOST_FLAG) values (63,43,0,4,'kangnam17',0);
Insert into REVIEW (RSEQ,SEQ,AVAL_CODE,GET_POINT,AVALED_ID,HOST_FLAG) values (64,44,0,4,'kangnam17',0);
Insert into REVIEW (RSEQ,SEQ,AVAL_CODE,GET_POINT,AVALED_ID,HOST_FLAG) values (101,81,0,3,'PublicPark',0);
Insert into REVIEW (RSEQ,SEQ,AVAL_CODE,GET_POINT,AVALED_ID,HOST_FLAG) values (102,82,0,3.5,'PublicPark',0);
Insert into REVIEW (RSEQ,SEQ,AVAL_CODE,GET_POINT,AVALED_ID,HOST_FLAG) values (108,88,0,3,'PublicPark',0);
Insert into REVIEW (RSEQ,SEQ,AVAL_CODE,GET_POINT,AVALED_ID,HOST_FLAG) values (109,89,0,4,'PublicPark',0);
Insert into REVIEW (RSEQ,SEQ,AVAL_CODE,GET_POINT,AVALED_ID,HOST_FLAG) values (121,101,0,3,'PublicPark',0);
Insert into REVIEW (RSEQ,SEQ,AVAL_CODE,GET_POINT,AVALED_ID,HOST_FLAG) values (122,102,0,3,'PublicPark',0);
Insert into REVIEW (RSEQ,SEQ,AVAL_CODE,GET_POINT,AVALED_ID,HOST_FLAG) values (166,146,0,4.5,'PublicPark',0);
Insert into REVIEW (RSEQ,SEQ,AVAL_CODE,GET_POINT,AVALED_ID,HOST_FLAG) values (173,153,0,3.5,'PublicPark',0);
Insert into REVIEW (RSEQ,SEQ,AVAL_CODE,GET_POINT,AVALED_ID,HOST_FLAG) values (174,154,0,3,'PublicPark',0);
Insert into REVIEW (RSEQ,SEQ,AVAL_CODE,GET_POINT,AVALED_ID,HOST_FLAG) values (81,61,0,3.5,'PublicPark',0);
Insert into REVIEW (RSEQ,SEQ,AVAL_CODE,GET_POINT,AVALED_ID,HOST_FLAG) values (165,145,0,3,'PublicPark',0);
Insert into REVIEW (RSEQ,SEQ,AVAL_CODE,GET_POINT,AVALED_ID,HOST_FLAG) values (105,85,0,4,'PublicPark',0);
Insert into REVIEW (RSEQ,SEQ,AVAL_CODE,GET_POINT,AVALED_ID,HOST_FLAG) values (106,86,0,3,'PublicPark',0);
Insert into REVIEW (RSEQ,SEQ,AVAL_CODE,GET_POINT,AVALED_ID,HOST_FLAG) values (107,87,0,3,'PublicPark',0);

---------------------------------------------------
--   END DATA FOR TABLE REVIEW
---------------------------------------------------
--------------------------------------------------------
--  Constraints for Table AVGPOINT
--------------------------------------------------------

  ALTER TABLE "AVGPOINT" ADD CONSTRAINT "PK_AVGPOINT" PRIMARY KEY ("RSEQ") USING INDEX  ENABLE;
  ALTER TABLE "AVGPOINT" MODIFY ("RSEQ" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BOARD
--------------------------------------------------------

  ALTER TABLE "BOARD" ADD CONSTRAINT "PK_BOARD" PRIMARY KEY ("SEQ") USING INDEX  ENABLE;
  ALTER TABLE "BOARD" MODIFY ("BCODE" NOT NULL ENABLE);
  ALTER TABLE "BOARD" MODIFY ("SEQ" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BOARDTYPE
--------------------------------------------------------

  ALTER TABLE "BOARDTYPE" ADD CONSTRAINT "PK_BOARDTYPE" PRIMARY KEY ("BCODE") USING INDEX  ENABLE;
  ALTER TABLE "BOARDTYPE" MODIFY ("BCODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CALL
--------------------------------------------------------

  ALTER TABLE "CALL" ADD CONSTRAINT "PK_CALL" PRIMARY KEY ("PCSEQ") USING INDEX  ENABLE;
  ALTER TABLE "CALL" MODIFY ("PCSEQ" NOT NULL ENABLE);
  ALTER TABLE "CALL" MODIFY ("PCALL_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CAR_INFO
--------------------------------------------------------

  ALTER TABLE "CAR_INFO" ADD CONSTRAINT "PK_CAR_INFO" PRIMARY KEY ("CAR_ID") USING INDEX  ENABLE;
  ALTER TABLE "CAR_INFO" MODIFY ("CAR_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CITIES
--------------------------------------------------------

  ALTER TABLE "CITIES" ADD CONSTRAINT "PK_CITIES" PRIMARY KEY ("EMD_CODE") USING INDEX  ENABLE;
  ALTER TABLE "CITIES" MODIFY ("EMD_CODE" NOT NULL ENABLE);
  ALTER TABLE "CITIES" MODIFY ("SGG_CODE" NOT NULL ENABLE);

--------------------------------------------------------
--  Constraints for Table EVALUATION
--------------------------------------------------------

  ALTER TABLE "EVALUATION" ADD CONSTRAINT "EVALUATION_PENALTY_CODE_PK" PRIMARY KEY ("PENALTY_CODE") USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table FAQ
--------------------------------------------------------

  ALTER TABLE "FAQ" MODIFY ("FSEQ" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table FAVORITE
--------------------------------------------------------

  ALTER TABLE "FAVORITE" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "FAVORITE" MODIFY ("PARK_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table GRADE
--------------------------------------------------------

  ALTER TABLE "GRADE" ADD CONSTRAINT "PK_GRADE" PRIMARY KEY ("GRADE_ID") USING INDEX  ENABLE;
  ALTER TABLE "GRADE" MODIFY ("GRADE_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MEMBER
--------------------------------------------------------

  ALTER TABLE "MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY ("USER_ID") USING INDEX  ENABLE;
  ALTER TABLE "MEMBER" MODIFY ("GRADE_ID" NOT NULL ENABLE);
  ALTER TABLE "MEMBER" MODIFY ("USER_PASS" NOT NULL ENABLE);
  ALTER TABLE "MEMBER" MODIFY ("USER_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MEMBER_CAR
--------------------------------------------------------

  ALTER TABLE "MEMBER_CAR" ADD CONSTRAINT "MEMBER_CAR_PK" PRIMARY KEY ("REG_NUM") USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table MESSAGE
--------------------------------------------------------

  ALTER TABLE "MESSAGE" ADD CONSTRAINT "PK_MESSAGE" PRIMARY KEY ("MSEQ") USING INDEX  ENABLE;
  ALTER TABLE "MESSAGE" MODIFY ("SEQ" NOT NULL ENABLE);
  ALTER TABLE "MESSAGE" MODIFY ("MSEQ" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PARKING
--------------------------------------------------------

  ALTER TABLE "PARKING" MODIFY ("PARK_ID" NOT NULL ENABLE);
  ALTER TABLE "PARKING" ADD CONSTRAINT "PK_PARKING" PRIMARY KEY ("PARK_ID") USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table PARKING_DETAIL
--------------------------------------------------------

  ALTER TABLE "PARKING_DETAIL" MODIFY ("PARK_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PENALTY
--------------------------------------------------------

  ALTER TABLE "PENALTY" ADD CONSTRAINT "PENALTY_PENALTY_NUM_PK" PRIMARY KEY ("PENALTY_NUM") USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table PICTURE
--------------------------------------------------------

  ALTER TABLE "PICTURE" ADD CONSTRAINT "PICTURE_PIC_SEQ_PK" PRIMARY KEY ("PIC_SEQ") USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table REPORT
--------------------------------------------------------

  ALTER TABLE "REPORT" ADD CONSTRAINT "PK_REPORT" PRIMARY KEY ("CSEQ") USING INDEX  ENABLE;
  ALTER TABLE "REPORT" MODIFY ("PARK_ID" NOT NULL ENABLE);
  ALTER TABLE "REPORT" MODIFY ("CSEQ" NOT NULL ENABLE);
  ALTER TABLE "REPORT" MODIFY ("SEQ" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table RESERVATION
--------------------------------------------------------

  ALTER TABLE "RESERVATION" ADD CONSTRAINT "PK_RESERVATION" PRIMARY KEY ("RESER_ID") USING INDEX  ENABLE;
  ALTER TABLE "RESERVATION" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "RESERVATION" MODIFY ("PARK_ID" NOT NULL ENABLE);
  ALTER TABLE "RESERVATION" MODIFY ("RESER_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REVIEW
--------------------------------------------------------

  ALTER TABLE "REVIEW" ADD CONSTRAINT "PK_REVIEW" PRIMARY KEY ("RSEQ") USING INDEX  ENABLE;
  ALTER TABLE "REVIEW" MODIFY ("SEQ" NOT NULL ENABLE);
  ALTER TABLE "REVIEW" MODIFY ("RSEQ" NOT NULL ENABLE);

--------------------------------------------------------
--  Ref Constraints for Table AVGPOINT
--------------------------------------------------------

  ALTER TABLE "AVGPOINT" ADD CONSTRAINT "FK_REVIEW_TO_AVGPOINT" FOREIGN KEY ("RSEQ") REFERENCES "REVIEW" ("RSEQ") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BOARD
--------------------------------------------------------

  ALTER TABLE "BOARD" ADD CONSTRAINT "FK_BOARDTYPE_TO_BOARD" FOREIGN KEY ("BCODE") REFERENCES "BOARDTYPE" ("BCODE") ENABLE;
  ALTER TABLE "BOARD" ADD CONSTRAINT "FK_MEMBER_TO_BOARD" FOREIGN KEY ("USER_ID") REFERENCES "MEMBER" ("USER_ID") ENABLE;

--------------------------------------------------------
--  Ref Constraints for Table CALL
--------------------------------------------------------

  ALTER TABLE "CALL" ADD CONSTRAINT "FK_BOARD_TO_CALL" FOREIGN KEY ("PCALL_ID") REFERENCES "BOARD" ("SEQ") ENABLE;


--------------------------------------------------------
--  Ref Constraints for Table COIN
--------------------------------------------------------

  ALTER TABLE "COIN" ADD CONSTRAINT "FK_MEMBER_TO_COIN" FOREIGN KEY ("USER_ID") REFERENCES "MEMBER" ("USER_ID") ENABLE;
  ALTER TABLE "COIN" ADD CONSTRAINT "FK_RESERVATION_TO_COIN" FOREIGN KEY ("RESER_ID") REFERENCES "RESERVATION" ("RESER_ID") ENABLE;


--------------------------------------------------------
--  Ref Constraints for Table FAVORITE
--------------------------------------------------------

  ALTER TABLE "FAVORITE" ADD CONSTRAINT "FK_MEMBER_TO_FAVORITE" FOREIGN KEY ("USER_ID") REFERENCES "MEMBER" ("USER_ID") ENABLE;

--------------------------------------------------------
--  Ref Constraints for Table MEMBER
--------------------------------------------------------

  ALTER TABLE "MEMBER" ADD CONSTRAINT "FK_GRADE_TO_MEMBER" FOREIGN KEY ("GRADE_ID") REFERENCES "GRADE" ("GRADE_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MEMBER_CAR
--------------------------------------------------------

  ALTER TABLE "MEMBER_CAR" ADD CONSTRAINT "FK_CAR_INFO_TO_MEMBER_CAR" FOREIGN KEY ("CAR_ID") REFERENCES "CAR_INFO" ("CAR_ID") ENABLE;
  ALTER TABLE "MEMBER_CAR" ADD CONSTRAINT "FK_MEMBER_TO_MEMBER_CAR" FOREIGN KEY ("USER_ID") REFERENCES "MEMBER" ("USER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MESSAGE
--------------------------------------------------------

  ALTER TABLE "MESSAGE" ADD CONSTRAINT "FK_BOARD_TO_MESSAGE" FOREIGN KEY ("SEQ") REFERENCES "BOARD" ("SEQ") ENABLE;
  ALTER TABLE "MESSAGE" ADD CONSTRAINT "FK_MEMBER_TO_MESSAGE" FOREIGN KEY ("RECEIVER_ID") REFERENCES "MEMBER" ("USER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PARKING
--------------------------------------------------------

  ALTER TABLE "PARKING" ADD CONSTRAINT "FK_MEMBER_TO_PARKING" FOREIGN KEY ("OWNER_ID") REFERENCES "MEMBER" ("USER_ID") ENABLE;

--------------------------------------------------------
--  Ref Constraints for Table PENALTY
--------------------------------------------------------

  ALTER TABLE "PENALTY" ADD CONSTRAINT "PENALTY_PENALTY_CODE_FK" FOREIGN KEY ("PENALTY_CODE") REFERENCES "EVALUATION" ("PENALTY_CODE") ENABLE;
  ALTER TABLE "PENALTY" ADD CONSTRAINT "PENALTY_SEQ_FK" FOREIGN KEY ("SEQ") REFERENCES "BOARD" ("SEQ") ENABLE;
  ALTER TABLE "PENALTY" ADD CONSTRAINT "PENALTY_USER_ID_FK" FOREIGN KEY ("USER_ID") REFERENCES "MEMBER" ("USER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PICTURE
--------------------------------------------------------

  ALTER TABLE "PICTURE" ADD CONSTRAINT "FK_board_TO_picture" FOREIGN KEY ("SEQ") REFERENCES "BOARD" ("SEQ") ENABLE;
  ALTER TABLE "PICTURE" ADD CONSTRAINT "FK_member_TO_picture" FOREIGN KEY ("USER_ID") REFERENCES "MEMBER" ("USER_ID") ENABLE;
  ALTER TABLE "PICTURE" ADD CONSTRAINT "FK_parking_to_picture" FOREIGN KEY ("PARK_ID") REFERENCES "PARKING" ("PARK_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPORT
--------------------------------------------------------

  ALTER TABLE "REPORT" ADD CONSTRAINT "FK_BOARD_TO_REPORT" FOREIGN KEY ("SEQ") REFERENCES "BOARD" ("SEQ") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table RESERVATION
--------------------------------------------------------

  ALTER TABLE "RESERVATION" ADD CONSTRAINT "FK_MEMBER_TO_RESERVATION" FOREIGN KEY ("USER_ID") REFERENCES "MEMBER" ("USER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REVIEW
--------------------------------------------------------

  ALTER TABLE "REVIEW" ADD CONSTRAINT "FK_BOARD_TO_REVIEW" FOREIGN KEY ("SEQ") REFERENCES "BOARD" ("SEQ") ENABLE;

