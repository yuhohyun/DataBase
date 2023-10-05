import express from 'express';
import { insertSql } from '../database/sql';

const router = express.Router();

router.get('/', (req, res) => {
    res.render('home', { data: " " });
})

router.post('/', (req, res) => {
    const vars = req.body;

    const data = {
        Id: vars.Sid,
        Name: vars.Sname,
        Email: vars.SEmail,
        PhoneNumber: vars.SPhoneNumber,
        Major: vars.Major,
    };
    insertSql.setStudent(data);
})

module.exports = router;
