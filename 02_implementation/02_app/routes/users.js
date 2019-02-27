const express = require('express');
const jwt = require('jsonwebtoken');
const router = express.Router();

//Models
const au_tuser = require('../models/au_tuser');

/* GET user listing. */

//Insert
router.post('/', async (req, res) => {
  let{user_ident, user_fname, user_lname} = req.body;
  try{
    let user = await au_tuser.create({
      user_ident,
      user_fname,
      user_lname
    },{
      fields: ["user_ident","user_fname","user_lname"]
    })
    if(user){
      res.json({
        result: "ok",
        data: user,
        message: "insert user successfully"
      });
    }else{
      res.json({
        result: "failed",
        data: {},
        message: 'Insert a user failed'
      });
    }
  }catch(error){
    res.json({
      result: "failed",
      data: {},
      message: `Insert user failed. Error ${error}`
    });
  }
});

//Update
router.put('/:user_user', async (req, res) => {
  const {user_user} = req.params;
  let{user_ident, user_fname, user_lname} = req.body;
  try{
    let user = await au_tuser.findAll({
      attributes: ["user_user","user_ident","user_fname","user_lname"],
      where: {
        user_user
      }
    });
  if(user.length > 0){
    user.forEach(async (user) => {
      await user.update({
        user_ident: user_ident ? user_ident : user.user_ident,
        user_fname: user_fname ? user_fname : user.user_fname,
        user_lname: user_lname ? user_lname : user.user_lname
      });
    });
    res.json({
      result: "ok",
      data: user,
      message: "update user successfully"
    });
  }else{
    res.json({
      result: "failed",
      data: {},
      message: "cannot find user to update"
    });
  }
  }catch(err){
    res.json({
      result: "failed",
      data: {},
      message: `Update user failed. Error ${err}` 
    });
  }
});

//Delete
router.delete('/:user_user', async (req, res) => {
  const {user_user} = req.params;
  try{
    let user = await au_tuser.destroy({
      where: {
        user_user
      }
    });
    res.json({
      result: "ok",
      message: "Delete user successfully"
    });
  }catch(err){
    res.json({
      result: "failed",
      message: `Delete user failed. Error ${err}` 
    });
  }
});

//Query all data
router.get('/', async (req, res) => {
  const {user_user} = req.params;
  try{
    const users = await au_tuser.findAll({
      attributes: ["user_user","user_ident","user_fname","user_lname"],
    });
    res.json({
      result: "ok",
      data: users,
      message: "Query list of user successfully"
    });
  }catch(err){
    res.json({
      result: "failed",
      data: {},
      message: `Query list of user failed. Error ${err}` 
    });
  }
});

//Get by Id
router.get('/:user_user', async (req, res) => {
  const {user_user} = req.params;
  try{
    let users = await au_tuser.findAll({
      attributes: ["user_user","user_ident","user_fname","user_lname"],
      where: {
        user_user
      }
    });
    if(users.length > 0){
      res.json({
        result: "ok",
        data: users,
        message: "Find user successfully"
      });
    }else{
      res.json({
        result: "failed",
        data: users,
        message: "Cannot find user"
      });
    }
  }catch(err){
    res.json({
      result: "failed",
      data: {},
      message: `Find user failed. Error ${err}` 
    });
  }
});

module.exports = router;
