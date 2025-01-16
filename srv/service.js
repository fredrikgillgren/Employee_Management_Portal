const cds = require('@sap/cds/lib')

module.exports = class AdminService extends cds.ApplicationService { init() {
    this.before ('NEW', 'Employees', genid)
    return super.init()
}}

async function genid (req) {
    const {ID} = await cds.tx(req).run (SELECT.one.from(req.target).columns('max(ID) as ID'))
    req.data.ID = ID - ID % 100 + 100 + 1
  }