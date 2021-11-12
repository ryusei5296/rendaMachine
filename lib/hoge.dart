import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void Memo() async {
  final database = openDatabase(
    join(await getDatabasesPath(), 'user_database.db'),
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE memo(id INTEGER PRIMARY KEY, text TEXT, priority INTEGER)",
      );
    },
    version: 1,
  );

  Future<void> insertMemo(User user) async {
    final Database db = await database;
    await db.insert(
      'user',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<User>> getMemos() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('memo');
    return List.generate(maps.length, (i) {
      return User(
        id: maps[i]['id'],
        text: maps[i]['text'],
        priority: maps[i]['priority'],
      );
    });
  }

  Future<void> updateMemo(User user) async {
    // Get a reference to the database.
    final db = await database;
    await db.update(
      'user',
      user.toMap(),
      where: "id = ?",
      whereArgs: [user.id],
      conflictAlgorithm: ConflictAlgorithm.fail,
    );
  }

  var user = User(
    id: 0,
    text: 'Flutterで遊ぶ',
    priority: 1,
  );

  await insertMemo(user);

  print(await getMemos());

  user = User(
    id: user.id,
    text: user.text,
    priority: user.priority,
  );
  await updateMemo(user);
}

class User {
  final int? id;
  final String? text;
  final int? priority;

  User({this.id, this.text, this.priority});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'priority': priority,
    };
  }
  @override
  String toString() {
    return 'Memo{id: $id, tet: $text, priority: $priority}';
  }
}