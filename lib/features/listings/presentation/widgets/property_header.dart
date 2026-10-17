import 'package:alphabeta/features/listings/domain/cubits/favorite_cubit.dart';
import 'package:alphabeta/widgets/common_svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class PropertyHeader extends StatelessWidget {
  final int index;

  const PropertyHeader({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final favoriteCubit = context.watch<FavoriteCubit>();
    final isFavorite = favoriteCubit.isFavorite(index);

    return Positioned(
      top: 8,
      left: 8,
      right: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(
                        'assets/agents/agent$index.png',
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: SvgPicture.asset(
                      'assets/icons/ring.svg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0, // Adjust position for overlap like in image
                    child: SvgPicture.asset(
                      'assets/icons/approved.svg',
                      width: 23,
                      height: 23,
                    ),
                  ),
                ],
              ),

              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Noah Thomy',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Phoenicia Real Estate',
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall?.copyWith(color: Colors.white70),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: () => favoriteCubit.toggleFavorite(index),
            child: CommonSvgIcon(
              assetName: isFavorite ? 'heart solid.svg' : 'heart big.svg',
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
