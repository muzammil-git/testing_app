import 'package:fitness_app/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../models/favorites_provider.dart';
import 'favorites.dart';


class LandingPage extends StatelessWidget {

  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Testing Sample'),
        actions: <Widget>[
          TextButton.icon(
            onPressed: () {
              context.push('/favorites');
            },
            icon: const Icon(Icons.favorite_border, color: AppColors.whiteColor,),
            label: const Text('Favs', style: TextStyle(color: AppColors.whiteColor),),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 100,
        cacheExtent: 20.0,
        physics: BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (context, index) => ItemTile(index),
      ),
    );
  }
}

class ItemTile extends StatelessWidget {
  final int itemNo;

  const ItemTile(this.itemNo, {super.key});

  @override
  Widget build(BuildContext context) {
    var favoritesList = Provider.of<FavoritesProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.primaries[itemNo % Colors.primaries.length],
        ),
        title: Text(
          'Item $itemNo',
          key: Key('text_$itemNo'),
        ),
        trailing: IconButton(
          key: Key('icon_$itemNo'),
          icon: favoritesList.items.contains(itemNo)
              ? const Icon(Icons.favorite)
              : const Icon(Icons.favorite_border),
          onPressed: () {
            !favoritesList.items.contains(itemNo)
                ? favoritesList.add(itemNo)
                : favoritesList.remove(itemNo);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(favoritesList.items.contains(itemNo)
                    ? 'Added to favorites.'
                    : 'Removed from favorites.'),
                duration: const Duration(seconds: 1),
              ),
            );
          },
        ),
      ),
    );
  }
}


//
// class LandingPage extends StatelessWidget {
//   const LandingPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text("Landing Page"),
//               ElevatedButton(
//                 onPressed: () {
//                   context.go("/setting");
//                 },
//                 child: const Text("Go to setting page"),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   context.push("/premium");
//                 },
//                 child: const Text("Go to Premium Page"),
//               ),
//
//               const SizedBox(
//                 height: 20,
//               ),
//
//               ElevatedButton(
//                 onPressed: () {
//                   context.push("/favorites");
//                 },
//                 child: const Text("Go to Favorites Page"),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
