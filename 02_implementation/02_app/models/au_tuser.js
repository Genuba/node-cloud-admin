const Sequelize = require('sequelize');
const sequelize = require('../databases/database').sequelize;
const Op = require('../databases/database').Op;

const au_tuser = sequelize.define('au_tuser',{
	user_user: {
        type: Sequelize.INTEGER,
        primaryKey: true
    }, 
	user_ident: {
        type: Sequelize.STRING,
    },
	user_fname: {
        type: Sequelize.STRING,
    },
	user_lname: {
        type: Sequelize.STRING,
    },

},{
    timestamps: false,
    freezeTableName: true,
});

module.exports = au_tuser;