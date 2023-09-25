import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/user_model.dart';
import '../services/auth_services.dart';

final getSingleUser =
    FutureProvider.family<UserModel, String>((ref, userId) async {
  return ref.watch(authProvider).getSingleUser(userId);
});
