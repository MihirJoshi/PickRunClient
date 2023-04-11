class OrderModel {
  String? uid;
  String? orderId;
  String? picAddress;
  String? picMobno;
  String? picTime;
  String? email;
  String? picInstruct;
  String? picName;
  String? picSmobno;
  String? destiAddress;
  String? destiMobno;
  String? destiTime;
  String? destiInstruct;
  String? destiName;
  String? destiSmobno;
  String? category;
  double? weight;
  double? picLat;
  double? picLng;
  String? codType;
  double? distance;
  double? price;
  double? distLat;
  double? distLng;
  String? status;

  OrderModel({this.uid, this.category, this.codType, this.destiAddress, this.destiMobno, this.destiTime, this.distLat, this.distLng, this.distance, this.orderId, this.picAddress, this.picLat, this.picLng, this.picMobno, this.picTime, this.price, this.weight, this.destiInstruct, this.destiName, this.destiSmobno, this.email, this.picInstruct, this.picName, this.picSmobno, this.status});

  // recieving data from the server

  factory OrderModel.fromMap(map) {
    return OrderModel(
      uid: map['uid'],
      orderId: map['orderId'],
      picAddress: map['picAddress'],
      picMobno: map['picMobno'],
      picTime: map['picTime'],
      email: map['email'],
      picInstruct: map['picInstruct'],
      picName: map['picName'],
      picSmobno: map['picSmobno'],
      destiAddress: map['destiAddress'],
      destiMobno: map['destiMobno'],
      destiTime: map['destiTime'],
      destiInstruct: map['destiInstruct'],
      destiName: map['destiName'],
      destiSmobno: map['destiSmobno'],
      category: map['category'],
      weight: map['weight'].toDouble(),
      picLat: map['picLat'].toDouble(),
      picLng: map['picLng'].toDouble(),
      codType: map['codType'],
      distance: map['distance'].toDouble(),
      price: map['price'].toDouble(),
      distLat: map['distLat'].toDouble(),
      distLng: map['distLng'].toDouble(),
      status: map['status']
    );
  }

  //sending data to server

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'orderId': orderId,
      'picAddress': picAddress,
      'picMobno': picMobno,
      'picTime': picTime,
      'email': email,
      'picInstruct': picInstruct,
      'picName': picName,
      'picSmobno': picSmobno,
      'destiAddress': destiAddress,
      'distMobno': destiMobno,
      'destiTime': destiTime,
      'destiInstruct': destiInstruct,
      'destiName': destiName,
      'destiSMobno': destiSmobno,
      'category': category,
      'weight': weight,
      'picLat': picLat,
      'picLng': picLng,
      'codType': codType,
      'distance': distance,
      'price': price,
      'distLat': distLat,
      'distLng': distLng,
      'status': status,
    };
  }
}
