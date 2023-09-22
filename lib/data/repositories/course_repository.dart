import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learning_app/utils/constant.dart';

class CourseRepository {
  Stream<QuerySnapshot<Map<String, dynamic>>> getCourses() {
    Stream<QuerySnapshot<Map<String, dynamic>>> snapshot =
        FirebaseFirestore.instance.collection(dbName).snapshots();
    return snapshot;
  }
}
