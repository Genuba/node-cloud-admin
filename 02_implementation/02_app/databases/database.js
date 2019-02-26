const Sequelize = require('sequelize');
const sequelize = new Sequelize(
    'ab_core', //database name
    'ab_core_us', //username
    'ab_core_us', //password
    {
        dialect: 'postgres',
        host: 'localhost',
        operatorsAliases: false,
        pool: {
            max: 5,
            min: 0,
            require: 30000,
            idle: 10000
        }
    }
);

const Op = Sequelize.Op;
module.exports = {
    sequelize,
    Op
}