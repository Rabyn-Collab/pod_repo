



import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  static FirebaseAuth _auth = FirebaseAuth.instance;

  static  Future<void> userLogin({
    required String email,
    required String password
  }) async{
      try{
        await _auth.signInWithEmailAndPassword(email: email, password: password);
      }on FirebaseAuthException catch(err){
        print(err);
        throw '${err.message}';
      }
  }


  static  Future<void> userRegister({
    required String email,
    required String password,
    required String username
  }) async{
    try{

    }on FirebaseAuthException catch(err){

    }
  }


}

