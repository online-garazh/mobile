class AccessToken {
  final String accessToken;

  AccessToken({
    required this.accessToken,
  });

  factory AccessToken.fromJson(Map<String, dynamic> json) {
    return AccessToken(
      accessToken: json["access_token"],
    );
  }

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
      };
}
// {
//     "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwiZW1haWwiOiI0a3VwZXJAZ21haWwuY29tIiwiaWF0IjoxNjg5ODc5NDA4LCJleHAiOjE3MjE0MTU0MDh9.xcj4JKStnM4QcYMQHMywdDtrsNrwMrxni86kSI7wClg"
// }