import express from 'express';
import { selectSql, deleteSql } from '../database/sql';

const router = express.Router();

router.get('/', async (req, res) => {
    if (req.session.user != undefined) {
        const class_has_student = await selectSql.getClass_has_student();
        res.render('delete', {
            title: "Delete",
            class_has_student,
        });
    } else{
        res.redirect('/');
    }
});

router.post('/', async (req, res) => {
    console.log("delete :", req.body.delBtn);
    const data = {
        Class_ClassId: req.body.delBtn,
    };

    await deleteSql.deleteClass_has_student(data);

    res.redirect('/delete/class');
});

module.exports = router;
