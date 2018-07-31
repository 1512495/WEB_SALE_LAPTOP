var express = require("express"),
  MD5 = require("crypto-js/md5");
moment = require("moment");
var accountRepo = require("../repos/accountRepo");

// var restrict = require('../middle-wares/restrict');

var router = express.Router();

router.get("/register", (req, res) => {
  res.render("account/register");
});

router.post("/register", (req, res) => {
  // var dob = moment(req.body.dob, 'D/M/YYYY')
  //     .format('YYYY-MM-DDTHH:mm');
  if (req.body["g-recaptcha-response"]) {
    var user = {
      ten: req.body.ten,
      gioi_tinh: req.body.gioi_tinh,
      email: req.body.email,
      password: MD5(req.body.password).toString(),
      dia_chi: req.body.dia_chi,
      sdt: req.body.sdt
    };

    accountRepo.add(user).then(value => {
      var vm = {
        showResult: true
      };
      res.render("account/register", vm);
    });
  } else {
    var vm = { error: "Vui lòng nhập captcha", hasError: true };
    res.render("error/index", vm);
  }
});

router.get("/login", (req, res) => {
  res.render("account/login", { layout: false });
});

router.post("/login", (req, res) => {
  var user = {
    email: req.body.email,
    password: MD5(req.body.password).toString()
  };

  accountRepo.login(user).then(rows => {
    if (rows.length > 0) {
      req.session.isLogged = true;
      req.session.curUser = rows[0];
      res.redirect("/");
    } else {
      var vm = {
        showError: true,
        errorMsg: "Login failed"
      };
      res.render("account/login", {
        data: vm,
        layout: false
      });
    }
  });
});

router.get("/profile", (req, res) => {
  accountRepo.loadByID(req.session.curUser.id).then(rows => {
    var vm = {
      profile: rows[0]
    };
    res.render("account/profile", vm);
  });
});

router.post("/profile", (req, res) => {
  if (req.body.password != "") {
    var user = {
      id: req.session.curUser.id,
      email: req.body.email,
      password: MD5(req.body.password).toString(),
      dia_chi: req.body.dia_chi,
      sdt: req.body.sdt
    };
  } else {
    var user = {
      id: req.session.curUser.id,
      email: req.body.email,
      dia_chi: req.body.dia_chi,
      sdt: req.body.sdt
    };
  }
  accountRepo.updateProfile(user).then(rows => {
    var vm = {
      showResult: true,
    };
    res.render("account/profile", vm);
  });
});

router.get("/logout", (req, res) => {
  req.session.isLogged = false;
  res.redirect("/");
});

module.exports = router;
