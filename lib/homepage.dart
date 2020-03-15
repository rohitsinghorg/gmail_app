import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class _HomePageState extends State<HomePage> {
  GoogleSignInAccount _currentUser;
  String username = "Your name is: ";

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn().then((googleresult) {
        setState(() {
           username = googleresult.displayName;
        });
      });

    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google'),
      ),
       body: Container(
         width: MediaQuery.of(context).size.width,
         height: MediaQuery.of(context).size.height,
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: <Widget>[
             Text(username, style: TextStyle(fontSize: 21),),
             SizedBox(
               height: 20,
             ),
             RaisedButton(
               onPressed: (){
                 _handleSignIn();
               },
               child: Text('Google+'),
             )
           ],
         ),
       ),
    );
  }
}
