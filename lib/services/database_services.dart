import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_testing/models/group.dart';
import 'package:firebase_testing/models/member.dart';
import 'package:firebase_testing/services/auth_services.dart';

const String GROUP_COLLECTION_REF = "groups";
const String MEMBER_COLLECTION_REF = "members";

class DatabaseServices {
  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference<Group> _groupsRef;
  late final CollectionReference<Member> _membersRef;

  DatabaseServices() {
    // the following makes sure that data is received from Firebase and sent to Firebase only any only in the format of a Group.
    _groupsRef =
        _firestore.collection(GROUP_COLLECTION_REF).withConverter<Group>(
            fromFirestore: (snapshot, _) => Group.fromJson(
                  snapshot.data()!,
                ),
            toFirestore: (group, _) => group.toJson());

    _membersRef =
        _firestore.collection(MEMBER_COLLECTION_REF).withConverter<Member>(
            fromFirestore: (snapshot, _) => Member.fromJson(
                  snapshot.data()!,
                ),
            toFirestore: (member, _) => member.toJson());
  }

  /******* GROUPS ******/

  Stream<QuerySnapshot> getGroups(String userId) {
    return _groupsRef.where('members', arrayContains: userId).snapshots();
  }

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

  /******* GROUPS ******/

  Future<void> createOrUpdateMember(String memberID, Member member) async {
    try {
      await _membersRef.doc(memberID).set(member);
    } on FirebaseException catch (e) {
      // Catch Firestore-specific errors
      print("Error: ${e.code}");
    } catch (e) {
      // Catch other exceptions
      print("An unexpected error occurred: $e");
    }
  }

  Future<DocumentSnapshot<Member?>?> getMember(String memberID) async {
    try {
      var snapshot = await _membersRef.doc(memberID).get();

      return snapshot; // snapshot.data() is of type Member?, snapshot.id is the id of the object
    } on FirebaseException catch (e) {
      // Catch Firestore-specific errors
      print("Error: ${e.code}");
      return null;
    } catch (e) {
      // Catch other exceptions
      print("An unexpected error occurred: $e");
      return null;
    }
  }
}
