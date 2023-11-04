import mysql from 'mysql2';

require("dotenv").config();

const pool = mysql.createPool({
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: '!smart5651',
    database: 'inha_db',
});

const promisePool = pool.promise();

// select query
export const selectSql = {
    getBuilding: async () => {
        const sql = `select * from Building`;
        const [result] = await promisePool.query(sql);
        return result;
    },
    getDepartment: async () => {
        const sql = `select * from Department`;
        const [result] = await promisePool.query(sql);
        return result;
    },
    getRoom: async () => {
        const sql = `select * from Room`;
        const [result] = await promisePool.query(sql);
        return result;
    },
    getStudent: async () => {
        const sql = `select * from Student`;
        const [result] = await promisePool.query(sql);
        return result;
    },
    getClass: async () => {
        const sql = `select * from Class`;
        const [result] = await promisePool.query(sql);
        return result;
    },
    getClass_has_student: async () => {
        const sql = `select * from Class_has_student where student_Sid=12191789`;
        const [result] = await promisePool.query(sql);
        return result;
    },
};

// insert query
export const insertSql = {
    setStudent: async (data) => {
        const sql = `insert into student values (
            "${data.Sid}", "${data.Sname}", "${data.SEmail}", 
            "${data.SPhoneNumber}", "${data.Major}"
        )`
        console.log(data);
        await promisePool.query(sql);
    },
};

// update query
export const updateSql = {
    updateStudent: async (data) => {
        console.log(data);
        const sql = `
            UPDATE Student 
            SET Id = ${data.Sid}, Name = "${data.Sname}", 
                Email = "${data.SEmail}", PhoneNumber = "${data.SPhoneNumber}",
                Major = "${data.Major}"
            WHERE Id = ${data.Sid}`;
        console.log(sql);
        await promisePool.query(sql);
    },
    updateDepartment: async (data) => {
        console.log(data);
        const sql = `
            UPDATE Department
            SET Department_Id : ${data.Did}, 
                Department_Name = "${data.Dname}",
                Department_Email : "${data.DEmail}",
                Department_PhoneNumber : "${data.DPhoneNumber}"
            WHERE Department_Id = ${data.Did}`;
        console.log(sql);
        await promisePool.query(sql);       
    },
};

// delete query
export const deleteSql = {
    deleteClass_has_student: async (data) => {
        console.log('delete Class Classid =', data);
        const sql = `DELETE FROM class_has_student WHERE Class_ClassId = "${data.Class_ClassId}"`
        console.log(sql);
        await promisePool.query(sql);
    },
};