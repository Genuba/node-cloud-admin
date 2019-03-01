const express = require('express');
const jwt = require('jsonwebtoken');
const router = express.Router();

//Models
const au_tuser       = require('../models/au_tuser');
const au_tlogin      = require('../models/au_tlogin');
const au_tmembership = require('../models/au_tmembership');

/* GET user listing. */

//Login
router.post('/', async (req, res) => {
  let{login_username,login_password} = req.body;
  try{

    let login = await au_tlogin.findAll({
      where: {
        login_username: login_username,
        login_password: login_password
      }
    })

    let user = await au_tuser.findAll({
      attributes: ["user_user"],
      where: {
        user_user: login.user_user
      }
    });

    if(login.length > 0){
      res.json({
        result: "ok",
        data: {user,login},
        message: "Login user successfully"
      });
    }else{
      res.json({
        result: "failed",
        data: {},
        message: 'nombre de usuario o password incorrectos'
      });
    }
  }catch(error){
    res.json({
      result: "failed",
      data: {},
      message: `Login user failed. Error ${error}`
    });
  }
});

module.exports = router;