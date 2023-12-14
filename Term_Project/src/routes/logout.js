const cookieParser = require("cookie-parser");
const express = require("express");
const expressSession = require('express-session');

const logoutRouter = express.Router();

logoutRouter.use(cookieParser());
logoutRouter.use(expressSession({
    secret: 'dilab',
    resave: true,
    saveUninitialized: true,
}));

logoutRouter.get('/logout', (req, res) => {
    if (req.cookies.user) {
        res.clearCookie('user');
        res.redirect("/");
    } else {
        res.redirect("/");
    }
})

module.exports = logoutRouter;
