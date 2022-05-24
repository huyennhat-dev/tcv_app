class Rating {
  int? id;
  int? truyenId;
  String? avt;
  String? ten;
  double? sosao;
  int? uId;
  String? noidung;
  String? ngaydang;
  int? trangthai;

  Rating(
      {this.id,
      this.truyenId,
      this.avt,
      this.ten,
      this.sosao,
      this.uId,
      this.noidung,
      this.ngaydang,
      this.trangthai});

  Rating.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    truyenId = json['truyen_id'];
    avt = json['avt'];
    ten = json['ten'];
    sosao = json['sosao'];
    uId = json['u_id'];
    noidung = json['noidung'];
    ngaydang = json['ngaydang'];
    trangthai = json['trangthai'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['truyen_id'] = this.truyenId;
    data['avt'] = this.avt;
    data['ten'] = this.ten;
    data['sosao'] = this.sosao;
    data['u_id'] = this.uId;
    data['noidung'] = this.noidung;
    data['ngaydang'] = this.ngaydang;
    data['trangthai'] = this.trangthai;
    return data;
  }
}
