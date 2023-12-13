import 'package:flutter/material.dart';

import '../models/Users.dart';
import '../services/api_services.dart';

enum Status{
  SUCCESSSFUL,
  UNSUCESSFUL,
}

class UsersProvider extends ChangeNotifier {
  Users? _userData;
  Status? _userStatus;
  int _skip = 0;
  int _limit = 20;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Status? get userStatus => _userStatus;

  Users? get userData => _userData;

  Future<Users?> fetchUserData() async {

    try {
      _isLoading = true;
      notifyListeners();

        Status statusSuccess = Status.SUCCESSSFUL;
      Users fetchedData = await AppServices().productsApi(skip: _skip, limit: _limit);

        _userData = fetchedData;

        _userStatus = statusSuccess;
      _isLoading = false;
        return _userData;


    } catch (e) {
      Status statusUnSuccess = Status.UNSUCESSFUL;

      print('Error fetching data: $e');
      _userStatus = statusUnSuccess;
      throw e;

    }
  }




}
