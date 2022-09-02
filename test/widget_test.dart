
void main() {
  //EXAMPLE OF CV MAP TO LIST
  Map<String,dynamic> mapData = {
    "200535626819" : {
      "nama" : "Reo Wicaksono",
      "nohp" : 087748779010,
      "alamat" : "Gebang"
    },
    "200535626817" : {
      "nama" : "Reo Wicaksono",
      "nohp" : 087748779010,
      "alamat" : "Gebang"
    },
    "200535626816" : {
      "nama" : "Reo Wicaksono",
      "nohp" : 087748779010,
      "alamat" : "Gebang"
    },
  };
  var data = mapData["200535626819"]["nama"];

  var values = mapData.values.toList(); //CARA PERTAMA
  var key = mapData.keys.toList();
  newList () => mapData.entries.map((e) => e.value ).toList(); //CARA KEDUA

  // for (int i = 0; i < newList().length; i++){
  //   return values[i];
  // }
  print(values);




  /// API REQ EXAMPLE
  ///  Uri urlKota = Uri.parse("https://api.banghasan.com/sholat/format/json/kota");
//   var resKota = await http.get(urlKota);

//   var jsonDataKota =
//       (json.decode(resKota.body) as Map<String, dynamic>)["kota"];

//   Uri namaKota = Uri.parse(
//       "https://api.banghasan.com/sholat/format/json/kota");
//   var resNamaKota = await http.get(namaKota);

// Map<String, dynamic> userdata = json.decode(resNamaKota.body);

//   NamaKota namaKota1 = NamaKota.fromJson(userdata);
//   var a = namaKota1.kota![0].id;

//   // var a = jsonDataNamaKota[0]["id"];

//   var b = new DateTime.now()
//             .toString()
//             .substring(0,10);

//   Uri urlJadwalShalat = Uri.parse(
//       "https://api.banghasan.com/sholat/format/json/jadwal/kota/$a/tanggal/$b");
//   var resJadwalShalat = await http.get(urlJadwalShalat);

//   var jsonDataJadwalShalat = (json.decode(resJadwalShalat.body) as Map<String, dynamic>)["jadwal"];
//   Jadwalshalat jadwalshalat = Jadwalshalat.fromJson(jsonDataJadwalShalat);

//   //  print(jadwalshalat.data!.ashar);


//    Uri urlx = Uri.parse("http://careernetwork.ml/getTamu.php?i=1");
//    var response = await http.get(urlx);

//    List? dataJson = (json.decode(response.body) as Map<String, dynamic>)["data"];
//    print(dataJson);
}
