



class Api{

  static const baseUrl = 'https://back-service-0dwa.onrender.com';

  ///user auths api
  static const userLogin = '$baseUrl/api/userLogin';
  static const userSignUp = '$baseUrl/api/userSignUp';
  static const userUpdate = '$baseUrl/api/userUpdate';

  ///products api
  static const getAllProducts = '$baseUrl/api/products';
  static const addProduct = '$baseUrl/api/add-product';
  static const crudProduct  = '$baseUrl/api/product';


  ///orders api

  static const addOrder  = '$baseUrl/api/create-order';
  static const userOrder  = '$baseUrl/api/order/user';
  static const orderDetail  = '$baseUrl/api/order';

}