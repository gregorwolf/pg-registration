const cds = require("@sap/cds");
const { retrieveJwt, verifyJwt } = require("@sap-cloud-sdk/core");

module.exports = async function (srv) {
  srv.on("READ", "UserScopes", async (req) => {
    let user = {
      username: req.user.id,
      is_admin: req.user.is("admin"),
    };
    let jwt = retrieveJwt(req);
    if (jwt) {
      let decodedJwt = await verifyJwt(jwt);
      user = {
        ...user,
        email: decodedJwt.email,
        firstname: decodedJwt.given_name,
        lastname: decodedJwt.family_name,
      };
    }
    const users = [user];
    users.$count = 1;
    return users;
  });
};
