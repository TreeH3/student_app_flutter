import 'package:student_app/business/models/authenticate.dart';

abstract class UserNetworkService {
  Future<bool> authenticate(Authentication data);
}