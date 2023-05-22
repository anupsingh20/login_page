import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:login/auth_controller.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    List images=['g.png','t.png','f.png'];
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: w,
            height: h*0.37,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("img/2.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: h*0.18,),
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(""
                      "img/dp2.png"),
                ),
              ],
            ),


          ),
          Container( width: w,
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: 50,),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 7,
                            offset: Offset(1,1),
                            color: Colors.grey.withOpacity(0.2),
                          )
                        ]
                    ),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "Email-Id",
                        prefixIcon: Icon(Icons.email, color: Colors.pinkAccent),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1.0,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height:20),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 7,
                            offset: Offset(1,1),
                            color: Colors.grey.withOpacity(0.2),
                          )
                        ]
                    ),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: Icon(Icons.password_outlined, color: Colors.pinkAccent),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1.0,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height:20),
                  // Row(
                  //   children: [
                  //     Expanded(child: Container(),),
                  //     Text("Sign into your account",
                  //         style: TextStyle(
                  //           fontSize: 20,
                  //           color: Colors.grey[500],
                  //           fontWeight: FontWeight.bold,
                  //
                  //         )),
                  //   ],
                  // ),


                ],
              )
          ),
          SizedBox(height: 15,),
          GestureDetector(
            onTap: (){
              AuthController.instance.register(emailController.text.trim(), passwordController.text.trim());
            },
            child: Container(
              width: w*0.4,
              height: h*0.06,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  image: AssetImage("img/3.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text("Sign Up",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,

                    )),
              ),


            ),
          ),
          SizedBox(height:10),
          RichText(text:
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap=()=>Get.back(),
            text: "Have an account? Sign in",
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey[500],
            ),
          ),),
          SizedBox(height: 40),
          RichText(text:
          TextSpan(
            text: "Sign up using",
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 20,
            ),

          )),
          Wrap(
            children: List<Widget>.generate(
                1,
                    (index){return Padding(

                  padding: const EdgeInsets.all(12.0),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey[400],
                    child: GestureDetector(
                      onTap: (){
                        AuthController().signInWithGoogle();
                      },
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(
                          // "img/"+images[index],
                          "img/google.png",
                        ),

                      ),
                    ),
                  ),
                );}
            ),
          ),
        ],
      ),

    );
  }
}
