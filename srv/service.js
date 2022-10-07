const cds = require('@sap/cds');
const constansts = require('./constants')
const cpi = require('./cpi')

module.exports = cds.service.impl(async function () {

    let { Cars, Drivers } = cds.entities('logistic');

    this.before('NEW', 'Driver', async (req) => {
        req.data.status_ID = '1';
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
    this.after('READ', 'Driver', (each) => {
        if (each.status_ID === '2') {
            each.sendToStorehouseEnabled = true;
        }
    });

    this.on('sendToStorehouse', 'Car', cpi.sendToStorehouse)


})