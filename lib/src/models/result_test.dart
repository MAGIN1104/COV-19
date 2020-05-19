class ResultTest {
  String sintomas;
  int valor = 0;

  static final _instancia = ResultTest._private();

  ResultTest._private();

  factory ResultTest() {
    return _instancia;
  }
}
