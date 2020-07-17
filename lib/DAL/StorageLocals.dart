import 'package:workservices/Entity/local.dart';
import 'package:firebase_database/firebase_database.dart';

class StorageLocals{
  StorageLocals();

  void saveToDatabase(String name, String desc, String schedule) {
    DatabaseReference ref = FirebaseDatabase.instance.reference();

    var data = {
      'name': name,
      'description': desc,
      'schedule': schedule,
      'likes': 0,
      'favorites': 0,
      'stars':3.4,
      'user': "prueba",
      'type': "ferreteria"
    };

    ref.child("locals").child(name).set(data);
  }


}
