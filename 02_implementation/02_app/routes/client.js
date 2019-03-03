const express = require('express');
const jwt = require('jsonwebtoken');
const router = express.Router();

//Models
const cl_tclient      = require('../models/cl_tclient');
const cl_tconsum      = require('../models/cl_tconsum');
const cl_treceipt     = require('../models/cl_treceipt');

/* GET client listing. */

//Insert
router.post('/', async (req, res) => {
  let{client_ident,client_fname,client_lname,client_mora,company_company} = req.body;
  try{

    let client = await cl_tclient.create({
      client_ident,
      client_fname,
      client_lname,
      client_mora,
      company_company

    },{
      fields: ["client_ident","client_fname","client_lname","client_mora","company_company"]
    })

    if(client){
      res.json({
        result: "ok",
        data: client,
        message: "insert client successfully"
      });
    }else{
      res.json({
        result: "failed",
        data: {},
        message: 'Insert a client failed'
      });
    }
  }catch(error){
    res.json({
      result: "failed",
      data: {},
      message: `Insert client failed. Error ${error}`
    });
  }
});

//Update
router.put('/:client_client', async (req, res) => {
  const {client_client} = req.params;
  let{client_ident,client_fname,client_lname,client_mora,client_state} = req.body;
  try{
    let client = await cl_tclient.findAll({
      attributes: ["client_client","client_ident","client_fname","client_lname","client_state","client_lname"],
      where: {
        client_client
      }
    });

  if(client.length){
    client.forEach(async (client) => {
      await client.update({
        client_ident: client_ident ? client_ident : client.client_ident,
        client_fname: client_fname ? client_fname : client.client_fname,
        client_lname: client_lname ? client_lname : client.client_lname,
        client_mora : client_mora  ? client_mora  : client.client_mora,
        client_state: client_state ? client_state : client.client_state
      });
    });
    res.json({
      result: "ok",
      data: client,
      message: "update client successfully"
    });
  }else{
    res.json({
      result: "failed",
      data: {},
      message: "cannot find client to update"
    });
  }
  }catch(err){
    res.json({
      result: "failed",
      data: {},
      message: `Update client failed. Error ${err}` 
    });
  }
});

//Delete
/*router.delete('/:client_client', async (req, res) => {
  const {client_client} = req.params;
  try{
    let client = await cl_tclient.destroy({
      where: {
        client_client
      }
    });
    res.json({
      result: "ok",
      message: "Delete client successfully"
    });
  }catch(err){
    res.json({
      result: "failed",
      message: `Delete client failed. Error ${err}` 
    });
  }
});*/

//Query all data
router.get('/', async (req, res) => {
  const {client_client} = req.params;
  try{
    const clients = await cl_tclient.findAll({
      attributes: ["client_client","client_ident","client_fname","client_lname","client_mora","client_state"],
    });
    res.json({
      result: "ok",
      data: clients,
      message: "Query list of client successfully"
    });
  }catch(err){
    res.json({
      result: "failed",
      data: {},
      message: `Query list of client failed. Error ${err}` 
    });
  }
});

//Get by Id
router.get('/:client_client', async (req, res) => {
  const {client_client} = req.params;
  try{
    let client = await cl_tclient.findAll({
      attributes: ["client_client","client_ident","client_fname","client_lname","client_mora","client_state"],
      where: {
        client_client
      },
      include:[{
        model: cl_tconsum,
        require: false
      },{
        model: cl_treceipt,
        require: false
      }]
    });

    if(client.length > 0){
      res.json({
        result: "ok",
        data: client[0],
        message: "Find client successfully"
      });
    }else{
      res.json({
        result: "failed",
        data: {},
        message: "Cannot find client"
      });
    }
  }catch(err){
    res.json({
      result: "failed",
      data: {},
      message: `Find client failed. Error ${err}` 
    });
  }
});

cl_tclient.hasMany(cl_tconsum,{foreignKey: 'client_client', sourceKey: 'client_client'});
cl_tconsum.belongsTo(cl_tclient,{foreignKey: 'client_client', targetKey: 'client_client'});

cl_tclient.hasMany(cl_treceipt,{foreignKey: 'client_client', sourceKey: 'client_client'});
cl_treceipt.belongsTo(cl_tclient,{foreignKey: 'client_client', targetKey: 'client_client'});

module.exports = router;

