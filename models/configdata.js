var mysql      = require('mysql');
var express = require("express");
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : '',
  database : 'e-shopping'
});

module.exports= connection;