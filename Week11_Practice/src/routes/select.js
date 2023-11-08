import express from "express";
import { createSql, selectSql } from '../database/sql';
import { createServer } from "livereload";
// TODO
// sql import

const router = express.Router();

router.get('/', async function (req, res) {

    if (req.cookies.user) {
        const classes = await selectSql.getCompletion();
        const allClass = await selectSql.getClasses();

        res.render('select', { 
            user: req.cookies.user,
            title: "Course completion list",
            title2: "Course List (Registration)",
            classes, 
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

    await createSql.addClass(data);

    res.redirect('/sugang');
});

module.exports = router;