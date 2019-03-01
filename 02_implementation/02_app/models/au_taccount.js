const Sequelize = require('sequelize');
const sequelize = require('../databases/database').sequelize;
const Op = require('../databases/database').Op;

const au_taccount = sequelize.define('au_taccount',{
	account_account: {
        type: Sequelize.INTEGER,
        primaryKey: true
    }, 
	account_name: {
        type: Sequelize.STRING,
    },
	account_desc: {
        type: Sequelize.STRING,
    },

},{
    timestamps: false,
    freezeTableName: true,
});

module.exports = au_taccount;