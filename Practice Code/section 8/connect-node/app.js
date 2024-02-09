var mysql = require("mysql");

// make connection
var connection = mysql.createConnection({
  host: "localhost",
  user: "root", // your root username (leave as root)
  database: "join_us", // the name of your db (create this if you haven't already)
  password: process.env.MYSQL_PW, // your root user's password
});

const query = `SELECT 5+5 AS answer;`;

// run query
connection.query(query, function (error, results, fields) {
  if (error) throw error;
  console.log(results);
});

// insert record;
// SIMPLE
const query1 = `INSERT INTO users (email) VALUES ("test@gmail.com");`;
connection.query(query1, function (error, results) {
  if (error) throw error;
  console.log(results);
});

// INSERT USING DYNAMICS: OBJECT

const person = { email: "test@gmail.com" };
const insUser = `INSERT INTO users SET ?`;
connection.query(insUser, person, function (error, results) {
  if (error) throw error;
  console.log(results);
});

const arrData = [["test1@gmail.com"], ["test2@gmail.com"], ["test3@gmail.com"]];
connection.query(insUser, [arrData], function (error, results) {
  if (error) throw error;
  console.log(results);
});

// end connection
connection.end();
