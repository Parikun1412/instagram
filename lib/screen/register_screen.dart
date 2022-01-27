import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram/handle/auth_methods.dart';
import 'package:instagram/widget/text_field_input.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final TextEditingController _usernameController = TextEditingController();
final TextEditingController _addressController = TextEditingController();



  @override
  void dispose(){
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _addressController.dispose();
  }

  void userRegister() async{
    String res = await AuthMethods().userRegister(
        email: _emailController.text,
        password: _passwordController.text,
        username: _usernameController.text,
        address: _addressController.text
    );
    print(res);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/ic_instagram.svg', color: Colors.white, height: 40,),
              const SizedBox(height: 24,),
              TextFieldInput(textFieldController: _emailController, hinttext: 'Enter your email'),
              const SizedBox(height: 24,),
              TextFieldInput(textFieldController: _passwordController, hinttext: 'Enter your password', isPass: true,),
              const SizedBox(height: 24,),
              TextFieldInput(textFieldController: _usernameController, hinttext: 'Enter your username'),
              const SizedBox(height: 24,),
              TextFieldInput(textFieldController: _addressController, hinttext: 'Enter your address'),
              const SizedBox(height: 24,),
              InkWell(
                onTap: userRegister,
                child: Container(
                  color: Colors.blue,
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding:const EdgeInsets.symmetric(vertical: 20),
                  child: const Text('Register', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
