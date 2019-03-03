const Sequelize = require('sequelize');
const sequelize = require('../databases/database').sequelize;
const Op = require('../databases/database').Op;

const cl_tconsum = sequelize.define('cl_tconsum',{
	consum_consum: {
        type: Sequelize.INTEGER,
        primaryKey: true
    }, 
	consum_cant: {
        type: Sequelize.INTEGER,
    },
	consum_date: {
        type: Sequelize.DATE,
    },
	consum_state: {
        type: Sequelize.STRING,
    },
    client_client: {
        type: Sequelize.INTEGER,
    },

},{
    timestamps: false,
    freezeTableName: true,
});

module.exports = cl_tconsum;