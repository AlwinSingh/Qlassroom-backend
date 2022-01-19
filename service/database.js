const { Pool } = require("pg");

const credentials = {
  user: "sapgroup2",
  host: "database-qlassroom-fyp-gamification.crpslpbskue5.ap-southeast-1.rds.amazonaws.com",
  database: "gamification",
  password: "testTEST1234",
  port: 5432,
};

const pool = new Pool(credentials);

module.exports = {
  pool
}