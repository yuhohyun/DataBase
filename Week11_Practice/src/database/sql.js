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
      `select C.ID as "ID", 
        C.Name as "Course", 
        C.Professor as "Professor", 
        D.Dname as "Opening_departments", 
        C.Number_Of_Participant as "Number_of_participant"
      from Class as C, Department as D`);
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
    const uid = await promisePool.query(`select Id from Student where StudentId=${data.sId}`);
    console.log(uid);
    const results = await promisePool.query (
      `insert into class_student values (${uid[0][0].Id}, ${data.cId});`
    )
    return results[0];
  }
}

