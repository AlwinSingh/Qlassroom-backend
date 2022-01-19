const express = require('express')
const cors = require("cors");
require('dotenv').config()
const swaggerUI = require("swagger-ui-express");
const swaggerJsDoc = require("swagger-jsdoc");
const app = express()
const PORT = process.env.PORT || 3001;
// options object for swagger const options
const options = {
    definition: {
        openapi: "3.0.0",
        info: {
            title: "Qlassroom FYP API",
            version: "1.0.0",
            description:
                "A simple Express Qlassroom FYP API made with Express and documented with Swagger",
        },
        // pick which server you execute the request against
        servers: [
            {
                url: `http://localhost:${PORT}`,
            },
        ],
        // where our apis are located
    },
    apis: ["./routes/*.js"],
};
const specs = swaggerJsDoc(options); // initialize the swagger js docs

// Import Router
const userRouter = require('./routes/user');

// Connect Router to Express
app.use(userRouter);

app.use(
    "/api-docs",
    swaggerUI.serve,
    swaggerUI.setup(specs, { explorer: true })
);

app.use("/health", async (req, res, next) => {
    return res.status(200).send({
        'status': 'up'
    });
});

app.get('/', (req, res) => {
    res.send('Hello World!')
})

app.listen(PORT, () => {
    console.log(`Example app listening at http://localhost:${PORT}`)
})