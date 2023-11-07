import express from "express";
import { selectSql } from '../database/sql';
// TODO
// sql import

const router = express.Router();

router.get('/', async function (req, res) {

    if (req.cookies.user) {
        const Classes = await selectSql.getClasses();
        const allClass = await selectSql.getClasses();

        res.render('select', { 
            user: req.cookies.user,
            title: "Course completion list",
            title2: "Course List (Registration)",
            Classes, 
            allClass,});
    } else {
        res.render('/')
    }

});

router.post('/', async(req, res) => {
    // TODO
    const data = {
        cId: req.body.applyBtn,
        sId: req.cookies.user,
    };
});

module.exports = router;