const mysql = require("mysql");
const express = require("express");
var app = express();
const bodyparser = require("body-parser");

app.use(bodyparser.json());

var mysqlConnection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "1234",
  database: "telcomsis",
  multipleStatements: true
});

mysqlConnection.connect(err => {
  if (!err) console.log("DB connection succeded. ");
  else
    console.log(
      "DB connection failed \n Error: " + JSON.stringify(err, undefined, 2)
    );
});

app.listen(3000, () =>
  console.log("Express server is runing at port no : 3000")
);

// get all telcomsis- users
app.get("/telcomsis", (req, res) => {
  mysqlConnection.query("SELECT * FROM users", (err, rows, fields) => {
    if (!err) res.send(rows);
    //console.log(rows[0].id);
    else console.log(err);
  });
});

// get an telcomsis- users
app.get("/telcomsis/:id", (req, res) => {
  mysqlConnection.query(
    "SELECT * FROM users WHERE id = ?",
    [req.params.id],
    (err, rows, fields) => {
      if (!err) res.send(rows);
      else console.log(err);
    }
  );
});

// Delete an telcomsis- users
app.delete("/telcomsis/:id", (req, res) => {
  mysqlConnection.query(
    "DELETE FROM users WHERE id = ?",
    [req.params.id],
    (err, rows, fields) => {
      if (!err) res.send("Deleted successfully. ");
      else console.log(err);
    }
  );
});

// Insert an telcomsis- users
app.post("/telcomsis", (req, res) => {
  let emp = req.body;
  var sql =
    "SET @id = ?;SET @username = ?;SET @identificacion = ?;SET @email = ?; \
    CALL telcomsis.usersAddOrEdit(@id,@username,@identificacion,@email);";
  mysqlConnection.query(
    sql,
    [emp.id, emp.username, emp.identificacion, emp.email],
    (err, rows, fields) => {
      if (!err)
        rows.forEach(element => {
          if (element.constructor == Array)
            res.send("Inserted users id :" + element[0].id);
        });
      else console.log(err);
    }
  );
});

// Update an telcomsis- users
app.put("/telcomsis", (req, res) => {
  let emp = req.body;
  var sql =
    "SET @id = ?;SET @username = ?;SET @identificacion = ?;SET @email = ?; \
    CALL telcomsis.usersAddOrEdit(@id,@username,@identificacion,@email);";
  mysqlConnection.query(
    sql,
    [emp.id, emp.username, emp.identificacion, emp.email],
    (err, rows, fields) => {
      if (!err) res.send("Update successfully. ");
      else console.log(err);
    }
  );
});
