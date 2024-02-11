enum Routes { initial, home}

extension TypeCoverter on Routes {
  String toStringPath() {
    switch (this) {
      case Routes.initial:
        return '/';
      case Routes.home:
        return 'home';
    }
  }
}
