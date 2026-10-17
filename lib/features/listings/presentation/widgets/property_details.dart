import 'package:alphabeta/features/listings/presentation/widgets/common_tag.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PropertyDetails extends StatelessWidget {
  const PropertyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '\$21,600,000',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            'description'.tr(),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 4),
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.bodyMedium,
              children: [
                TextSpan(
                  text: '4 ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: 'beds'.tr() + "  "),

                TextSpan(
                  text: '3 ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: 'baths'.tr() + "  "),
                TextSpan(
                  text: '367 ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: 'sqm'.tr() + "  "),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              CommonTag(text: "villa".tr()),
              SizedBox(width: 8),
              CommonTag(text: 'sale'.tr()),
            ],
          ),
        ],
      ),
    );
  }
}
