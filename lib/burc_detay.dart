import 'package:burclar_rehberi/model/burc.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetay extends StatefulWidget {
  final Burc secilenBurc;
  const BurcDetay({required this.secilenBurc, Key? key}) : super(key: key);

  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Color appBarRengi = Colors.transparent;
  late PaletteGenerator _generator;

  // bu metod sayfa yüklenmeden önce initialize işlemi yapmayı sağlıyor. ilk değer atamalaı için kullanılıyor genelde.
  @override
  void initState() {
    super.initState();

    // bu kısım alt taraftaki build 1 kere çalıştıktan sonra buraya verilen fonksiyonu çalıştırıyor.
    // yani build metodun ilk ve 1 kez çalışmasına izin veriyor.
    WidgetsBinding.instance.addPostFrameCallback((_) => appBarRenginiBul());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            backgroundColor: appBarRengi,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.secilenBurc.burcAd + " Burcu ve Özellikleri"),
              centerTitle: true,
              background: Image.asset(
                "images/" + widget.secilenBurc.buyukResim,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Text(
                  widget.secilenBurc.burcDetay,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void appBarRenginiBul() async {
    _generator = await PaletteGenerator.fromImageProvider(
        AssetImage("images/${widget.secilenBurc.buyukResim}"));
    appBarRengi = _generator.dominantColor!.color;
    setState(() {});
  }
}
