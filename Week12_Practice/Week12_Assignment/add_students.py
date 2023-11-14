import mysql.connector
from faker import Faker

# MySQL 연결 설정
connection = mysql.connector.connect(
    host="localhost",
    user="root",
    password="!smart5651",
    database="inha_DB"
)

cursor = connection.cursor()

# faker 객체를 생성함
fake = Faker()

# 10만명 이상의 가짜 학생 정보를 추가하는 쿼리문 작성
sql_query = """
INSERT INTO Student (Sid, Sname, SEmail, SPhoneNumber, Department_Did, Major)
VALUES
"""

# faker 객체 생성
fake = Faker()
# ...

# 10만명의 가짜 데이터 생성 및 쿼리에 추가
for Sid in range(1, 100001):
    Sname = fake.unique.user_name()
    SEmail = f'{fake.word()}{Sid}@example.com'

    # 중복되지 않는 무작위 숫자를 생성하여 SPhoneNumber의 일부로 사용 (10자리)
    random_number = fake.unique.random_number(digits=9)
    SPhoneNumber = f'{random_number}'

    Department_Did = fake.random_int(min=1, max=5)

    if Department_Did == 1:
        Major = 'ICE'
    elif Department_Did == 2:
        Major = 'CS'
    elif Department_Did == 3:
        Major = 'EE'
    elif Department_Did == 4:
        Major = 'MEDICAL'
    elif Department_Did == 5:
        Major = 'AI'

    # VALUES에 각 학생의 정보를 추가
    sql_query += f"({Sid}, '{Sname}', '{SEmail}', '{SPhoneNumber}', {Department_Did}, '{Major}'),"

    # 진행 상황 출력
    print(f"학생 {Sid} 정보 추가 완료")

# 맨 마지막 쉼표 제거
sql_query = sql_query.rstrip(',')

# 쿼리 실행
cursor.execute(sql_query)

# 변경사항 저장
connection.commit()

# 연결 종료
cursor.close()
connection.close()

print("10만명 이상의 가짜 학생 정보가 MySQL 데이터베이스에 추가되었습니다.")
