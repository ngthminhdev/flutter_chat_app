import 'package:flutter/material.dart';
import 'package:mc_application/core/appearances/colors.dart';
import 'package:mc_application/core/helpers/screen_helper.dart';

class Conversation extends StatefulWidget {
  const Conversation({super.key});

  @override
  State<Conversation> createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      padding: EdgeInsets.symmetric(
          vertical: screenHelper.getHeightByPercent(0.03),
          horizontal: screenHelper.getWidthByPercent(0.02)),
      margin: EdgeInsets.only(bottom: screenHelper.getHeightByPercent(0.02)),
      child: Row(children: [
        Column(
          children: [
            Row(
              children: [
                Container(
                  height: screenHelper.setHeight(50),
                  width: screenHelper.setWidth(50),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset('assets/images/avatar2.jpg'),
                  ),
                ),
                SizedBox(width: screenHelper.setWidth(10)),
                Container(
                  width: screenHelper.getWidthByPercent(0.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nguyen Minh',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: screenHelper.setWidth(5)),
                      Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, ',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[700],
                          )),
                    ],
                  ),
                ),
                Container(
                  width: screenHelper.getWidthByPercent(0.2),
                  child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '20:00',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: screenHelper.setHeight(10)),
                        Container(
                          width: screenHelper.setWidth(15),
                          height: screenHelper.setHeight(15),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: primaryGreen),
                          child: Text(
                            '3',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ]),
                )
              ],
            )
          ],
        )
      ]),
    );
  }
}
