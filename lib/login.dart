import "package:flutter/material.dart";
// import "package:flutter/widgets.dart";

import "utils/routes.dart";
// import "package:flutter/widgets.dart";
// import "package:flutter/widgets.dart";

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String name = "";
  bool dabayakya = false;
  final _formkey = GlobalKey<FormState>();

  moveto(BuildContext context) async {
    if(_formkey.currentState!.validate()){
    setState(() {
      dabayakya = true;
    });
    await Future.delayed(const Duration(seconds: 1));
    // ignore: use_build_context_synchronously
    await Navigator.pushNamed(context, myroutes.loadingroute);
    setState(() {
      dabayakya = false;
    });
  }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/login.png",
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Welcome $name",
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),

                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "LOGIN ",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

                const SizedBox(
                  height: 20,
                ),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: Column(children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Enter Username:", labelText: "Username"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Username cannot be empty";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: "Enter Password:", labelText: "Password"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password cannot be empty";
                        } else if (value.length < 6) {
                          return "Password should be atleat 6 charaters long";
                        }
                        return null;
                      },
                    )
                  ]),
                ),
                Material(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(6),
                  child: InkWell(
                    splashColor: Colors.deepPurpleAccent,
                    onTap: () => moveto(context),
                    child: AnimatedContainer(
                      width: dabayakya ? 93 : 100,
                      duration: const Duration(seconds: 1),
                      height: dabayakya ? 45 : 50,
                      alignment: Alignment.center,
                      // decoration: BoxDecoration(
                      // color: Colors.deepPurple,
                      // borderRadius: BorderRadius.circular(6)),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     Navigator.pushNamed(context, myroutes.loadingroute);
                //   },
                //   style: TextButton.styleFrom(),
                //   child: const Text("Login"),
                // )
              ],
            ),
          ),
        ));
  }
}
