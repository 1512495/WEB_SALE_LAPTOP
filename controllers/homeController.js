var express = require("express"),
  slideRepo = require("../repos/sliderRepo"),
  productRepo = require("../repos/productRepo");
var router = express.Router();

router.get("/", (req, res) => {
  var slides = slideRepo.loadAll("slides");
  var productNew = productRepo.loadNew("productNew");
  var productView = productRepo.loadView("productView");
  var productSell = productRepo.loadSell("productSell");

  Promise.all([slides, productNew, productView, productSell]).then(
    ([slidesRow, productNewRow, productViewRow, productSellRow]) => {
      var vm = {
        slides: slidesRow,
        productNew: productNewRow,
        productView: productViewRow,
        productSell: productSellRow
      };
      res.render("home/index", vm);
    }
  );
});

router.get("/about", (req, res) => {
  res.render("home/about");
});

router.get("/detail", (req, res) => {
  productRepo.single(req.query.id).then(rows => {
    productRepo.cung_loai(req.query.id_loai).then(rows1 => {
      productRepo.cung_nsx(req.query.id_nsx).then(rows2 => {
        var vm = {
          product: rows[0],
          cung_loais: rows1,
          cung_nsxs: rows2
        };
        res.render("home/detail", vm);
      });
    });
  });
});

router.get("/view", (req, res) => {
    productRepo.loadAll().then(rows => {
      var vm = {
        products: rows
      };
      res.render("home/view",vm);
    });
  });

module.exports = router;
