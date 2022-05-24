class Book {
  int? id;
  String? tentruyen;
  String? hinhanh;
  String? slug;
  String? mota;
  int? nguoidangId;
  String? tacgia;
  int? phanloai;
  int? theloaiId;
  int? tinhcachId;
  int? luuphaiId;
  int? thegioiId;
  int? luotxem;
  int? luotdecu;
  int? sobinhluan;
  int? sodanhgia;
  String? ngaydang;
  String? thoigiancapnhat;
  int? tinhtrang;
  int? trangthai;
  double? sosao;
  int? sochuong;

  Book(
      {this.id,
      this.tentruyen,
      this.hinhanh,
      this.slug,
      this.mota,
      this.nguoidangId,
      this.tacgia,
      this.phanloai,
      this.theloaiId,
      this.tinhcachId,
      this.luuphaiId,
      this.thegioiId,
      this.luotxem,
      this.luotdecu,
      this.sobinhluan,
      this.sodanhgia,
      this.ngaydang,
      this.thoigiancapnhat,
      this.tinhtrang,
      this.trangthai,
      this.sosao,
      this.sochuong});

  Book.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tentruyen = json['tentruyen'];
    hinhanh = json['hinhanh'];
    slug = json['slug'];
    mota = json['mota'];
    nguoidangId = json['nguoidang_id'];
    tacgia = json['tacgia'];
    phanloai = json['phanloai'];
    theloaiId = json['theloai_id'];
    tinhcachId = json['tinhcach_id'];
    luuphaiId = json['luuphai_id'];
    thegioiId = json['thegioi_id'];
    luotxem = json['luotxem'];
    luotdecu = json['luotdecu'];
    sobinhluan = json['sobinhluan'];
    sodanhgia = json['sodanhgia'];
    ngaydang = json['ngaydang'];
    thoigiancapnhat = json['thoigiancapnhat'];
    tinhtrang = json['tinhtrang'];
    trangthai = json['trangthai'];
    sosao = json['sosao'];
    sochuong = json['sochuong'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tentruyen'] = this.tentruyen;
    data['hinhanh'] = this.hinhanh;
    data['slug'] = this.slug;
    data['mota'] = this.mota;
    data['nguoidang_id'] = this.nguoidangId;
    data['tacgia'] = this.tacgia;
    data['phanloai'] = this.phanloai;
    data['theloai_id'] = this.theloaiId;
    data['tinhcach_id'] = this.tinhcachId;
    data['luuphai_id'] = this.luuphaiId;
    data['thegioi_id'] = this.thegioiId;
    data['luotxem'] = this.luotxem;
    data['luotdecu'] = this.luotdecu;
    data['sobinhluan'] = this.sobinhluan;
    data['sodanhgia'] = this.sodanhgia;
    data['ngaydang'] = this.ngaydang;
    data['thoigiancapnhat'] = this.thoigiancapnhat;
    data['tinhtrang'] = this.tinhtrang;
    data['trangthai'] = this.trangthai;
    data['sosao'] = this.sosao;
    data['sochuong'] = this.sochuong;
    return data;
  }
}
