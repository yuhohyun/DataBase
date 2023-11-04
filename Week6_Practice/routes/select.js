import express from 'express';
import { selectSql } from '../database/sql';

const router = express.Router();

router.get('/', async (req, res) => {
    const Student = await selectSql.getStudent();

    res.render('select', {
        main_title: "Tables in InhaDB",
        title1: "Student",
        Student,
    })
})

module.exports = router;
