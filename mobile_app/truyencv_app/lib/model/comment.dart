class Comment {
  int? id;
  int? truyenId;
  int? uId;
  String? noidung;
  String? ngaythem;

  Comment({this.id, this.truyenId, this.uId, this.noidung, this.ngaythem});

  Comment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    truyenId = json['truyen_id'];
    uId = json['u_id'];
    noidung = json['noidung'];
    ngaythem = json['ngaythem'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['truyen_id'] = this.truyenId;
    data['u_id'] = this.uId;
    data['noidung'] = this.noidung;
    data['ngaythem'] = this.ngaythem;
    return data;
  }
}
