class SSO_Info {
  String status;
  String message;
  String clientId;
  String userId;
  String accountType;
  String name;
  String email;
  String birthDate;
  String userGender;
  String mobile;
  String ministryCd;

  SSO_Info(
      {this.status,
        this.message,
        this.clientId,
        this.userId,
        this.accountType,
        this.name,
        this.email,
        this.birthDate,
        this.userGender,
        this.mobile,
        this.ministryCd});

  SSO_Info.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    clientId = json['client_id'];
    userId = json['user_id'];
    accountType = json['account_type'];
    name = json['name'];
    email = json['email'];
    birthDate = json['birth_date'];
    userGender = json['user_gender'];
    mobile = json['mobile'];
    ministryCd = json['ministry_cd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['client_id'] = this.clientId;
    data['user_id'] = this.userId;
    data['account_type'] = this.accountType;
    data['name'] = this.name;
    data['email'] = this.email;
    data['birth_date'] = this.birthDate;
    data['user_gender'] = this.userGender;
    data['mobile'] = this.mobile;
    data['ministry_cd'] = this.ministryCd;
    return data;
  }
}