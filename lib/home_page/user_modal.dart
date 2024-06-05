class User {
  String memberid;
  String membername;
  String membermobile;
  String memberemail;
  String memberadress;
  String memberlat;
  String memberlong;
  String memberimg;

  User({
    required this.membername,
    required this.memberid,
    required this.memberadress,
    required this.memberlat,
    required this.memberemail,
    required this.memberlong,
    required this.membermobile,
    required this.memberimg,
  });

  factory User.fromJson(Map<String, Object?> json) => User(
        memberadress: '${json['ADDRESS']}',
        memberlong: '${json['GEOLONG']}',
        memberemail: '${json['MEMBEREMAIL']}',
        memberlat: '${json['GEOLAT']}',
        membername: '${json['MEMBERNAME']}',
        memberid: '${json['MEMBERID']}',
        membermobile: '${json['MEMBERMOBILE']}',
        memberimg: '${json['IMAGE']}',
      );
}
