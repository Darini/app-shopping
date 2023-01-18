class ProductItemListModel {
  String? id;
  String? title;
  String? brand;
  String? tag;
  double? price = 0;
  String? image;

  ProductItemListModel(
      {this.id, this.title, this.brand, this.tag, this.price, this.image});

  ProductItemListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    brand = json['brand'];
    tag = json['tag'];
    price = json['price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['title'] = title;
    data['brand'] = brand;
    data['tag'] = tag;
    data['price'] = price;
    data['image'] = image;

    return data;
  }
}
