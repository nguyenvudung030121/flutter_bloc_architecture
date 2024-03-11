enum Endpoint { getProduct }

extension EndPointConstants on Endpoint {
  String get path {
    switch (this) {
      case Endpoint.getProduct:
        return "/products";
    }
  }
}
