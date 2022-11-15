var express = require("express");
var { errorHandler, notFound } = require("./middlewares/error_handlers");
require("dotenv").config();
const cors = require("cors");
const PORT = process.env.PORT;
var indexRouter = require("./routes/index");
var usersRouter = require("./routes/users");

var app = express();

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

app.use("/", indexRouter);
app.use("/users", usersRouter);

app.use(notFound);
app.use(errorHandler);

app.listen(PORT, () => {
  console.log(`App running on http://localhost:${PORT}`);
});
