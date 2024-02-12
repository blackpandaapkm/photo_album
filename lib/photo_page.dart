import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:photo_album/photo.dart';
import 'package:photo_album/fetch_photo.dart';
import 'package:http/http.dart' as http;
import 'package:photo_album/photo_details.dart';

class PhotoPage extends StatelessWidget {
  const PhotoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery App'),
        backgroundColor: Colors.blueAccent.shade200,
        foregroundColor: Colors.white,
        centerTitle: false,
      ),
      body: FutureBuilder<List<Photo>>(
        future: getPhotosFromApi(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return  Center(
              child: SpinKitWaveSpinner(
                color:Colors.blueAccent.shade200,
                waveColor: Colors.blueAccent.shade100,
                trackColor: Colors.white12,
                size: 100,
              ),
            );

          } else if (snapshot.data == null || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No photos available.'),
            );
          } else {
            return ListView.separated(
              itemCount: snapshot.data?.length ?? List.empty().length,
              itemBuilder: (context, index) {
                final photo = snapshot.data![index];
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ListTile(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PhotoDetails(photo: photo))),
                    leading: Hero(
                      tag: photo.id!,
                      child: Image.network(photo.thumbnailUrl ??
                          ''),
                    ),
                    title: Text(
                      photo.title ?? 'N/A',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  color: Colors.grey.shade300,
                  indent: 16,
                );
              },
            );
          }
        },
      ),
    );
  }
}