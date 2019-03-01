const express = require('express');
const jwt = require('jsonwebtoken');
const router = express.Router();

//Models
const au_tuser       = require('../models/au_tuser');
const au_tlogin      = require('../models/au_tlogin');
const au_tmembership = require('../models/au_tmembership');

/* GET user listing. */

//Insert
router.post('/', async (req, res) => {
  let{user_ident,user_fname,user_lname,login_username,login_password,company_company,rol_rol} = req.body;
  try{

    let user = await au_tuser.create({
      user_ident,
      user_fname,
      user_lname
    },{
      fields: ["user_ident","user_fname","user_lname"]
    })
    
    let login = await au_tlogin.create({
      login_username,
      login_password,
      user_user: user.user_user
    },{
      fields: ["login_username","login_password","user_user"]
    })

    let membership = await au_tmembership.create({
      user_user: user.user_user,
      company_company,
      rol_rol
    },{
      fields: ["user_user", "company_company", "rol_rol"]
    })

    if(user && login && membership){
      res.json({
        result: "ok",
        data: {user,login,membership},
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
  let{user_ident,user_fname,user_lname,login_username,login_password,menbership_state,rol_rol} = req.body;
  try{
    let user = await au_tuser.findAll({
      attributes: ["user_user","user_ident","user_fname","user_lname"],
      where: {
        user_user
      }
    });

    let login = await au_tlogin.findAll({
      attributes: ["login_login","login_username","login_password"],
      where: {
        user_user: user_user
      }
    })

    let membership = await au_tmembership.findAll({
      attributes: ["membership_membership","menbership_state","rol_rol"],
      where:{
        user_user: user_user
      }
    })

  if(user.length > 0 && login.length > 0 && membership.length > 0){
    user.forEach(async (user) => {
      await user.update({
        user_ident: user_ident ? user_ident : user.user_ident,
        user_fname: user_fname ? user_fname : user.user_fname,
        user_lname: user_lname ? user_lname : user.user_lname
      });
    });
    login.forEach(async (login) => {
      await login.update({
        login_username: login_username ? login_username : login.login_username,
        login_password: login_password ? login_password : login.login_password
      });
    });
    membership.forEach(async (membership) => {
      await membership.update({
        menbership_state: menbership_state ? menbership_state : membership.menbership_state,
        rol_rol         : rol_rol          ? rol_rol          : membership.rol_rol
      });
    });
    res.json({
      result: "ok",
      data: {user,login,membership},
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
/*router.delete('/:user_user', async (req, res) => {
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
});*/

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
    let user = await au_tuser.findAll({
      attributes: ["user_user","user_ident","user_fname","user_lname"],
      where: {
        user_user
      }
    });

    let login = await au_tlogin.findAll({
      attributes: ["login_login","login_username","login_password"],
      where: {
        user_user: user_user
      }
    })

    let membership = await au_tmembership.findAll({
      attributes: ["membership_membership","menbership_state","rol_rol"],
      where:{
        user_user: user_user
      }
    })

    if(user.length > 0 && login.length > 0 && membership.length > 0){
      res.json({
        result: "ok",
        data: {user,login,membership},
        message: "Find user successfully"
      });
    }else{
      res.json({
        result: "failed",
        data: {},
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
