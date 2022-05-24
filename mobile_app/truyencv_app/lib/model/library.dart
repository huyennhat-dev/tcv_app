class Library {
  int? id;
  int? truyenId;
  String? hinhanh;
  String? tentruyen;
  int? chuongId;
  int? chuongSlug;
  int? uId;

  Library(
      {this.id,
      this.truyenId,
      this.hinhanh,
      this.tentruyen,
      this.chuongId,
      this.chuongSlug,
      this.uId});

  Library.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    truyenId = json['truyen_id'];
    hinhanh = json['hinhanh'];
    tentruyen = json['tentruyen'];
    chuongId = json['chuong_id'];
    chuongSlug = json['chuong_slug'];
    uId = json['u_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['truyen_id'] = this.truyenId;
    data['hinhanh'] = this.hinhanh;
    data['tentruyen'] = this.tentruyen;
    data['chuong_id'] = this.chuongId;
    data['chuong_slug'] = this.chuongSlug;
    data['u_id'] = this.uId;
    return data;
  }
}
