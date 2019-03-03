const Sequelize = require('sequelize');
const sequelize = require('../databases/database').sequelize;
const Op = require('../databases/database').Op;

const cl_tclient = sequelize.define('cl_tclient',{
	client_client: {
        type: Sequelize.INTEGER,
        primaryKey: true
    }, 
	client_ident: {
        type: Sequelize.STRING,
    },
	client_fname: {
        type: Sequelize.STRING,
    },
	client_lname: {
        type: Sequelize.STRING,
    },
    client_mora: {
        type: Sequelize.DECIMAL,
    },
    client_state: {
        type: Sequelize.STRING,
    },
    company_company: {
        type: Sequelize.INTEGER,
    },
},{
    timestamps: false,
    freezeTableName: true,
});

module.exports = cl_tclient;