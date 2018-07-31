var db = require('../fn/db');

//xu ly khong dung toi database

exports.getNumberOfItems = cart => {
    if (!cart) {
        return -1;
    }

    var n = 0;
    for (var i = cart.length - 1; i >= 0; i--) {
        n += cart[i].quantity;
    }

    return n;
}

exports.add = (cart, item) => {
    if(cart.length === 0){
        cart.push(item);
    }else{
        for (i = cart.length - 1; i >= 0; i--) {
            if (cart[i].ProId === item.ProId) {
                cart[i].Quantity += item.Quantity;
                return;
            }
        }
        cart.push(item);
    }
}

exports.remove = (cart, proId) => {
    for (var i = cart.length - 1; i >= 0; i--) {
        if (proId === cart[i].ProId) {
            cart.splice(i, 1);
            return;
        }
    }
}

exports.addHoaDon = hoadon => {
    var sql = `insert into hoa_don(id_user,ngay_dat,tong_tien,trang_thai,thanh_toan) values(${hoadon.id_user},'${hoadon.ngay_dat}',${hoadon.tong_tien},'${hoadon.trang_thai}','${hoadon.thanh_toan}')`;
    return db.save(sql);
}

exports.addChiTietHoaDon = cthd => {
    var sql = `insert into chi_tiet_hoa_don(id_hoa_don,id_san_pham,so_luong,gia) values(${cthd.id_hoa_don},${cthd.id_san_pham},${cthd.so_luong},${cthd.gia})`;
    return db.save(sql);
}

exports.loadHoaDon = id_user => {
    var sql = `select * from hoa_don where id_user=${id_user}`;
    return db.load(sql);
}

exports.loadChiTietHoaDon = id_hoa_don => {
    var sql = `select * from chi_tiet_hoa_don where id_hoa_don=${id_hoa_don}`;
    return db.load(sql);
}