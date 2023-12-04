import 'FirebaseAdmin.dart';

class DataHolder{

  static final DataHolder _dataHolder = DataHolder._internal();

  String sNombre= "Examen DataHolder";
  FirebaseAdmin fbadmin=FirebaseAdmin();

  DataHolder._internal() {

  }
}