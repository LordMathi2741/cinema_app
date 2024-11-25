import 'package:cinema/features/auth/data/remote/firebase_service_facade.dart';
import 'package:cinema/features/movies/presentation/screens/cinema_menu_screen.dart';
import 'package:cinema/shared/presentation/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final firebaseExternalService = FirebaseServiceFacade();
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.darken,
            ),
            child: Image.network(
                "https://springboard-cdn.appadvice.com/wp-content/appadvice-v2-media/2016/11/Netflix-background_860c8ece6b34fb4f43af02255ca8f225.jpg",
              fit: BoxFit.cover,
              colorBlendMode: BlendMode.darken,
              repeat: ImageRepeat.noRepeat,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 100,horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                    "Welcome to Cinema App!",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
                const SizedBox(height: 40),
                CustomTextField(
                    hintText: "Email:",
                    controller: emailController,
                    isPassword: false,
                ),
                const SizedBox(height: 40),
                CustomTextField(
                  hintText: "Password:",
                  controller: passwordController,
                  isPassword: true,
                ),
                const SizedBox(height: 40),
                Center(
                  child: SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          )
                        ),
                        onPressed: () async{
                           try{
                             await firebaseExternalService.signIn(emailController.text, passwordController.text);
                             Navigator.push(context, MaterialPageRoute(builder: (_) => const CinemaMenuScreen()));
                           } catch (_){
                             showDialog(
                                 context: context,
                                 builder: (BuildContext context){
                                   return AlertDialog(
                                     title: const Text(
                                         "Invalid email or password",
                                       style: TextStyle(
                                         fontWeight: FontWeight.bold,
                                         fontSize: 20
                                       ),
                                     ),
                                     actions: [
                                       TextButton(
                                           onPressed: (){
                                             Navigator.push(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
                                           },
                                         style: TextButton.styleFrom(
                                           backgroundColor: Colors.red,
                                           foregroundColor: Colors.white
                                         ),
                                           child: const Text("Cancel"),
                                       ),
                                       TextButton(
                                         onPressed: (){
                                           Navigator.push(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
                                         },
                                         style: TextButton.styleFrom(
                                             backgroundColor: Colors.black,
                                             foregroundColor: Colors.white
                                         ),
                                         child: const Text("Accept"),
                                       )
                                     ],
                                   );
                                 }
                             );
                           }
                        },
                        child: const Text(
                            "Sign In",
                          style: TextStyle(
                            fontSize: 15
                          ),
                        )
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
