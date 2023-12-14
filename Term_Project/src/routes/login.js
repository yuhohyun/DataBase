const cookieParser = require("cookie-parser");
const express = require("express");
const expressSession = require('express-session');
const { selectSql } = require("../database/sql.js");

const router = express.Router();

router.use(cookieParser());
router.use(expressSession({
    secret: 'dilab',
    resave: true,
    saveUninitialized: true,
}))

router.get('/', (req, res) => {
    if (req.cookies.user) {
        res.render('login', { 
            'user': req.cookies.user,
        });
    } else {
        res.render('login');
    }
});

router.get('/logout', (req, res) => {
    if (req.cookies.user) {
        res.clearCookie('user')
        res.redirect("/");
    } else {
        res.redirect("/");
    }
});

router.post('/', async (req, res) => {
    const vars = req.body;
    const users = await selectSql.getUsers();
    let whoAmI = 1;
    let checkLogin = false;

    users.forEach((user) => {
        if (vars.id == user.ID && vars.password === user.Password) {
            checkLogin = true;
            whoAmI = user.ID;
            req.session.UserType = user.UserType;
            console.log(req.session.UserType);
        }
    });

    if (checkLogin) {
        console.log("Login successful. Redirecting...");
        // UserType에 따라 적절한 페이지로 리다이렉트
        if (req.session.UserType === 'Doctor' || req.session.UserType === 'Nurse') {
            console.log(`user : staff`);
            res.redirect('/staff');
        } else if (req.session.UserType === 'Patient') {
            console.log(`user : patient`);
            res.redirect('/patient');
        } else if (req.session.UserType === 'Administrator') {
            console.log(`user : administrator`);
            res.redirect('/admin');
        } else {
            // UserType이 doctor, nurse, patient가 아닌 경우에 대한 기본 리다이렉트
            console.log(`login failed`);
            res.redirect('/');
        }
    } else {
        console.log(`login failed`);
        res.redirect('/');
    }
});

module.exports = router;
