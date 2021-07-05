import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class Profile {
  String name;
  String birth_date;
  // Set usersLiked = {};
  DatabaseReference? _id;

  Profile(this.name, this.birth_date);

  void setId(DatabaseReference id) {
    this._id = id;
  }

  Map<String, dynamic> toJson() {
    return {
      'name': this.name,
      'birth_date': this.birth_date,
      '_id': this._id,
    };
  }
}

Profile createPost(record) {
  Map<String, dynamic> attributes = {
    'name': '',
    'birth_date': '',
    // '_id': '',
  };

  record.forEach((key, value) => {attributes[key] = value});

  Profile profile = new Profile(
    attributes['name'],
    attributes['birth_date'],
    // attributes['_id'],
  );
  return profile;
}
