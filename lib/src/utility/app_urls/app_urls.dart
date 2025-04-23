class Urls{
  Urls._();
  static const String _baseUrl = "https://dummyjson.com";
  static  String get baseUrl => _baseUrl;


  static  String  productUrl = "$_baseUrl/products/";
  static  String  searchProductUrl(String searchProduct) => "$_baseUrl/products/search?q=$searchProduct";
  static  String  orderQueryUrl(String sortBy,String orderQuery) => "$_baseUrl/products?sortBy=$sortBy&order=$orderQuery";


}