
class MyUser {
  static String collectionName='users';
  String ?userName;
  String ?email;
  String ?id;
  MyUser({required this.id ,required this.userName , required this.email});

  Map<String,dynamic> toFireStore(){
    return {
      'id' : id,
      'userName' : userName,
      'email' : email
    };
  }
  MyUser.fromFireStore(Map<String,dynamic>data):this(
      id: data['id'],
      userName: data['userName'],
      email: data['email']

  );
}
