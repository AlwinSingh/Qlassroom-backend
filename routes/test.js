// Pulled from internship backend
var express = require("express");
var router = express.Router();
const axios = require("axios");

router.post("/test", async (req, res, next) => {
    try {
        let body = req.body;

        console.log("body");
        console.log(body);

        // Note Axios in this context should only be used if something outside our backend scope is needed.
        // I.e Qlassroom API
        const result = await axios({ // Yes this looks async.
            method: "POST",
            url: "url",
            data: {
                fileName: 'file'
            },
        });
        console.log(result);

        return res.status(200).send(result["body"]["data"]);
    } catch (error) {
        console.error("Error completing request", error);
        res.status(400).send(error["body"]["status"]);
    }
});

module.exports = router;