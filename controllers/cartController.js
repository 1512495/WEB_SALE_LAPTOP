var express = require('express');
var moment = require('moment');
var cartRepo = require('../repos/cartRepo'),
    productRepo = require('../repos/productRepo'),
    orderRepo = require('../repos/orderRepo'),
    accountRepo = require('../repos/accountRepo');

var restrict = require('../middle-wares/restrict');

var yyyymmdd = require('yyyy-mm-dd');

var router = express.Router();


router.get('/', restrict, (req, res) => {

     
    var arr = [];
    var user = accountRepo.loadUser(req.session.curUser.ten)

    arr.push(user);
    for (var i = 0; i < req.session.cart.length; i++) {
        var cartItem = req.session.cart[i];
       
        var p = productRepo.single(cartItem.ProId);
        arr.push(p);
    }
    if (req.session.total === undefined) {
		req.session.total = 0;
    }
    var items = [];
    var moneyTotal = 0;
    req.session.total = 0;

    Promise.all(arr).then(result => {

        for (var i = result.length - 1; i >= 1; i--) {
            var pro = result[i][0];

            var item = {
                Product: pro,
                Quantity: req.session.cart[i-1].Quantity,
                Amount: pro.gia * req.session.cart[i-1].Quantity
            };

            req.session.total += item.Amount;
            items.push(item);
        }

        var vm = {
            items: items,
            moneyTotal: req.session.total, 
            user: result[0][0]
        };
        res.render('cart/index', {
            data: vm,
            layout: 'main.handlebars'
        });
    });
});



router.post('/add', (req, res) => {
    var item = {
        ProId: req.body.proId,
        Quantity: +req.body.quantity,
    };
    cartRepo.add(req.session.cart, item);
    res.redirect(req.headers.referer);
});


router.post('/remove', (req,res) => {
	cartRepo.remove(req.session.cart, +req.body.proId);
	res.redirect(req.headers.referer);
});


router.post('/payment', (req, res) => {
    var time = new Date();
    var ngay_dat = moment(time, 'D/M/YYYY').format('YYYY-MM-DDTHH:mm');

    //lấy id user
    accountRepo.loadUser(req.session.curUser.ten).then(rows => {
        
        hoadon = {
            id_user: rows[0].id,
            tong_tien: req.session.total,
            ngay_dat: ngay_dat,
            trang_thai: "Chưa giao hàng",
            thanh_toan: 'Chưa thanh toán'
        }

        // add du lieu vo bang hoa_don => lay id truyen cho viec tiep theo
        var cart = req.session.cart;
        cartRepo.addHoaDon(hoadon).then(value => {
            var arr = [];
            for (var i = 0; i < cart.length; i++) {
                var cartItem = cart[i];
                var p = productRepo.single(cartItem.ProId);
                arr.push(p);
            }
            //chuẩn bị dữ liệu add vo chi_tiet_hoa_don
            var items = [];
            Promise.all(arr).then(result => {
                for (var i = result.length - 1; i >= 0; i--) {
                    var item = {
                        id_hoa_don: value.insertId,
                        id_san_pham: cart[i].ProId,
                        so_luong: cart[i].Quantity,
                        gia: result[i][0].gia,
                        
                    };
                    //cap nhat so luong ton, so luong ban
                    // newSLT = result[i][0].so_luong_ton - item.so_luong;
                    // newSLB = result[i][0].sl_ban + item.so_luong;

                    // updateSL = productRepo.updateSL(item.id_sach, newSLT, newSLB)
                    // items.push(updateSL);
                    
                    orderDetail = cartRepo.addChiTietHoaDon(item);
                    items.push(orderDetail);
                }

                //add du lieu vo order_detail
                Promise.all(items).then(result_order_detail => {
                    //delete toan bo cart sau khi hoan thanh
                    req.session.cart = undefined;
                    res.redirect('/cart/history');
                });
            });
        });
    })
});


router.get('/history', (req, res) => {
    accountRepo.loadUser(req.session.curUser.ten).then(rows => {
        $id_user = rows[0].id;
        cartRepo.loadHoaDon($id_user).then(hoadons => {
            hoadon = [];
            //load all order cua nguoi dung
            for (var i = hoadons.length - 1; i >= 0; i--) {
                id_hoa_don = hoadons[i].id;
                proInOrder = cartRepo.loadChiTietHoaDon(id_hoa_don);
                hoadon.push(proInOrder);
            }
            //cau hinh data gui cho client
            data = [];
            // var sanpham = productRepo.showNameAndImage()
            Promise.all(hoadon).then(result => {
                for (var j = result.length - 1, i = 0; j >= 0, i < result.length - 1; j--, i++) {
                    // debugger
                    var order = {
                        
                        items: result[i],

                        time: yyyymmdd(hoadons[j].ngay_dat),
                        total: hoadons[j].tong_tien,
                        trang_thai: hoadons[j].trang_thai,
                    }
                    data.push(order);
                }
                var vm = {
                    orders: data
                }
                
                res.render('cart/history', {
                    data: vm,
                    layout: 'main.handlebars',
                });
            });
        });
    });
})

// router.get("/history", (req,res) => {
// 	orderRepo.queryByUserID(req.session.curUser.id).then(rows =>{
// 	  var vm = {
// 		ten_user: req.session.curUser.ten,
// 		history: rows[0]
// 	  };
// 	  res.render("cart/history", vm);
// 	});
//   });


module.exports = router;