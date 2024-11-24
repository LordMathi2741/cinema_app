import '../../domain/model/userDTO.dart';
import 'package:firebase_auth/firebase_auth.dart';
class FirebaseServiceFacade {
  final firebaseAuth = FirebaseAuth.instance;
  Future<UserDTO?> signIn(String email, String password) async {
    try{
     UserCredential userCredential =  await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
     final userAuthenticated = userCredential.user!;
     String? idToken = await userAuthenticated.getIdToken();
     UserDTO? user = UserDTO(email: userAuthenticated.email!, token: idToken!);
     return user;
   } on FirebaseAuthException catch (e){
      if (e.code == 'user-not-found'){
        throw Exception("This user not found");
      }
      if (e.code == 'wrong-password'){
        throw Exception("Email or password wrong");
      } else{
        throw Exception("Unexpect exepction, please verify firebase auth configuration");
      }
    }
  }


}