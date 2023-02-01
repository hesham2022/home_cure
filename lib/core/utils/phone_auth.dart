import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_cure/features/login/presentation/verify_otp%20_firebase/verify_otp_fiebase_cubit.dart';

class PhoneAuthService {
  String? verificationCode;
  Future<void> verifyPhone(
    String phone,
    BuildContext context,
    VoidCallback onSent,
  ) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) async {
        
        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) async {
          if (value.user != null) {
            // await showDialog<void>(
            //   context: context,
            //   builder: (context) => const AlertDialog(
            //     content: Text('Done'),
            //   ),
            // );
            await context.read<VerifyOtpFirebaseCubit>().verifyOtpFirebase();
            // await Navigator.pushAndRemoveUntil<void>(
            //   context,
            //   MaterialPageRoute(builder: (context) => Home()),
            //   (route) => false,
            // );
          }
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String? verficationID, int? resendToken) {
        // setState(() {
        print('*' * 100);
        print(verficationID);
        onSent();
        verificationCode = verficationID;
        print(verificationCode);

        (context as ComponentElement).markNeedsBuild();

        // });
      },
      codeAutoRetrievalTimeout: (String verificationID) {
        // setState(() {
        verificationCode = verificationID;
        (context as ComponentElement).markNeedsBuild();

        // });
      },
      timeout: const Duration(seconds: 20),
    );
  }
}
