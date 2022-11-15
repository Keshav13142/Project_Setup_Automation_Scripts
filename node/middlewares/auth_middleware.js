const jwt = require("jsonwebtoken");
const asyncHandler = require("express-async-handler");
const { getConnection } = require("../db_config");

module.exports = asyncHandler(async (req, res, next) => {
  //get the auth header from the request
  const authHeader = req.headers.authorization;

  //check if the auth header starts with "Bearer ....token"
  if (authHeader && authHeader.startsWith("Bearer")) {
    //extract the token from the header
    const token = authHeader.split(" ")[1];

    //Verify the token using jwt.verify() => returns the decoded value
    const decoded = jwt.verify(token, process.env.JWT_SECRET);

    //Get the user's ID from the token
    const {
      user: { email },
    } = decoded;

    //Fetch the user's details from the DB excluding the password
    //Write code to get User Details from the DB 

    if (user) {
      //Set the user in request
      req.user = user;

      //Pass the control to the next function
      next();
    }
    //If user not found then throw error
    else {
      res.status(401);
      throw new Error("Unauthorized 😿");
    }

    //if token is not present in the header then throw error
    if (!token) {
      res.status(401);
      throw new Error("Unauthorized 😿");
    }
  }
  //If authorization header is not present in the request then throw error
  else {
    res.status(401);
    throw new Error("Unauthorized 😿");
  }
});
