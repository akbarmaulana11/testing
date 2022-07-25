import 'dart:developer';

import 'package:chattingan/components/button/button_custom.dart';
import 'package:chattingan/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class PhoneNumberAuthenticatorPage extends StatelessWidget {
  const PhoneNumberAuthenticatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseAuth fauth = FirebaseAuth.instance;
    TextEditingController InputPhoneController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Spacer(),
              Text("SIGN IN WITH PHONE NUMBER",
                  style: GoogleFonts.lato(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              StreamBuilder<User?>(
                  stream: FirebaseAuth.instance.userChanges(),
                  builder: (context, snapshoot) {
                    if (snapshoot.hasData) {
                      return Text(
                          'Sign In with ${snapshoot.data?.phoneNumber}');
                      // to the next page, when you after verify the phone number....
                    }
                    return Text('Kamu, mesti login dulu...');
                  }),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                    color: MediaQuery.of(context).platformBrightness ==
                            Brightness.light
                        ? Colors.grey.withOpacity(0.19)
                        : Colors.white.withOpacity(0.19),
                    borderRadius: BorderRadius.circular(30)),
                child: TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.phone,
                  controller: InputPhoneController,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Phone Number'),
                ),
              ),
              Spacer(
                flex: 3,
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (fauth.currentUser == null) {
                      await fauth.verifyPhoneNumber(
                        phoneNumber: '',
                        verificationCompleted:
                            (PhoneAuthCredential credential) async {
                          await fauth.signInWithCredential(credential);
                        },
                        verificationFailed: (FirebaseAuthException e) {
                          showNotif(context, e.message.toString());
                          // if (e.code == 'invalid-phone-number') {
                          //   print('The provided phone number is not valid.');
                          // }
                          // Handle other errors
                        },
                        codeSent:
                            (String verificationId, int? resendToken) async {
                          // // Update the UI - wait for the user to enter the SMS code
                          // String smsCode = 'xxxx';
                          String? smsCode = await askingSMScode(context);

                          if (smsCode != null) {
                            PhoneAuthCredential credential =
                                PhoneAuthProvider.credential(
                                    verificationId: verificationId,
                                    smsCode: smsCode);
                            try {
                              fauth.signInWithCredential(credential);
                            } on FirebaseAuthException catch (e) {
                              log(e.message.toString());
                            }
                          }

                          // // Create a PhoneAuthCredential with the code
                          // PhoneAuthCredential credential =
                          //     PhoneAuthProvider.credential(
                          //         verificationId: verificationId,
                          //         smsCode: smsCode);

                          // // Sign the user in (or link) with the credential
                          // await fauth.signInWithCredential(credential);
                        },
                        // timeout: const Duration(seconds: 60),
                        codeAutoRetrievalTimeout: (String verificationId) {
                          // Auto-resolution timed out...
                        },
                      );
                    } else {
                      fauth.signOut();
                    }
                  },
                  child: StreamBuilder(
                      stream: FirebaseAuth.instance.userChanges(),
                      builder: (context, snapshoot) {
                        if (snapshoot.hasData) {
                          return Text('Sign Out');
                        }
                        return Text('Sign In');
                      })),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void showNotif(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.green.shade900,
        content: Text(message.toString())));
  }

  Future<String?> askingSMScode(BuildContext context) async {
    return await showDialog<String>(
        context: context,
        builder: (_) {
          TextEditingController controller = TextEditingController();

          return SimpleDialog(
              title: const Text('Masukkan code verifikasi dari SMS'),
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 0, 30, 15),
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                  color: MediaQuery.of(context).platformBrightness ==
                          Brightness.light
                      ? Colors.grey.withOpacity(0.19)
                      : Colors.white.withOpacity(0.19),
                  child: TextField(
                    controller: controller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: 'SMS Code'),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context, controller.text);
                    },
                    child: Text('Confirm',
                        style: TextStyle(color: Colors.green.shade900)))
              ]);
        });
  }
}
