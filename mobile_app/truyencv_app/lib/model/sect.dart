class Sect {
  int? id;
  String? tenluuphai;
  String? slug;
  int? trangthai;

  Sect({this.id, this.tenluuphai, this.slug, this.trangthai});

  Sect.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenluuphai = json['tenluuphai'];
    slug = json['slug'];
    trangthai = json['trangthai'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tenluuphai'] = this.tenluuphai;
    data['slug'] = this.slug;
    data['trangthai'] = this.trangthai;
    return data;
  }
}
