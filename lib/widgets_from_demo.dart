import 'package:flutter/material.dart';
/// ============== 表单提交 ============
class FormDemo extends StatefulWidget {
  @override
  _FormDemoState createState() => _FormDemoState();
}

class _FormDemoState extends State<FormDemo> {
  final registerFormKey = GlobalKey<FormState>();
  String? username;
  String? password;

  void registerForm() {
   registerFormKey.currentState?.save();
   registerFormKey.currentState?.validate();
   print("username: $username password: $password");
  }

  @override
  Widget build(BuildContext context) {
    return
      Form(
        key: registerFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
                icon: Icon(Icons.people),
                labelText: "用户名或手机号"
            ),
            onSaved: (value){
              this.username = value;
            },
            validator: (value){
              if (value?.isEmpty ?? true){
                return "账号不能为空";
              }
              return null;
            },

          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
                icon: Icon(Icons.lock),
                labelText: "密码"
            ),
            onSaved: (value) {
              this.password = value;
            },
            // validator: (value){
            //   if (value?.isEmpty ?? true){
            //     return "密码不能为空";
            //   }
            //   return null;
            // },
          ),
          SizedBox(height: 16,),
          // Container(
          //   width: double.infinity,
          //   height: 44,
          //   child: RaisedButton(
          //     color: Colors.lightGreen,
          //     child: Text("注 册", style: TextStyle(fontSize: 20, color: Colors.white),),
          //     onPressed: registerForm
          //   ),
          // )
        ],
      ),
    );
  }
}