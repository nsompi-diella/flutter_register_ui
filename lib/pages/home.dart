import 'package:course/validation/validator.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  final formkey = GlobalKey<FormState>();
  bool isloading = false;
  bool ischeck = false;

  //  text input
  final usernameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final confirmPasswordCtrl = TextEditingController();

  // dispose text
  @override
  void dispose() {
    usernameCtrl.dispose();
    passwordCtrl.dispose();
    confirmPasswordCtrl.dispose();
    super.dispose();
  }

  // checkbox
  void userCheck(bool? value) {
    setState(() {
      ischeck = value ?? false;
    });
  }

  void submitButton() async {
    if (formkey.currentState!.validate()) {
      setState(() {
        isloading = true;
      });
      await Future.delayed(Duration(seconds: 2));
      print("you click the button");

      setState(() {
        isloading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Padding(
              padding: EdgeInsets.only(top: 80, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Signup',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 5,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Welcome to Sneyco we are happy to see you ',
                    style: TextStyle(
                      color: const Color.fromARGB(177, 158, 158, 158),
                      fontSize: 12,
                    ),
                  ),
                  // first input
                  SizedBox(height: 50),
                  Text(
                    'Username : ',
                    style: TextStyle(fontSize: 15, color: Colors.indigo),
                  ),
                  SizedBox(height: 5),
                  SizedBox(
                    width: 350,
                    child: TextFormField(
                      controller: usernameCtrl,
                      validator: Validator.username,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        hint: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            'Enter username',
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                        ),
                        suffixIcon: Icon(Icons.person_outline, size: 23),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Password : ',
                    style: TextStyle(fontSize: 15, color: Colors.indigo),
                  ),
                  SizedBox(height: 5),
                  SizedBox(
                    width: 350,
                    child: TextFormField(
                      validator: Validator.password,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        hint: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            'Enter password',
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                        ),
                        suffixIcon: Icon(Icons.lock_outline, size: 23),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Confirm Password : ',
                    style: TextStyle(fontSize: 14, color: Colors.indigo),
                  ),
                  SizedBox(
                    width: 350,
                    child: TextFormField(
                      controller: confirmPasswordCtrl,
                      validator: (value) {
                        return Validator.confirmPassword(
                          value,
                          passwordCtrl.text,
                        );
                      },
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        hint: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            'Confirm Password',
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                        ),
                        suffixIcon: Icon(Icons.lock_outline, size: 23),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    child: Row(
                      children: [
                        Checkbox(
                          activeColor: Colors.green,
                          value: ischeck,
                          onChanged: userCheck,
                        ),
                        Text(
                          'Accept policy',
                          style: TextStyle(color: Colors.indigo),
                        ),
                      ],
                    ),
                  ),
                  //  mettre un string validation
                  SizedBox(height: 20),
                  SizedBox(
                    width: 350,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                      ),
                      onPressed: (!ischeck || isloading) ? null : submitButton,
                      child: isloading
                          ? CircularProgressIndicator(
                              backgroundColor: Colors.white,
                              color: Colors.indigo,
                            )
                          : Text(
                              'SUBMIT',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                  SizedBox(height: 150),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Icon(Icons.public_outlined, size: 15),
                        SizedBox(width: 5),
                        Text(
                          'Corporation by',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Lovinci',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
