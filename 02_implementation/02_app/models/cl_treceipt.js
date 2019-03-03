const Sequelize = require('sequelize');
const sequelize = require('../databases/database').sequelize;
const Op = require('../databases/database').Op;

const cl_treceipt = sequelize.define('cl_treceipt',{
	receipt_receipt: {
        type: Sequelize.INTEGER,
        primaryKey: true
    }, 
	receipt_value: {
        type: Sequelize.DECIMAL,
    },
	receipt_date: {
        type: Sequelize.DATE,
    },
	receipt_lastc: {
        type: Sequelize.INTEGER,
    },
    receipt_pasc: {
        type: Sequelize.INTEGER,
    },
    receipt_state: {
        type: Sequelize.STRING,
    },
    client_client: {
        type: Sequelize.INTEGER,
    },

},{
    timestamps: false,
    freezeTableName: true,
});

module.exports = cl_treceipt;