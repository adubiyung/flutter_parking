class Location_model {
  final String idLocation;
  final String nameLocation;
  final String imageLocation;
  final String areaLocation;
  final String typeLocation;
  final String rateLocation;
  final String priceLocation;
  final String spaceLocation;

  const Location_model({
    this.idLocation,
    this.nameLocation,
    this.imageLocation,
    this.areaLocation,
    this.typeLocation,
    this.rateLocation,
    this.priceLocation,
    this.spaceLocation,
  });
}

List<Location_model> locationList = [
  const Location_model(
      idLocation: "1",
      nameLocation: "Taman Kesehatan",
      imageLocation: "",
      areaLocation: "BSD, Tangerang Selatan",
      typeLocation: "Parking Space",
      rateLocation: "4.8",
      priceLocation: "Rp 5.000/day",
      spaceLocation: "60 lot"),
  const Location_model(
      idLocation: "1",
      nameLocation: "Sabang",
      imageLocation: "",
      areaLocation: "Sabang, Jakarta Pusat",
      typeLocation: "Parking Street",
      rateLocation: "4.6",
      priceLocation: "Rp 5.000/hour",
      spaceLocation: "243 lot"),
  const Location_model(
      idLocation: "1",
      nameLocation: "Taman Kebangetan",
      imageLocation: "",
      areaLocation: "BSD, Tangerang Selatan",
      typeLocation: "Parking Space",
      rateLocation: "4.8",
      priceLocation: "Rp 5.000/day",
      spaceLocation: "60 lot"),
  const Location_model(
      idLocation: "1",
      nameLocation: "Taman Ketiduran",
      imageLocation: "",
      areaLocation: "BSD, Tangerang Selatan",
      typeLocation: "Parking Space",
      rateLocation: "4.8",
      priceLocation: "Rp 5.000/day",
      spaceLocation: "60 lot"),
];
