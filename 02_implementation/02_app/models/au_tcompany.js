const Sequelize = require('sequelize');
const sequelize = require('../databases/database').sequelize;
const Op = require('../databases/database').Op;

const au_taccount = require('./au_taccount');

const au_tcompany = sequelize.define('au_tcompany',{
	company_company: {
        type: Sequelize.INTEGER,
        primaryKey: true
    }, 
	company_ident: {
        type: Sequelize.STRING,
    },
	company_name: {
        type: Sequelize.STRING,
    },
	account_account: {
        type: Sequelize.INTEGER,
    },

},{
    timestamps: false,
    freezeTableName: true,
});

au_taccount.hasMany(au_tcompany,{foreignKey: 'account_account', sourceKey: 'account_account'});
au_tcompany.belongsTo(au_taccount,{foreignKey: 'account_account', targetKey: 'account_account'});

module.exports = au_tcompany;