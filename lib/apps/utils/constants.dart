
const baseLink = 'assets/images/weathers/';
class AssetCustom {
  static String getImageLink(String name ) {
    return '$baseLink${name.replaceAll(' ', '').toLowerCase()}.png';
  }
}

class MyKey {
  static const String  apiToken = 'e6ce7c456624e79a82043f834373b387';
}