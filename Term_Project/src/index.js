const express = require("express");
const logger = require("morgan");
const path = require("path");
const liveReload = require('livereload');
const connectLiveReload = require('connect-livereload');

const loginRouter = require("./routes/login.js");
const logoutRouter = require('./routes/logout.js');
const staffRouter = require("./routes/staff.js");
const patientRouter = require("./routes/patient.js");
const adminRouter = require("./routes/admin.js");

const PORT = 3000;

const liveReloadServer = liveReload.createServer();
liveReloadServer.server.once("connection", () => {
  setTimeout(() => {
    liveReloadServer.refresh('/');
  }, 100)
});

const app = express();

app.use(connectLiveReload());

app.use(express.urlencoded({ extended: false }));
app.use(express.json());

app.set("views", path.join(__dirname, "views"));
app.set("view engine", "hbs");
app.use(express.static(path.join(__dirname, 'public')));

app.use(logger("dev"));

app.use("/", loginRouter);
app.use("/logout", logoutRouter);
app.use("/staff", staffRouter);
app.use("/patient", patientRouter);
app.use("/admin", adminRouter);


app.listen(PORT, () => {
  console.log(`Example app listening at http://localhost:${PORT}`);
});
