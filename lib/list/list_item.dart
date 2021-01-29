// The base class for the different types of item the list can contain
import 'package:flutter/cupertino.dart';

abstract class ListItem {
  Widget buildDate(BuildContext context);

  Widget buildActHours(BuildContext context);

  Widget buildTotalHours(BuildContext context);

  Widget buildNote(BuildContext context);
}

class HeadingItem implements ListItem {
  @override
  Widget buildDate(BuildContext context) {
    // TODO: implement buildDate
    throw UnimplementedError();
  }


  @override
  Widget buildActHours(BuildContext context) => null;

  @override
  Widget buildNote(BuildContext context) => null;

  @override
  Widget buildTotalHours(BuildContext context) => null;

}