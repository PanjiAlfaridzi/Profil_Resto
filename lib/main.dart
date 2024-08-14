import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final biodata = <String, String>{};

  MainApp({super.key}) {
    biodata['name'] = 'Rumah Makan Sedap Rasa';
    biodata['email'] = 'alfapanji2012@gmail.com';
    biodata['phone'] = '+62895415470597';
    biodata['image'] = 'gambar.png';
    biodata['hobby'] = 'Bermain Lira dan Flute';
    biodata['addr'] = 'St. Freeway in side of Moonstad';
    biodata['alamat'] =
        'Jln.Merdeka no 11 Kab.Semarang, Jawa Tengah, Indonesia';
    biodata['list1'] = 'Geprek';
    biodata['list2'] = 'Nasi Goreng';
    biodata['list3'] = 'Nasi Magelangan';
    biodata['jambuka1'] = '08.00-16.00 WIB';
    biodata['jambuka2'] = '19.00-24.00 WIB';
    biodata['desc'] =
        "Selamat datang di Rumah Makan Sedap Rasa, tempat di mana cita rasa autentik Indonesia bertemu dengan suasana yang nyaman dan ramah. Kami menyajikan berbagai hidangan khas dari seluruh penjuru Nusantara, mulai dari rendang Padang yang lezat hingga sate Madura yang menggugah selera.";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Rumah Makan Sedap Rasa",
      home: Scaffold(
        appBar: AppBar(title: Text("Rumah Makan Sedap Rasa")),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.black),
                child: Text(
                  biodata['name'] ?? '',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              Image(image: AssetImage('assets/${biodata["image"] ?? ''}')),
              Row(
                children: [
                  btnContact(Icons.alternate_email, Colors.green[900],
                      "mailto:${biodata['email'] ?? ''}?subject=Tanya%20Seputar%20Resto"),
                  btnContact(Icons.mark_email_read, Colors.blueAccent,
                      "https://wa.me/${biodata['phone']}"),
                  btnContact(Icons.phone, Colors.deepPurple,
                      "tel:${biodata['phone']}"),
                  btnContact(Icons.map, Colors.red,
                      "https://www.google.com/maps/search/?api=1&query=-6.982370121055442, 110.40911661805112")
                ],
              ),
              SizedBox(
                height: 10,
              ),
              // textAttribute('Hobby', biodata['hobby'] ?? ''),
              // textAttribute('Alamat', biodata['addr'] ?? ''),
              SizedBox(
                height: 10,
              ),
              teksKotak(Colors.black38, 'Deskripsi'),
              SizedBox(
                height: 10,
              ),
              Text(
                biodata['desc'] ?? '',
                style: TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              teksKotak(Colors.black38, 'List Menu'),
              SizedBox(
                height: 10,
              ),
              textList('', biodata['list1'] ?? ''),
              textList('', biodata['list2'] ?? ''),
              textList('', biodata['list3'] ?? ''),
              SizedBox(
                height: 10,
              ),
              teksKotak(Colors.black38, 'Alamat'),
              SizedBox(
                height: 10,
              ),
              Text(
                biodata['alamat'] ?? '',
                style: TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              teksKotak(Colors.black38, 'Jam Buka'),
              SizedBox(
                height: 10,
              ),
              textAttribute('Pagi', biodata['jambuka1'] ?? ''),
              textAttribute('Malam', biodata['jambuka2'] ?? ''),
            ],
          ),
        ),
      ),
    );
  }

  Expanded btnContact(IconData icon, var color, String uri) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          launch(uri);
        },
        child: Icon(icon),
        style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            backgroundColor: color,
            foregroundColor: Colors.white),
      ),
    );
  }

  Row textAttribute(String judul, String teks) {
    return Row(
      children: [
        Container(
          width: 80,
          child: Text(
            '- $judul ',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Text(
          ': ',
          style: TextStyle(fontSize: 18),
        ),
        Text(
          teks,
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }

  Row textList(String judul, String teks) {
    return Row(
      children: [
        Container(
          child: Text(
            '- $judul ',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Text(
          '',
          style: TextStyle(fontSize: 18),
        ),
        Text(
          teks,
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }

  Container teksKotak(Color bgColor, String teks) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(color: bgColor),
      child: Text(
        teks,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }

  Future launch(String uri) async {
    if (!await launchUrl(Uri.parse(uri))) {
      throw Exception('Tidak dapat memanggil : $uri');
    }
  }
}
