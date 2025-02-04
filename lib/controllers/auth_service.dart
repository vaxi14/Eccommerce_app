import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService {
  Future<String> createAccountWithEmail(String email, String password) async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email, password: password
        );
        return "Account Created";
    }
    on FirebaseAuthException catch (e){
      return e.message.toString();    }
  }
  //login with eamil and password method
  Future<String> logininWithEmail(String email,String password) async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword
      (email: email, password: password);
      return "Login Successfull";
    }
    on FirebaseAuthException catch (e){
      return e.message.toString();
    }
  }

  //logout the user
  Future logout() async{
    await FirebaseAuth.instance.signOut();
  }

  // reset the passowrd
  Future resetPassword(String email)async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return "Mail sent";
    }
   on FirebaseAuthException catch(e){
    return e.message.toString();
    }
  }

  //check whether the user is sign in or sign out
  Future<bool> isLoggedIn() async{
    var user = FirebaseAuth.instanceFor.currentUser;
    return user !=null;
  }
}

extension on FirebaseAuth Function({required FirebaseApp app, Persistence? persistence}) {
   get currentUser => null;
}