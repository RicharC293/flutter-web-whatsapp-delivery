class ProductsModel {
  final int uId;
  final String name;
  final String description;
  final double price;
  final String image;
  bool addToCart;

  ProductsModel(this.uId, this.name, this.description, this.price, this.image,
      this.addToCart);
}
