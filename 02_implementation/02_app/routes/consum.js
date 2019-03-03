const express = require('express');
const jwt = require('jsonwebtoken');
const router = express.Router();

//Models
const cl_tconsum      = require('../models/cl_tconsum');

/* GET consum listing. */

//Insert
router.post('/', async (req, res) => {
  let{consum_cant,consum_date,consum_state,client_client} = req.body;
  try{

    let consum = await cl_tconsum.create({
      consum_cant,
      consum_date,
      consum_state,
      client_client

    },{
      fields: ["consum_cant","consum_date","consum_state","client_client"]
    })

    if(consum){
      res.json({
        result: "ok",
        data: consum,
        message: "insert consum successfully"
      });
    }else{
      res.json({
        result: "failed",
        data: {},
        message: 'Insert a consum failed'
      });
    }
  }catch(error){
    res.json({
      result: "failed",
      data: {},
      message: `Insert consum failed. Error ${error}`
    });
  }
});

//Update
router.put('/:consum_consum', async (req, res) => {
  const {consum_consum} = req.params;
  let{consum_cant,consum_date,consum_state} = req.body;
  try{
    let consum = await cl_tconsum.findAll({
      attributes: ["consum_consum","consum_cant","consum_date","consum_state"],
      where: {
        consum_consum
      }
    });

  if(consum.length){
    consum.forEach(async (consum) => {
      await consum.update({
        consum_cant: consum_cant ? consum_cant : consum.consum_cant,
        consum_date : consum_date  ? consum_date  : consum.consum_date,
        consum_state: consum_state ? consum_state : consum.consum_state
      });
    });
    res.json({
      result: "ok",
      data: consum,
      message: "update consum successfully"
    });
  }else{
    res.json({
      result: "failed",
      data: {},
      message: "cannot find consum to update"
    });
  }
  }catch(err){
    res.json({
      result: "failed",
      data: {},
      message: `Update consum failed. Error ${err}` 
    });
  }
});

//Delete
/*router.delete('/:client_client', async (req, res) => {
  const {consum_consum} = req.params;
  try{
    let consum = await cl_tconsum.destroy({
      where: {
        consum_consum
      }
    });
    res.json({
      result: "ok",
      message: "Delete consum successfully"
    });
  }catch(err){
    res.json({
      result: "failed",
      message: `Delete consum failed. Error ${err}` 
    });
  }
});*/

//Query all data
router.get('/', async (req, res) => {
  const {consum_consum} = req.params;
  try{
    const consums = await cl_tconsum.findAll({
      attributes: ["consum_consum","consum_cant","consum_date","consum_state"],
    });
    res.json({
      result: "ok",
      data: consums,
      message: "Query list of consum successfully"
    });
  }catch(err){
    res.json({
      result: "failed",
      data: {},
      message: `Query list of consum failed. Error ${err}` 
    });
  }
});

//Get by Id
router.get('/:consum_consum', async (req, res) => {
  const {consum_consum} = req.params;
  try{
    let consum = await cl_tconsum.findAll({
      attributes: ["consum_consum","consum_cant","consum_date","consum_state"],
      where: {
        consum_consum
      }
    });

    if(consum.length > 0){
      res.json({
        result: "ok",
        data: consum,
        message: "Find consum successfully"
      });
    }else{
      res.json({
        result: "failed",
        data: {},
        message: "Cannot find consum"
      });
    }
  }catch(err){
    res.json({
      result: "failed",
      data: {},
      message: `Find consum failed. Error ${err}` 
    });
  }
});

module.exports = router;
