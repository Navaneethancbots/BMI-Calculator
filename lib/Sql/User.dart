class User{
  int? id;
  String? Name;
  String? Gender;
  String? Height;
  String? Weight;
  String? Age;
  String? Result;
  String? Value;
  String? Interpretation;
  String? Timestamp;

  UserMap(){
    var mapping = Map<String,dynamic>();
    mapping['id'] = id ?? null;
    mapping['Name'] = Name!;
    mapping['Gender'] = Gender!;
    mapping['Height'] = Height!;
    mapping['Weight'] = Weight!;
    mapping['Age'] = Age!;
    mapping['Result'] = Result!;
    mapping['Value'] = Value!;
    mapping['Interpretation'] = Interpretation!;
    mapping['Timestamp'] = Timestamp!;
    return mapping;
  }
}