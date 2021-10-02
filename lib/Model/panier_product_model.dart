class PanierProductModel {
  String idProduct, name, image;
  int prix, qte, stock;

  PanierProductModel({
    required this.idProduct,
    required this.name,
    required this.image,
    required this.prix,
    required this.qte,
    required this.stock,
  });

  factory PanierProductModel.fromJson(Map<dynamic, dynamic> map) =>
      new PanierProductModel(
        idProduct: map['idProduct'],
        name: map['name'],
        image: map['image'],
        prix: map['prix'],
        qte: map['qte'],
        stock: map['stock'],
      );

  Map<String, dynamic> toMap() => {
        'idProduct': idProduct,
        'name': name,
        'image': image,
        'prix': prix,
        'qte': qte,
        'stock': stock,
      };
}
