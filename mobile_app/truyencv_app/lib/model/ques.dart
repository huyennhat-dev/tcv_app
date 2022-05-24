class Question {
  int? id;
  String? cauhoi;
  String? cautraloi;
  int? trangthai;

  Question({this.id, this.cauhoi, this.cautraloi, this.trangthai});

  Question.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cauhoi = json['cauhoi'];
    cautraloi = json['cautraloi'];
    trangthai = json['trangthai'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cauhoi'] = this.cauhoi;
    data['cautraloi'] = this.cautraloi;
    data['trangthai'] = this.trangthai;
    return data;
  }
}
