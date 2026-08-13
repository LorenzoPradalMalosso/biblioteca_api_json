import 'package:biblioteca_api_json/model/book_model.dart';
import 'package:biblioteca_api_json/model/user_model.dart';

class LoanModel {
  // Atributos
  String? id;
  UserModel user;
  BookModel book;
  DateTime startDate;
  DateTime dueDate;
  bool returned;

  // Construtor
  LoanModel({
    this.id, 
    required this.user, 
    required this.book, 
    required this.startDate, 
    required this.dueDate, 
    required this.returned
  });

  // ToMap
  Map<String,dynamic> toMap() {
    return {
      'id' : id,
      'user' : user.toMap(),
      'book' : book.toMap(),
      'startDate' : startDate.toIso8601String(),
      'dueDate' : dueDate.toIso8601String(),
      'returned' : returned
    };
  }

  // FromMap => factory => construtor alternativo ao construtor principal
  factory LoanModel.fromMap(Map<String,dynamic> map) {
    return LoanModel(
      id: map['id'].toString(), 
      user: UserModel.fromMap(map['user']), 
      book: BookModel.fromMap(map['book']),
      startDate: DateTime.parse(map['startDate'].toString()),
      dueDate: DateTime.parse(map['dueDate'].toString()),
      returned: map['returned'] == true ? true : false
    );
  }
}