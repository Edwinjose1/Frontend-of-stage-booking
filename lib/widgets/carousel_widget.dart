import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items:const [
        //1st Image of Slider
        ContainerforCarouselslider(url:"https://assets-news.housing.com/news/wp-content/uploads/2022/01/11220447/wedding-stage-decoration-shutterstock_1193416354-1200x700-compressed.jpg" ),
        //2nd Image of Slider
        ContainerforCarouselslider(url: "https://wp.popxo.com/wp-content/uploads/2022/03/aashstudio_154135568_1532899950235445_4280014286567207249_n.jpg",),
        //3nd Image of Slider
        ContainerforCarouselslider(url: "https://weddingbanquets.in/blog/wp-content/uploads/2022/04/Bougainvillaea.jpg"),
        //4nd Image of Slider
        ContainerforCarouselslider(url: "https://i.pinimg.com/originals/cd/9b/34/cd9b3420955f73f3454e9de058d2ce50.jpg"),


      ],

      //Slider Container properties
      options: CarouselOptions(
        height: 180.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
         autoPlayAnimationDuration: Duration(milliseconds: 800),
        // autoPlayAnimationDuration:Duration.zero ,
        viewportFraction: 0.8,
      ),
    );
  }
}

class ContainerforCarouselslider extends StatelessWidget {
  const ContainerforCarouselslider({
    super.key,required this.url,
  });
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
          image: NetworkImage(
              url),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}