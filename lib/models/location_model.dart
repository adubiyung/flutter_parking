class Location_model {
  final String idLocation;
  final String nameLocation;
  final String imageLocation;
  final String areaLocation;

  const Location_model(
      {this.idLocation,
      this.nameLocation,
      this.imageLocation,
      this.areaLocation});
}

List<Location_model> locationList = [
  const Location_model(
      idLocation: "1",
      nameLocation: "Taman Kesehatan",
      imageLocation: "",
      areaLocation: "BSD, Tangerang Selatan"),
  const Location_model(
      idLocation: "1",
      nameLocation: "Taman Kesemutan",
      imageLocation: "",
      areaLocation: "BSD, Tangerang Selatan"),
  const Location_model(
      idLocation: "1",
      nameLocation: "Taman Kebangetan",
      imageLocation: "",
      areaLocation: "BSD, Tangerang Selatan"),
  const Location_model(
      idLocation: "1",
      nameLocation: "Taman Ketiduran",
      imageLocation: "",
      areaLocation: "BSD, Tangerang Selatan"),
];
