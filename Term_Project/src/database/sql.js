const mysql = require("mysql2");

const pool = mysql.createPool(
  process.env.JAWSDB_URL ?? {
    host: 'localhost',
    user: 'root',
    database: 'hospitalDB',
    password: '!smart5651',
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
  }
);

// async / await 사용
const promisePool = pool.promise();
const selectSql = {
    getUsers: async () => {
      const [rows] = await promisePool.query(
        `
        SELECT DoctorID AS ID, Password, 'Doctor' AS UserType FROM DOCTOR
        UNION
        SELECT NurseID AS ID, Password, 'Nurse' AS UserType FROM NURSE
        UNION
        SELECT PatientID AS ID, Password, 'Patient' AS UserType FROM PATIENT
        UNION
        SELECT AdministratorID AS ID, Password, 'Administrator' AS UserType FROM ADMINISTRATOR ;
        `
      );
      return rows;
    },
    getDoctor: async () => {
      const sql = `select * from DOCTOR`;
      const [result] = await promisePool.query(sql);
      
      return result;
    },
    getNurse: async () => {
      const sql = `select * from NURSE`;
      const [result] = await promisePool.query(sql);
      
      return result;
    },
    getPatientReservations: async (data) => {
      const [rows] = await promisePool.query(
        'SELECT * FROM RESERVATION WHERE PatientID = ?',
        [data.PatientID]
      );

      return rows;
    }
};

//update query
export const updateSql = {
  updateDoctor: async (data) => {
    console.log(data);

    const sql = `
      UPDATE DOCTOR
      SET DoctorID = ${data.DoctorID}, DepartmentID = ${data.DepartmentID},
          Name = "${data.Name}", Address = "${data.Address}",
          PhoneNumber = "${data.PhoneNumber}". Password = "${data.Password}"
      WHERE DoctorID = ${data.DoctorID}`;

    console.log(sql);
    await promisePool.query(sql);
  },
  updateNurse: async (data) => {
    console.log(data);

    const sql = `
      UPDATE NURSE
      SET NurseID = ${data.NurseID}, DepartmentID = ${data.DepartmentID},
          Name = "${data.Name}", Address = "${data.Address}",
          PhoneNumber = "${data.PhoneNumber}". Password = "${data.Password}"
      WHERE NurseID = ${data.NurseID}`;

    console.log(sql);
    await promisePool.query(sql);
  }
};

module.exports = { selectSql, updateSql };