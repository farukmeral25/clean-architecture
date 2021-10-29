import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/usecase/usecase.dart';
import 'package:flutter_clean_architecture/feature/authenticate/login/domain/entities/argument/user_argument.dart';
import 'package:flutter_clean_architecture/feature/authenticate/login/domain/entities/user_info.dart';
import 'package:flutter_clean_architecture/feature/authenticate/login/domain/usecase/get_data_user.dart';
import 'package:flutter_clean_architecture/feature/authenticate/login/domain/usecase/remove_data_user.dart';
import 'package:flutter_clean_architecture/feature/authenticate/login/domain/usecase/save_data_user.dart';

class LoginProvider with ChangeNotifier {
  final GetDataUserUsecase getDataUser;
  final RemoveDataUserUsecase removeDataUser;
  final SaveDataUserUsecase saveDataUser;
  TextEditingController textEditingControllerEmail = TextEditingController();
  TextEditingController textEditingControllerPassword = TextEditingController();

  LoginProvider({
    required this.getDataUser,
    required this.removeDataUser,
    required this.saveDataUser,
  }) {
    getDataUser(const NoParams()).then(
      (getDataUserEither) {
        getDataUserEither.fold(
          (failure) => const Left(null),
          (getDataUser) {
            userInfo = getDataUser;
          },
        );
        notifyListeners();
      },
    );
  }
  late UserInfo userInfo = UserInfo(email: '', password: '');

  void cacheUserInfo() {
    userInfo = UserInfo(email: textEditingControllerEmail.text, password: textEditingControllerPassword.text);
    saveDataUser(UserArgument(userInfo: userInfo));
    notifyListeners();
  }

  void removeUserInfo() {
    removeDataUser(const NoParams()).then((removeDataUserEither) {
      removeDataUserEither.fold((failure) => Left(failure), (removeDataUser) => const Right(null));
    });
    notifyListeners();
  }
}
