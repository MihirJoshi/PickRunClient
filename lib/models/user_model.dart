class UserModel {
  String? uid;
  String? firstname;
  String? mobno;
  String? city;
  String? email;

  UserModel({this.uid, this.firstname, this.mobno, this.city, this.email});

  // recieving data from the server

  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      firstname: map['firstname'],
      mobno: map['mobno'],
      city: map['city'],
      email: map['email'],
    );
  }

  //sending data to server

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'firstname': firstname,
      'mobno': mobno,
      'city': city,
      'email': email,
    };
  }
}
