import 'dart:async' show Future;
import 'dart:convert';
// import 'package:html/parser.dart' show parse;
// import 'package:html/dom.dart';
// import 'package:http/http.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:james_childrens_app/models/book.dart' show Book;
import 'package:james_childrens_app/models/user.dart' show User;
import 'package:flutter/services.dart' show rootBundle;
import 'package:james_childrens_app/services/db_service.dart';
import 'package:scoped_model/scoped_model.dart' as scopedModel;
import 'package:james_childrens_app/services/login_service.dart';

 class CustomBookListModel extends scopedModel.Model {
  DatabaseService _dataBaseService = new DatabaseService();
  // TODO get custom boooks from DB
  
  // TODO return list of custom books from DB
}

class AppModel extends scopedModel.Model with CustomBookListModel{
}

class ModelBuilder{
  DatabaseService _dataBaseService;
  ModelBuilder(){}

  void createBook() async {

    // TODO save image to mongo db
    // get mongodb uri , save to objectDB
    // setup form to have user input title, book body

  }

  Future<List<Book>> getCustomBook() async {
    _dataBaseService = new DatabaseService();
    List<Map<dynamic, dynamic>> rawBooks;
    List<Book> list = new List<Book>();
    String category = "custom";
    // rawBooks = await _dataBaseService.getCustomBookFromDb(category);
    // for(var item in rawBooks){
    //  print($item);
    // }
    return list;
  }

  void uploadImageToMongo() {
    _dataBaseService = new DatabaseService();
    // save path to local db
    _dataBaseService.saveImagePath();
  }

  void saveProfile(Map<String, dynamic> user){
    _dataBaseService = new DatabaseService();
    _dataBaseService.saveProfile(user);
  }
  
  // get only the user that is logged on
  Future<User> getUserProfile() async {
    _dataBaseService = new DatabaseService();
    bool isCurrentUser = true;
    Map<dynamic, dynamic> u = await _dataBaseService.getUserFromDB(isCurrentUser);
    // _dataBaseService.deleteAll();
    // User user = new User(u["name"], u["profile"], u["email"], u["image"], u["editlink"]);
    // var userJson = json.decode(u.toString());
    User user = User.fromJson(u);
    // print("USER MODEL : ${user.email}");
    // print("USER MODEL PARSED : $user");
    String email = user.email;
        String link = user.link;
    String name = user.name;
    String picture = user.picture;
    print("USER MODEL EMAIL $email PICTURE $picture NAME $name LINK $link");
    return user;
  }

  void deleteAll() async {
    _dataBaseService = new DatabaseService();
    _dataBaseService.deleteAll();
  }

// TODO use objectdb to build  prototype , production will use cloud backend as a service
  static Future<String> getAllBooks() async {
    var res = await rootBundle.loadString('assets/books.json');
    Map cid = jsonDecode(res);
    return cid["clientSecret"];
  }

  // TODO get all books
  // using lodash or underscore for managing the initial json data will transfer over to when
  // cloud backend is hooked up
  // TODO yield a list of books based on category 
  // TODO return a list of book based on number of categories, order not necessary
  // TODO return an object based on title
  // GET params VAR1 VAR2
  // GET http://www.childrenslibrary.org/icdl/TextSearch?term=VAR1+VAR2&lang=English&search=Search
  Future<String> _getBooksFromFile() async {
    return await rootBundle.loadString("assets/books.json");
  }

  Future<List<String>> getCategoryList() async {
    List<String> catList = new List<String>();
    var rawDataString = await _getBooksFromFile(); 
    Map decodedData = json.decode(rawDataString);
    // if(decodedData == null ){ print("false"); return catList;}
    if(decodedData is Map<String, dynamic>){
      // print("true");
    }
    var len = decodedData["books"].length;
    // print("DATA length: $len");
    List<dynamic> bookListRaw = decodedData["books"];
    Set<String> catSet = new Set();
    bookListRaw.forEach((item){
      catSet.add(item["category"]);
    });
    catList = catSet.toList();
    return catList;
  }

  Future<List<Book>> getBooksByCategory(String category) async {
    var rawDataString = await _getBooksFromFile(); 
    Map decodedData = json.decode(rawDataString);
    List<Book> catList = new List<Book>();
    List<dynamic> bookListRaw = decodedData["books"];
    bookListRaw.forEach((item){
      if(item["category"] == category){
        Book b = new Book(item["title"], item["author"], item["preview"], item["link"], item["category"]);
        catList.add(b);
      }
    });
    // print("DATA 3");
    // print(catList.toString());
    return catList;
  }

  // TODO use the html package to send GET request with parameters
  // http://www.childrenslibrary.org/icdl/TextSearch?sort=match&page=1&route=text&view=cover&location=everywhere&ilangcode=en&ilang=English&term=fable&lang=English&search=Search
  // https://stackoverflow.com/questions/49899164/convert-string-to-get-request-parameter-in-dart-using-standard-library
  // param "+" delimited string
  Future<String> _getBooksFromNetwork(List<String> queryToSearch) async {
    var htmlSource = "http://www.childrenslibrary.org/icdl/TextSearch?sort=match&page=1&route=text&view=cover&location=everywhere&ilangcode=en&ilang=English&lang=English&search=Search&term=";
    List data = new List();
    var httpClient = new HttpClient();
    var buffer = new StringBuffer();
    for(var item in queryToSearch){
      buffer.write(item);
      buffer.write("+");
    }
    /*
    var request = await httpClient.getUrl(Uri.parse(
        config['API_ENDPOINT'] + '/search?query=' +
            queryToSearch));
    */
    var request = await httpClient.getUrl(Uri.parse(htmlSource + buffer.toString()));

    var response = await request.close();
    if (response.statusCode == HttpStatus.OK) {
      // TODO response is in html format not json so parse html using global parse()
      // var document = parse(response);
      // var jsonString = await response.transform(utf8.decoder).join();
      // data = json.decode(jsonString);
      // print(data[0]);
      // return data[0].toString();
      // print("html response: $document");
    } else {
      return "{}";
    }
  }

  
}