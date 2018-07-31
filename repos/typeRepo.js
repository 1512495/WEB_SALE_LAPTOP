var db = require("../fn/db");

exports.loadAll = () => {
  var sql = "select * from loai_san_pham";
  return db.load(sql);
};

exports.single = id => {
  var sql = `select * from loai_san_pham where id = ${id}`;
  return db.save(sql);
};

exports.add = type => {
  var sql = `insert into loai_san_pham(ten) values('${type.ten}')`;
  return db.save(sql);
};

exports.delete = id => {
  var sql = `delete from loai_san_pham where id = ${id}`;
  return db.save(sql);
};

exports.update = type => {
  var sql = `update loai_san_pham set ten='${type.ten}' where id=${type.id}`;
  return db.save(sql);
};
