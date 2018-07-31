var db = require('../fn/db');

exports.loadAll = ()=>{
	var sql = 'select * from nha_san_xuat';
	return db.load(sql);
}

exports.single = id => {
	var sql = `select * from nha_san_xuat where id = ${id}`;
	return db.load(sql);
}

exports.add = producer =>{
	var sql = `insert into nha_san_xuat(ten) values('${producer.ten}')`;
	return db.save(sql);
}

exports.delete = id => {
	var sql = `delete from nha_san_xuat where id = ${id}`;
	return db.save(sql);
}

exports.update = producer => {
	var sql = `update nha_san_xuat set ten='${producer.ten}' where id=${producer.id}`;
	return db.save(sql);
}


