var db = require('../fn/db');

exports.add = user => {
	var sql = `insert into user(ten, gioi_tinh, email, password, dia_chi, sdt) values('${user.ten}', '${user.gioi_tinh}', '${user.email}', '${user.password}', '${user.dia_chi}', '${user.sdt}')`;
	return db.save(sql);
}

exports.login = user => {
	var sql = `select * from user where email = '${user.email}' and password = '${user.password}'`;
	return db.load(sql);
}

exports.loadByID = id => {
	var sql = `select * from user where id=${id}`;
	return db.load(sql);
}

exports.updateProfile = user =>{
	if(user.password !== undefined){
	var sql = `update user set email='${user.email}', dia_chi='${user.dia_chi}', sdt='${user.sdt}', password='${user.password}' where id=${user.id}`;
	}	
	else{
		var sql = `update user set email='${user.email}', dia_chi='${user.dia_chi}', sdt='${user.sdt}' where id=${user.id}`;
	}
	return db.save(sql);
}

var db = require('../fn/db');



exports.loadUser = ten => {
    var sql = `select * from user where ten = '${ten}'`;
    return db.load(sql);
}

exports.updateUser = user => {
    var sql = `UPDATE user SET ten='${user.ten}',gioi_tinh='${user.gioi_tinh}', email='${user.email}', password='${user.password}', dia_chi='${user.dia_chi}', sdt='${user.sdt}' WHERE ten = '${user.ten}'`;
    return db.save(sql);
}