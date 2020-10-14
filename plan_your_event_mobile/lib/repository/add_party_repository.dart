import 'package:planyoureventmobile/datasources/add_party/add_party_api_provider.dart';
import 'package:planyoureventmobile/models/event_model.dart';

class AddPartyRepository {
  AddPartyApiProvider _addPartyApiProvider = AddPartyApiProvider();

  Future<Event> getParty(){
    return _addPartyApiProvider.getParty();
  }


  Future<int> registerUser(Event event){
    return _addPartyApiProvider.postParty(event);
  }
}