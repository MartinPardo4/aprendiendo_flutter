import 'dart:io';

import 'package:chat_app/widgets/user_image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firebase = FirebaseAuth.instance;

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  var _isLogIn = true;
  var _isAuthenticaiting = false;
  final _formKey = GlobalKey<FormState>();

  var _enteredEmail = "";
  var _enteredPassword = "";
  File? _selectedImage;

  void _submit() async {
    var isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    }

    /*if(!_isLogIn && _selectedImage == null){
      return;
    }*/

    _formKey.currentState!.save();

    try {
      setState(() {
        _isAuthenticaiting = true;
      });
      if (_isLogIn) {
        final userCredentials = await _firebase.signInWithEmailAndPassword(
          email: _enteredEmail,
          password: _enteredPassword,
        );
      } else {
        final userCredentials = await _firebase.createUserWithEmailAndPassword(
          email: _enteredEmail,
          password: _enteredPassword,
        );
        print(userCredentials);
        /*final storageRef = FirebaseStorage.instance
            .ref()
            .child("user_images")
            .child("${userCredentials.user!.uid}.jpg");
        
        await storageRef.putFile(_selectedImage!);
        final imageUrl = await storageRef.getDownloadURL();
        
        print(imageUrl);*/
      }
    } on FirebaseAuthException catch (error) {

      if(!mounted) return;
      
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message ?? "Authentication failed"),
        ),
      );
      setState(() {
        _isAuthenticaiting = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: Text(_isLogIn ? "Log in" : "Sign Up"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(30),
                width: 200,
                child: Image.asset('assets/images/chat.png'),
              ),
              const SizedBox(
                height: 12,
              ),
              Card(
                margin: const EdgeInsets.all(30),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          /*if (!_isLogIn)
                            UserImagePicker(
                              onSelectImage: (image) {
                                setState(() {
                                  _selectedImage = image;
                                });
                              },
                            ),*/
                          TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              autocorrect: false,
                              textCapitalization: TextCapitalization.none,
                              decoration: const InputDecoration(
                                labelText: "Email adress",
                              ),
                              validator: (value) {
                                if (value == null ||
                                    value.trim().isEmpty ||
                                    !value.contains("@")) {
                                  return "Must be a valid email";
                                }
                                return null;
                              },
                              onSaved: (value) {
                                setState(() {
                                  _enteredEmail = value!;
                                });
                              }),
                          const SizedBox(
                            height: 6,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: "Password",
                            ),
                            validator: (value) {
                              if (value == null || value.trim().length < 6) {
                                return "Must be a valid password";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              setState(() {
                                _enteredPassword = value!;
                              });
                            },
                          ),
                          const SizedBox(height: 14),
                          if(_isAuthenticaiting)
                            const CircularProgressIndicator(),
                          if(!_isAuthenticaiting)
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                ),
                                onPressed: _submit,
                                child: Text(_isLogIn ? "Log In" : "Sign Up")),
                            const SizedBox(height: 6),
                          if(!_isAuthenticaiting)
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  _isLogIn = !_isLogIn;
                                });
                              },
                              child: Text(_isLogIn
                                  ? "Create an account"
                                  : "I have an account"),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
