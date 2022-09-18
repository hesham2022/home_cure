// import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:darisly_flutter_student/models/student_user.dart';
// import 'package:jwt_decode/jwt_decode.dart';
// import 'package:sign_in_with_apple/sign_in_with_apple.dart';

// class UserAdapter {
//   Future<StudentUser> adapt(user) {
//     if (user is AuthorizationCredentialAppleID) return _adaptAppleAccount(user);
//     return user is GoogleSignInAccount
//         ? _adaptGoogleAccount(user)
//         : _adaptFacebookAccount(user);
//   }

//   Future<StudentUser> _adaptGoogleAccount(GoogleSignInAccount user) async {
//     final userNameList = user.displayName.split(' ');
//     final firstName = userNameList.first;
//     final lastName = userNameList.last;
//     String idToken;

//     idToken = (await user.authentication).idToken;

//     return StudentUser(
//       firstName: firstName,
//       lastName: lastName,
//       socialMediaToken: idToken,
//       email: user.email,
//     );
//   }

//   Future<StudentUser> _adaptAppleAccount(
//       AuthorizationCredentialAppleID user) async {
//     final userNameList = [user.givenName, user.familyName];

//     final firstName = userNameList.first;
//     final lastName = userNameList.last;
//     String idToken;

//     idToken = user.userIdentifier;
//     print('Id Token is ');
//     Map<String, dynamic> payload = Jwt.parseJwt(user.identityToken);
//     final exists = await checkIfDocExists(idToken);
//     if (!exists) {
//       saveUserToFirestore(
//           firstName: firstName,
//           lastName: lastName,
//           id: idToken,
//           email: payload['email']);
//       return StudentUser(
//         firstName: firstName,
//         lastName: lastName,
//         socialMediaToken: idToken,
//         email: payload['email'],
//       );
//     } else {
//       final userFromFirebase = await usersRef.doc(idToken).get();
//       final userObject = userFromFirebase.data() as Map<String, dynamic>;
//       return StudentUser(
//         firstName: userObject['firstName'],
//         lastName: userObject['lastName'],
//         socialMediaToken: idToken,
//         email: payload['email'],
//       );
//     }
//   }

//   Future<StudentUser> _adaptFacebookAccount(user) async {
//     final userNameList = (user["name"] as String).split(' ');
//     final firstName = userNameList.first;
//     final lastName = userNameList.last;
//     return StudentUser(
//       firstName: firstName,
//       lastName: lastName,
//       email: user['email'],
//       socialMediaToken: user['accessToken'],
//     );
//   }
// }

// FirebaseFirestore firestore = FirebaseFirestore.instance;

// CollectionReference usersRef = firestore.collection('users');

// saveUserToFirestore({
//   String firstName,
//   String lastName,
//   String user,
//   String email,
//   String id,
// }) async {
//   await usersRef.doc(id).set({
//     'firstName': firstName,
//     'email': email,
//     'id': id,
//     'lastName': lastName,
//   });
// }

// Future<bool> checkIfDocExists(String docId) async {
//   try {
//     // Get reference to Firestore collection

//     var doc = await usersRef.doc(docId).get();
//     return doc.exists;
//   } catch (e) {
//     throw e;
//   }
// }
