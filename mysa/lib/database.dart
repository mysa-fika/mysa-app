import 'package:firebase_database/firebase_database.dart';

import 'model/profile.dart';

final databaseReference = FirebaseDatabase.instance.reference();

DatabaseReference saveProfile(Profile profile) {
  var id = databaseReference.child('profiles/').push();
  id.set(profile.toJson());
  return id;
}
