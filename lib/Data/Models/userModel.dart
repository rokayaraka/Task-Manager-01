class UserModel {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String mobile;
  final String photo;

  UserModel({required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.mobile,
    required this.photo,

  });


  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    String readString(dynamic value) => value?.toString() ?? '';

    return UserModel(
      id: readString(jsonData['_id'] ?? jsonData['id']),
      email: readString(jsonData['email']),
      firstName: readString(jsonData['firstName']),
      lastName: readString(jsonData['lastName']),
      mobile: readString(jsonData['mobile']),
      photo: readString(jsonData['photo']),
    );
  }

  Map<String,dynamic> toJson(){
    return {
      "_id":id,
      "email":email,
      "firstName":firstName,
      "lastName":lastName,
      "mobile":mobile,
      "photo" : photo
    };
  }
}