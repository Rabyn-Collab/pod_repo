



class UserModel{
  final String token;
  final String id;
  final bool isAdmin;
  final String message;
  final String email;
  final String fullname;
  final ShippingAddress shippingAddress;

  UserModel({
    required this.shippingAddress,
    required this.message,
    required this.email,
    required this.id,
    required this.token,
    required this.fullname,
    required this.isAdmin
});

  factory UserModel.fromJson(Map<String, dynamic> json){
return UserModel(
    shippingAddress: ShippingAddress.fromJson(json['shippingAddress']),
    message: json['message'],
    email: json['email'],
    id: json['id'],
    token: json['token'],
    fullname: json['fullname'],
    isAdmin: json['isAdmin']
);
  }

  factory UserModel.empty(){
    return UserModel(
        shippingAddress: ShippingAddress.empty(),
        message: '',
        email: '',
        id: '',
        token: 'no-token',
        fullname: '',
        isAdmin: false
    );
  }

}


class ShippingAddress{
  final String address;
  final String city;
  final bool isEmpty;
  ShippingAddress({
    required this.city,
    required this.isEmpty,
    required this.address
});

  factory ShippingAddress.fromJson(Map<String, dynamic> json){
    return ShippingAddress(city: json['city'], isEmpty: json['isEmpty'], address: json['address']);
  }

  factory ShippingAddress.empty(){
    return ShippingAddress(
       address: 'aslkdjlkasd',
      city: '',
      isEmpty: true
    );
  }


}