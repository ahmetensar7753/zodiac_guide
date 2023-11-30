class Burc {
  final String _burcAd;
  final String _burcTarih;
  final String _burcDetay;
  final String _kucukResim;
  final String _buyukResim;

  get burcAd => this._burcAd;

  get burcTarih => this._burcTarih;

  get burcDetay => this._burcDetay;

  get kucukResim => this._kucukResim;

  get buyukResim => this._buyukResim;

  Burc(this._burcAd, this._burcTarih, this._burcDetay, this._kucukResim,
      this._buyukResim);

  @override
  String toString() {
    // TODO: implement toString
    return "$_burcAd - $_buyukResim";
  }
}
