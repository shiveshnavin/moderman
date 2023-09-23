const cds = require('@sap/cds');
const express = require('express')
const path = require('path')
require('dotenv').config()

cds.on('bootstrap', (app) => {
    app.use('/sql', async (req, res) => {
        let query = req.query.query || req.body.query
        try {
            let books = await cds.db.run(query)
            res.send({
                message: 'ok',
                result: books
            })
        } catch (e) {
            res.status(500).send({
                message: e.message
            })
        }
    })
    app.use(express.static(path.join(__dirname, './app/ui-admin/dist')))
    // app.post("/odata/v4/event-registration/logout", (req, res) => {
    //     // Send 401 Unauthorized to tell the browser to forget the credentials.
    //     // NOTE: while this works for the sample app, it is not double-checked for 100% security! 
    //     res.status(401);
    //     res.send();
    // });
});

// Delegate bootstrapping to built-in server.js of CDS
module.exports = cds.server