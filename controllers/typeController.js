var express = require("express"),
  typeRepo = require("../repos/typeRepo");

var router = express.Router();

router.get("/", (req, res) => {
  typeRepo.loadAll().then(rows => {
    var vm = {
      types: rows
    };
    res.render("admin/type/index", { layout: "admin", vm });
  });
});

router.get("/create", (req, res) => {
  var vm = {
    showResult: false
  };
  res.render("admin/type/create", { layout: "admin", vm });
});

router.post("/create", (req, res, next) => {
  typeRepo.add(req.body).then(value => {
    var vm = {
      showResult: true
    };
    res.render("admin/type/create", { layout: "admin", vm });
  });
});

router.get("/delete", (req, res) => {
  typeRepo.delete(req.query.id).then(value => {
    res.redirect("/admin/type");
  });
});

router.get("/update", (req, res) => {
  typeRepo.single(req.query.id).then(rows => {
    var vm = {
      type: rows[0]
    };
    res.render("admin/type/update", { layout: "admin", vm });
  });
});

router.post("/update", (req, res) => {
  typeRepo.update(req.body).then(value => {
    res.redirect("/admin/type");
  });
});

module.exports = router;
