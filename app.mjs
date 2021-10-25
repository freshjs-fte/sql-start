import express from "express";

const app = express();

app.get("/", (req, res) => {
  console.log(req.query);
  res.end("Hello");
});

app.get("/test", (req, res) => {
  console.log(req.method);
  res.send({ test: 123 });
});

export default app
