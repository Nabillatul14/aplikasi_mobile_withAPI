// import 'package:flutter/material.dart';
// import 'package:flutter_api_bawaslu/provider/simpan.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_api_bawaslu/provider/simpan.dart';

// class FavoritePage extends StatelessWidget {
//   const FavoritePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<simpanbookmark>(context);
//     final favorites = provider.favorites;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Bookmark'),
//       ),
//       body: ListView.builder(
//         itemCount: favorites.length,
//         itemBuilder: (context, index) {
//           final favorite = favorites[index];
//           return ListTile(
//             title: Text(favorite.title),
//             trailing: IconButton(
//               onPressed: () {
//                 provider.toggleFavorite(favorite.id);
//               },
//               icon: provider.isFavorite(favorite.id)
//                   ? const Icon(Icons.favorite, color: Colors.red)
//                   : const Icon(Icons.favorite_border),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_api_bawaslu/provider/simpan.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SimpanBookmark>(context);
    final favorites = provider.posts.where((post) => provider.isFavorite(post.id)).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmark'),
      ),
      body: favorites.isEmpty
          ? Center(
              child: Text(
                'No bookmarks yet',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final favorite = favorites[index];
                return ListTile(
                  title: Text(favorite.title),
                  trailing: IconButton(
                    onPressed: () {
                      provider.toggleFavorite(favorite.id);
                    },
                    icon: provider.isFavorite(favorite.id)
                        ? const Icon(Icons.favorite, color: Colors.red)
                        : const Icon(Icons.favorite_border),
                  ),
                );
              },
            ),
    );
  }
}
