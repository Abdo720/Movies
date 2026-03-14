import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movies/features/AuthenticationScreens/registerScreeen/model/usermodel.dart';
import 'package:movies/features/main_Layout/Profile/data/local/UserLocalDsImpl.dart';

class RegisterFirebaseFunctions {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static CollectionReference<UserModel> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection("Users")
        .withConverter<UserModel>(
          fromFirestore: (snapshot, _) {
            return UserModel.fromjson(snapshot.data()!);
          },
          toFirestore: (value, _) => value.tojson(),
        );
  }

  static Future<void> saveUser(UserModel user) {
    var collection = getUsersCollection();
    var docRef = collection.doc(user.id);
    return docRef.set(user);
  }

  static Future<void> updateUser(UserModel model) {
    var collection = getUsersCollection();
    var refDoc = collection.doc(model.id);
    return refDoc.update(model.tojson());
  }

  static Future<UserModel?> getCurrentUser() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return null;
    final doc = await getUsersCollection().doc(uid).get();
    return doc.data();
  }

  static Stream<UserModel?> getUserStream() {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      return const Stream.empty();
    }

    return getUsersCollection().doc(uid).snapshots().map((doc) => doc.data());
  }

  static Future<void> signOut() async {
    await _auth.signOut();
    await GoogleSignIn().signOut();
    await UserLocalDsImpl().clearUser();
  }

  static Future<void> createUser(
    String name,
    String email,
    String password,
    String phone,
    String image, {
    required Function(bool) onLoading,
    required Function onSuccess,
    required Function(String) onError,
  }) async {
    try {
      onLoading(true);

      // إنشاء المستخدم في Firebase Auth
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await saveUser(
        UserModel(
          name: name,
          email: email,
          id: credential.user!.uid,
          phone: phone,
          image: image,
        ),
      );
      await UserLocalDsImpl().saveUser(
        UserModel(
          name: name,
          email: email,
          id: credential.user!.uid,
          phone: phone,
          image: image,
        ),
      );
      onLoading(false);
      onSuccess();
    } on FirebaseAuthException catch (e) {
      onLoading(false);
      if (e.code == 'weak-password') {
        onError('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        onError('The account already exists for that email.');
      } else {
        onError(e.toString());
      }
    } catch (e) {
      onLoading(false);
      onError(e.toString());
    }
  }
}
