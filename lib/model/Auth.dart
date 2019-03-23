class UserDetails {
  final String accessToken;
  final String mobileNumber;
  final String message;
 
  UserDetails(this.accessToken, this.mobileNumber, this.message);
}

class OtpLogin{
  final bool checkUserexist;
  final String otpValue;

OtpLogin(this.otpValue,this.checkUserexist);
}


