import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  
  TextEditingController fullNameController = TextEditingController();
  TextEditingController fatherController = TextEditingController();
  TextEditingController dobNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordNameController = TextEditingController();
  
  final String FULL_NAME_KEY = 'fname';
  final String FATHER_NAME_KEY = 'fatherName';
  final String DOB_NAME_KEY = 'dob_key';
  final String EMAIL_NAME_KEY = 'email_key';
  final String PASS_NAME_KEY = 'pass_key';
  
  
  String? full_Name;
  String? father_name;
  String? dob_key;
  String? email_key;
  String? pass_key;
  
  

  void getSignUpData() async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    full_Name = prefs.getString(FULL_NAME_KEY);
    father_name = prefs.getString(FATHER_NAME_KEY);
    dob_key = prefs.getString(DOB_NAME_KEY);
    email_key = prefs.getString(EMAIL_NAME_KEY);
    pass_key = prefs.getString(PASS_NAME_KEY);

    setState(() {

    });

  }
  
  void setSignUpData({required full_Name,required father_name, required dob_key, required email_key, required pass_key}) async {
    
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    
    prefs.setString(FULL_NAME_KEY, full_Name);
    prefs.setString(FATHER_NAME_KEY, father_name);
    prefs.setString(DOB_NAME_KEY, dob_key);
    prefs.setString(EMAIL_NAME_KEY, email_key);
    prefs.setString(PASS_NAME_KEY, pass_key);
    
  }

  @override
  void initState() {
    getSignUpData();
    super.initState();
  }
  
  void clearData()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(FULL_NAME_KEY);
    prefs.remove(FATHER_NAME_KEY);
    prefs.remove(DOB_NAME_KEY);
    prefs.remove(EMAIL_NAME_KEY);
    prefs.remove(PASS_NAME_KEY);
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
             const SizedBox(height: 20),
            TextField(
              controller: fullNameController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: fatherController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                labelText: 'Father Name',
                border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: dobNameController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'DOB',
                border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder()
              ),
            ),
            
            const SizedBox(height: 20),
            TextField(
              obscureText: true,
              keyboardType: TextInputType.text,
              controller: passwordNameController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder()
              ),
            ),
            
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: (){
                if(fullNameController.text.isNotEmpty && dobNameController.text.isNotEmpty && fatherController.text.isNotEmpty && emailController.text.isNotEmpty && passwordNameController.text.isNotEmpty ){
                  setSignUpData(
                      full_Name: fullNameController.text,
                    dob_key: dobNameController.text,
                    father_name: fatherController.text,
                    email_key: emailController.text,
                    pass_key: passwordNameController.text
                  );
                }
               
              },
               child: const Text('Save')),
            
            Text('Hi, Name is : ${full_Name ?? 'N/A' }'),
            Text('Father Name is : ${father_name ?? 'N/A' }'),
            Text('DOB is : ${dob_key ?? 'N/A' }'),
            Text('Email is : ${email_key ?? 'N/A' }'),
            Text('Pass Name is : ${pass_key ?? 'N/A' }'),
            
            ElevatedButton(onPressed: (){
              clearData();
              
            }, child: const Text('Clear cache'))
            
          ],
        ),
      ),
    );
  }
}