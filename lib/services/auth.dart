import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_kitchenware/models/user.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:smart_kitchenware/services/database.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;
 // final GoogleSignIn googleSignIn = new GoogleSignIn();

  //ceate user obj based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;
  }

  //Get UID
 // Future<String> getCurrentUID() async{
   // return (await _firebaseAuth.currentUser()).uid;
  //}



  //auth change user streem
  Stream<User> get user{
    return _auth.onAuthStateChanged
    //.map((FirebaseUser user) => _userFromFirebaseUser(user));
    .map(_userFromFirebaseUser);
  }

  //sign in anon
Future signInAnon() async{
  try{
    AuthResult result = await _auth.signInAnonymously();
    FirebaseUser user = result.user;
    return user;
  }catch(e){
    print(e.toString());
    return null;

  }
}
//sign in with email and password

  Future signInWithEmailAndPassword(String email, String password) async{
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user  = result.user;
      return  _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

/*sign in with Google Account

   Future<String> signInWithGoogle() async {
    final GoogleSignInAccount account = await _googleSignIn.signIn();
    final GoogleSignInAuthentication _googleAuth = await account.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: _googleAuth.idToken,
        accessToken: _googleAuth.accessToken,
    );
    return (await _FirebaseAuth.signInWithCredential(credential)).user.uid;
  }


*/


//register with email and password
  Future registerWithEmailAndPassword(String name, String number, String email, String password) async{
  try{
    AuthResult result = await _auth.createUserWithEmailAndPassword( email: email, password: password);
    FirebaseUser user  = result.user;

    //create a new document for user with uid
    await DatabaseService(uid: user.uid).updateUserData('Salt', 60 );

    return  _userFromFirebaseUser(user);
  }catch(e){
    print(e.toString());
    return null;
  }
  }

//sign out
Future Signout() async{
  try{
    return await _auth.signOut();
  }catch(e){
    print(e.toString());
    return null;
  }
}

}