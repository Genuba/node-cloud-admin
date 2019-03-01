const Sequelize = require('sequelize');
const sequelize = require('../databases/database').sequelize;
const Op = require('../databases/database').Op;
const au_tuser = require('./au_tuser');

const au_tlogin = sequelize.define('au_tlogin',{
	login_login: {
        type: Sequelize.INTEGER,
        primaryKey: true
    }, 
	login_username: {
        type: Sequelize.STRING,
    },
	login_password: {
        type: Sequelize.STRING,
    },
	user_user: {
        type: Sequelize.INTEGER,
    },

},{
    timestamps: false,
    freezeTableName: true,
});

au_tuser.hasMany(au_tlogin,{foreignKey: 'user_user', sourceKey: 'user_user'});
au_tlogin.belongsTo(au_tuser,{foreignKey: 'user_user', targetKey: 'user_user'});

module.exports = au_tlogin;