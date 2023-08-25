import 'package:booklyapp/Core/widgets/shimmer_featured.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imgUrl});

  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: ClipRRect(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        borderRadius: BorderRadius.circular(16),
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: imgUrl,
          placeholder: (context, url) => SizedBox(height: MediaQuery.of(context).size.height *0.3,child: const ShimmerFeaturedList()),
          errorWidget: (context, url, error) => const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.warning_amber_outlined,
                size: 32,
              ),
              SizedBox(height:10,),
              Text('Image Not Available',textAlign: TextAlign.center,),
            ],
          ),
        ),
      ),
    );
  }
}
