import express from "express";
import { selectSql } from "../database/sql";

const router = express.Router();

router.get('/', (req, res) => {
    res.render('login');
});

router.post('/', async (req, res) => {
    const vars = req.body;
    const users = await selectSql.getStudent();

    users.map((user) => {
        console.log('ID :', user.Sid);
        if (vars.id == user.Sid && vars.password == user.SPhoneNumber) {
            console.log('login success!');
            req.session.user = { id: user.Sid, checkLogin: true };
        }
    });

    if (req.session.user == undefined) {
        console.log('login failed!');
        res.send(`<script>
                    alert('login failed!');
                    location.href='/';
                </script>`)
    } else {
        res.redirect('/select');
    }
});

module.exports = router;