import 'package:flutter/material.dart';
import 'package:photo_album/photo.dart';


class PhotoDetails extends StatelessWidget {
  final Photo photo;


  const PhotoDetails({super.key, required this.photo});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Details'),
        backgroundColor: Colors.blueAccent.shade200,
        foregroundColor: Colors.white,
      ),
      body:


      Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              child: Card(
                color: Colors.grey.shade100,
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Image.network(
                        photo.url ?? '',
                        height: 600,
                        width: 600,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                        child: Text(
                          photo.title ?? 'N/A',
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 25,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                        child: Text(
                          "id: ${photo.id.toString() ?? 'N/A'}",
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 25,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ],
      )

    );
  }
}


