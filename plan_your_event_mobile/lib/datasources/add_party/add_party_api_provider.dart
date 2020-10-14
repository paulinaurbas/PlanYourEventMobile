import 'package:planyoureventmobile/datasources/auth/http_handler.dart';
import 'package:planyoureventmobile/models/event_model.dart';

class AddPartyApiProvider {

  Future<Event> getParty() async {
    final String _endpoint = "http://192.168.0.113:8080/api/register_user";
    return await HttpHandler().getFromApi(_endpoint).then((response) =>  Event.fromJson(response.data));
  }

  Future<int> postParty(Event event) async {
    final String _endpoint = "http://192.168.0.113:8080/api/create_event";
    return await HttpHandler().postToApi(_endpoint).then((response) => response.statusCode);
  }
}
