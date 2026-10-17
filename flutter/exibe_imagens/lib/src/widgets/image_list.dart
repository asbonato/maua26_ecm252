import 'package:flutter/material.dart';
import '../models/image_model.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> imagens;
  ImageList(this.imagens);

  @override
  Widget build(BuildContext context) {
    //Column empilha o texto e a grade verticalmente
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Você tem ${imagens.length} imagens',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        //Expanded faz a grade ocupar todo o espaço restante da Column
        Expanded(
          child: GridView.builder(
            //afasta a grade das bordas da tela (esquerda, direita e baixo)
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            //duas imagens por linha, com espaçamento entre elas
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              //largura / altura de cada célula; < 1 deixa espaço para o texto
              childAspectRatio: 0.75,
            ),
            itemCount: imagens.length,
            itemBuilder: (BuildContext context, int index) {
              return buildImagem(imagens[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget buildImagem(ImageModel imagem) {
    //Container permite definir borda, espaçamento interno (padding) etc.
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          //a imagem ocupa o espaço que sobra acima da descrição
          Expanded(
            child: Image.network(imagem.url, fit: BoxFit.cover),
          ),
          const SizedBox(height: 8),
          //descrição logo abaixo da imagem
          Text(
            imagem.alt,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
