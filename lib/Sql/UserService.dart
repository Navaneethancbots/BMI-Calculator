import 'package:bmi_calculator/Sql/Repository.dart';
import 'User.dart';

class UserService {
  late Repository _repository;
  UserService(){
    _repository = Repository();
  }
//Save user
  // ignore: non_constant_identifier_names
  SaveUser(User user)async{
    return await _repository.insertData('users', user.UserMap());
  }
  //Read all user
  readAllUsers() async{
    return await _repository.readData('users');
  }
  deleteUser(userId)async {
    return await _repository.deleteDataById('users', userId);
  }
  
  truncateTable()async{
    
    return await _repository.truncateTable('users');

  }
}