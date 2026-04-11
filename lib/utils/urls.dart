class Urls{

  static String _baseUrl = 'https://task.teamrabbil.com/api/v1';
  //static String _baseUrl = 'http://35.73.30.144:2005/api/v1';
  
  static String SignUpURL = '$_baseUrl/Registration';
  static String LoginUrl = '$_baseUrl/Login';
  static String AddTaskURL = '$_baseUrl/createTask';
  static String TaskCountURL = '$_baseUrl/taskStatusCount';
  static String ProfileUpdateURL = '$_baseUrl/ProfileUpdate';
  static String TaskByStatusURL(String status) => '$_baseUrl/listTaskByStatus/$status';
  static String DeleteTaskURL(String id) => '$_baseUrl/deleteTask/$id';
  static String ChangeStatusURL(String id, String status) => '$_baseUrl/updateTaskStatus/$id/$status';
  static String emailVerificationURL(String email) => '$_baseUrl/RecoverVerifyEmail/$email';
  static String verifyOTPURL(String email,String otp) => '$_baseUrl/RecoverVerifyOTP/$email/$otp';
  static String resetPasswordURL = '$_baseUrl/RecoverResetPassword';

}