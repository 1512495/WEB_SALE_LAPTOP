var db = require('../fn/db');

exports.loadAll = ()=>{
	var sql = 'select * from slide';
	return db.load(sql);
}

exports.single = id => {
	var sql = `select * from slide where id = ${id}`;
	return db.load(sql);
}

exports.add = slide => {
	var sql = `insert into slide(hinh_anh) values('${slide.hinh_anh}')`;
	return db.save(sql);
}

exports.delete = id => {
	var sql = `delete from slide where id = ${id}`;
	return db.save(sql);
}

exports.update = category => {
	var sql = `update slide set hinh_anh = '${slide.hinh_anh}' where id = ${slide.id}`;
	return db.save(sql);
}