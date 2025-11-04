

import 'package:souyoutoo/repo/auth_repo/auth_repo.dart';
import 'package:souyoutoo/repo/auth_repo/auth_repo_impl.dart';
import 'package:souyoutoo/src/base/base_view_controller.dart';

class AuthController extends BaseViewController{


final AuthRepo repository = AuthRepoImpl();

login() {
  startLoading();
  repository.login();
  // startLoading();
}
  
}