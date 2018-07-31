var express = require("express"),
  orderRepo = require("../repos/orderRepo");

var yyyymmdd = require("yyyy-mm-dd");
var router = express.Router();

router.get("/", (req, res) => {
  orderRepo.loadAll().then(rows => {
    for (var i = 0; i < rows.length; i++) {
      if (rows[i].ngay_dat) rows[i].ngay_dat = yyyymmdd(rows[i].ngay_dat);
    }
    var vm = {
      orders: rows
    };
    res.render("admin/order/index", { layout: "admin", vm });
  });
});

router.get("/create", (req, res) => {
  orderRepo.queryID_User().then(rows => {
    var vm = {
      showResult: false,
      users: rows
    };
    res.render("admin/order/create", { layout: "admin", vm });
  });
});

router.get("/create", (req, res) => {
  var vm = {
    showResult: false
  };
  res.render("admin/order/create", { layout: "admin", vm });
});

router.post("/create", (req, res, next) => {
  orderRepo.add(req.body).then(value => {
    var vm = {
      showResult: true
    };
    res.render("admin/order/create", { layout: "admin", vm });
  });
});

router.get("/delete", (req, res) => {
  orderRepo.delete(req.query.id).then(value => {
    res.redirect("/admin/order");
  });
});

router.get("/update", (req, res) => {
  orderRepo.single(req.query.id).then(rows => {
    orderRepo.queryID_User().then(rows_user => {
      var vm = {
        order: rows[0],
        users: rows_user
      };
      res.render("admin/order/update", { layout: "admin", vm });
    });
  });
});

module.exports = router;
