import 'package:flutter/material.dart';
import 'package:catalog_app/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async{
    if(_formKey.currentState!.validate()){
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).canvasColor,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset("assets/images/login_image.png",
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20.0,),
                 Text("Welcome $name",
                style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold ),
                ),
                Padding(padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: "Enter username"
                      ),
                      onChanged: (value) {
                        name = value;
                        setState((){
                        });
                      },
                      validator: (value) {
                        if(value!.isEmpty) {
                          return "Please enter username";
                        }
                        if(value.length < 2) {
                          return "username length should be atleast 2";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                          labelText: "Enter password"
                      ),
                      validator: (value) {
                        if(value!.isEmpty) {
                          return "Please enter password";
                        }
                        if(value.length < 6) {
                          return "Password length should be atleast 6";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0,),
                    Material(
                      borderRadius: BorderRadius.circular(
                          changeButton ? 50 : 8
                      ),
                      color: Theme.of(context).primaryColorDark,
                      child: InkWell(
                        splashColor: Colors.black,
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          height: 50,
                          width: changeButton ? 50 : 150,
                          alignment: Alignment.center,
                          child :changeButton ? const Icon(Icons.done, color: Colors.white,)
                              : const Text("Login", style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                          ),),
                        ),
                      ),
                    )
                  ],
                ),)

              ],
            ),
          ),
        ),
    );
  }
}
