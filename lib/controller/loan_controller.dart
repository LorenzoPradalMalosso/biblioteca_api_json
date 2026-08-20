import 'package:biblioteca_api_json/model/loan_model.dart';
import 'package:biblioteca_api_json/service/api_service.dart';

class LoanController {


  //não precisa criar um obj da classe ApiService ( Static)

  //métodos

  //fetch //read
  Future<List<LoanModel>> fetchAll() async{
    final list = await ApiService.getList("loans"); //estabelece a conexão
    return list.map((item)=>LoanModel.fromMap(item)).toList(); // transforma o resulta em uma lista de objetos   
  }

  //fetchOne //readOne
  Future<LoanModel> fetchOne(String id) async{
    final Map<String,dynamic> loan = await ApiService.getOne("loans", id);
    return LoanModel.fromMap(loan);
  }

  //create
  Future<LoanModel> create(LoanModel loan) async{
    final map = await ApiService.post("loans", loan.toMap());
    return LoanModel.fromMap(map);
  }

  //update
  Future<LoanModel> update(LoanModel loan) async{
    final map = await ApiService.put("loans", loan.toMap(), loan.id!); // quan a diferença entre ! e ??
                                                               //!: Força o valor a ser nulo, ??: Tem um valor reserva caso seja nulo
    return LoanModel.fromMap(map);
  }

  //delete
  void delete(String id) async{
    await ApiService.delete("loans", id);
  }
}