const Sequelize = require('sequelize');
const sequelize = new Sequelize(
    'ab_core',
    'ab_core_us',
    'ab_core_us',
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