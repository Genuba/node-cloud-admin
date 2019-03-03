const express = require('express');
const jwt = require('jsonwebtoken');
const router = express.Router();

//Models
const cl_treceipt      = require('../models/cl_treceipt');

/* GET receipt listing. */

//Insert
router.post('/', async (req, res) => {
  let{receipt_value,receipt_date,receipt_lastc,receipt_pasc,receipt_state,client_client} = req.body;
  try{

    let receipt = await cl_treceipt.create({
      receipt_value,
      receipt_date,
      receipt_lastc,
      receipt_pasc,
      receipt_state,
      client_client

    },{
      fields: ["receipt_value","receipt_date","receipt_lastc","receipt_pasc","receipt_state","client_client"]
    })

    if(receipt){
      res.json({
        result: "ok",
        data: receipt,
        message: "insert receipt successfully"
      });
    }else{
      res.json({
        result: "failed",
        data: {},
        message: 'Insert a receipt failed'
      });
    }
  }catch(error){
    res.json({
      result: "failed",
      data: {},
      message: `Insert receipt failed. Error ${error}`
    });
  }
});

//Update
router.put('/:receipt_receipt', async (req, res) => {
  const {receipt_receipt} = req.params;
  let{receipt_value,receipt_date,receipt_lastc,receipt_pasc,receipt_state} = req.body;
  try{
    let receipt = await cl_treceipt.findAll({
      attributes: ["receipt_receipt","receipt_value","receipt_date","receipt_lastc","receipt_state","receipt_lastc"],
      where: {
        receipt_receipt
      }
    });

  if(receipt.length){
    receipt.forEach(async (receipt) => {
      await receipt.update({
        receipt_value: receipt_value ? receipt_value : receipt.receipt_value,
        receipt_date : receipt_date  ? receipt_date  : receipt.receipt_date,
        receipt_lastc: receipt_lastc ? receipt_lastc : receipt.receipt_lastc,
        receipt_pasc : receipt_pasc  ? receipt_pasc  : receipt.receipt_pasc,
        receipt_state: receipt_state ? receipt_state : receipt.receipt_state
      });
    });
    res.json({
      result: "ok",
      data: receipt,
      message: "update receipt successfully"
    });
  }else{
    res.json({
      result: "failed",
      data: {},
      message: "cannot find receipt to update"
    });
  }
  }catch(err){
    res.json({
      result: "failed",
      data: {},
      message: `Update receipt failed. Error ${err}` 
    });
  }
});

//Delete
/*router.delete('/:receipt_receipt', async (req, res) => {
  const {receipt_receipt} = req.params;
  try{
    let receipt = await cl_treceipt.destroy({
      where: {
        receipt_receipt
      }
    });
    res.json({
      result: "ok",
      message: "Delete receipt successfully"
    });
  }catch(err){
    res.json({
      result: "failed",
      message: `Delete receipt failed. Error ${err}` 
    });
  }
});*/

//Query all data
router.get('/', async (req, res) => {
  const {receipt_receipt} = req.params;
  try{
    const receipts = await cl_treceipt.findAll({
      attributes: ["receipt_receipt","receipt_value","receipt_date","receipt_lastc","receipt_pasc","receipt_state"],
    });
    res.json({
      result: "ok",
      data: receipts,
      message: "Query list of receipt successfully"
    });
  }catch(err){
    res.json({
      result: "failed",
      data: {},
      message: `Query list of receipt failed. Error ${err}` 
    });
  }
});

//Get by Id
router.get('/:receipt_receipt', async (req, res) => {
  const {receipt_receipt} = req.params;
  try{
    let receipt = await cl_treceipt.findAll({
      attributes: ["receipt_receipt","receipt_value","receipt_date","receipt_lastc","receipt_mora","receipt_state"],
      where: {
        receipt_receipt
      }
    });

    if(receipt.length > 0){
      res.json({
        result: "ok",
        data: receipt,
        message: "Find receipt successfully"
      });
    }else{
      res.json({
        result: "failed",
        data: {},
        message: "Cannot find receipt"
      });
    }
  }catch(err){
    res.json({
      result: "failed",
      data: {},
      message: `Find receipt failed. Error ${err}` 
    });
  }
});

module.exports = router;
