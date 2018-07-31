var express = require("express"),
  producerRepo = require("../repos/producerRepo");

var router = express.Router();

router.get("/", (req, res) => {
  producerRepo.loadAll().then(rows => {
    var vm = {
      producers: rows
    };
    res.render("admin/producer/index", { layout: "admin", vm });
  });
});

router.get("/add", (req, res) => {
  var vm = {
    showResult: false
  };
  res.render("admin/producer/create", { layout: "admin", vm });
});

router.post("/add", (req, res) => {
  producerRepo.add(req.body).then(value => {
    var vm = {
      showResult: true
    };
    res.render("admin/producer/create", { layout: "admin", vm });
  });
});

router.get("/delete", (req, res) => {
  producerRepo.delete(req.query.id).then(value => {
    res.redirect("/admin/producer");
  });
});

router.get("/update", (req, res) => {
  producerRepo.single(req.query.id).then(rows => {
    var vm = {
      producer: rows[0]
    };
    res.render("admin/producer/update", { layout: "admin", vm });
  });
});

router.post("/update", (req, res) => {
  producerRepo.update(req.body).then(value => {
    res.redirect("/admin/producer");
  });
});

module.exports = router;
