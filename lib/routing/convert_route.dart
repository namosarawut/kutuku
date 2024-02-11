enum Routes { initial, home,createAccount}

extension TypeCoverter on Routes {
  String toStringPath() {
    switch (this) {
      case Routes.initial:
        return '/';
      case Routes.home:
        return 'home';
        case Routes.createAccount:
        return 'createAccount';
    }
  }
}
