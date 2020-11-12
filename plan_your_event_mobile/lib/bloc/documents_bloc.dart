import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planyoureventmobile/models/document_model.dart';
import 'package:planyoureventmobile/models/supplier_model.dart';
import 'package:planyoureventmobile/repository/document_repository.dart';
import 'package:rxdart/rxdart.dart';

class DocumentsBloc extends BlocProvider {
  DocumnentRepository documentRepository = DocumnentRepository();
  final _documentsName = BehaviorSubject<String>();
  PublishSubject<String> partyID = PublishSubject();
  final PublishSubject<List<Document>> documentsList = PublishSubject<List<Document>>();
  Stream<List<Document>> get supplierListStream => documentsList.stream;

  final _error = BehaviorSubject<dynamic>();

  Stream<dynamic> get errorStream => _error.stream;

  Stream<String> get documentsStream => _documentsName.stream;

  Function(String) get changeDocumentItem => _documentsName.sink.add;

  bool updateShouldNotify(_) => true;

  getPartyDocuments(String partyId) async {
    List<Document> response = await documentRepository.getPartySupplier(partyId);
    documentsList.sink.add(response);
  }
  editDocumentStatus(Document document){
    documentRepository.editDocumentStatus(document);
  }
  Future<void> addDocuments(
      String partyId, String documentDescription) async {
    FirebaseAuth.instance.currentUser().then((FirebaseUser user) {
      String userId;
      if (user != null) {
        userId = user.uid;
      }
      Document document = Document(partyId: partyId, documentItem: documentDescription, isDone: false);
      return documentRepository.addSupplier(document);
    }).catchError((e) {
      print(e);
      _error.sink.addError(e);
      return null;
    });
    return null;
  }

  void dispose() async {
    _documentsName.close();
    partyID.close();
    documentsList.close();
    _error.close();
  }

  bool validateFields() {
    if (_documentsName.value != null &&
        _documentsName.value.isNotEmpty) {
      _error.sink.addError('ValueNotNull');
      return true;
    } else {
      return false;
    }
  }
}
