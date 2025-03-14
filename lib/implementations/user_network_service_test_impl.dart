
import 'package:student_app/business/models/authenticate.dart';
import 'package:student_app/business/services/user_network_service.dart';

class UserNetworkServiceTestImpl implements UserNetworkService{
  List<Authentication> userDB = [
    Authentication(email: "test", password: "password"),
    Authentication(email: "test1", password: "pwd"),
    Authentication(email: "test2", password: "pwd2"),
  ];

  @override
  Future<bool> authenticate(Authentication data) {

    var recherche = userDB.where((e)=> e.email == data.email && e.password == data.password);

    if (recherche.isEmpty) {
      throw Exception("utilisateur non trouvé");
    } else {
      return Future.value(true);
    }

  }
}

void main() async {
  var service = UserNetworkServiceTestImpl();
  var donneeDuFormulaire = Authentication(email: "email", password: "password");

  try {
    var resultat = await service.authenticate(donneeDuFormulaire);

    if(resultat){}
  }
  catch (e) {
    print(e);
  }
}