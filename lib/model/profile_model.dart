class ProfileModel {
  final String? username;
  final String? useremail;
  final String? userphoneNo;
  final String? image;
  final String? address;

  ProfileModel(
      {required this.useremail,
      this.username,
      this.userphoneNo,
      this.image,
      this.address});

  Map<String, dynamic> toJson() => {
        'email': useremail,
        'username': username,
        'phone': userphoneNo,
        "image": image,
        "address": address
      };

  static ProfileModel fromJson(Map<String, dynamic> json) => ProfileModel(
      useremail: json['email'],
      username: json['username'],
      userphoneNo: json['phone'],
      image: json['image'],
      address: json['address']);
}
