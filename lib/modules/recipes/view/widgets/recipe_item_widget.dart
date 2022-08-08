import 'package:coffers_app/modules/recipes/data/models/recipe.dart';
import 'package:coffers_app/modules/recipes/view/pages/recipe_item_page.dart';
import 'package:coffers_app/shared/colors.dart';
import 'package:flutter/material.dart';

class RecipeItemWidget extends StatelessWidget {
  const RecipeItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Recipe item;

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => RecipeItemPage(item: item))),
      child: Card(
        color: lightBrown,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.black12, width: 0.8),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [_imageBackground(), const Spacer(), _titleRow(mediaQuery)],
        ),
      ),
    );
  }

  Widget _titleRow(Size mediaQuery) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 12.0),
      child: Row(
        children: [
          SizedBox(
            width: mediaQuery.width / 3,
            child: Text(
              item.title,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: primaryBrown,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0),
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 20.0,
            color: primaryBrown,
          )
        ],
      ),
    );
  }

  Widget _imageBackground() {
    return Container(
      height: 150.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(item.imageUrl),
        ),
      ),
    );
  }
}
