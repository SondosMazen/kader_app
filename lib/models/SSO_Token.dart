class SSO_Token {
  String tokenType;
  int expiresIn;
  String accessToken;
  String refreshToken;
  String status;

  SSO_Token(
      {this.tokenType,
        this.expiresIn,
        this.accessToken,
        this.refreshToken,
        this.status});

  SSO_Token.fromJson(Map<String, dynamic> json) {
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token_type'] = this.tokenType;
    data['expires_in'] = this.expiresIn;
    data['access_token'] = this.accessToken;
    data['refresh_token'] = this.refreshToken;
    data['status'] = this.status;
    return data;
  }
}