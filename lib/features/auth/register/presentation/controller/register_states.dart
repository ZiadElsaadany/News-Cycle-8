
class RegisterStates{}
class RegisterInitialState extends RegisterStates{ }
class RegisterLoadingState extends RegisterStates{ }
class RegisterFailureState extends RegisterStates{
  final String errorMessage;
  RegisterFailureState(
  {
    required this.errorMessage
}
      );
}
class RegisterSuccessState extends RegisterStates{ }