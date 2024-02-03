

import 'package:clean_rlg/3_domain/entities/id.dart';
import 'package:clean_rlg/3_domain/entities/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

extension FirebaseUserMapper on User{

  CustomUser toDomain(){
    return CustomUser(id: UniqueId.fromUniqueString(uid));
  }
}