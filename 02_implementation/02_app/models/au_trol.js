const Sequelize = require('sequelize');
const sequelize = require('../databases/database').sequelize;
const Op = require('../databases/database').Op;

const au_trol = sequelize.define('au_trol',{
	rol_rol: {
        type: Sequelize.INTEGER,
        primaryKey: true
    }, 
	rol_name: {
        type: Sequelize.STRING,
    },
	rol_desc: {
        type: Sequelize.STRING,
    },

},{
    timestamps: false,
    freezeTableName: true,
});

module.exports = au_trol;