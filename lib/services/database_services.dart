import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_testing/models/group.dart';

const String GROUP_COLLECTION_REF = "groups";

class DatabaseServices {
  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference _groupsRef;

  DatabaseServices() {
    // the following makes sure that data is received from Firebase and sent to Firebase only any only in the format of a Group.
    _groupsRef =
        _firestore.collection(GROUP_COLLECTION_REF).withConverter<Group>(
            fromFirestore: (snapshot, _) => Group.fromJson(
                  snapshot.data()!,
                ),
            toFirestore: (group, _) => group.toJson());
  }

  // Stream<QuerySnapshot> getGroups() {
  //   return _groupsRef.snapshots();
  // }

  Stream<QuerySnapshot> getGroups(String userId) {
    return _groupsRef.where('members', arrayContains: userId).snapshots();
  }

  // Stream<List<Group>> getGroups() {
  //   return _groupsRef.snapshots().map(
  //       (snapshot) => snapshot.docs.map((doc) => doc.data() as Group).toList());
  // }

  Future<void> createGroup(Group group) async {
    try {
      await _groupsRef
          .add(group); // Use 'await' to wait for the operation to complete
    } on FirebaseException catch (e) {
      // Catch Firestore-specific errors
      print("Error: ${e.code}");
    } catch (e) {
      // Catch other exceptions
      print("An unexpected error occurred: $e");
    }
  }

  Future<void> updateGroup(String groupID, Group group) async {
    try {
      await _groupsRef.doc(groupID).update(group.toJson());
    } on FirebaseException catch (e) {
      // Catch Firestore-specific errors
      print("Error: ${e.code}");
    } catch (e) {
      // Catch other exceptions
      print("An unexpected error occurred: $e");
    }
  }

  Future<void> deleteGroup(String groupID) async {
    try {
      await _groupsRef.doc(groupID).delete();
    } on FirebaseException catch (e) {
      // Catch Firestore-specific errors
      print("Error: ${e.code}");
    } catch (e) {
      // Catch other exceptions
      print("An unexpected error occurred: $e");
    }
  }
}
