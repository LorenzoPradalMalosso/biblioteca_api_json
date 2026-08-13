class BookModel {
  // Atributos
  String? id;
  String title;
  String author;
  bool available;

  // Construtor
  BookModel({
    this.id, 
    required this.title, 
    required this.author, 
    required this.available
  });

  // ToMap
  Map<String,dynamic> toMap() {
    return {
      'id' : id,
      'title' : title,
      'author' : author,
      'avaliable' : available
    };
  }

  // FromMap => factory => construtor alternativo ao construtor principal
  factory BookModel.fromMap(Map<String,dynamic> map) {
    return BookModel(
      id: map['id'].toString(), 
      title: map['name'].toString(), 
      author: map['email'].toString(),
      // Verificação de Valor
      available: map['avaliable'] == true ? true : false
    );
  }
}