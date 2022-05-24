class WorldScene {
  int? id;
  String? tenthegioi;
  String? slug;
  int? trangthai;

  WorldScene({this.id, this.tenthegioi, this.slug, this.trangthai});

  WorldScene.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenthegioi = json['tenthegioi'];
    slug = json['slug'];
    trangthai = json['trangthai'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tenthegioi'] = this.tenthegioi;
    data['slug'] = this.slug;
    data['trangthai'] = this.trangthai;
    return data;
  }
}
