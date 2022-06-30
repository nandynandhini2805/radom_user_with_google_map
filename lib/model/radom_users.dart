/// results : [{"gender":"female","name":{"title":"Ms","first":"Freja","last":"Kristensen"},"location":{"street":{"number":5990,"name":"Allegade"},"city":"Randers Nø","state":"Nordjylland","country":"Denmark","postcode":83026,"coordinates":{"latitude":"-27.4288","longitude":"115.3825"},"timezone":{"offset":"-3:00","description":"Brazil, Buenos Aires, Georgetown"}},"email":"freja.kristensen@example.com","login":{"uuid":"56d590aa-c9e9-428d-88c1-c9285091d58c","username":"bigrabbit630","password":"sapphire","salt":"M6JjFZVI","md5":"19b940adb121b2a2ad80a1664780ee5e","sha1":"feaa30c52a6ce51f953ccc3012688fefca062fba","sha256":"6f12f5530a4418c14e071e8bf3ab3d6da764c587838f7344310a5826b1fd7d28"},"dob":{"date":"1952-08-08T00:17:45.918Z","age":70},"registered":{"date":"2011-05-19T17:55:35.983Z","age":11},"phone":"05083575","cell":"40542680","id":{"name":"CPR","value":"080852-2393"},"picture":{"large":"https://randomuser.me/api/portraits/women/32.jpg","medium":"https://randomuser.me/api/portraits/med/women/32.jpg","thumbnail":"https://randomuser.me/api/portraits/thumb/women/32.jpg"},"nat":"DK"}]
/// info : {"seed":"d95740c3f2f4cc20","results":1,"page":1,"version":"1.3"}

class RadomUsers {
  RadomUsers({
      List<Results>? results, 
      Info? info,}){
    _results = results;
    _info = info;
}

  RadomUsers.fromJson(dynamic json) {
    if (json['results'] != null) {
      _results = [];
      json['results'].forEach((v) {
        _results?.add(Results.fromJson(v));
      });
    }
    _info = json['info'] != null ? Info.fromJson(json['info']) : null;
  }
  List<Results>? _results;
  Info? _info;

  List<Results>? get results => _results;
  Info? get info => _info;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_results != null) {
      map['results'] = _results?.map((v) => v.toJson()).toList();
    }
    if (_info != null) {
      map['info'] = _info?.toJson();
    }
    return map;
  }

}

/// seed : "d95740c3f2f4cc20"
/// results : 1
/// page : 1
/// version : "1.3"

class Info {
  Info({
      String? seed, 
      int? results, 
      int? page, 
      String? version,}){
    _seed = seed;
    _results = results;
    _page = page;
    _version = version;
}

  Info.fromJson(dynamic json) {
    _seed = json['seed'];
    _results = json['results'];
    _page = json['page'];
    _version = json['version'];
  }
  String? _seed;
  int? _results;
  int? _page;
  String? _version;

  String? get seed => _seed;
  int? get results => _results;
  int? get page => _page;
  String? get version => _version;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['seed'] = _seed;
    map['results'] = _results;
    map['page'] = _page;
    map['version'] = _version;
    return map;
  }

}

/// gender : "female"
/// name : {"title":"Ms","first":"Freja","last":"Kristensen"}
/// location : {"street":{"number":5990,"name":"Allegade"},"city":"Randers Nø","state":"Nordjylland","country":"Denmark","postcode":83026,"coordinates":{"latitude":"-27.4288","longitude":"115.3825"},"timezone":{"offset":"-3:00","description":"Brazil, Buenos Aires, Georgetown"}}
/// email : "freja.kristensen@example.com"
/// login : {"uuid":"56d590aa-c9e9-428d-88c1-c9285091d58c","username":"bigrabbit630","password":"sapphire","salt":"M6JjFZVI","md5":"19b940adb121b2a2ad80a1664780ee5e","sha1":"feaa30c52a6ce51f953ccc3012688fefca062fba","sha256":"6f12f5530a4418c14e071e8bf3ab3d6da764c587838f7344310a5826b1fd7d28"}
/// dob : {"date":"1952-08-08T00:17:45.918Z","age":70}
/// registered : {"date":"2011-05-19T17:55:35.983Z","age":11}
/// phone : "05083575"
/// cell : "40542680"
/// id : {"name":"CPR","value":"080852-2393"}
/// picture : {"large":"https://randomuser.me/api/portraits/women/32.jpg","medium":"https://randomuser.me/api/portraits/med/women/32.jpg","thumbnail":"https://randomuser.me/api/portraits/thumb/women/32.jpg"}
/// nat : "DK"

class Results {
  Results({
      String? gender, 
      Name? name, 
      Location? location, 
      String? email, 
      Login? login, 
      Dob? dob, 
      Registered? registered, 
      String? phone, 
      String? cell, 
      Id? id, 
      Picture? picture, 
      String? nat,}){
    _gender = gender;
    _name = name;
    _location = location;
    _email = email;
    _login = login;
    _dob = dob;
    _registered = registered;
    _phone = phone;
    _cell = cell;
    _id = id;
    _picture = picture;
    _nat = nat;
}

  Results.fromJson(dynamic json) {
    _gender = json['gender'];
    _name = json['name'] != null ? Name.fromJson(json['name']) : null;
    _location = json['location'] != null ? Location.fromJson(json['location']) : null;
    _email = json['email'];
    _login = json['login'] != null ? Login.fromJson(json['login']) : null;
    _dob = json['dob'] != null ? Dob.fromJson(json['dob']) : null;
    _registered = json['registered'] != null ? Registered.fromJson(json['registered']) : null;
    _phone = json['phone'];
    _cell = json['cell'];
    _id = json['id'] != null ? Id.fromJson(json['id']) : null;
    _picture = json['picture'] != null ? Picture.fromJson(json['picture']) : null;
    _nat = json['nat'];
  }
  String? _gender;
  Name? _name;
  Location? _location;
  String? _email;
  Login? _login;
  Dob? _dob;
  Registered? _registered;
  String? _phone;
  String? _cell;
  Id? _id;
  Picture? _picture;
  String? _nat;

  String? get gender => _gender;
  Name? get name => _name;
  Location? get location => _location;
  String? get email => _email;
  Login? get login => _login;
  Dob? get dob => _dob;
  Registered? get registered => _registered;
  String? get phone => _phone;
  String? get cell => _cell;
  Id? get id => _id;
  Picture? get picture => _picture;
  String? get nat => _nat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['gender'] = _gender;
    if (_name != null) {
      map['name'] = _name?.toJson();
    }
    if (_location != null) {
      map['location'] = _location?.toJson();
    }
    map['email'] = _email;
    if (_login != null) {
      map['login'] = _login?.toJson();
    }
    if (_dob != null) {
      map['dob'] = _dob?.toJson();
    }
    if (_registered != null) {
      map['registered'] = _registered?.toJson();
    }
    map['phone'] = _phone;
    map['cell'] = _cell;
    if (_id != null) {
      map['id'] = _id?.toJson();
    }
    if (_picture != null) {
      map['picture'] = _picture?.toJson();
    }
    map['nat'] = _nat;
    return map;
  }

}

/// large : "https://randomuser.me/api/portraits/women/32.jpg"
/// medium : "https://randomuser.me/api/portraits/med/women/32.jpg"
/// thumbnail : "https://randomuser.me/api/portraits/thumb/women/32.jpg"

class Picture {
  Picture({
      String? large, 
      String? medium, 
      String? thumbnail,}){
    _large = large;
    _medium = medium;
    _thumbnail = thumbnail;
}

  Picture.fromJson(dynamic json) {
    _large = json['large'];
    _medium = json['medium'];
    _thumbnail = json['thumbnail'];
  }
  String? _large;
  String? _medium;
  String? _thumbnail;

  String? get large => _large;
  String? get medium => _medium;
  String? get thumbnail => _thumbnail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['large'] = _large;
    map['medium'] = _medium;
    map['thumbnail'] = _thumbnail;
    return map;
  }

}

/// name : "CPR"
/// value : "080852-2393"

class Id {
  Id({
      String? name, 
      String? value,}){
    _name = name;
    _value = value;
}

  Id.fromJson(dynamic json) {
    _name = json['name'];
    _value = json['value'];
  }
  String? _name;
  String? _value;

  String? get name => _name;
  String? get value => _value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['value'] = _value;
    return map;
  }

}

/// date : "2011-05-19T17:55:35.983Z"
/// age : 11

class Registered {
  Registered({
      String? date, 
      int? age,}){
    _date = date;
    _age = age;
}

  Registered.fromJson(dynamic json) {
    _date = json['date'];
    _age = json['age'];
  }
  String? _date;
  int? _age;

  String? get date => _date;
  int? get age => _age;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = _date;
    map['age'] = _age;
    return map;
  }

}

/// date : "1952-08-08T00:17:45.918Z"
/// age : 70

class Dob {
  Dob({
      String? date, 
      int? age,}){
    _date = date;
    _age = age;
}

  Dob.fromJson(dynamic json) {
    _date = json['date'];
    _age = json['age'];
  }
  String? _date;
  int? _age;

  String? get date => _date;
  int? get age => _age;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = _date;
    map['age'] = _age;
    return map;
  }

}

/// uuid : "56d590aa-c9e9-428d-88c1-c9285091d58c"
/// username : "bigrabbit630"
/// password : "sapphire"
/// salt : "M6JjFZVI"
/// md5 : "19b940adb121b2a2ad80a1664780ee5e"
/// sha1 : "feaa30c52a6ce51f953ccc3012688fefca062fba"
/// sha256 : "6f12f5530a4418c14e071e8bf3ab3d6da764c587838f7344310a5826b1fd7d28"

class Login {
  Login({
      String? uuid, 
      String? username, 
      String? password, 
      String? salt, 
      String? md5, 
      String? sha1, 
      String? sha256,}){
    _uuid = uuid;
    _username = username;
    _password = password;
    _salt = salt;
    _md5 = md5;
    _sha1 = sha1;
    _sha256 = sha256;
}

  Login.fromJson(dynamic json) {
    _uuid = json['uuid'];
    _username = json['username'];
    _password = json['password'];
    _salt = json['salt'];
    _md5 = json['md5'];
    _sha1 = json['sha1'];
    _sha256 = json['sha256'];
  }
  String? _uuid;
  String? _username;
  String? _password;
  String? _salt;
  String? _md5;
  String? _sha1;
  String? _sha256;

  String? get uuid => _uuid;
  String? get username => _username;
  String? get password => _password;
  String? get salt => _salt;
  String? get md5 => _md5;
  String? get sha1 => _sha1;
  String? get sha256 => _sha256;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uuid'] = _uuid;
    map['username'] = _username;
    map['password'] = _password;
    map['salt'] = _salt;
    map['md5'] = _md5;
    map['sha1'] = _sha1;
    map['sha256'] = _sha256;
    return map;
  }

}

/// street : {"number":5990,"name":"Allegade"}
/// city : "Randers Nø"
/// state : "Nordjylland"
/// country : "Denmark"
/// postcode : 83026
/// coordinates : {"latitude":"-27.4288","longitude":"115.3825"}
/// timezone : {"offset":"-3:00","description":"Brazil, Buenos Aires, Georgetown"}

class Location {
  Location({
      Street? street, 
      String? city, 
      String? state, 
      String? country, 
     // int? postcode, 
      Coordinates? coordinates, 
      Timezone? timezone,}){
    _street = street;
    _city = city;
    _state = state;
    _country = country;
   // _postcode = postcode;
    _coordinates = coordinates;
    _timezone = timezone;
}

  Location.fromJson(dynamic json) {
    _street = json['street'] != null ? Street.fromJson(json['street']) : null;
    _city = json['city'];
    _state = json['state'];
    _country = json['country'];
   // _postcode = json['postcode'];
    _coordinates = json['coordinates'] != null ? Coordinates.fromJson(json['coordinates']) : null;
    _timezone = json['timezone'] != null ? Timezone.fromJson(json['timezone']) : null;
  }
  Street? _street;
  String? _city;
  String? _state;
  String? _country;
 // int? _postcode;
  Coordinates? _coordinates;
  Timezone? _timezone;

  Street? get street => _street;
  String? get city => _city;
  String? get state => _state;
  String? get country => _country;
 // int? get postcode => _postcode;
  Coordinates? get coordinates => _coordinates;
  Timezone? get timezone => _timezone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_street != null) {
      map['street'] = _street?.toJson();
    }
    map['city'] = _city;
    map['state'] = _state;
    map['country'] = _country;
  //  map['postcode'] = _postcode;
    if (_coordinates != null) {
      map['coordinates'] = _coordinates?.toJson();
    }
    if (_timezone != null) {
      map['timezone'] = _timezone?.toJson();
    }
    return map;
  }

}

/// offset : "-3:00"
/// description : "Brazil, Buenos Aires, Georgetown"

class Timezone {
  Timezone({
      String? offset, 
      String? description,}){
    _offset = offset;
    _description = description;
}

  Timezone.fromJson(dynamic json) {
    _offset = json['offset'];
    _description = json['description'];
  }
  String? _offset;
  String? _description;

  String? get offset => _offset;
  String? get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['offset'] = _offset;
    map['description'] = _description;
    return map;
  }

}

/// latitude : "-27.4288"
/// longitude : "115.3825"

class Coordinates {
  Coordinates({
      String? latitude, 
      String? longitude,}){
    _latitude = latitude;
    _longitude = longitude;
}

  Coordinates.fromJson(dynamic json) {
    _latitude = json['latitude'];
    _longitude = json['longitude'];
  }
  String? _latitude;
  String? _longitude;

  String? get latitude => _latitude;
  String? get longitude => _longitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    return map;
  }

}

/// number : 5990
/// name : "Allegade"

class Street {
  Street({
      int? number, 
      String? name,}){
    _number = number;
    _name = name;
}

  Street.fromJson(dynamic json) {
    _number = json['number'];
    _name = json['name'];
  }
  int? _number;
  String? _name;

  int? get number => _number;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['number'] = _number;
    map['name'] = _name;
    return map;
  }

}

/// title : "Ms"
/// first : "Freja"
/// last : "Kristensen"

class Name {
  Name({
      String? title, 
      String? first, 
      String? last,}){
    _title = title;
    _first = first;
    _last = last;
}

  Name.fromJson(dynamic json) {
    _title = json['title'];
    _first = json['first'];
    _last = json['last'];
  }
  String? _title;
  String? _first;
  String? _last;

  String? get title => _title;
  String? get first => _first;
  String? get last => _last;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['first'] = _first;
    map['last'] = _last;
    return map;
  }

}