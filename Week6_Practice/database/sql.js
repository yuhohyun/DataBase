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
}

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
};