import 'dart:io';

import 'package:parse_server_sdk/parse_server_sdk.dart';

Future<Parse> initializeParse() async {
  return await Parse().initialize('OzrokmU22cgyApcIL7XMkNvADiuxuro1B5SRJ8Yy',
      'https://parseapi.back4app.com/',
      clientKey: 'yQXy4KHzCutNlZOtToTsRU7AsHXqMts6oPaloj58', debug: true);
}

Future<List<ParseObject>> getBranch() async {
  final response = await ParseObject('Branch').getAll();
  return response.results;
}

Future<List<ParseObject>> getEmployeeRole() async {
  final response = await ParseObject('EmployeeRole').getAll();
  return response.results;
}

// registers a new employee
Future<ParseObject> signupEmployee(
  String phoneNumber,
  String name,
  String employeeId,
  String type,
  String password,
  String formLink,
  String formResultLink,
  String branch,
) async {
  var user = ParseUser(phoneNumber, password, null);
  var response = await user.signUp(allowWithoutEmail: true);
  user = response.result;

  final employee = ParseObject('Employee')
    ..set('name', name)
    ..set('employeeId', employeeId)
    ..set('type', type)
    ..set('formLink', formLink)
    ..set('formResultLink', formResultLink)
    ..set('branch', branch)
    ..set('user', user)
    ..set('phoneNumber', phoneNumber);

  response = await employee.save();

  return response.result;
}

// returns either an Employee ParseObject or a Donor
// check by value.parseClassName == "Donor"
Future<ParseObject> login(String phoneNumber, String password) async {
  var user = ParseUser(phoneNumber, password, null);

  var response = await user.login();

  if (!response.success) throw response.error;

  user = response.result;

  var query = QueryBuilder(ParseObject('Employee'))
    ..whereEqualTo('user', user)
    ..setLimit(1);

  response = await query.query();

  // if querying the employee didn't show any results
  if (response.count == 0) {
    // query for donors
    query = QueryBuilder(ParseObject('Donor'))
      ..whereEqualTo('user', user)
      ..setLimit(1);

    response = await query.query();

    return response.results[0];
  }

  return response.results[0];
}
