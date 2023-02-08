import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';
import 'package:akm/app/modules/list_agunan_tanah_bangunan/views/list_agunan_tanah_bangunan_view.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../controllers/detail_agunan_controller.dart';

class DetailAgunanView extends GetView<DetailAgunanController> {
  const DetailAgunanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var agunanList = controller.args.agunan;

    Agunan agunanTanah = agunanList!.any((element) => element.kodeAgunan == 1)
        ? agunanList.elementAt(
            agunanList.indexWhere((element) => element.kodeAgunan == 1))
        : Agunan();

    Agunan agunanTanahBangunan =
        agunanList.any((element) => element.kodeAgunan == 2)
            ? agunanList.elementAt(
                agunanList.indexWhere((element) => element.kodeAgunan == 2))
            : Agunan();

    Agunan agunanKendaraan =
        agunanList.any((element) => element.kodeAgunan == 3)
            ? agunanList.elementAt(
                agunanList.indexWhere((element) => element.kodeAgunan == 3))
            : Agunan();

    Agunan agunanPeralatan =
        agunanList.any((element) => element.kodeAgunan == 4)
            ? agunanList.elementAt(
                agunanList.indexWhere((element) => element.kodeAgunan == 4))
            : Agunan();

    Agunan agunanCash = agunanList.any((element) => element.kodeAgunan == 5)
        ? agunanList.elementAt(
            agunanList.indexWhere((element) => element.kodeAgunan == 5))
        : Agunan();

    Agunan agunanLos = agunanList.any((element) => element.kodeAgunan == 6)
        ? agunanList.elementAt(
            agunanList.indexWhere((element) => element.kodeAgunan == 6))
        : Agunan();

    Agunan agunanLainnya = agunanList.any((element) => element.kodeAgunan == 7)
        ? agunanList.elementAt(
            agunanList.indexWhere((element) => element.kodeAgunan == 7))
        : Agunan();

    var formAgunanTanah = agunanTanah.formTanah;
    var formAgunanTanahBangunan = agunanTanahBangunan.formTanahBangunan;
    var formKendaraan = agunanKendaraan.formKendaraan;
    var formPeralatan = agunanPeralatan.formPeralatan;
    var formCash = agunanCash.formCash;
    var formLos = agunanLos.formLos;
    var formLainnya = agunanLainnya.formLainnya;

    return Scaffold(
      appBar: AppBar(
        title: Text('Agunan ${controller.args.peminjam1}'),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Statistik Agunan",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Total Nilai Agunan",
                                style: TextStyle(
                                  fontSize: 12.0,
                                ),
                              ),
                              const SizedBox(
                                height: 6.0,
                              ),
                              Row(
                                children: [
                                  Text(
                                    MoneyMaskedTextController(
                                      decimalSeparator: ',',
                                      thousandSeparator: '.',
                                      precision: 0,
                                      leftSymbol: 'Rp. ',
                                      initialValue: double.parse(controller
                                          .args.analisaAgunan!.totalAgunan
                                          .toString()),
                                    ).text,
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: const BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                8.0,
                              ),
                            ),
                          ),
                          child: const Icon(
                            Icons.wallet,
                            size: 24.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Card(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Tanah",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 6.0,
                                    ),
                                    Row(
                                      children: [
                                        formAgunanTanah != null
                                            ? Text(
                                                formAgunanTanah.length
                                                    .toString(),
                                                style: const TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                            : const Text(
                                                '0',
                                                style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      8.0,
                                    ),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.home,
                                  size: 24.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Tanah dan Bangunan",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 6.0,
                                    ),
                                    Row(
                                      children: [
                                        formAgunanTanah != null
                                            ? Text(
                                                formAgunanTanahBangunan!.length
                                                    .toString(),
                                                style: const TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                            : const Text(
                                                "0",
                                                style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: const BoxDecoration(
                                  color: Colors.pink,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      8.0,
                                    ),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.landslide,
                                  size: 24.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Card(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Kendaran",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 6.0,
                                    ),
                                    Row(
                                      children: [
                                        formKendaraan != null
                                            ? Text(
                                                formKendaraan.length.toString(),
                                                style: const TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                            : const Text(
                                                "0",
                                                style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: const BoxDecoration(
                                  color: Colors.indigo,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      8.0,
                                    ),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.motorcycle,
                                  size: 24.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Peralatan",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 6.0,
                                    ),
                                    Row(
                                      children: [
                                        formPeralatan != null
                                            ? Text(
                                                formPeralatan.length.toString(),
                                                style: const TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                            : const Text(
                                                "0",
                                                style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: const BoxDecoration(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      8.0,
                                    ),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.build,
                                  size: 24.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Card(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Cash Collateral",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 6.0,
                                    ),
                                    Row(
                                      children: [
                                        formCash != null
                                            ? Text(
                                                formCash.length.toString(),
                                                style: const TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                            : const Text(
                                                "0",
                                                style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: const BoxDecoration(
                                  color: Colors.lightGreen,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      8.0,
                                    ),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.account_balance_wallet,
                                  size: 24.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Los / Kios Pasar",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 6.0,
                                    ),
                                    Row(
                                      children: [
                                        formLos != null
                                            ? Text(
                                                formLos.length.toString(),
                                                style: const TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                            : const Text(
                                                "0",
                                                style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: const BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      8.0,
                                    ),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.storefront,
                                  size: 24.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Card(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Lainnya",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 6.0,
                                    ),
                                    Row(
                                      children: [
                                        formLainnya != null
                                            ? Text(
                                                formLainnya.length.toString(),
                                                style: const TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                            : const Text(
                                                "0",
                                                style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      8.0,
                                    ),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.corporate_fare,
                                  size: 24.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),
                  ],
                ),
                Builder(
                  builder: (context) {
                    final List<Map> chartData = [
                      {
                        "status": "Tanah",
                        "value": formAgunanTanah == null
                            ? 0
                            : formAgunanTanah.length,
                      },
                      {
                        "status": "Tanah dan Bangunan",
                        "value": formAgunanTanahBangunan == null
                            ? 0
                            : formAgunanTanahBangunan.length,
                      },
                      {
                        "status": "Kendaraan",
                        "value":
                            formKendaraan == null ? 0 : formKendaraan.length,
                      },
                      {
                        "status": "Peralatan",
                        "value":
                            formPeralatan == null ? 0 : formPeralatan.length,
                      },
                      {
                        "status": "Cash Collateral",
                        "value": formCash == null ? 0 : formCash.length,
                      },
                      {
                        "status": "Los / Kios Pasar",
                        "value": formLos == null ? 0 : formLos.length,
                      },
                      {
                        "status": "Lainnya",
                        "value": formLainnya == null ? 0 : formLainnya.length,
                      },
                    ];
                    return Container(
                      color: Theme.of(context).cardColor,
                      padding: const EdgeInsets.all(12.0),
                      child: SfCircularChart(
                        title: ChartTitle(text: 'Jumlah Agunan'),
                        legend: Legend(isVisible: true),
                        backgroundColor: Colors.transparent,
                        series: <CircularSeries>[
                          PieSeries<Map, String>(
                            dataSource: chartData,
                            enableTooltip: true,
                            dataLabelSettings: const DataLabelSettings(
                              isVisible: true,
                              showZeroValue: false,
                              textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              borderColor: Colors.transparent,
                            ),
                            xValueMapper: (Map data, _) => data["status"],
                            yValueMapper: (Map data, _) => data["value"],
                          )
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Detail Agunan",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                formAgunanTanah != null
                    ? Column(
                        children: [
                          Card(
                            color: Colors.blue[100],
                            child: ListTile(
                              leading: const CircleAvatar(
                                child: Icon(Icons.house),
                              ),
                              title: const Text("Agunan Tanah"),
                              subtitle: Text(
                                  "Debitur ini memiliki ${formAgunanTanah.length} agunan tanah"),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          ListView.separated(
                            itemCount:
                                int.parse(formAgunanTanah.length.toString()),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 12.0,
                            ),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Card(
                                clipBehavior: Clip.antiAlias,
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 300.0,
                                        child: SizedBox(
                                          height: 200,
                                          width: 450,
                                          child: FlutterMap(
                                            options: MapOptions(
                                              center: LatLng(
                                                // Split string to get latitude and longitude
                                                double.parse(
                                                    formAgunanTanah[index]
                                                        .titikKoordinat!
                                                        .split(',')[0]),
                                                double.parse(
                                                    formAgunanTanah[index]
                                                        .titikKoordinat!
                                                        .split(',')[1]),
                                              ),
                                              zoom: 16,
                                              interactiveFlags:
                                                  InteractiveFlag.all -
                                                      InteractiveFlag.rotate,
                                            ),
                                            children: [
                                              TileLayer(
                                                urlTemplate:
                                                    'https://mt1.google.com/vt/lyrs=m&x={x}&y={y}&z={z}',
                                                userAgentPackageName:
                                                    'dev.fleaflet.flutter_map.example',
                                              ),
                                              PopupMarkerLayerWidget(
                                                options:
                                                    PopupMarkerLayerOptions(
                                                  popupController: controller
                                                      .popupLayerController,
                                                  markers: [
                                                    Marker(
                                                      point: LatLng(
                                                        // Split string to get latitude and longitude
                                                        double.parse(
                                                            formAgunanTanah[
                                                                    index]
                                                                .titikKoordinat!
                                                                .split(',')[0]),
                                                        double.parse(
                                                            formAgunanTanah[
                                                                    index]
                                                                .titikKoordinat!
                                                                .split(',')[1]),
                                                      ),
                                                      width: 40,
                                                      height: 40,
                                                      builder: (_) =>
                                                          const Icon(
                                                        Icons.location_on,
                                                        size: 50,
                                                        color: GFColors.DANGER,
                                                      ),
                                                      anchorPos:
                                                          AnchorPos.align(
                                                        AnchorAlign.top,
                                                      ),
                                                    ),
                                                  ],
                                                  markerRotateAlignment:
                                                      PopupMarkerLayerOptions
                                                          .rotationAlignmentFor(
                                                              AnchorAlign.top),
                                                  popupBuilder:
                                                      (BuildContext context,
                                                              Marker marker) =>
                                                          ExamplePopup(marker),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Agunan Tanah ${index + 1}",
                                                  style: const TextStyle(
                                                    fontSize: 12.0,
                                                  ),
                                                ),
                                                const Spacer(),
                                                Text(
                                                  "Tgl Input: ${DateFormat('dd/MM/yy').format(DateTime.parse(formAgunanTanah[index].tanggal.toString()))}",
                                                  style: const TextStyle(
                                                    fontSize: 10.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10.0,
                                            ),
                                            Text(
                                              "${formAgunanTanah[index].deskripsiPendek}",
                                              style: const TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 6.0,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Table(
                                                  columnWidths: const {
                                                    0: FlexColumnWidth(0.5),
                                                    1: FlexColumnWidth(0.1),
                                                    2: FlexColumnWidth(1),
                                                  },
                                                  children: [
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Atas Nama'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          formAgunanTanah[index]
                                                              .namaPemilik
                                                              .toString(),
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Bukti Kepemilikan'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          formAgunanTanah[index]
                                                              .buktiKepemilikan
                                                              .toString(),
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah('Luas'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          '${formAgunanTanah[index].luasTanah} m2',
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Nilai Pasar'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                            'Rp. ${MoneyMaskedTextController(thousandSeparator: '.', decimalSeparator: '', precision: 0, initialValue: double.parse(formAgunanTanah[index].nilaiPasar.toString())).text}'),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Nilai Liquidasi'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          'Rp. ${MoneyMaskedTextController(thousandSeparator: '.', decimalSeparator: '', precision: 0, initialValue: double.parse(formAgunanTanah[index].nilaiLiquidasi.toString())).text}',
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Lokasi'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          formAgunanTanah[index]
                                                              .lokasi
                                                              .toString(),
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Pengikatan'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          formAgunanTanah[index]
                                                              .pengikatan
                                                              .toString(),
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(''),
                                                        const SizedBox.shrink(),
                                                        const SizedBox.shrink(),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Pemilik'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          formAgunanTanah[index]
                                                              .namaPemilik
                                                              .toString(),
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Alamat'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          formAgunanTanah[index]
                                                              .lokasi
                                                              .toString(),
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Titik Koordinat'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          formAgunanTanah[index]
                                                              .titikKoordinat
                                                              .toString(),
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(''),
                                                        const SizedBox.shrink(),
                                                        const SizedBox.shrink(),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Summary'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          formAgunanTanah[index]
                                                              .deskripsiPanjang
                                                              .toString(),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
                formAgunanTanah != null
                    ? const SizedBox(
                        height: 10.0,
                      )
                    : const SizedBox.shrink(),
                formAgunanTanahBangunan != null
                    ? Column(
                        children: [
                          Card(
                            color: Colors.amber[100],
                            child: ListTile(
                              leading: const CircleAvatar(
                                child: Icon(Icons.houseboat_rounded),
                              ),
                              title: const Text("Agunan Tanah dan Bangunan"),
                              subtitle: Text(
                                  "Debitur ini memiliki ${formAgunanTanahBangunan.length} agunan tanah dan bangunan"),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          ListView.separated(
                            itemCount: int.parse(
                                formAgunanTanahBangunan.length.toString()),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 12.0,
                            ),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Card(
                                clipBehavior: Clip.antiAlias,
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 300.0,
                                        child: SizedBox(
                                          height: 200,
                                          width: 450,
                                          child: FlutterMap(
                                            options: MapOptions(
                                              center: LatLng(
                                                // Split string to get latitude and longitude
                                                double.parse(
                                                    formAgunanTanahBangunan[
                                                            index]
                                                        .titikKoordinat!
                                                        .split(',')[0]),
                                                double.parse(
                                                    formAgunanTanahBangunan[
                                                            index]
                                                        .titikKoordinat!
                                                        .split(',')[1]),
                                              ),
                                              zoom: 16,
                                              interactiveFlags:
                                                  InteractiveFlag.all -
                                                      InteractiveFlag.rotate,
                                            ),
                                            children: [
                                              TileLayer(
                                                urlTemplate:
                                                    'https://mt1.google.com/vt/lyrs=m&x={x}&y={y}&z={z}',
                                                userAgentPackageName:
                                                    'dev.fleaflet.flutter_map.example',
                                              ),
                                              PopupMarkerLayerWidget(
                                                options:
                                                    PopupMarkerLayerOptions(
                                                  popupController: controller
                                                      .popupLayerController,
                                                  markers: [
                                                    Marker(
                                                      point: LatLng(
                                                        // Split string to get latitude and longitude
                                                        double.parse(
                                                            formAgunanTanahBangunan[
                                                                    index]
                                                                .titikKoordinat!
                                                                .split(',')[0]),
                                                        double.parse(
                                                            formAgunanTanahBangunan[
                                                                    index]
                                                                .titikKoordinat!
                                                                .split(',')[1]),
                                                      ),
                                                      width: 40,
                                                      height: 40,
                                                      builder: (_) =>
                                                          const Icon(
                                                        Icons.location_on,
                                                        size: 50,
                                                        color: GFColors.DANGER,
                                                      ),
                                                      anchorPos:
                                                          AnchorPos.align(
                                                        AnchorAlign.top,
                                                      ),
                                                    ),
                                                  ],
                                                  markerRotateAlignment:
                                                      PopupMarkerLayerOptions
                                                          .rotationAlignmentFor(
                                                              AnchorAlign.top),
                                                  popupBuilder:
                                                      (BuildContext context,
                                                              Marker marker) =>
                                                          ExamplePopup(marker),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Agunan Tanah Bangunan ${index + 1}",
                                                  style: const TextStyle(
                                                    fontSize: 12.0,
                                                  ),
                                                ),
                                                const Spacer(),
                                                Text(
                                                  "Tgl Input: ${DateFormat('dd/MM/yy').format(DateTime.parse(formAgunanTanahBangunan[index].tanggal.toString()))}",
                                                  style: const TextStyle(
                                                    fontSize: 10.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10.0,
                                            ),
                                            Text(
                                              "${formAgunanTanah![index].deskripsiPendek}",
                                              style: const TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 6.0,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Table(
                                                  columnWidths: const {
                                                    0: FlexColumnWidth(0.5),
                                                    1: FlexColumnWidth(0.1),
                                                    2: FlexColumnWidth(1),
                                                  },
                                                  children: [
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Atas Nama'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          formAgunanTanahBangunan[
                                                                  index]
                                                              .namaPemilik
                                                              .toString(),
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Bukti Kepemilikan'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          formAgunanTanahBangunan[
                                                                  index]
                                                              .buktiKepemilikan
                                                              .toString(),
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah('Luas'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          '${formAgunanTanahBangunan[index].luasTanah} m2',
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(''),
                                                        const SizedBox.shrink(),
                                                        const SizedBox.shrink(),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Nilai Pasar Tanah'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                            'Rp. ${MoneyMaskedTextController(thousandSeparator: '.', decimalSeparator: '', precision: 0, initialValue: double.parse(formAgunanTanahBangunan[index].nilaiPasarTanah.toString())).text}'),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Nilai Liquidasi Tanah'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                            'Rp. ${MoneyMaskedTextController(thousandSeparator: '.', decimalSeparator: '', precision: 0, initialValue: double.parse(formAgunanTanahBangunan[index].nilaiLiquidasiTanah.toString())).text}'),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Nilai Pasar Bangunan'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                            'Rp. ${MoneyMaskedTextController(thousandSeparator: '.', decimalSeparator: '', precision: 0, initialValue: double.parse(formAgunanTanahBangunan[index].nilaiPasarBangunan.toString())).text}'),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Nilai Liquidasi Bangunan'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                            'Rp. ${MoneyMaskedTextController(thousandSeparator: '.', decimalSeparator: '', precision: 0, initialValue: double.parse(formAgunanTanahBangunan[index].nilaiLiquidasiBangunan.toString())).text}'),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(''),
                                                        const SizedBox.shrink(),
                                                        const SizedBox.shrink(),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Total Nilai Pasar'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                            'Rp. ${MoneyMaskedTextController(thousandSeparator: '.', decimalSeparator: '', precision: 0, initialValue: double.parse(formAgunanTanahBangunan[index].nilaiPasar.toString())).text}'),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Total Nilai Liquidasi'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          'Rp. ${MoneyMaskedTextController(thousandSeparator: '.', decimalSeparator: '', precision: 0, initialValue: double.parse(formAgunanTanahBangunan[index].nilaiLiquidasi.toString())).text}',
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(''),
                                                        const SizedBox.shrink(),
                                                        const SizedBox.shrink(),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Lokasi'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          formAgunanTanahBangunan[
                                                                  index]
                                                              .lokasi
                                                              .toString(),
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Pengikatan'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          formAgunanTanahBangunan[
                                                                  index]
                                                              .pengikatan
                                                              .toString(),
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(''),
                                                        const SizedBox.shrink(),
                                                        const SizedBox.shrink(),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Pemilik'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          formAgunanTanahBangunan[
                                                                  index]
                                                              .namaPemilik
                                                              .toString(),
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Alamat'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          formAgunanTanahBangunan[
                                                                  index]
                                                              .lokasi
                                                              .toString(),
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Titik Koordinat'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          formAgunanTanahBangunan[
                                                                  index]
                                                              .titikKoordinat
                                                              .toString(),
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(''),
                                                        const SizedBox.shrink(),
                                                        const SizedBox.shrink(),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Summary'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          formAgunanTanahBangunan[
                                                                  index]
                                                              .deskripsiPanjang
                                                              .toString(),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
                formAgunanTanahBangunan != null
                    ? const SizedBox(
                        height: 10.0,
                      )
                    : const SizedBox.shrink(),
                formKendaraan != null
                    ? Column(
                        children: [
                          Card(
                            color: Colors.pink[100],
                            child: ListTile(
                              leading: const CircleAvatar(
                                child: Icon(Icons.motorcycle),
                              ),
                              title: const Text("Agunan Kendaraan"),
                              subtitle: Text(
                                  "Debitur ini memiliki ${formKendaraan.length} agunan kendaraan"),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          ListView.separated(
                            itemCount:
                                int.parse(formKendaraan.length.toString()),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 12.0,
                            ),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Card(
                                clipBehavior: Clip.antiAlias,
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Agunan Kendaraan ${index + 1}",
                                                  style: const TextStyle(
                                                    fontSize: 12.0,
                                                  ),
                                                ),
                                                const Spacer(),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10.0,
                                            ),
                                            Text(
                                              formKendaraan[index]
                                                          .jenis
                                                          .toString() ==
                                                      'Spd Motor'
                                                  ? "Kendaraan Roda 2"
                                                  : "Kendaraan Roda 4",
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 6.0,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Table(
                                                  columnWidths: const {
                                                    0: FlexColumnWidth(0.5),
                                                    1: FlexColumnWidth(0.1),
                                                    2: FlexColumnWidth(1),
                                                  },
                                                  children: [
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Jenis'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          formKendaraan[index]
                                                              .jenis
                                                              .toString(),
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah('Merk'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          formKendaraan[index]
                                                              .merk
                                                              .toString(),
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah('Tipe'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          formKendaraan[index]
                                                              .type
                                                              .toString(),
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Warna'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          formKendaraan[index]
                                                              .warna
                                                              .toString(),
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Tahun'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          formKendaraan[index]
                                                              .tahun
                                                              .toString(),
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'No. Polisi'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          formKendaraan[index]
                                                              .noPolisi
                                                              .toString(),
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'No. Rangka'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          formKendaraan[index]
                                                              .noRangka
                                                              .toString(),
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'No. Mesin'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          formKendaraan[index]
                                                              .noMesin
                                                              .toString(),
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'No. BPKB'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          formKendaraan[index]
                                                              .noBpkb
                                                              .toString(),
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Atas Nama'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          formKendaraan[index]
                                                              .namaPemilik
                                                              .toString(),
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Keadaan'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          formKendaraan[index]
                                                              .kondisi
                                                              .toString(),
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(''),
                                                        paddedTextTanah(''),
                                                        paddedTextTanah(''),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Nilai Pasar'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          'Rp. ${MoneyMaskedTextController(
                                                            decimalSeparator:
                                                                '',
                                                            thousandSeparator:
                                                                '.',
                                                            precision: 0,
                                                            initialValue:
                                                                double.parse(
                                                              formKendaraan[
                                                                      index]
                                                                  .nilaiPasar
                                                                  .toString(),
                                                            ),
                                                          ).text}',
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Nilai Likuidasi'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          'Rp. ${MoneyMaskedTextController(
                                                            decimalSeparator:
                                                                '',
                                                            thousandSeparator:
                                                                '.',
                                                            precision: 0,
                                                            initialValue:
                                                                double.parse(
                                                              formKendaraan[
                                                                      index]
                                                                  .nilaiLiquidasi
                                                                  .toString(),
                                                            ),
                                                          ).text}',
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Nilai Pengikatan'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          'Rp. ${MoneyMaskedTextController(
                                                            decimalSeparator:
                                                                '',
                                                            thousandSeparator:
                                                                '.',
                                                            precision: 0,
                                                            initialValue:
                                                                double.parse(
                                                              formKendaraan[
                                                                      index]
                                                                  .nilaiPengikatan
                                                                  .toString(),
                                                            ),
                                                          ).text}',
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Pengikatan'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          formKendaraan[index]
                                                              .pengikatan
                                                              .toString(),
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(''),
                                                        paddedTextTanah(''),
                                                        paddedTextTanah(''),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Pemilik'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          formKendaraan[index]
                                                              .namaPemilik
                                                              .toString(),
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(''),
                                                        paddedTextTanah(''),
                                                        paddedTextTanah(''),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Summary'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                            '${formKendaraan[index].jenis == 'Spd Motor' ? 'Kendaraan Roda 2 (Dua)' : 'Kendaraan Roda 4 (Empat)'} Merk ${formKendaraan[index].merk} Tahun ${formKendaraan[index].tahun}, sesuai yang tercantum dalam BPKB asli ${formKendaraan[index].noBpkb}, No Polisi ${formKendaraan[index].noPolisi}, No Rangka ${formKendaraan[index].noRangka}, No Mesin ${formKendaraan[index].noMesin}, Warna ${formKendaraan[index].warna}, dengan kondisi ${formKendaraan[index].kondisi}'),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
                formKendaraan != null
                    ? const SizedBox(
                        height: 10.0,
                      )
                    : const SizedBox.shrink(),
                formPeralatan != null
                    ? Column(
                        children: [
                          Card(
                            color: Colors.purple[100],
                            child: ListTile(
                              leading: const CircleAvatar(
                                child: Icon(Icons.settings),
                              ),
                              title: const Text("Agunan Peralatan"),
                              subtitle: Text(
                                  "Debitur ini memiliki ${formPeralatan.length} agunan peralatan"),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          ListView.separated(
                            itemCount:
                                int.parse(formPeralatan.length.toString()),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 12.0,
                            ),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Card(
                                clipBehavior: Clip.antiAlias,
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Agunan Peralatan ${index + 1}",
                                                  style: const TextStyle(
                                                    fontSize: 12.0,
                                                  ),
                                                ),
                                                const Spacer(),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10.0,
                                            ),
                                            Text(
                                              "${formPeralatan[index].deskripsiPanjang}",
                                              style: const TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 6.0,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Table(
                                                  columnWidths: const {
                                                    0: FlexColumnWidth(0.5),
                                                    1: FlexColumnWidth(0.1),
                                                    2: FlexColumnWidth(1),
                                                  },
                                                  children: [
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(''),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(''),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Nilai Pasar'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          'Rp. ${MoneyMaskedTextController(
                                                            decimalSeparator:
                                                                '',
                                                            thousandSeparator:
                                                                '.',
                                                            precision: 0,
                                                            initialValue:
                                                                double.parse(
                                                              formPeralatan[
                                                                      index]
                                                                  .nilaiPasar
                                                                  .toString(),
                                                            ),
                                                          ).text}',
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Nilai Liquidasi'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          'Rp. ${MoneyMaskedTextController(
                                                            decimalSeparator:
                                                                '',
                                                            thousandSeparator:
                                                                '.',
                                                            precision: 0,
                                                            initialValue:
                                                                double.parse(
                                                              formPeralatan[
                                                                      index]
                                                                  .nilaiLiquidasi
                                                                  .toString(),
                                                            ),
                                                          ).text}',
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Nilai Pengikatan'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          'Rp. ${MoneyMaskedTextController(
                                                            decimalSeparator:
                                                                '',
                                                            thousandSeparator:
                                                                '.',
                                                            precision: 0,
                                                            initialValue:
                                                                double.parse(
                                                              formPeralatan[
                                                                      index]
                                                                  .nilaiPengikatan
                                                                  .toString(),
                                                            ),
                                                          ).text}',
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Pengikatan'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          formPeralatan[index]
                                                              .pengikatan
                                                              .toString(),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
                formPeralatan != null
                    ? const SizedBox(
                        height: 10.0,
                      )
                    : const SizedBox.shrink(),
                formCash != null
                    ? Column(
                        children: [
                          Card(
                            color: Colors.red[100],
                            child: ListTile(
                              leading: const CircleAvatar(
                                child: Icon(Icons.attach_money),
                              ),
                              title: const Text("Agunan Cash"),
                              subtitle: Text(
                                  "Debitur ini memiliki ${formCash.length} agunan cash"),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          ListView.separated(
                            itemCount: int.parse(formCash.length.toString()),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 12.0,
                            ),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Card(
                                clipBehavior: Clip.antiAlias,
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Agunan Cash ${index + 1}",
                                                  style: const TextStyle(
                                                    fontSize: 12.0,
                                                  ),
                                                ),
                                                const Spacer(),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10.0,
                                            ),
                                            Text(
                                              "${formPeralatan![index].deskripsiPanjang}",
                                              style: const TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 6.0,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Table(
                                                  columnWidths: const {
                                                    0: FlexColumnWidth(0.5),
                                                    1: FlexColumnWidth(0.1),
                                                    2: FlexColumnWidth(1),
                                                  },
                                                  children: [
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(''),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(''),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Nilai Pasar'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          'Rp. ${MoneyMaskedTextController(
                                                            decimalSeparator:
                                                                '',
                                                            thousandSeparator:
                                                                '.',
                                                            precision: 0,
                                                            initialValue:
                                                                double.parse(
                                                              formCash[index]
                                                                  .nilaiPasar
                                                                  .toString(),
                                                            ),
                                                          ).text}',
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Nilai Liquidasi'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          'Rp. ${MoneyMaskedTextController(
                                                            decimalSeparator:
                                                                '',
                                                            thousandSeparator:
                                                                '.',
                                                            precision: 0,
                                                            initialValue:
                                                                double.parse(
                                                              formCash[index]
                                                                  .nilaiLiquidasi
                                                                  .toString(),
                                                            ),
                                                          ).text}',
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Nilai Pengikatan'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          'Rp. ${MoneyMaskedTextController(
                                                            decimalSeparator:
                                                                '',
                                                            thousandSeparator:
                                                                '.',
                                                            precision: 0,
                                                            initialValue:
                                                                double.parse(
                                                              formCash[index]
                                                                  .nilaiPengikatan
                                                                  .toString(),
                                                            ),
                                                          ).text}',
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Pengikatan'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          formCash[index]
                                                              .pengikatan
                                                              .toString(),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
                formCash != null
                    ? const SizedBox(
                        height: 10.0,
                      )
                    : const SizedBox.shrink(),
                const SizedBox(
                  height: 10.0,
                ),
                formLos != null
                    ? Column(
                        children: [
                          Card(
                            color: Colors.green[100],
                            child: ListTile(
                              leading: const CircleAvatar(
                                child: Icon(Icons.shopify_rounded),
                              ),
                              title: const Text("Agunan Los / Kios Pasar"),
                              subtitle: Text(
                                  "Debitur ini memiliki ${formLos.length} agunan los"),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          ListView.separated(
                            itemCount: int.parse(formLos.length.toString()),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 12.0,
                            ),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Card(
                                clipBehavior: Clip.antiAlias,
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 300.0,
                                        child: SizedBox(
                                          height: 200,
                                          width: 450,
                                          child: FlutterMap(
                                            options: MapOptions(
                                              center: LatLng(
                                                // Split string to get latitude and longitude
                                                double.parse(formLos[index]
                                                    .titikKoordinat!
                                                    .split(',')[0]),
                                                double.parse(formLos[index]
                                                    .titikKoordinat!
                                                    .split(',')[1]),
                                              ),
                                              zoom: 16,
                                              interactiveFlags:
                                                  InteractiveFlag.all -
                                                      InteractiveFlag.rotate,
                                            ),
                                            children: [
                                              TileLayer(
                                                urlTemplate:
                                                    'https://mt1.google.com/vt/lyrs=m&x={x}&y={y}&z={z}',
                                                userAgentPackageName:
                                                    'dev.fleaflet.flutter_map.example',
                                              ),
                                              PopupMarkerLayerWidget(
                                                options:
                                                    PopupMarkerLayerOptions(
                                                  popupController: controller
                                                      .popupLayerController,
                                                  markers: [
                                                    Marker(
                                                      point: LatLng(
                                                        // Split string to get latitude and longitude
                                                        double.parse(
                                                            formLos[index]
                                                                .titikKoordinat!
                                                                .split(',')[0]),
                                                        double.parse(
                                                            formLos[index]
                                                                .titikKoordinat!
                                                                .split(',')[1]),
                                                      ),
                                                      width: 40,
                                                      height: 40,
                                                      builder: (_) =>
                                                          const Icon(
                                                        Icons.location_on,
                                                        size: 50,
                                                        color: GFColors.DANGER,
                                                      ),
                                                      anchorPos:
                                                          AnchorPos.align(
                                                        AnchorAlign.top,
                                                      ),
                                                    ),
                                                  ],
                                                  markerRotateAlignment:
                                                      PopupMarkerLayerOptions
                                                          .rotationAlignmentFor(
                                                              AnchorAlign.top),
                                                  popupBuilder:
                                                      (BuildContext context,
                                                              Marker marker) =>
                                                          ExamplePopup(marker),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Agunan Los ${index + 1}",
                                                  style: const TextStyle(
                                                    fontSize: 12.0,
                                                  ),
                                                ),
                                                const Spacer(),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10.0,
                                            ),
                                            Text(
                                              "${formLos[index].deskripsiPendek}",
                                              style: const TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 6.0,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Table(
                                                  columnWidths: const {
                                                    0: FlexColumnWidth(0.5),
                                                    1: FlexColumnWidth(0.1),
                                                    2: FlexColumnWidth(1),
                                                  },
                                                  children: [
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Atas Nama'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          formLos[index]
                                                              .namaPemilik
                                                              .toString(),
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Tempat Tgl Lahir'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          '${formLos[index].tempatLahir.toString()}, ${DateFormat('dd MMMM yyyy').format(DateTime.parse(formLos[index].tanggalLahir.toString()))}',
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Alamat'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          formLos[index]
                                                              .alamatPemilik
                                                              .toString(),
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Komponen'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          formLos[index]
                                                              .komponen
                                                              .toString(),
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Tempat Dasaran'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          formLos[index]
                                                              .tempatDasaran
                                                              .toString(),
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'No Registrasi'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          formLos[index]
                                                              .noRegistrasi
                                                              .toString(),
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah('Luas'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          '${formLos[index].luasLos.toString()} m2',
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Jenis Dagangan'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          formLos[index]
                                                              .jenisDagangan
                                                              .toString(),
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Jam Buka'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          '${formLos[index].waktuBuka.toString()} - ${formLos[index].waktuTutup.toString()} WIB',
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Berlaku s/d'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          DateFormat(
                                                                  'dd MMMM yyyy')
                                                              .format(DateTime
                                                                  .parse(formLos[
                                                                          index]
                                                                      .berlakuSampai
                                                                      .toString())),
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(''),
                                                        paddedTextTanah(''),
                                                        paddedTextTanah(''),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Nilai Pasar'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          'Rp. ${MoneyMaskedTextController(
                                                            decimalSeparator:
                                                                '',
                                                            thousandSeparator:
                                                                '.',
                                                            precision: 0,
                                                            initialValue:
                                                                double.parse(
                                                              formLos[index]
                                                                  .nilaiPasar
                                                                  .toString(),
                                                            ),
                                                          ).text}',
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Nilai Likuidasi'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          'Rp. ${MoneyMaskedTextController(
                                                            decimalSeparator:
                                                                '',
                                                            thousandSeparator:
                                                                '.',
                                                            precision: 0,
                                                            initialValue:
                                                                double.parse(
                                                              formLos[index]
                                                                  .nilaiLiquidasi
                                                                  .toString(),
                                                            ),
                                                          ).text}',
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Nilai Pengikatan'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          'Rp. ${MoneyMaskedTextController(
                                                            decimalSeparator:
                                                                '',
                                                            thousandSeparator:
                                                                '.',
                                                            precision: 0,
                                                            initialValue:
                                                                double.parse(
                                                              formLos[index]
                                                                  .nilaiPengikatan
                                                                  .toString(),
                                                            ),
                                                          ).text}',
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Pengikatan'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          formLos[index]
                                                              .pengikatan
                                                              .toString(),
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(''),
                                                        paddedTextTanah(''),
                                                        paddedTextTanah(''),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Lokasi Pasar'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          formLos[index]
                                                              .lokasiPasar
                                                              .toString(),
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Titik Koordinat'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          formLos[index]
                                                              .titikKoordinat
                                                              .toString(),
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(''),
                                                        paddedTextTanah(''),
                                                        paddedTextTanah(''),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Pemilik'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          formLos[index]
                                                              .namaPemilik
                                                              .toString(),
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Alamat'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          formLos[index]
                                                              .alamatPemilik
                                                              .toString(),
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Summary'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          formLos[index]
                                                              .deskripsiPanjang
                                                              .toString(),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
                formLos != null
                    ? const SizedBox(
                        height: 10.0,
                      )
                    : const SizedBox.shrink(),
                formLainnya != null
                    ? Column(
                        children: [
                          Card(
                            color: Colors.lime[100],
                            child: ListTile(
                              leading: const CircleAvatar(
                                child: Icon(Icons.food_bank),
                              ),
                              title: const Text("Agunan Lainnya"),
                              subtitle: Text(
                                  "Debitur ini memiliki ${formLainnya.length} agunan lainnya"),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          ListView.separated(
                            itemCount: int.parse(formLainnya.length.toString()),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 12.0,
                            ),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Card(
                                clipBehavior: Clip.antiAlias,
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${formLainnya[index].deskripsiPanjang}",
                                              style: const TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 6.0,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Table(
                                                  columnWidths: const {
                                                    0: FlexColumnWidth(0.5),
                                                    1: FlexColumnWidth(0.1),
                                                    2: FlexColumnWidth(1),
                                                  },
                                                  children: [
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Keterangan'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          formLainnya[index]
                                                              .deskripsiPanjang
                                                              .toString(),
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Perusahaan'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          formLainnya[index]
                                                              .namaAsuransiPenjamin
                                                              .toString(),
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(''),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(''),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        paddedTextTanah(
                                                            'Nilai Pasar'),
                                                        paddedTextTanah(':'),
                                                        paddedTextTanah(
                                                          'Rp. ${MoneyMaskedTextController(
                                                            decimalSeparator:
                                                                '',
                                                            thousandSeparator:
                                                                '.',
                                                            precision: 0,
                                                            initialValue:
                                                                double.parse(
                                                              formLainnya[index]
                                                                  .nilaiPasar
                                                                  .toString(),
                                                            ),
                                                          ).text}',
                                                        ),
                                                      ],
                                                    ),
                                                    // TableRow(
                                                    //   children: [
                                                    //     paddedTextTanah('Nilai Liquidasi'),
                                                    //     paddedTextTanah(':'),
                                                    //     paddedTextTanah(
                                                    //       'Rp. ${MoneyMaskedTextController(
                                                    //         decimalSeparator: '',
                                                    //         thousandSeparator: '.',
                                                    //         precision: 0,
                                                    //         initialValue: double.parse(
                                                    //           controller.listAgunanLainnya[index]
                                                    //               .nilaiLiquidasi
                                                    //               .toString(),
                                                    //         ),
                                                    //       ).text}',
                                                    //     ),
                                                    //   ],
                                                    // ),
                                                    // TableRow(
                                                    //   children: [
                                                    //     paddedTextTanah('Nilai Pengikatan'),
                                                    //     paddedTextTanah(':'),
                                                    //     paddedTextTanah(
                                                    //       'Rp. ${MoneyMaskedTextController(
                                                    //         decimalSeparator: '',
                                                    //         thousandSeparator: '.',
                                                    //         precision: 0,
                                                    //         initialValue: double.parse(
                                                    //           controller.listAgunanLainnya[index]
                                                    //               .nilaiPengikatan
                                                    //               .toString(),
                                                    //         ),
                                                    //       ).text}',
                                                    //     ),
                                                    //   ],
                                                    // ),
                                                    // TableRow(
                                                    //   children: [
                                                    //     paddedTextTanah('Pengikatan'),
                                                    //     paddedTextTanah(':'),
                                                    //     paddedTextTanah(
                                                    //       controller
                                                    //           .listAgunanLainnya[index].pengikatan
                                                    //           .toString(),
                                                    //     ),
                                                    //   ],
                                                    // ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      )
                    : const SizedBox.shrink()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget paddedTextTanah(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 2.0),
    child: Text(
      text,
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
    ),
  );
}
