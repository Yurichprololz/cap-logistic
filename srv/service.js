const cds = require('@sap/cds');
const constansts = require('./constants')
const cpi = require('./cpi')
const { getAverageRating } = require('./helper')

module.exports = cds.service.impl(async function () {

    let { Cars, Drivers, Driver_Rating: Rating } = cds.entities('logistic');

    this.before('NEW', 'Driver', async (req) => {
        req.data.status_ID = '1';
        req.data.rating = '0.0'
    });

    this.before('NEW', 'Car', async (req) => {
        req.data.status_ID = '2';
    });

    this.before('CREATE', 'Car', async (req) => {
        const { driver_ID } = req.data;
        let driverInfo = await SELECT.from(Drivers).where({ ID: driver_ID })
        if (driverInfo[0].status_ID === '2') {
            throw new Error(constansts.errors.busyDriver)
        } else {
            await UPDATE(Drivers, { ID: driver_ID }).with({ status_ID: "2" })
        }
    });

    this.before('UPDATE', 'Driver', async (req) => {
        console.log('lala ' + req.data)
    })

    this.before('DELETE', 'Car', async (req) => {
        const { ID } = req.data
        const driverInfo = await SELECT.from(Cars).where({ ID: ID });
        const { driver_ID } = driverInfo[0]
        await UPDATE(Drivers, { ID: driver_ID }).with({ status_ID: "1" })
    });

    this.before('DELETE', 'Driver', async (req) => {
        const { ID } = req.data
        const carsInfo = await SELECT.from(Cars).where({ driver_ID: ID });
        await UPDATE(Cars, { ID: carsInfo[0].ID }).with({ status_ID: "1" })
    });

    this.before('DELETE', 'Driver', async (req) => {
        const { ID } = req.data
        const carsInfo = await SELECT.from(Cars).where({ driver_ID: ID });
        await UPDATE(Cars, { ID: carsInfo[0].ID }).with({ status_ID: "1" })
    });
    this.after('READ', 'Car', (each) => {
        if (each.status_ID === '2') {
            each.sendToStorehouseEnabled = true;
        }
    });

    this.on('sendToStorehouse', 'Car', cpi.sendToStorehouse)

    this.on('rateDriver', 'Driver', async (req) => {
        const { ID: driver_ID } = req.params[0]
        const { rate: rate_value, comment } = req.data
        await INSERT({ comment, driver_ID, rate_value }).into(Rating)
        const rating = await SELECT.from(Rating)
        const average = getAverageRating(rating)
        await UPDATE(Drivers, { ID: driver_ID }).with({ rating: average, })
    })
})