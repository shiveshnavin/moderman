const cds = require('@sap/cds')

// https://cap.cloud.sap/docs/guides/providing-services#registering-event-handlers
module.exports = function () {
    this.on('CREATE', `ContentItem`, (req, next) => {
        req.data.createdBy = req.user.id;
        return next();
    });
}