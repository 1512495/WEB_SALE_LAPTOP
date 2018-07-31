var express = require("express"),
  productRepo = require("../repos/productRepo");
var formidable = require("formidable");
var fs = require("fs");
var multer = require("multer");
var upload = multer();
var yyyymmdd = require("yyyy-mm-dd");
var router = express.Router();

router.get("/", (req, res) => {
  productRepo.loadAll().then(rows => {
    for (var i = 0; i < rows.length; i++) {
      rows[i].ngay_nhap = yyyymmdd(rows[i].ngay_nhap);
    }
    var vm = {
      products: rows
    };
    res.render("admin/product/index", { layout: "admin", vm });
  });
});

router.get("/add", (req, res) => {
  productRepo.queryID_NSX().then(row1s => {
    productRepo.queryID_Loai().then(row2s => {
      var vm = {
        showResult: false,
        id_nsxs: row1s,
        id_loais: row2s
      };
      res.render("admin/product/create", { layout: "admin", vm });
    });
  });
});

//Phải dùng middleware multer để parsing multipart/form-data
router.post("/add", upload.array(), (req, res, next) => {
  // if(req.url == '/add' && req.method == 'POST') {
  // 	var form = new formidable.IncomingForm();
  // 	form.parse(req, (err,fields,files)=> {
  // 		var path = __dirname + files.hinh_anh.name;
  // 		console.log(path);
  // 	});
  // 	res.render('admin/product/create',vm);
  // }

  productRepo.add(req.body).then(value => {
    var vm = {
      showResult: true
    };
    res.render("admin/product/create", { layout: "admin", vm });
  });
});

router.get("/delete", (req, res) => {
  productRepo.delete(req.query.id).then(value => {
    res.redirect("/admin/product");
  });
});

router.get("/update", (req, res) => {
  productRepo.queryID_NSX().then(row1s => {
    productRepo.queryID_Loai().then(row2s => {
      productRepo.single(req.query.id).then(rows => {
        var vm = {
          id_nsxs: row1s,
          id_loais: row2s,
          product: rows[0]
        };
        res.render("admin/product/update", { layout: "admin", vm });
      });
    });
  });
});

router.post("/update", (req, res) => {
  productRepo.update(req.body).then(value => {
    res.redirect("/admin/product");
  });
});

router.get('/byType/:catId', (req, res) => {
  var catId = req.params.catId;

  var p1 = productRepo.loadAllByType(catId);
  var p2 = productRepo.countByType(catId);
  Promise.all([p1, p2]).then(([pRows, countRows]) => {
    // console.log(pRows);
    // console.log(countRows);

    //var total = countRows[0].total;

    var vm = {
      products: pRows,
      noProducts: pRows.length === 0,
    };
    res.render('product/byType', vm);
  });
});

router.get('/byProducer/:catId', (req, res) => {
  var catId = req.params.catId;

  var p1 = productRepo.loadAllByProducer(catId);
  var p2 = productRepo.countByType(catId);
  Promise.all([p1, p2]).then(([pRows, countRows]) => {

    //var total = countRows[0].total;

    var vm = {
      products: pRows,
      noProducts: pRows.length === 0,
    };
    res.render('product/byProducer', vm);
  });
});
module.exports = router;
