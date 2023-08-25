import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBestSeller extends StatelessWidget {
  const ShimmerBestSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      gradient: const LinearGradient(
        colors: [
          Colors.white38,
          Colors.white10,
          Colors.white24,
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 125,
            child: Row(
              children: [
              AspectRatio(
              aspectRatio: 2.6 / 4,
              child: ClipRRect(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                borderRadius: BorderRadius.circular(16),
                child: Container(color: Colors.white,),
              ),
            ),
                const SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 10,
                        color: Colors.black,
                      ),
                      Container(
                        height: 10,
                        width: MediaQuery.of(context).size.width*0.3,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 10,
                            width:MediaQuery.of(context).size.width * 0.2,
                            color: Colors.black,
                          ),
                          Container(
                            height: 10,
                            width:MediaQuery.of(context).size.width * 0.1,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20,),

          SizedBox(
            height: 125,
            child: Row(
              children: [
                AspectRatio(
                  aspectRatio: 2.6 / 4,
                  child: ClipRRect(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    borderRadius: BorderRadius.circular(16),
                    child: Container(color: Colors.white,),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 10,
                        color: Colors.black,
                      ),
                      Container(
                        height: 10,
                        width: MediaQuery.of(context).size.width*0.3,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 10,
                            width:MediaQuery.of(context).size.width * 0.2,
                            color: Colors.black,
                          ),
                          Container(
                            height: 10,
                            width:MediaQuery.of(context).size.width * 0.1,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20,),

          SizedBox(
            height: 125,
            child: Row(
              children: [
                AspectRatio(
                  aspectRatio: 2.6 / 4,
                  child: ClipRRect(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    borderRadius: BorderRadius.circular(16),
                    child: Container(color: Colors.white,),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 10,
                        color: Colors.black,
                      ),
                      Container(
                        height: 10,
                        width: MediaQuery.of(context).size.width*0.3,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 10,
                            width:MediaQuery.of(context).size.width * 0.2,
                            color: Colors.black,
                          ),
                          Container(
                            height: 10,
                            width:MediaQuery.of(context).size.width * 0.1,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20,),


        ],
      ),
    );
  }
}


class ShimmerBestSellerItem extends StatelessWidget {
  const ShimmerBestSellerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      gradient: const LinearGradient(
        colors: [
          Colors.white38,
          Colors.white10,
          Colors.white24,
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 125,
            child: Row(
              children: [
                AspectRatio(
                  aspectRatio: 2.6 / 4,
                  child: ClipRRect(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    borderRadius: BorderRadius.circular(16),
                    child: Container(color: Colors.white,),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 10,
                        color: Colors.black,
                      ),
                      Container(
                        height: 10,
                        width: MediaQuery.of(context).size.width*0.3,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 10,
                            width:MediaQuery.of(context).size.width * 0.2,
                            color: Colors.black,
                          ),
                          Container(
                            height: 10,
                            width:MediaQuery.of(context).size.width * 0.1,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20,),
        ],
      ),
    );
  }
}
