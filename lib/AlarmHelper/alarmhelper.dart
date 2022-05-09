import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:islamicapp/authentications/providers/models/alarminfo.dart';

final String tableAlarm = 'alarm';
final String columnId = 'id';
final String columnTitle = 'title';
final String columnDateTime = 'alarmDateTime';
final String columnPending = 'isPending';
final String columnColorIndex = 'gradientColorIndex';

class AlarmHelper {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'alarm.db'),
      onCreate: (database, version) async {
        await database.execute('''
          create table $tableAlarm ( 
          $columnId integer primary key autoincrement, 
          $columnTitle text not null,
          $columnDateTime text not null,
          $columnPending integer,
          $columnColorIndex integer)
        ''');
      },
      version: 1,
    );
  }

  // Future<Database> initializeDatabase() async {
  //   var dir = await getDatabasesPath();
  //   var path = dir + "alarm.db";

  //   var database = await openDatabase(
  //     path,
  //     version: 1,
  //     onCreate: (db, version) {
  //       db.execute('''
  //         create table $tableAlarm (
  //         $columnId integer primary key autoincrement,
  //         $columnTitle text not null,
  //         $columnDateTime text not null,
  //         $columnPending integer,
  //         $columnColorIndex integer)
  //       ''');
  //     },
  //   );
  //   return database;
  // }

  void insertAlarm(AlarmInfo alarmInfo) async {
    var db = await initializeDB();
    var result = await db.insert(tableAlarm, alarmInfo.toMap());
    print('result : $result');
  }

  Future<List<AlarmInfo>> getAlarms() async {
    List<AlarmInfo> _alarms = [];

    var db = await initializeDB();
    var result = await db.query(tableAlarm);
    result.forEach((element) {
      var alarmInfo = AlarmInfo.fromMap(element);
      _alarms.add(alarmInfo);
    });

    return _alarms;
  }

  Future<int> delete(int id) async {
    var db = await initializeDB();
    return await db.delete(tableAlarm, where: '$columnId = ?', whereArgs: [id]);
  }
}
