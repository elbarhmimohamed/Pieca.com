class PanierProductModel {
  String idProduct, name, image;
  int prix, qte, stock;

  PanierProductModel({
    this.idProduct,
    this.name,
    this.image,
    this.prix,
    this.qte,
    this.stock,
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
