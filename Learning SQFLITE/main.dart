import 'package:sqflite_common_ffi/sqflite_ffi.dart';

Future main() async {
  // Init ffi loader if needed.
  sqfliteFfiInit();

  var databaseFactory = databaseFactoryFfi;
  var db = await databaseFactory.openDatabase(inMemoryDatabasePath);       
  
  await db.execute('''
  CREATE TABLE Student (
      id INTEGER PRIMARY KEY,
      school TEXT,
      age INTEGER
  )
  ''');
  await db.insert('Student',{'school': 'No.1 Meikhtila','age' : 20});
  await db.insert('Student',{'school': 'No.2 Meikhtila','age' : 21});
  await db.insert('Student',{'school': 'No.3 Meikhtila','age' : 22});

  var idToUpdate = 2;
  await db.update('Student', {'school': 'No.22 Meikhtila'},
      where: 'id = ?', whereArgs: [idToUpdate]);
  await db.update('Student', {'school': 'No.33 Meikhtila'},
      where: 'id=?', whereArgs: [3]);
  await db.delete('Student', where: 'id=?', whereArgs: [1]);
  var result = await db.query('Student');
  print(result);
  // var result =
  //     await db.query('Student', where: 'id=?', whereArgs: [idToUpdate]);
  // var result1 = await db.query('Student', where: 'id=?', whereArgs: [3]);
  // print(result);
  // print(result1);
  await db.close();
}
