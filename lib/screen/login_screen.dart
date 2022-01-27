import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram/handle/auth_methods.dart';
import 'package:instagram/provider/provider_user.dart';
import 'package:instagram/screen/home_page_screen.dart';
import 'package:instagram/widget/text_field_input.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState(){
    super.initState();
    loadData();
  }

  void loadData() async{
    ProviderUser userProvider = Provider.of(context, listen: false);
    await userProvider.refestUser();
  }

  void userLogin() async{
    String res = await AuthMethods().userLogin(
        email: _emailController.text,
        password: _passwordController.text
    );
    if(res == 'success'){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomePageScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/ic_instagram.svg', color: Colors.white, height: 40,),
                const SizedBox(height: 20,),
                TextFieldInput(textFieldController: _emailController, hinttext: 'Enter your email'),
                const SizedBox(height: 20,),
                TextFieldInput(textFieldController: _passwordController, hinttext: 'Enter your password', isPass: true,),
                const SizedBox(height: 24,),
                InkWell(
                  onTap: userLogin,
                  child:Container(
                    color: Colors.blue,
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: const Text('Login', style: TextStyle(
                      color: Colors.white,
                    ),),
                  ),
                ),
                const SizedBox(height: 70,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:const [
                    Text('Do you have account?', style: TextStyle(color: Colors.white),),
                    Text(' Sign up', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                    Icon(Icons.arrow_forward_outlined, color: Colors.white,)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
