library convert;

double parseDouble(String value) {
  return double.parse(value.replaceAll(",", "."));
}
