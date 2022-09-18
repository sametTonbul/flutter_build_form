import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();}

class _MyHomePageState extends State<MyHomePage> {

    var formKey = GlobalKey<FormState>();
    var tfUserName = TextEditingController();
    var tfUserPassword = TextEditingController();

   @override
  Widget build(BuildContext context) {
        return Scaffold(
      appBar: AppBar(
        title: Text('UsingForm')),
      body: Center(
        child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Form(
                key : formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: tfUserName,
                      decoration: InputDecoration(
                        hintText:  'UserName'
                      ),
                      validator: (userEnter){
                        if(userEnter == null){
                          return 'Required UserName';}
                        if(userEnter.isEmpty){
                          return 'Required UserName';
                        }
                     },
                    ),
                    TextFormField(
                      controller: tfUserPassword,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText:  'UserPassword'
                      ),
                      validator: (userEnter){
                        if(userEnter == null){
                          return 'Required UserPassword';}
                        if(userEnter.length<6){
                          return 'UserPassword must be at least 6 characters';}
                        },
                    ),
                    ElevatedButton(
                        child: Text('LOGIN'),
                        onPressed: (){
                          bool resultControl = formKey.currentState!.validate();
                          if(resultControl){
                            String userName = tfUserName.text;
                            int userPassword = int.parse(tfUserPassword.text);
                            print('userName : $userName - userPassword : $userPassword');
                          }
                        }
                      ,),

                  ],
                ),

              ),
            ),

          ],
        ),
      ),
    );
  }
}
