var db = require("../fn/db");

exports.loadAll = () => {
  var sql = "select * from san_pham";
  return db.load(sql);
};

exports.single = id => {
  var sql = `select * from san_pham where id=${id}`;
  return db.load(sql);
};

exports.add = product => {
  var sql = `insert into san_pham(ten,id_loai,id_nsx,mo_ta,gia,gia_km,hinh_anh,ngay_nhap) values('${
    product.ten}',${product.id_loai},${product.id_nsx},'${product.mo_ta}',${product.gia},${product.gia_km
  },'${product.hinh_anh}','${product.ngay_nhap}')`;
  return db.save(sql);
};

exports.queryID_NSX = () => {
  var sql = "select id, ten from nha_san_xuat";
  return db.save(sql);
};

exports.queryID_Loai = () => {
  var sql = "select id, ten from loai_san_pham";
  return db.save(sql);
};

exports.delete = id => {
  var sql = `delete from san_pham where id=${id}`;
  return db.save(sql);
};

exports.update = product => {
  var sql = `update san_pham set ten='${product.ten}',id_loai=${
    product.id_loai
  },id_nsx=${id_nsx},mo_ta='${
    product.mo_ta
  }',gia=${gia},gia_km=${gia_km},hinh_anh='${hinh_anh}'`;
  return db.save(sql);
};

exports.cung_loai = id_loai => {
  var sql = `select * from san_pham where id_loai=${id_loai} limit 0,5`;
  return db.load(sql);
};

exports.cung_nsx = id_nsx => {
  var sql = `select * from san_pham where id_nsx=${id_nsx} limit 0,5`;
  return db.load(sql);
};
exports.updateView = id => {
  var sql = `update san_pham set so_luot_xem=so_luot_xem+1 where id=${id}`;
  return db.save(sql);
};
//----------------------------------
exports.loadNew = () => {
  var sql = "select * from san_pham order by ngay_nhap desc limit 10";
  return db.load(sql);
};

exports.loadView = () => {
  var sql = "select * from san_pham order by so_luot_xem desc limit 10";
  return db.load(sql);
};

exports.loadSell = () => {
  var sql = "select * from san_pham order by so_luot_ban desc limit 10";
  return db.load(sql);
};

exports.loadAllByType = (catId) => {
	var sql = `select * from san_pham where id_loai = ${catId}`;
	return db.load(sql);
}

exports.loadAllByProducer = (catId) => {
	var sql = `select * from san_pham where id_nsx = ${catId}`;
	return db.load(sql);
}

exports.countByType = catId => {
	var sql = `select count(*) as total from san_pham where id_loai = ${catId}`;
    return db.load(sql);
}

exports.showNameAndImage = id_san_pham => {
  var sql = `select ten, hinh_anh from san_pham where id=${id_san_pham}`;
  return db.load(sql);
}