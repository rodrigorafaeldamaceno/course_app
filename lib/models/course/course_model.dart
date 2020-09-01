class Course {
  String name;
  String description;
  String logo;
  List<String> images;

  Course({this.name, this.description, this.logo, this.images});

  Course.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    logo = json['logo'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['logo'] = this.logo;
    data['images'] = this.images;
    return data;
  }
}
