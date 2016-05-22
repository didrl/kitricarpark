--------------------------------------------------------
--  File created - 토요일-5월-21-2016   
--------------------------------------------------------
  DROP TABLE "AVGPOINT" cascade constraints;
  DROP TABLE "BOARD" cascade constraints;
  DROP TABLE "BOARDTYPE" cascade constraints;
  DROP TABLE "CALL" cascade constraints;
  DROP TABLE "EVALUATION" cascade constraints;
  DROP TABLE "FAVORITE" cascade constraints;
  DROP TABLE "GRADE" cascade constraints;
  DROP TABLE "MEMBER" cascade constraints;
  DROP TABLE "MESSAGE" cascade constraints;
  DROP TABLE "PARKING" cascade constraints;
  DROP TABLE "PARKING_DETAIL" cascade constraints;
  DROP TABLE "PENALTY" cascade constraints;
  DROP TABLE "REPORT" cascade constraints;
  DROP TABLE "RESERVATION" cascade constraints;
  DROP TABLE "REVIEW" cascade constraints;
  
  drop sequence board_num_seq;
  drop sequence message_num_mseq;
  drop sequence report_num_cseq;
  drop sequence review_num_rseq;
  drop sequence call_num_pcseq;
--------------------------------------------------------
--  SEQUENCE created - 토요일-5월-21-2016   
--------------------------------------------------------
  create sequence board_num_seq
  start with 1 increment by 1;
  
  create sequence message_num_mseq
  start with 1 increment by 1;

  create sequence report_num_cseq
  start with 1 increment by 1;

  create sequence review_num_rseq
  start with 1 increment by 1;

  create sequence call_num_pcseq
  start with 1 increment by 1;

--------------------------------------------------------
--  DDL for Table AVGPOINT
--------------------------------------------------------

  CREATE TABLE "AVGPOINT" 
   (	"RSEQ" NUMBER, 
	"SEQ" NUMBER, 
	"BCODE" NUMBER, 
	"PARK_ID" NUMBER(10,0), 
	"AVGPOINT" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table BOARD
--------------------------------------------------------

  CREATE TABLE "BOARD" 
   (	"SEQ" NUMBER, 
	"BCODE" NUMBER, 
	"USER_ID" VARCHAR2(16), 
	"SUBJECT" VARCHAR2(50), 
	"CONTENT" VARCHAR2(100), 
	"LOGTIME" DATE
   ) ;
--------------------------------------------------------
--  DDL for Table BOARDTYPE
--------------------------------------------------------

  CREATE TABLE "BOARDTYPE" 
   (	"BCODE" NUMBER, 
	"BNAME" VARCHAR2(20)
   ) ;
--------------------------------------------------------
--  DDL for Table CALL
--------------------------------------------------------

  CREATE TABLE "CALL" 
   (	"PCALL_ID" NUMBER, 
	"PCSEQ" NUMBER, 
	"BCODE" NUMBER, 
	"PCALL_ADDR" VARCHAR2(100), 
	"PCALL_IMG" VARCHAR2(100), 
	"PCALL_FLAG" NUMBER, 
	"PCALL_NUM" NUMBER, 
	"PCALL_OK" NUMBER DEFAULT 0
   ) ;
--------------------------------------------------------
--  DDL for Table EVALUATION
--------------------------------------------------------

  CREATE TABLE "EVALUATION" 
   (	"PENAL_CODE" NUMBER, 
	"PANEL_NAME" VARCHAR2(100), 
	"PANEL_CONTENT" VARCHAR2(100), 
	"PANEL_POINT" NUMBER DEFAULT 0
   ) ;
--------------------------------------------------------
--  DDL for Table FAVORITE
--------------------------------------------------------

  CREATE TABLE "FAVORITE" 
   (	"PARK_ID" NUMBER(10,0), 
	"USER_ID" VARCHAR2(16), 
	"GU_NAME" VARCHAR2(20), 
	"DONG_NAME" VARCHAR2(20)
   ) ;
--------------------------------------------------------
--  DDL for Table GRADE
--------------------------------------------------------

  CREATE TABLE "GRADE" 
   (	"GRADE_ID" NUMBER, 
	"GRADE_NAME" VARCHAR2(20), 
	"AVGPOINT" NUMBER DEFAULT 0, 
	"BENEFIT" NUMBER DEFAULT 0, 
	"PENALTY" NUMBER DEFAULT 0
   ) ;
--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

  CREATE TABLE "MEMBER" 
   (	"USER_ID" VARCHAR2(16), 
	"GRADE_ID" NUMBER, 
	"USER_PASS" VARCHAR2(20), 
	"LOGIN_KEY" VARCHAR2(50), 
	"HOST_FLAG" NUMBER DEFAULT 0, 
	"CARINFO" VARCHAR2(20), 
	"COIN" NUMBER DEFAULT 0, 
	"USER_AVGPOINT" NUMBER DEFAULT 0, 
	"PENALTY" NUMBER DEFAULT 0, 
	"USER_FLAG" NUMBER DEFAULT 0
   ) ;
--------------------------------------------------------
--  DDL for Table MESSAGE
--------------------------------------------------------

  CREATE TABLE "MESSAGE" 
   (	"MSEQ" NUMBER, 
	"SEQ" NUMBER, 
	"BCODE" NUMBER, 
	"RECEIVER_ID" VARCHAR2(16), 
	"MSG_FLAG" NUMBER DEFAULT 0
   ) ;
--------------------------------------------------------
--  DDL for Table PARKING
--------------------------------------------------------

  CREATE TABLE "PARKING" 
   (	"PARK_ID" NUMBER(10,0), 
	"PARK_NAME" VARCHAR2(100), 
	"LOCATION" VARCHAR2(200), 
	"PARK_CAPACITY" NUMBER(5,0), 
	"OWNER_ID" VARCHAR2(16), 
	"LATITUDE" NUMBER(12,9), 
	"LONGITUDE" NUMBER(12,9), 
	"PARK_TYPE" VARCHAR2(6)
   ) ;
--------------------------------------------------------
--  DDL for Table PARKING_DETAIL
--------------------------------------------------------

  CREATE TABLE "PARKING_DETAIL" 
   (	"PARK_ID" NUMBER(10,0), 
	"PARK_FLAG" NUMBER(2,0) DEFAULT 1, 
	"PARK_AVGPOINT" NUMBER(4,2) DEFAULT 0, 
	"GET_STATUS" NUMBER(2,0), 
	"CUR_PARKING" NUMBER(5,0), 
	"PAY_YN" VARCHAR2(2), 
	"SATUR_PAY_YN" VARCHAR2(2), 
	"HOLI_PAY_YN" VARCHAR2(2), 
	"FULLTIME_MONTHLY_PAY" NUMBER(10,0), 
	"PARK_RATE" NUMBER(10,0), 
	"ADD_PARK_RATE" NUMBER(5,0), 
	"DAY_MAX_PAY" NUMBER(10,0), 
	"PARK_TIME_RATE" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table PENALTY
--------------------------------------------------------

  CREATE TABLE "PENALTY" 
   (	"PANEL_NUM" NUMBER, 
	"USER_ID" VARCHAR2(16), 
	"PANEL_CODE" NUMBER, 
	"PANEL_DATE" DATE, 
	"PANEL_CONTENT" VARCHAR2(100)
   ) ;
--------------------------------------------------------
--  DDL for Table REPORT
--------------------------------------------------------

  CREATE TABLE "REPORT" 
   (	"SEQ" NUMBER, 
	"CSEQ" NUMBER, 
	"PARK_ID" NUMBER(10,0), 
	"BCODE" NUMBER, 
	"USER_ID" VARCHAR2(16)
   ) ;
--------------------------------------------------------
--  DDL for Table RESERVATION
--------------------------------------------------------

  CREATE TABLE "RESERVATION" 
   (	"PARK_ID" NUMBER(10,0), 
	"USER_ID" VARCHAR2(16), 
	"RESER_ID" NUMBER, 
	"START_DATE" DATE, 
	"END_DATE" DATE
   ) ;
--------------------------------------------------------
--  DDL for Table REVIEW
--------------------------------------------------------

  CREATE TABLE "REVIEW" 
   (	"RSEQ" NUMBER, 
	"SEQ" NUMBER, 
	"BCODE" NUMBER, 
	"AVAL_CODE" NUMBER, 
	"GET_POINT" NUMBER, 
	"AVALED_ID" VARCHAR2(16), 
	"HOST_FLAG" NUMBER DEFAULT 0
   ) ;

--------------------------------------------------------
--  Constraints for Table AVGPOINT
--------------------------------------------------------

  ALTER TABLE "AVGPOINT" ADD CONSTRAINT "PK_AVGPOINT" PRIMARY KEY ("RSEQ") ENABLE;
 
  ALTER TABLE "AVGPOINT" MODIFY ("RSEQ" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BOARD
--------------------------------------------------------

  ALTER TABLE "BOARD" ADD CONSTRAINT "PK_BOARD" PRIMARY KEY ("SEQ") ENABLE;
 
  ALTER TABLE "BOARD" MODIFY ("SEQ" NOT NULL ENABLE);
 
  ALTER TABLE "BOARD" MODIFY ("BCODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BOARDTYPE
--------------------------------------------------------

  ALTER TABLE "BOARDTYPE" ADD CONSTRAINT "PK_BOARDTYPE" PRIMARY KEY ("BCODE") ENABLE;
 
  ALTER TABLE "BOARDTYPE" MODIFY ("BCODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CALL
--------------------------------------------------------

  ALTER TABLE "CALL" ADD CONSTRAINT "PK_CALL" PRIMARY KEY ("PCSEQ") ENABLE;
 
  ALTER TABLE "CALL" MODIFY ("PCALL_ID" NOT NULL ENABLE);
 
  ALTER TABLE "CALL" MODIFY ("PCSEQ" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table EVALUATION
--------------------------------------------------------

  ALTER TABLE "EVALUATION" ADD CONSTRAINT "PK_EVALUATION" PRIMARY KEY ("PENAL_CODE") ENABLE;
 
  ALTER TABLE "EVALUATION" MODIFY ("PENAL_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table FAVORITE
--------------------------------------------------------

  ALTER TABLE "FAVORITE" ADD CONSTRAINT "PK_FAVORITE" PRIMARY KEY ("PARK_ID", "USER_ID") ENABLE;
 
  ALTER TABLE "FAVORITE" MODIFY ("PARK_ID" NOT NULL ENABLE);
 
  ALTER TABLE "FAVORITE" MODIFY ("USER_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table GRADE
--------------------------------------------------------

  ALTER TABLE "GRADE" ADD CONSTRAINT "PK_GRADE" PRIMARY KEY ("GRADE_ID") ENABLE;
 
  ALTER TABLE "GRADE" MODIFY ("GRADE_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MEMBER
--------------------------------------------------------

  ALTER TABLE "MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY ("USER_ID") ENABLE;
 
  ALTER TABLE "MEMBER" MODIFY ("USER_ID" NOT NULL ENABLE);
 
  ALTER TABLE "MEMBER" MODIFY ("GRADE_ID" NOT NULL ENABLE);
 
  ALTER TABLE "MEMBER" MODIFY ("USER_PASS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MESSAGE
--------------------------------------------------------

  ALTER TABLE "MESSAGE" ADD CONSTRAINT "PK_MESSAGE" PRIMARY KEY ("MSEQ") ENABLE;
 
  ALTER TABLE "MESSAGE" MODIFY ("MSEQ" NOT NULL ENABLE);
 
  ALTER TABLE "MESSAGE" MODIFY ("SEQ" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PARKING
--------------------------------------------------------

  ALTER TABLE "PARKING" ADD CONSTRAINT "PK_PARKING" PRIMARY KEY ("PARK_ID") ENABLE;
 
  ALTER TABLE "PARKING" MODIFY ("PARK_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PARKING_DETAIL
--------------------------------------------------------

  ALTER TABLE "PARKING_DETAIL" MODIFY ("PARK_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PENALTY
--------------------------------------------------------

  ALTER TABLE "PENALTY" ADD CONSTRAINT "PK_PENALTY" PRIMARY KEY ("PANEL_NUM") ENABLE;
 
  ALTER TABLE "PENALTY" MODIFY ("PANEL_NUM" NOT NULL ENABLE);
 
  ALTER TABLE "PENALTY" MODIFY ("USER_ID" NOT NULL ENABLE);
 
  ALTER TABLE "PENALTY" MODIFY ("PANEL_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPORT
--------------------------------------------------------

  ALTER TABLE "REPORT" ADD CONSTRAINT "PK_REPORT" PRIMARY KEY ("CSEQ") ENABLE;
 
  ALTER TABLE "REPORT" MODIFY ("SEQ" NOT NULL ENABLE);
 
  ALTER TABLE "REPORT" MODIFY ("CSEQ" NOT NULL ENABLE);
 
  ALTER TABLE "REPORT" MODIFY ("PARK_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table RESERVATION
--------------------------------------------------------

  ALTER TABLE "RESERVATION" ADD CONSTRAINT "PK_RESERVATION" PRIMARY KEY ("RESER_ID") ENABLE;
 
  ALTER TABLE "RESERVATION" MODIFY ("PARK_ID" NOT NULL ENABLE);
 
  ALTER TABLE "RESERVATION" MODIFY ("USER_ID" NOT NULL ENABLE);
 
  ALTER TABLE "RESERVATION" MODIFY ("RESER_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REVIEW
--------------------------------------------------------

  ALTER TABLE "REVIEW" ADD CONSTRAINT "PK_REVIEW" PRIMARY KEY ("RSEQ") ENABLE;
 
  ALTER TABLE "REVIEW" MODIFY ("RSEQ" NOT NULL ENABLE);
 
  ALTER TABLE "REVIEW" MODIFY ("SEQ" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table AVGPOINT
--------------------------------------------------------

  ALTER TABLE "AVGPOINT" ADD CONSTRAINT "FK_PARKING_TO_AVGPOINT" FOREIGN KEY ("PARK_ID")
	  REFERENCES "PARKING" ("PARK_ID") ENABLE;
 
  ALTER TABLE "AVGPOINT" ADD CONSTRAINT "FK_REVIEW_TO_AVGPOINT" FOREIGN KEY ("RSEQ")
	  REFERENCES "REVIEW" ("RSEQ") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BOARD
--------------------------------------------------------

  ALTER TABLE "BOARD" ADD CONSTRAINT "FK_BOARDTYPE_TO_BOARD" FOREIGN KEY ("BCODE")
	  REFERENCES "BOARDTYPE" ("BCODE") ENABLE;
 
  ALTER TABLE "BOARD" ADD CONSTRAINT "FK_MEMBER_TO_BOARD" FOREIGN KEY ("USER_ID")
	  REFERENCES "MEMBER" ("USER_ID") ENABLE;

--------------------------------------------------------
--  Ref Constraints for Table CALL
--------------------------------------------------------

  ALTER TABLE "CALL" ADD CONSTRAINT "FK_BOARD_TO_CALL" FOREIGN KEY ("PCALL_ID")
	  REFERENCES "BOARD" ("SEQ") ENABLE;

--------------------------------------------------------
--  Ref Constraints for Table FAVORITE
--------------------------------------------------------

  ALTER TABLE "FAVORITE" ADD CONSTRAINT "FK_MEMBER_TO_FAVORITE" FOREIGN KEY ("USER_ID")
	  REFERENCES "MEMBER" ("USER_ID") ENABLE;
 
  ALTER TABLE "FAVORITE" ADD CONSTRAINT "FK_PARKING_TO_FAVORITE" FOREIGN KEY ("PARK_ID")
	  REFERENCES "PARKING" ("PARK_ID") ENABLE;

--------------------------------------------------------
--  Ref Constraints for Table MEMBER
--------------------------------------------------------

  ALTER TABLE "MEMBER" ADD CONSTRAINT "FK_GRADE_TO_MEMBER" FOREIGN KEY ("GRADE_ID")
	  REFERENCES "GRADE" ("GRADE_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MESSAGE
--------------------------------------------------------

  ALTER TABLE "MESSAGE" ADD CONSTRAINT "FK_BOARD_TO_MESSAGE" FOREIGN KEY ("SEQ")
	  REFERENCES "BOARD" ("SEQ") ENABLE;
 
  ALTER TABLE "MESSAGE" ADD CONSTRAINT "FK_MEMBER_TO_MESSAGE" FOREIGN KEY ("RECEIVER_ID")
	  REFERENCES "MEMBER" ("USER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PARKING
--------------------------------------------------------

  ALTER TABLE "PARKING" ADD CONSTRAINT "FK_MEMBER_TO_PARKING" FOREIGN KEY ("OWNER_ID")
	  REFERENCES "MEMBER" ("USER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PARKING_DETAIL
--------------------------------------------------------

  ALTER TABLE "PARKING_DETAIL" ADD CONSTRAINT "FK_PARKING_TO_PARKING_DETAIL" FOREIGN KEY ("PARK_ID")
	  REFERENCES "PARKING" ("PARK_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PENALTY
--------------------------------------------------------

  ALTER TABLE "PENALTY" ADD CONSTRAINT "FK_EVALUATION_TO_PENALTY" FOREIGN KEY ("PANEL_CODE")
	  REFERENCES "EVALUATION" ("PENAL_CODE") ENABLE;
 
  ALTER TABLE "PENALTY" ADD CONSTRAINT "FK_MEMBER_TO_PENALTY" FOREIGN KEY ("USER_ID")
	  REFERENCES "MEMBER" ("USER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPORT
--------------------------------------------------------

  ALTER TABLE "REPORT" ADD CONSTRAINT "FK_BOARD_TO_REPORT" FOREIGN KEY ("SEQ")
	  REFERENCES "BOARD" ("SEQ") ENABLE;
 
  ALTER TABLE "REPORT" ADD CONSTRAINT "FK_PARKING_TO_REPORT" FOREIGN KEY ("PARK_ID")
	  REFERENCES "PARKING" ("PARK_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table RESERVATION
--------------------------------------------------------

  ALTER TABLE "RESERVATION" ADD CONSTRAINT "FK_MEMBER_TO_RESERVATION" FOREIGN KEY ("USER_ID")
	  REFERENCES "MEMBER" ("USER_ID") ENABLE;
 
  ALTER TABLE "RESERVATION" ADD CONSTRAINT "FK_PARKING_TO_RESERVATION" FOREIGN KEY ("PARK_ID")
	  REFERENCES "PARKING" ("PARK_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REVIEW
--------------------------------------------------------

  ALTER TABLE "REVIEW" ADD CONSTRAINT "FK_BOARD_TO_REVIEW" FOREIGN KEY ("SEQ")
	  REFERENCES "BOARD" ("SEQ") ENABLE;
