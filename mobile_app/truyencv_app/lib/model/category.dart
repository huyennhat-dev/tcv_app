class Category {
  int? id;
  String? tentheloai;
  String? slug;
  String? mota;
  int? trangthai;

  Category({this.id, this.tentheloai, this.slug, this.mota, this.trangthai});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tentheloai = json['tentheloai'];
    slug = json['slug'];
    mota = json['mota'];
    trangthai = json['trangthai'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tentheloai'] = this.tentheloai;
    data['slug'] = this.slug;
    data['mota'] = this.mota;
    data['trangthai'] = this.trangthai;
    return data;
  }
}
