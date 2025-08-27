import 'package:router_demo/models/form_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userDataProvider = StateProvider<UserData>((ref) {
  return UserData.empty;
});
