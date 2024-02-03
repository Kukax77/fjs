import 'package:clean_rlg/3_domain/repositories/auth_repository.dart';
import 'package:clean_rlg/injection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


extension FireStoreExt on FirebaseFirestore {
  Future<DocumentReference> userDocument() async {
    final userOption = sl<AuthRepository>().getSignedInUser();

    final user = userOption.getOrElse(() => throw NotAuthenticatedError());

    return FirebaseFirestore.instance.collection("users").doc(user.id.value);
  }

  Future<DocumentReference> pointsDocument() async {
    final userOption = sl<AuthRepository>().getSignedInUser();

    final user = userOption.getOrElse(() => throw NotAuthenticatedError());

    return FirebaseFirestore.instance.collection("points").doc(user.id.value);
  }
}

class NotAuthenticatedError {
}

extension DocumentReferenceExt on DocumentReference {
  CollectionReference<Map<String, dynamic>> get tomorrowQuestCollection =>
      collection("tomorrowQuest");

  CollectionReference<Map<String, dynamic>> get questCollection =>
      collection("quests");

  CollectionReference<Map<String, dynamic>> get pointsCollection =>
      collection("points");

  CollectionReference<Map<String, dynamic>> get activityCollection =>
      collection("activity");
}
