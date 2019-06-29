var express = require('express');
var router = express.Router();
// var session = require('express-session');
var data = require("../models/getdata");
// router.use(session());




//hình thức thanh toán
function httt(HTThanhToan) {
  var httt = parseInt(HTThanhToan);
  var kq = "";
  if (httt == 1)
    kq = "Thanh toán khi nhận hàng.";
  else kq = "Thanh toán trực tuyến.";
  return kq;
}

// trạng thái hóa đơn
function tthd(TrangThaiHD) {
  var tthd = parseInt(TrangThaiHD);
  var kq = "";
  switch (tthd) {
    case 1: kq = "Đã xác nhận."; break;
    case 2: kq = "Đặt hàng thành công."; break;
    case 3: kq = "Đang giao."; break;
    case 4: kq = "Đã giao."; break;
    case 5: kq = "Đã hủy."; break;
  }
  return kq;
}
//ngày đặt
function ngaydat(NgayDat) {
  var kq = NgayDat.getDate() + '/' + NgayDat.getMonth() + '/' + NgayDat.getFullYear() +
    ' ' + NgayDat.getHours() + ':' + NgayDat.getMinutes();
  return kq;
}
// set lại hóa đơn
function HD(HD) {
  for (var i = 0; i < HD.length; i++) {
    HD[i].HTThanhToan = httt(HD[i].HTThanhToan);
    HD[i].TrangThaiHD = tthd(HD[i].TrangThaiHD);
    HD[i].NgayDat = ngaydat(HD[i].NgayDat);

  }
  return HD
}

//chuyển idSP thành tên sp
// function id_ten(idSP) {
//   var TenSP = "";
//   var sp = data.getSP_IdSP(idSP);
//   sp.then(tensp => {
//     for (var i = 0; i < tensp.length; i++) {
//       TenSP = tensp[i].TenSP;
//       //  console.log(TenSP)
//       return TenSP;
//     }
//   })
// }
// // id_ten(1)
// set lại thông tin hóa đơn và cthd
function Info(Info) {
  for (var i = 0; i < Info.length; i++) {
    Info[i].HTThanhToan = httt(Info[i].HTThanhToan);
    Info[i].NgayDat = ngaydat(Info[i].NgayDat);

  }
  return Info
}
/* GET home page. */
router.get('/', function (req, res, next) {
  res.render('index', { title: 'Trang Chủ' });
});
router.get('/dangnhap', function (req, res, next) {
  res.render('login', { title: 'Đăng Nhập' });
});
router.get('/dangxuat',function (req, res, next) {
  res.clearCookie('idUser');
  res.clearCookie('HoTen');

  res.render('index', { title: 'Trang Chủ' });
});

router.post('/login', function (req, res, next) {
  var Email = req.body.Email;
  var Pass = req.body.Password;
  var Kq = data.login(Email, Pass);

  Kq.then(kq => {
    if (kq.length > 0) {
      res.cookie('idUser', kq[0].idUser);
      res.cookie('HoTen', kq[0].HoTen);
      res.redirect('/');
      res.render('index', { title: 'Trang Chủ' });
    }
    else{
      // res.redirect('/');
      res.render('login', { title: 'Đăng Nhập' });
    }
  });

});
router.get('/hoadon', function (req, res, next) {

  var idUser = req.cookies.idUser;
  console.log(idUser);
  if (typeof idUser == 'undefined') {
    res.redirect('/dangnhap')
    res.render('login', { title: 'Đăng Nhập' });
  }
  else{
    var getHD = data.getHD_idUser(idUser);
    getHD.then(hd => {
      var hd = HD(hd);
      res.render('hoadon', { title: 'Hóa Đơn', HD: hd,HoTen: req.cookies.HoTen });
    });
  }

});

router.get("/chitiet/:idHD", function (req, res, next) {
  var idHD = req.params.idHD;
  var getAllInfo = data.getAllInfo(idHD);
  getAllInfo.then(info => {
    info = Info(info);
    var TenSP = data.TenSP(idHD);
    TenSP.then(tensp => {
      res.render('chitietdonhang', { title: 'Chi Tiết Hóa Đơn', Info: info, TenSP: tensp });
    });
  });
});

module.exports = router;

