
import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:payflow_john_nlw6/modules/login/login_controller.dart';
import 'package:payflow_john_nlw6/shared/themes/app_colors.dart';
import 'package:payflow_john_nlw6/shared/themes/app_images.dart';
import 'package:payflow_john_nlw6/shared/themes/app_text_styles.dart';
import 'package:payflow_john_nlw6/shared/widgets/social_login/social_login_button.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController();
  @override
  Widget build(BuildContext context) {
   final size_screen = MediaQuery.of(context).size;
  String texto = "Organize seus boletos em um só lugar";
    return AnimatedCard(
      direction: AnimatedCardDirection.bottom,
      child: Scaffold(
       backgroundColor: AppColors.background,
       body: Container(
         width: size_screen.width,
         height: size_screen.height,
         child: Stack(
      children: [
          Container(
            width: size_screen.width,
            height: size_screen.height *0.36,
            color: AppColors.primary,
          ),
          Positioned(
          top: 40,
          right: 0,
          left: 0,
          child: Image.asset(AppImages.person,width: 208,height: 300,)
          ),
          Positioned(
            bottom: size_screen.height * 0.05 ,
            left: 0,
            right: 0,
    
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AppImages.logomini),
                Padding(
                  padding: const EdgeInsets.only(top: 30,left: 70,right: 70),
                  child: Text(
                    texto,
                    textAlign: TextAlign.center,
                    style:TextStyles.titleHome,
                    ),
                ),
               Padding(
                 padding: const EdgeInsets.only(left: 40,right:40,top: 40),
                 child: SocialLoginButton(
                   onTap:  (){controller.googleSignIn(context);
                   }
    
                   
                 ),
               )
              ],
            ),
          )
      ],
    
         ),
       ),
      ),
    );
  }
}