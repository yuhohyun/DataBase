import mysql from "mysql2";

const pool = mysql.createPool(
  process.env.JAWSDB_URL ?? {
    host: 'localhost',
    user: 'root',
    database: 'WEEK11_INHA_DB',
    password: '!smart5651',
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
  }
);

// async / await 사용
const promisePool = pool.promise();

// selec query
export const selectSql = {
  getUsers: async () => {
    const [rows] = await promisePool.query(`select * from student`);
    return rows;
  },
  getClasses: async () => {
    const [rows] = await promisePool.query(
      `SELECT
        C.ID AS "ID",
        C.Name AS "Course",
        C.Professor AS "Professor",
        D.Dname AS "Opening_departments",
        C.Number_Of_Participant AS "Number_of_participant",
        (C.Number_Of_Participant - COUNT(CS.class_ID)) AS "Remaining_participants"
      FROM
        Class AS C
      JOIN
        Department AS D ON C.Did = D.ID
      LEFT JOIN
        class_student AS CS ON C.ID = CS.class_ID
      GROUP BY
        C.ID, C.Name, C.Professor, D.Dname, C.Number_Of_Participant;`);
      
      return rows;
  },
  getCompletion: async (data) => {
    const uid = await promisePool.query(`select ID from Student where StudentId=${data.sId}`);
    console.log(uid);

    const [rows] = await promisePool.query(
      `SELECT C.Cid AS "ID", 
        C.Name AS "Course", 
        C.Professor AS "Professor", 
        D.Dname AS "Opening_departments",
        C.Number_Of_Participant AS "Number_of_participant"
      FROM Class AS C
        JOIN class_student AS CS ON C.ID = CS.Class_Id
        JOIN Student AS S ON CS.Student_Id = S.ID
        JOIN Department AS D ON C.Did = D.ID
      WHERE S.ID = ${uid[0][0].ID};`);
    return rows;
  }

}

export const createSql = {
  addClass: async (data) => {
    const uid = await promisePool.query(`SELECT Id FROM Student WHERE StudentId=${data.sId}`);

    const checkRemainingParticipants = await promisePool.query(
     `SELECT
        (C.Number_Of_Participant - COUNT(CS.class_ID)) AS "Remaining_participants"
      FROM
        Class AS C
      JOIN
        Department AS D ON C.Did = D.ID
      LEFT JOIN
        class_student AS CS ON C.ID = CS.class_ID
      WHERE
        C.ID = ${data.cId}
      GROUP BY
        C.Number_Of_Participant;` 
    );

    console.log('check Remaining Participants:', checkRemainingParticipants);

    const checkDuplicate = await promisePool.query(
      `SELECT * FROM class_student WHERE student_id = ${uid[0][0].Id} AND class_id = ${data.cId}`
    );

    console.log('Check Duplicate:', checkDuplicate);

    if (checkDuplicate[0].length > 0) {
      // 데이터가 중복된다면, 콘솔 로그 출력
      console.log('Duplicate entry. You Cannot Insert!');
    } 
    else {
      // 데이터가 중복되지 않는다면, 남은 학생수를 확인함.
      const remainingParticipants = checkRemainingParticipants[0][0]["Remaining_participants"];

      console.log('Remaining Participants: ', remainingParticipants);

      if (remainingParticipants > 0) {
        const results = await promisePool.query(
          `INSERT INTO class_student VALUES (${uid[0][0].Id}, ${data.cId});`
        );
        console.log('Data insertion complete!');

        return results[0];
      }
      else {
        console.log('Number Of Remaining Participants = 0. You Cannot Insert!')
      }
    }
  }
};
