/* 주차장정보 */
DROP TABLE parking 
	CASCADE CONSTRAINTS;

/* 예약정보 */
DROP TABLE reservation 
	CASCADE CONSTRAINTS;

/* 쪽지 */
DROP TABLE message 
	CASCADE CONSTRAINTS;

/* 후기 */
DROP TABLE review 
	CASCADE CONSTRAINTS;

/* 등급 평가기준 */
DROP TABLE grade 
	CASCADE CONSTRAINTS;

/* 회원정보 */
DROP TABLE member 
	CASCADE CONSTRAINTS;

/* 신고 게시판 */
DROP TABLE report 
	CASCADE CONSTRAINTS;

/* 벌점 내역 */
DROP TABLE penalty 
	CASCADE CONSTRAINTS;

/* 벌점 평가 리스트 */
DROP TABLE evaluation 
	CASCADE CONSTRAINTS;

/* 주차장 제보 목록 */
DROP TABLE call 
	CASCADE CONSTRAINTS;

/* 즐겨찾기 */
DROP TABLE favorite 
	CASCADE CONSTRAINTS;

/* 평점 내역_주차장 */
DROP TABLE avgpoint 
	CASCADE CONSTRAINTS;

/* 게시판 */
DROP TABLE board 
	CASCADE CONSTRAINTS;

/* 게시판 형식 */
DROP TABLE boardtype 
	CASCADE CONSTRAINTS;

/* 주차장 상세 */
DROP TABLE parking_detail 
	CASCADE CONSTRAINTS;

/* 도시 */
DROP TABLE cities 
	CASCADE CONSTRAINTS;

/* 주차장 시설정보 */
DROP TABLE parking_facility 
	CASCADE CONSTRAINTS;

/* 회원차량정보 */
DROP TABLE member_car 
	CASCADE CONSTRAINTS;

/* 차종정보 */
DROP TABLE car_info 
	CASCADE CONSTRAINTS;

/* 게시판_사진 */
DROP TABLE board_img 
	CASCADE CONSTRAINTS;

/* 주차장_사진 */
DROP TABLE parking_img 
	CASCADE CONSTRAINTS;

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


/* 주차장정보 */
CREATE TABLE parking (
	park_id NUMBER NOT NULL, /* 주차장아이디 */
	park_name VARCHAR2(100), /* 주차장이름 */
	park_capacity NUMBER, /* 총 주차면 수 */
	owner_id VARCHAR2(16), /* 소유주아이디 */
	latitude NUMBER, /* 주차장 위도 */
	longitude NUMBER, /* 주차장 경도 */
	park_type VARCHAR2(6), /* 주차장 종류 */
	emd_code NUMBER, /* 읍면동 코드 */
	content VARCHAR2(400) /* 상세정보 */
);

ALTER TABLE parking
	ADD
		CONSTRAINT PK_parking
		PRIMARY KEY (
			park_id
		);

/* 예약정보 */
CREATE TABLE reservation (
	reser_id NUMBER NOT NULL, /* 예약 번호 */
	park_id NUMBER NOT NULL, /* 주차장아이디 */
	user_id VARCHAR2(16) NOT NULL, /* 회원아이디(예약자) */
	start_date DATE, /* 예약시작일 */
	end_date DATE, /* 예약종료일 */
	pay number
);

ALTER TABLE reservation
	ADD
		CONSTRAINT PK_reservation
		PRIMARY KEY (
			reser_id
		);

/* 쪽지 */
CREATE TABLE message (
	mseq NUMBER NOT NULL, /* 쪽지글번호 */
	seq NUMBER NOT NULL, /* 글번호 */
	receiver_id VARCHAR2(16), /* 받는사람 아이디 */
	msg_flag NUMBER DEFAULT 0 /* 확인여부 */
);

ALTER TABLE message
	ADD
		CONSTRAINT PK_message
		PRIMARY KEY (
			mseq
		);

/* 후기 */
CREATE TABLE review (
	rseq NUMBER NOT NULL, /* 후기글번호 */
	seq NUMBER NOT NULL, /* 글번호 */
	aval_code NUMBER, /* 평가 코드 */
	get_point NUMBER, /* 등록한 평점 */
	avaled_id VARCHAR2(16), /* 평가대상 아이디 */
	host_flag NUMBER DEFAULT 0 /* 게스트호스트 플래그 */
);

ALTER TABLE review
	ADD
		CONSTRAINT PK_review
		PRIMARY KEY (
			rseq
		);

/* 등급 평가기준 */
CREATE TABLE grade (
	grade_id NUMBER NOT NULL, /* 등급번호 */
	grade_name VARCHAR2(20), /* 등급 이름 */
	avgPoint NUMBER DEFAULT 0, /* 평점 */
	benefit NUMBER DEFAULT 0, /* 혜택 */
	penalty NUMBER DEFAULT 0 /* 패널티 */
);

ALTER TABLE grade
	ADD
		CONSTRAINT PK_grade
		PRIMARY KEY (
			grade_id
		);

/* 회원정보 */
CREATE TABLE member (
	user_id VARCHAR2(16) NOT NULL, /* 아이디 */
	user_pass VARCHAR2(20) NOT NULL, /* 패스워드 */
	grade_id NUMBER NOT NULL, /* 등급번호 */
	login_key VARCHAR2(50), /* 간편로그인키 */
	host_flag NUMBER DEFAULT 0, /* 호스트여부 */
	coin NUMBER DEFAULT 0, /* 보유한코인 */
	user_avgPoint NUMBER DEFAULT 0, /* 평점 */
	penalty NUMBER DEFAULT 0, /* 누적 벌점 */
	user_flag NUMBER DEFAULT 0, /* 회원종류(개인/기업) */
	user_name VARCHAR2(16), /* 이름 */
	email VARCHAR2(100), /* 이메일 */
	tel NUMBER, /* 전화번호 */
	profile_image VARCHAR2(100) /* 프로필이미지 */
);

ALTER TABLE member
	ADD
		CONSTRAINT PK_member
		PRIMARY KEY (
			user_id
		);

/* 신고 게시판 */
CREATE TABLE report (
	seq NUMBER NOT NULL, /* 글번호 */
	cseq NUMBER NOT NULL, /* 신고글번호 */
	park_id NUMBER NOT NULL, /* 신고받은 주차장 아이디 */
	user_id VARCHAR2(16) /* 신고받은 아이디 */
);

ALTER TABLE report
	ADD
		CONSTRAINT PK_report
		PRIMARY KEY (
			cseq
		);

/* 벌점 내역 */
CREATE TABLE penalty (
	panel_num NUMBER NOT NULL, /* 벌점 번호 */
	user_id VARCHAR2(16) NOT NULL, /* 아이디 */
	panel_code NUMBER NOT NULL, /* 벌점코드 */
	panel_date DATE, /* 벌점 받은 날짜 */
	panel_content VARCHAR2(100) /* 벌점내역 */
);

ALTER TABLE penalty
	ADD
		CONSTRAINT PK_penalty
		PRIMARY KEY (
			panel_num
		);

/* 벌점 평가 리스트 */
CREATE TABLE evaluation (
	penal_code NUMBER NOT NULL, /* 벌점코드 */
	panel_name VARCHAR2(100), /* 벌점이름 */
	panel_content VARCHAR2(100), /* 벌점상세내용 */
	panel_point NUMBER DEFAULT 0 /* 벌점 점수 */
);

ALTER TABLE evaluation
	ADD
		CONSTRAINT PK_evaluation
		PRIMARY KEY (
			penal_code
		);

/* 주차장 제보 목록 */
CREATE TABLE call (
	pcall_id NUMBER NOT NULL, /* 글번호 */
	pcseq NUMBER NOT NULL, /* 제보글번호 */
	pcall_addr VARCHAR2(100), /* 주차장 주소 */
	pcall_img VARCHAR2(100), /* 주차장 이미지 */
	pcall_flag NUMBER, /* 주차장 구분 */
	pcall_num NUMBER, /* 주차면 수 */
	pcall_ok NUMBER DEFAULT 0 /* 방문예정 여부 */
);

ALTER TABLE call
	ADD
		CONSTRAINT PK_call
		PRIMARY KEY (
			pcseq
		);

/* 즐겨찾기 */
CREATE TABLE favorite (
	park_id NUMBER NOT NULL, /* 주차장 아이디 */
	user_id VARCHAR2(16) NOT NULL /* 아이디 */
);

/* 평점 내역_주차장 */
CREATE TABLE avgpoint (
	rseq NUMBER NOT NULL, /* 후기글번호 */
	seq NUMBER, /* 글 번호 */
	park_id NUMBER, /* 주차장아이디 */
	avgPoint NUMBER /* 평점 */
);

ALTER TABLE avgpoint
	ADD
		CONSTRAINT PK_avgpoint
		PRIMARY KEY (
			rseq
		);

/* 게시판 */
CREATE TABLE board (
	seq NUMBER NOT NULL, /* 글번호 */
	bcode NUMBER NOT NULL, /* 게시판 형식 번호 */
	user_id VARCHAR2(16), /* 작성자 */
	subject VARCHAR2(50), /* 제목 */
	contents VARCHAR2(100), /* 내용 */
	logtime DATE, /* 작성일 */
	photo_key VARCHAR2(100) /* 사진 */
);

ALTER TABLE board
	ADD
		CONSTRAINT PK_board
		PRIMARY KEY (
			seq
		);

/* 게시판 형식 */
CREATE TABLE boardtype (
	bcode NUMBER NOT NULL, /* 게시판 형식 번호 */
	bname VARCHAR2(20) /* 게시판 형식 이름 */
);

ALTER TABLE boardtype
	ADD
		CONSTRAINT PK_boardtype
		PRIMARY KEY (
			bcode
		);

/* 주차장 상세 */
CREATE TABLE parking_detail (
	park_id NUMBER NOT NULL, /* 주차장아이디 */
	park_flag NUMBER DEFAULT 1, /* 주차장 사용가능 여부 */
	park_avgPoint NUMBER DEFAULT 0, /* 주차장 평균평점 */
	get_status NUMBER, /* 실시간 정보 제공여부 */
	cur_parking NUMBER, /* 현재 주차중인 차량 수 */
	PAY_YN VARCHAR2(4), /* 평일 유무료 구분 */
	satur_pay_yn VARCHAR2(4), /* 토요일 유무료 구분 */
	holi_pay_yn VARCHAR2(4), /* 공휴일 유무료 구분 */
	fulltime_monthly_pay NUMBER, /* 월 정기권 금액 */
	park_rate NUMBER, /* 기본 주차요금 */
	park_time_rate NUMBER, /* 기본 주차시간 */
	add_park_rate NUMBER, /* 추가단위 요금 */
	day_max_pay NUMBER /* 하루 최대 요금 */
);

/* 도시 */
CREATE TABLE cities (
	sgg_code NUMBER NOT NULL, /* 시군구 코드 */
	emd_code NUMBER NOT NULL, /* 읍면동 코드 */
	sgg_name VARCHAR2(20), /* 시군구 이름 */
	emd_name VARCHAR2(20), /* 읍면동 이름 */
	lat NUMBER, /* 위도 */
	lng NUMBER /* 경도 */
);

ALTER TABLE cities
	ADD
		CONSTRAINT PK_cities
		PRIMARY KEY (
			emd_code
		);

/* 주차장 시설정보 */
CREATE TABLE parking_facility (
	park_id NUMBER, /* 주차장 아이디 */
	facility VARCHAR2(40), /* 보유시설 */
	feature VARCHAR2(100) /* 보유시설특징 */
);

/* 회원차량정보 */
CREATE TABLE member_car (
	category VARCHAR2(10), /* 차카테고리 */
	reg_num VARCHAR2(14), /* 차량번호 */
	car_id varchar2(20), /* 차모델아이디 */
	user_id VARCHAR2(16), /* 회원아이디 */
	car_name VARCHAR2(100)
);

/* 차종정보 */
CREATE TABLE car_info (
	car_id varchar2(20) NOT NULL, /* 차종모델아이디 */
	maker varchar2(20), /* 제조사 */
	 model varchar2(20) /* 모델 */
);

ALTER TABLE car_info
	ADD
		CONSTRAINT PK_car_info
		PRIMARY KEY (
			car_id
		);

/* 게시판_사진 */
CREATE TABLE board_img (
	seq NUMBER, /* 게시글번호 */
	file_name VARCHAR2(40), /* 파일명 */
	file_path VARCHAR2(100), /* 파일위치 */
	file_num number /* 게시글번호당파일수 */
);

/* 주차장_사진 */
CREATE TABLE parking_img (
	park_id NUMBER, /* 주차장번호 */
	file_name VARCHAR2(40), /* 파일명 */
	file_path VARCHAR2(100), /* 파일위치 */
	file_num number /* 게시글번호당파일수 */
);

ALTER TABLE parking
	ADD
		CONSTRAINT FK_member_TO_parking
		FOREIGN KEY (
			owner_id
		)
		REFERENCES member (
			user_id
		);

ALTER TABLE parking
	ADD
		CONSTRAINT FK_cities_TO_parking
		FOREIGN KEY (
			emd_code
		)
		REFERENCES cities (
			emd_code
		);

ALTER TABLE reservation
	ADD
		CONSTRAINT FK_member_TO_reservation
		FOREIGN KEY (
			user_id
		)
		REFERENCES member (
			user_id
		);

ALTER TABLE reservation
	ADD
		CONSTRAINT FK_parking_TO_reservation
		FOREIGN KEY (
			park_id
		)
		REFERENCES parking (
			park_id
		);

ALTER TABLE message
	ADD
		CONSTRAINT FK_board_TO_message
		FOREIGN KEY (
			seq
		)
		REFERENCES board (
			seq
		);

ALTER TABLE message
	ADD
		CONSTRAINT FK_member_TO_message
		FOREIGN KEY (
			receiver_id
		)
		REFERENCES member (
			user_id
		);

ALTER TABLE review
	ADD
		CONSTRAINT FK_board_TO_review
		FOREIGN KEY (
			seq
		)
		REFERENCES board (
			seq
		);

ALTER TABLE member
	ADD
		CONSTRAINT FK_grade_TO_member
		FOREIGN KEY (
			grade_id
		)
		REFERENCES grade (
			grade_id
		);

ALTER TABLE report
	ADD
		CONSTRAINT FK_board_TO_report
		FOREIGN KEY (
			seq
		)
		REFERENCES board (
			seq
		);

ALTER TABLE report
	ADD
		CONSTRAINT FK_parking_TO_report
		FOREIGN KEY (
			park_id
		)
		REFERENCES parking (
			park_id
		);

ALTER TABLE penalty
	ADD
		CONSTRAINT FK_member_TO_penalty
		FOREIGN KEY (
			user_id
		)
		REFERENCES member (
			user_id
		);

ALTER TABLE penalty
	ADD
		CONSTRAINT FK_evaluation_TO_penalty
		FOREIGN KEY (
			panel_code
		)
		REFERENCES evaluation (
			penal_code
		);

ALTER TABLE call
	ADD
		CONSTRAINT FK_board_TO_call
		FOREIGN KEY (
			pcall_id
		)
		REFERENCES board (
			seq
		);

ALTER TABLE favorite
	ADD
		CONSTRAINT FK_member_TO_favorite
		FOREIGN KEY (
			user_id
		)
		REFERENCES member (
			user_id
		);

ALTER TABLE favorite
	ADD
		CONSTRAINT FK_parking_TO_favorite
		FOREIGN KEY (
			park_id
		)
		REFERENCES parking (
			park_id
		);

ALTER TABLE avgpoint
	ADD
		CONSTRAINT FK_review_TO_avgpoint
		FOREIGN KEY (
			rseq
		)
		REFERENCES review (
			rseq
		);

ALTER TABLE avgpoint
	ADD
		CONSTRAINT FK_parking_TO_avgpoint
		FOREIGN KEY (
			park_id
		)
		REFERENCES parking (
			park_id
		);

ALTER TABLE board
	ADD
		CONSTRAINT FK_member_TO_board
		FOREIGN KEY (
			user_id
		)
		REFERENCES member (
			user_id
		);

ALTER TABLE board
	ADD
		CONSTRAINT FK_boardtype_TO_board
		FOREIGN KEY (
			bcode
		)
		REFERENCES boardtype (
			bcode
		);

ALTER TABLE parking_detail
	ADD
		CONSTRAINT FK_parking_TO_parking_detail
		FOREIGN KEY (
			park_id
		)
		REFERENCES parking (
			park_id
		);

ALTER TABLE parking_facility
	ADD
		CONSTRAINT FK_parking_TO_parking_facility
		FOREIGN KEY (
			park_id
		)
		REFERENCES parking (
			park_id
		);

ALTER TABLE member_car
	ADD
		CONSTRAINT FK_member_TO_member_car
		FOREIGN KEY (
			user_id
		)
		REFERENCES member (
			user_id
		);

ALTER TABLE member_car
	ADD
		CONSTRAINT FK_car_info_TO_member_car
		FOREIGN KEY (
			car_id
		)
		REFERENCES car_info (
			car_id
		);

ALTER TABLE board_img
	ADD
		CONSTRAINT FK_board_TO_board_img
		FOREIGN KEY (
			seq
		)
		REFERENCES board (
			seq
		);

ALTER TABLE parking_img
	ADD
		CONSTRAINT FK_parking_TO_parking_img
		FOREIGN KEY (
			park_id
		)
		REFERENCES parking (
			park_id
		);