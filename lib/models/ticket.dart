class Ticket {
  final String idTransaction;
  final String noTransaction;
  final String durationTransaction;
  final String dateTransaction;
  final String statusTransaction;
  final String idUser;
  final String idLocation;
  final String nameLocation;
  final String idWarden;
  final String nameWarden;
  final String typeVehicle;
  final String noVehicle;

  const Ticket({
      this.idTransaction,
      this.noTransaction,
      this.durationTransaction,
      this.dateTransaction,
      this.statusTransaction,
      this.idUser,
      this.idLocation,
      this.nameLocation,
      this.idWarden,
      this.nameWarden,
      this.typeVehicle,
      this.noVehicle});
}

List<Ticket> ticketList = [
  const Ticket(
      idTransaction: "12",
      noTransaction : "EPT-55555552",
      durationTransaction : "10.00 - 12.00",
      dateTransaction : "Jumat, 26 Jul 2019",
      statusTransaction : "On Going",
      idUser : "1",
      idLocation : "1",
      nameLocation : "Taman Kesehatan",
      idWarden : "1",
      nameWarden : "John Doe",
      typeVehicle : "car",
      noVehicle : "R 8655 BS",
      ),
];
