var typeRepo = require('../repos/typeRepo'),
  producerRepo = require('../repos/producerRepo');
var type = typeRepo.loadAll('type');
var producer = producerRepo.loadAll('producer');

module.exports = (req, res, next) => {

  if (req.session.isLogged === undefined) {
    req.session.isLogged = false;
    req.session.username = "";
  }
  Promise.all([type, producer]).then(([types, producers]) => {
    if (req.session.cart === undefined) {
      req.session.cart = [];
    }

    var numberItems = 0;
    var cart = req.session.cart;
    if (cart.length === 0) {
      numberItems = 0;
    } else {
      for (i = cart.length - 1; i >= 0; i--) {
        numberItems += cart[i].Quantity;
      }
    }

    if (req.session.curUser) {
      if (req.session.curUser.ten === "admin") {
        res.locals.layoutVM = {
          type: types,
          producer: producers,
          isLogged: req.session.isLogged,
          username: req.session.curUser.ten,
          isAdmin: true,
          numberItems: numberItems
        };
      } else {
        res.locals.layoutVM = {
          type: types,
          producer: producers,
          isLogged: req.session.isLogged,
          username: req.session.curUser.ten,
          isAdmin: false,
          numberItems: numberItems
        };
      }
    } else {
      res.locals.layoutVM = {
        type: types,
        producer: producers,
        isLogged: req.session.isLogged,
        numberItems: numberItems
      };
    }
    console.log(res.locals.layoutVM.type);
    next();
  });
};
