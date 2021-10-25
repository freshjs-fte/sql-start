import express from "express";

const usersDB = new Map();

const app = express();
const bodyParser = express.json();

app.get("/user", (req, res) => {
  console.log(req.query);

  res.send([...usersDB.values()]);
});

app.delete("/user", bodyParser, (req, res) => {
  usersDB.has("user" + req.body.id);
  usersDB.delete("user" + req.body.id);
  res.send(/*  */);
});

app.post("/user", bodyParser, (req, res) => {
  console.log(req.body);

  usersDB.set(`user${usersDB.size}`, req.body);

  res.send(req.body);
});

app.put("/user", bodyParser, (req, res) => {
  usersDB.get("user" + req.body.id);
  usersDB.set("user" + req.body.id /* value */);
  res.send(/*  */);
});

app.delete("/user", (req, res) => {
  usersDB.has("user" + req.body.id);
  usersDB.delete("user" + req.body.id);
});

export default app;
