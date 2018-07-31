var db = require("../fn/db");

exports.loadAll = () => {
  var sql = "select * from hoa_don";
  return db.load(sql);
};

exports.single = id => {
  var sql = `select * from hoa_don where id = ${id}`;
  return db.save(sql);
};

exports.add = order => {
  var sql = `insert into hoa_don(id_user,ngay_dat,tong_tien,trang_thai,thanh_toan) values('${ order.id_user }','${order.ngay_dat}',${order.tong_tien},'${order.trang_thai}','${order.thanh_toan}')`;
  return db.save(sql);
};

exports.delete = id => {
  var sql = `delete from hoa_don where id = ${id}`;
  return db.save(sql);
};

exports.update = order => {
	var sql = `update san_pham set id_user='${order.id_user}',ngay_dat=${order.ngay_dat},tong_tien=${tong_tien},trang_thai='${order.trang_thai}',thanh_toan='${thanh_toan}'`;
	return db.save(sql);
}

exports.queryID_User = () => {
  var sql = "select id, ten from user";
  return db.save(sql);
};

exports.queryByUserID = (id) => {
  var sql = `select * from hoa_don where id_user=${id}`;
  return db.load(sql);
}