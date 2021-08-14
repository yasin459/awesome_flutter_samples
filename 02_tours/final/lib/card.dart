import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

Widget myCard(tourDetail, ThemeData theme, onPressed) {
  const padding = 15.0;

  return Card(
    elevation: 10,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          tourDetail["image"],
        ),
        Padding(
          padding: const EdgeInsets.all(padding),
          child: Row(
            children: [
              Text(
                tourDetail["name"],
                style: theme.textTheme.bodyText1!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.blue.shade50,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text("\$" + tourDetail["price"],
                      style: theme.textTheme.bodyText2!
                          .copyWith(color: Colors.blue)))
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(padding),
            child: ReadMoreText(
              tourDetail["info"],
              style: theme.textTheme.bodyText1,
              trimLines: 3,
              colorClickableText: Colors.blue,
              trimMode: TrimMode.Line,
              trimCollapsedText: ' ...Read more',
              trimExpandedText: ' ...Show less',
            )),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: Colors.red,
                  width: 1,
                ),
              ),
              onPressed: () => onPressed(tourDetail["id"]),
              child: Text(
                "Not Interested",
                style: theme.textTheme.headline6!.copyWith(color: Colors.red),
              )),
        )
      ],
    ),
  );
}
