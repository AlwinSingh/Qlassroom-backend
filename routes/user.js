// Pulled from internship backend
var express = require("express");
var router = express.Router();
const db = require('../service/queries')


router.get("/getUsers", db.getUsers);

module.exports = router;