
import 'package:flutter/cupertino.dart';
import 'package:planyoureventmobile/datasources/documents/documents_api_provider.dart';
import 'package:planyoureventmobile/models/document_model.dart';

class DocumnentRepository with ChangeNotifier {
  final _documentApiProvider = DocumentApiProvider();

  Future <String> addSupplier (Document document) => _documentApiProvider.addDocument(document);

  Future <List<Document>> getPartySupplier (String partyId) => _documentApiProvider.getPartyDocuments(partyId);

  void editDocumentStatus(Document document) {
    _documentApiProvider.editDocumentStatus(document);
  }
}