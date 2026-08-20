import 'package:biblioteca_api_json/model/book_model.dart';
import 'package:biblioteca_api_json/service/api_service.dart';

class BookController {

  //não precisa criar um obj da classe ApiService ( Static)

  //métodos

  //fetch //read
  Future<List<BookModel>> fetchAll() async{
    final list = await ApiService.getList("books"); //estabelece a conexão
    return list.map((item)=>BookModel.fromMap(item)).toList(); // transforma o resulta em uma lista de objetos   
  }

  //fetchOne //readOne
  Future<BookModel> fetchOne(String id) async{
    final Map<String,dynamic> book = await ApiService.getOne("books", id);
    return BookModel.fromMap(book);
  }

  //create
  Future<BookModel> create(BookModel book) async{
    final map = await ApiService.post("books", book.toMap());
    return BookModel.fromMap(map);
  }

  //update
  Future<BookModel> update(BookModel book) async{
    final map = await ApiService.put("books", book.toMap(), book.id!); // quan a diferença entre ! e ??
                                                               //!: Força o valor a ser nulo, ??: Tem um valor reserva caso seja nulo
    return BookModel.fromMap(map);
  }

  //delete
  void delete(String id) async{
    await ApiService.delete("books", id);
  }
}