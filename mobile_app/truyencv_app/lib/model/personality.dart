class Personality {
  int? id;
  String? tentinhcach;
  String? slug;
  int? trangthai;

  Personality({this.id, this.tentinhcach, this.slug, this.trangthai});

  Personality.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tentinhcach = json['tentinhcach'];
    slug = json['slug'];
    trangthai = json['trangthai'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tentinhcach'] = this.tentinhcach;
    data['slug'] = this.slug;
    data['trangthai'] = this.trangthai;
    return data;
  }
}
