DROP TABLE member_tbl_02;
CREATE TABLE member_tbl_02(
	custno number(6) primary key,
	custname varchar2(20),
	phone varchar2(13),
	address varchar2(60),
	joindate date,
	grade char(2),
	city char(2)
);

INSERT INTO MEMBER_TBL_02 VALUES(100001, '김행복', '010-1111-2222', '서울 동대문구 휘경1동', '20151202', 'A', '01');
INSERT INTO MEMBER_TBL_02 VALUES(100002, '이축복', '010-1111-3333', '서울 동대문구 휘경2동', '20151206', 'B', '01');
INSERT INTO MEMBER_TBL_02 VALUES(100003, '장믿음', '010-1111-4444', '울릉군 울릉읍 독도1리', '20151001', 'B', '30');
INSERT INTO MEMBER_TBL_02 VALUES(100004, '최사랑', '010-1111-5555', '울릉군 울릉웁 독도2리', '20151113', 'A', '30');
INSERT INTO MEMBER_TBL_02 VALUES(100005, '진평화', '010-1111-6666', '제주도 제주시 외나무골', '20151225', 'B', '60');
INSERT INTO MEMBER_TBL_02 VALUES(100006, '차공단', '010-1111-7777', '제주도 제주시 감나무골', '20151211', 'C', '60');

select custno, custname, phone,
address, to_char(joindate, 'yyyy-mm-dd') as joindate,
 grade, case when grade = 'A' then 'VIP'
  when grade = 'B' then '일반'
   else '직원' end as grade, city 
   from member_tbl_02 order by custno;
SELECT * FROM MEMBER_TBL_02;

DROP TABLE money_tbl_02;
CREATE TABLE money_tbl_02(
	custno number(6),
	salenol number(8),
	pcost number(8),
	amount number(4),
	price number(8),
	pcode varchar2(4),
	sdate date,
	primary key(custno, salenol)
);

INSERT INTO MONEY_TBL_02 VALUES(100001, '20160001', '500', '5', '2500', 'A001', '20160101');
INSERT INTO MONEY_TBL_02 VALUES(100001, '20160002', '1000', '2', '4000', 'A002', '20160101');
INSERT INTO MONEY_TBL_02 VALUES(100001, '20160003', '500', '3', '1500', 'A008', '20160101');
INSERT INTO MONEY_TBL_02 VALUES(100002, '20160004', '2000', '1', '2000', 'A004', '20160102');
INSERT INTO MONEY_TBL_02 VALUES(100002, '20160005', '500', '1', '500', 'A001', '20160103');
INSERT INTO MONEY_TBL_02 VALUES(100003, '20160006', '1500', '2', '3000', 'A003', '20160103');
INSERT INTO MONEY_TBL_02 VALUES(100004, '20160007', '500', '2', '1000', 'A001', '20160104');
INSERT INTO MONEY_TBL_02 VALUES(100004, '20160008', '300', '1', '300', 'A005', '20160104');
INSERT INTO MONEY_TBL_02 VALUES(100004, '20160009', '600', '1', '600', 'A006', '20160104');
INSERT INTO MONEY_TBL_02 VALUES(100004, '20160010', '3000', '1', '3000', 'A007', '20160106');

SELECT * FROM money_tbl_02;

select max(custno) from member_tbl_02;

select mb.custno, mb.custname, 
		case when mb.grade = 'A' then 'VIP'
			when mb.grade = 'B' then '일반'
			else '직원' end as grade,
		sum(price) as 매출
from member_tbl_02 mb, money_tbl_02 mo
where mb.custno = mo.custno(+)
group by mb.custno, mb.custname, grade
order by 매출 desc;

INSERT INTO MEMBER_TBL_02 VALUES(100006, '차공단', '010-1111-7777', '제주도 제주시 감나무골', '20151211', 'C', '60');
update member_tbl_02 set
		custname = '김민준',
		phone = '뿡뿡이ㅇ',
		address = '뿡',
		joindate = '2023-09-11',
		grade = 'A',
		city = '01'
where custno = 100007
		
