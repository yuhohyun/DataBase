import express from 'express';
import { selectSql, updateSql } from '../database/sql';

const router = express.Router();

router.get('/student', async (_req, res) => {
    const student_res = await selectSql.getStudent();
    console.log(student_res)
    res.render('updateStudent', {
        main_title: "UPDATE 'Student' table",
        student_res,
    });
});
router.post('/student', async (req, res) => {
    const vars = req.body;
    const data = {
        Id: vars.Sid,
        Name: vars.Sname,
        Email: vars.SEmail,
        PhoneNumber: vars.SPhoneNumber,
        Major: vars.Major,
    }
    await updateSql.updateStudent(data);

    res.redirect('/update/student');
})

module.exports = router;
