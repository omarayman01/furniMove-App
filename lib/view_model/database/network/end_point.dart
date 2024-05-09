class EndPoints {
  static const String baseUrl =
      'https://furnimove20240301161609.azurewebsites.net';
  static const String login = '/api/Account/login';
  static const String resetPaswword = '/api/Account/resetPassword';

  static const String confirmEmail = '/api/Account/sendEmailConfirmation';

  static const String register = '/api/Account/register';

  static const String getAllMoveRequests =
      '/api/Admin/GetAllMoveRequests?status=created';
  static const String getMoveRequestById = '/api/Admin/getMoveRequestById';
  static const String getUsersByRole = '/api/Admin/getUsersByRole';
  static const String updateUser = '/api/Account/updateUser';
  static const String addUserImg = '/api/Account/addUserImg';
  static const String deleteUserImg = '/api/Account/deleteUserImg';
}
