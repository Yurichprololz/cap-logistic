const cds = require('@sap/cds');

const { Cars, Drivers } = cds.entities('logistic')

async function sendToStorehouse(req) {
    try {
        const { ID } = req.params[0];
        const carInfo = await SELECT.from(Cars).where({ ID: ID });
        const driverInfo = await SELECT.from(Drivers).where({ ID: carInfo[0].driver_ID });
        const payload = JSON.stringify({
            ID: carInfo[0].ID,
            driverSurname: driverInfo[0].surname,
            driverRating: driverInfo[0].rating,
            carName: carInfo[0].brand + ' ' + carInfo[0].number,
        });

        const cpi = await cds.connect.to('CPI_DESTINATION');
        await cpi.tx(req).post('/http/toStorehouse', payload);
        await UPDATE(Cars, { ID: ID }).with({ status_ID: "3" });
    }
    catch (error) {
        console.log("Dispatch to CPI was not successful. Rejected with error: ", error)
    }
}

module.exports = {
    sendToStorehouse
}