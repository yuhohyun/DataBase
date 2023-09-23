-- Building 테이블 데이터 삽입
INSERT INTO building (Bid, BName)
VALUES (1, 'HighTech_Center'), (2, 'Engineering'), (3, '60 aniversary'), (4, 'AI'), (5, 'Law');

-- Department 테이블 데이터 삽입
INSERT INTO department (Did, Dname, DEmail, DPhoneNumber, Building_Bid)
VALUES 
  (1, 'ICE', 'ICE@inha.ac.kr', '0328607430', 1),
  (2, 'CS', 'CS@inha.ac.kr', '0321111111', 1),
  (3, 'EE', 'EE@inha.ac.kr', '0322222222', 2),
  (4, 'MEDICAL', 'MEDICAL@inha.ac.kr', '03233333333', 3),
  (5, 'AI', 'AI@inha.ac.kr', '03244444444', 4);

-- Student 테이블 데이터 삽입
INSERT INTO student (Sid, Sname, SEmail, SPhoneNumber, Department_Did, Major)
VALUES 
  (12191789, 'HOHYUN', 'hohyun07@gmail.com', '01047245651', 1, 'ICE'),
  (12190001, 'AMY', 'AMY@gmail.com', '01000001111', 1, 'ICE'),
  (12190002, 'BOB', 'BOB@gmail.com', '01011112222', 1, 'ICE'),
  (12190003, 'KIM', 'KIM@gmail.com', '01022223333', 2, 'CS'),
  (12190004, 'LEE', 'LEE@gmail.com', '01033334444', 3, 'EE'),
  (12190006, 'JO', 'JO@gmail.com', '01055556666', 1, 'ICE');

-- Room 테이블 데이터 삽입
INSERT INTO room (Rid, Rname, Capacity, Building_Bid)
VALUES 
  (230, 'H-230', 75, 1),
  (232, 'H-232', 75, 1),
  (424, 'H-424', 40, 1),
  (101, '2-101', 50, 2),
  (102, '2-102', 50, 2);
