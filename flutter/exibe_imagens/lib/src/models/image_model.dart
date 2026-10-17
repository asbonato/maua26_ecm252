class ImageModel {
  late String url;
  late String alt;

  ImageModel(this.url, this.alt);

  ImageModel.fromJSON(Map <String, dynamic> decodedJSON) {
    //o resultado tem uma coleção de fotos
    //vamos pegar sempre a primeira
    //por isso, posição zero
    //dela, pegamos o tamanho médio (propriedade do objeto src)
    url = decodedJSON['photos'][0]['src']['medium'];
    alt = decodedJSON['photos'][0]['alt'];
  }

  //outra forma de definir um construtor
  // ImageModel.fromJSON(Map <String, dynamic> decodedJSON)
  //   : url = decodedJSON['photos'][0]['src']['medium'],
  //     alt = decodedJSON['photos'][0]['alt'];
  // }

  @override
  String toString() {
    return 'url: $url, alt: $alt';
  }
}