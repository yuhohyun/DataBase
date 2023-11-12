import express from "express";
import { createSql, selectSql } from '../database/sql';
import { createServer } from "livereload";
// TODO
// sql import

const router = express.Router();

router.get('/', async function (req, res) {
    const data = {
        sId: req.cookies.user,
    }

    if (req.cookies.user) {
        const classes = await selectSql.getCompletion(data);
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
    const data = {
        cId: req.body.applyBtn,
        sId: req.cookies.user,
    };

    try {
        await createSql.addClass(data);
        res.redirect('/sugang');
    } catch (error) {
        // Handle any errors that occur during the insertion (e.g., duplicate entry)
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
});

module.exports = router;