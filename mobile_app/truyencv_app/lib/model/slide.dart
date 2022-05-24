class Slide {
  int? id;
  String? hinhanh;
  String? mota;
  int? trangthai;

  Slide({this.id, this.hinhanh, this.mota, this.trangthai});

  Slide.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hinhanh = json['hinhanh'];
    mota = json['mota'];
    trangthai = json['trangthai'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['hinhanh'] = this.hinhanh;
    data['mota'] = this.mota;
    data['trangthai'] = this.trangthai;
    return data;
  }
}
