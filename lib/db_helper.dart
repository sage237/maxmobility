import 'dart:developer';
import 'dart:io';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  ///Creates a table named students
  static Future<void> createTables(sql.Database database, int version) async {
    await database.execute(
        '''CREATE TABLE MEMBERS (MEMBERID INTEGER PRIMARY KEY AUTOINCREMENT ,MEMBERNAME TEXT,MEMBERMOBILE TEXT,MEMBEREMAIL TEXT,GEOLAT TEXT,GEOLONG TEXT)''');
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'offlinedb.db',
      version: 1,
      onCreate: createTables,
    );
  }

  static Future<void> addUsers(
      {required String name,
      required String mobile,
      required String email,
      required String lat,
      required String long}) async {
    final db = await SQLHelper.db();
    // db.delete('TouristplaceMst');
    var id = await db.insert('MEMBERS', {
      'MEMBERID':null,
      'MEMBERNAME': '$name',
      'MEMBERMOBILE': '$mobile',
      'MEMBEREMAIL': '$email',
      'GEOLAT': '$lat',
      'GEOLONG': '$long',
    });

    log('Id $id dbs: ${await db.query('MEMBERS')}');
    await saveImage(id);
  }

  static Future<List<Map<String, Object?>>> getAllUsers() async {
    // log('cate $cateId Lang $selectedLang');
    final db = await SQLHelper.db();
    //  final data=await db.rawQuery('''SELECT * FROM TouristplaceMst WHERE CategoryID=? and LanguageID=?''',[cateId,'${selectedLang['LangID']}']);
    // log('Place List $data');

    return await db.query(
      'MEMBERS',
    );
  }

  static Future<void> deleteUeseTable() async {
    final db = await SQLHelper.db();
    db.delete('MEMBERS');
  }

  static saveImage(int id) {}
}
// Future<void> download(String url) async {
//
//   String downUrl='${urlStr}$url';
//   // log("Website $downUrl");
//   try{final data = await http.get(Uri.parse(downUrl));
//   final filedata = data.bodyBytes;
//   if (await Permission.storage.request().isGranted) {
//     Directory? documentDirectory = await getExternalStorageDirectory();
//
//     if (documentDirectory != null) {documentDirectory = await documentDirectory.create(recursive: true);
//     Directory adit = await Directory(
//         '${documentDirectory.path}/${path.dirname(url)}').create(recursive: true);
//     File file = await File('${adit.path}/${url
//         .split('/')
//         .last}').create();
//     var filewr = file.openSync(mode: FileMode.write);
//     filewr.writeFrom(filedata);}
//     // await filewr.close();
//   }
//     // file.writeAsBytes(bytes)
//     // log("Loggg $file");
//   }finally{}
// }
