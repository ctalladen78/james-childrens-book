import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:objectdb/objectdb.dart';

class DatabaseService{
  ObjectDB db;
  var doesDbExist;
  File dbFile;
  String dbFilePath;
  DatabaseService();
  
  // TODO use mlab to upload json and image file
  init() async {
    // get document directory using path_provider plugin
    Directory appDocDir = await getApplicationDocumentsDirectory();

    dbFilePath = [appDocDir.path, 'user.db'].join('/');
    print("DB path $dbFilePath");
    
    // initialize and open database
    db = ObjectDB(dbFilePath);
    // delete old database file if exists
    dbFile = File(dbFilePath);

    // check if database does not exist
    doesDbExist = await dbFile.exists();
    print("DB exists ? $doesDbExist");
  }

  get getDb => db;
  get doesDBExist => doesDbExist;

  // TODO use objectdb to save json and image paths
  // https://github.com/netz-chat/flutter_examples/blob/master/objectdb/listview/lib/main.dart
  

  // TODO use image picker to get images from camera or local files
   void _getImageFromDB(){
    db.close();
  }

   bool existsProfile(String email){
    db.close();
  }
  void deleteAll() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    dbFilePath = [appDocDir.path, 'user.db'].join('/');
    db = ObjectDB(dbFilePath);
    db.open();
    await db.remove({"verified_email" : true});  // TODO remove all items from db

    db.close();
  }

  void checkDb() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    dbFilePath = [appDocDir.path, 'user.db'].join('/');
    db = ObjectDB(dbFilePath);
    db.open();
List<Map<dynamic, dynamic>> userList2 = await db.find({"verified_email": true}); // get all items
      for(var item in userList2){
        print("USER CHECK $item");
      } 
    db.close();
  }
  
    // db operations : db.find(), db.insertMany, db.insert, db.remove, db.update
    // TODO search user if exists then set its isCurrentUser key to false
   Future<bool> saveProfile(Map<String, dynamic> user) async {
    try{
      print(user["email"]);
      String email = user["email"];

      print("TRY SET USER : $user");
      Directory appDocDir = await getApplicationDocumentsDirectory();
      dbFilePath = [appDocDir.path, 'user.db'].join('/');
      db = ObjectDB(dbFilePath);
      db.open();
      // there is only one current user so delete all pre-existing ones
      await db.remove({"verified_email" : true});  // TODO remove all items from db
      user.addAll({"isCurrentUser" : true});
      var result = await db.insert(user);
      // var result = await db.insertMany(userList);
      print("ADDED $result");
      db.close();
      // check db
      // checkDb();
      return true;
    }
    catch(Exception){
      print(Exception);
      return false;
    }
  }

  // return json object
  Future<Map<dynamic, dynamic>> getUserFromDB(bool isCurrentUser) async {
    try{
      // get document directory using path_provider plugin
      Directory appDocDir = await getApplicationDocumentsDirectory();
      dbFilePath = [appDocDir.path, 'user.db'].join('/');    
      // initialize and open database
      db = ObjectDB(dbFilePath);
      db.open();
      Map<dynamic, dynamic> user;
      List<Map<dynamic, dynamic>> userList2 = await db.find({"verified_email": true}); // get all items
      for(var item in userList2){
        print("USER LIST $item");
        if(item["isCurrentUser"] == isCurrentUser){
          user = item;
        }
      }
      db.close();
      return user;
    }
    catch(Exception){
      print(Exception);
      return null;
    }
  }

  void saveImagePath() {

  }
}