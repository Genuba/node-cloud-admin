const Sequelize = require('sequelize');
const sequelize = require('../databases/database').sequelize;
const Op = require('../databases/database').Op;

const au_tuser = require('./au_tuser');
const au_tcompany = require('./au_tcompany');
const au_trol = require('./au_trol');

const au_tmembership = sequelize.define('au_tmembership',{
	membership_membership: {
        type: Sequelize.INTEGER,
        primaryKey: true
    }, 
	membership_cdate: {
        type: Sequelize.DATE,
    },
    menbership_state: {
        type: Sequelize.STRING,
    },
	user_user: {
        type: Sequelize.INTEGER,
    },
    company_company: {
        type: Sequelize.INTEGER,
    },
    rol_rol: {
        type: Sequelize.INTEGER,
    },

},{
    timestamps: false,
    freezeTableName: true,
});

au_tuser.hasMany(au_tmembership,{foreignKey: 'user_user', sourceKey: 'user_user'});
au_tmembership.belongsTo(au_tuser,{foreignKey: 'user_user', targetKey: 'user_user'});

au_tcompany.hasMany(au_tmembership,{foreignKey: 'company_company', sourceKey: 'company_company'});
au_tmembership.belongsTo(au_tcompany,{foreignKey: 'company_company', targetKey: 'company_company'});

au_trol.hasMany(au_tmembership,{foreignKey: 'rol_rol', sourceKey: 'rol_rol'});
au_tmembership.belongsTo(au_trol,{foreignKey: 'rol_rol', targetKey: 'rol_rol'});

module.exports = au_tmembership;