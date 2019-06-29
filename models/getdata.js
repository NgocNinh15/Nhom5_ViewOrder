var conn = require("./configdata");
var q = require('q');
conn.connect();
//lấy ra tất cả hóa đơn theo idUser
function getHD_idUser(idUser) {
    var defer = q.defer();
    sql = "SELECT * FROM `hoadon` WHERE `idUser`=" + idUser+ " ORDER BY NgayDat";
    conn.query(sql, function (err, results) {
        if (err) defer.reject(err);
        else defer.resolve(results);
    });
    return defer.promise;
}

//lấy ra tất cả hóa đơn theo idHD
function getHD_idHD(idHD) {
    var defer = q.defer();
    sql = "SELECT * FROM `hoadon` WHERE `idHD`=" + idHD;
    conn.query(sql, function (err, results) {
        if (err) defer.reject(err);
        else defer.resolve(results);
    });
    return defer.promise;
}

//lấy toàn bộ thông tin của đơn hàng
function getAllInfo(idHD) {
    var defer = q.defer();
    sql = "SELECT * FROM `cthd`,`hoadon` WHERE `hoadon`.`idHD`=`cthd`.`idHD` and `hoadon`.`idHD`=" +idHD;
    conn.query(sql, function (err, results) {
        if (err) defer.reject(err);
        else defer.resolve(results);
    });
    return defer.promise;
}
// var a=getAllInfo(1);
// a.then(aa=>{
//     console.log(aa)
// })

//lấy ctht theo idhd
function getCTHD(idHD) {
    var defer = q.defer();
    sql = "SELECT * FROM `cthd` WHERE `idHD`=" +idHD;
    conn.query(sql, function (err, results) {
        if (err) defer.reject(err);
        else defer.resolve(results);
    });
    return defer.promise;
}

// var a= getCTHD(1);
// a.then(a=>{
//     console.log(a);
// })
//lấy sp theo idSP

//lấy tên sp theo idHD
function TenSP(idHD) {
    var defer = q.defer();
    sql = "SELECT * FROM `cthd`, `sanpham` WHERE `cthd`.`idSP`=`sanpham`.`idSP` AND `cthd`.`idHD` =" +idHD;
    conn.query(sql, function (err, results) {
        if (err) defer.reject(err);
        else defer.resolve(results);
    });
    return defer.promise;
}
// var a= TenSP(1);
// a.then(a=>{
//     console.log(a);
// })
function getSP_IdSP(idSP) {
    var defer = q.defer();
    sql = "SELECT * FROM `sanpham` where IdSP=" + idSP;
    conn.query(sql, function (err, results) {
        if (err) defer.reject(err);
        else defer.resolve(results);
    });

    return defer.promise;
}
// var a= getSP_IdSP(1);
// a.then(a=>{
//     console.log(a);
// })
function login(Email, Password) {
    var defer = q.defer();
    var sql = "SELECT * FROM `user` WHERE `Email`= '" + Email + "' AND `Password`='" + Password + "'";
    conn.query(sql, function (err, results) {
        if (err) defer.reject(err);
        else defer.resolve(results);
    })
    return defer.promise;
}







module.exports = {
    getAllInfo:getAllInfo,
    TenSP:TenSP,
    getHD_idUser: getHD_idUser,
    getHD_idHD: getHD_idHD,
    getCTHD: getCTHD,
    getSP_IdSP: getSP_IdSP,
    login: login,
}