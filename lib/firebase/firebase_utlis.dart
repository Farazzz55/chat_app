import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/my_user.dart';


class FirebaseUtils {
  static CollectionReference<MyUser> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection(MyUser.collectionName)
        .withConverter<MyUser>(
      fromFirestore: (snapshot, options) =>
          MyUser.fromFireStore(snapshot.data()!),
      toFirestore: (myUser, options) => myUser.toFireStore(),
    );
  }

  static Future<void> addUserToFirebase(MyUser user) async {
    return getUsersCollection().doc(user.id).set(user);
  }

  static Future<MyUser?> readUserFromFirestore(String uid) async {
    var querySnapshot = await getUsersCollection().doc(uid).get();
    return querySnapshot.data();
  }
}
