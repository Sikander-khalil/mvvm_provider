class Users {
  Users({
      List<Products>? products, 
      num? total, 
      num? skip, 
      num? limit,}){
    _products = products;
    _total = total;
    _skip = skip;
    _limit = limit;
}
Users.fromJson(dynamic json) {
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(Products.fromJson(v));
      });
    }
    _total = json['total'];
    _skip = json['skip'];
    _limit = json['limit'];
  }
  List<Products>? _products;
  num? _total;
  num? _skip;
  num? _limit;
Users copyWith({  List<Products>? products,
  num? total,
  num? skip,
  num? limit,
}) => Users(  products: products ?? _products,
  total: total ?? _total,
  skip: skip ?? _skip,
  limit: limit ?? _limit,
);
  List<Products>? get products => _products;
  num? get total => _total;
  num? get skip => _skip;
  num? get limit => _limit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    map['total'] = _total;
    map['skip'] = _skip;
    map['limit'] = _limit;
    return map;
  }

}
class Products {
  Products({
    num? id,
    String? title,
    String? description,
    num? price,
    num? discountPercentage,
    num? rating,
    num? stock,
    String? brand,
    String? category,
    String? thumbnail,
    List<String>? images,}) {
    _id = id;
    _title = title;
    _description = description;
    _price = price;
    _discountPercentage = discountPercentage;
    _rating = rating;
    _stock = stock;
    _brand = brand;
    _category = category;
    _thumbnail = thumbnail;
    _images = images;
  }

  Products.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
    _price = json['price'];
    _discountPercentage = json['discountPercentage'];
    _rating = json['rating'];
    _stock = json['stock'];
    _brand = json['brand'];
    _category = json['category'];
    _thumbnail = json['thumbnail'];
    _images = json['images'] != null ? json['images'].cast<String>() : [];
  }

  num? _id;
  String? _title;
  String? _description;
  num? _price;
  num? _discountPercentage;
  num? _rating;
  num? _stock;
  String? _brand;
  String? _category;
  String? _thumbnail;
  List<String>? _images;

  Products copyWith({ num? id,
    String? title,
    String? description,
    num? price,
    num? discountPercentage,
    num? rating,
    num? stock,
    String? brand,
    String? category,
    String? thumbnail,
    List<String>? images,
  }) =>
      Products(
        id: id ?? _id,
        title: title ?? _title,
        description: description ?? _description,
        price: price ?? _price,
        discountPercentage: discountPercentage ?? _discountPercentage,
        rating: rating ?? _rating,
        stock: stock ?? _stock,
        brand: brand ?? _brand,
        category: category ?? _category,
        thumbnail: thumbnail ?? _thumbnail,
        images: images ?? _images,
      );

  num? get id => _id;

  String? get title => _title;

  String? get description => _description;

  num? get price => _price;

  num? get discountPercentage => _discountPercentage;

  num? get rating => _rating;

  num? get stock => _stock;

  String? get brand => _brand;

  String? get category => _category;

  String? get thumbnail => _thumbnail;

  List<String>? get images => _images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['description'] = _description;
    map['price'] = _price;
    map['discountPercentage'] = _discountPercentage;
    map['rating'] = _rating;
    map['stock'] = _stock;
    map['brand'] = _brand;
    map['category'] = _category;
    map['thumbnail'] = _thumbnail;
    map['images'] = _images;
    return map;
  }

}