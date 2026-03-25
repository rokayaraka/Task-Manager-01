import 'package:flutter/material.dart';
import 'package:task_manager_astad/Controller/auth_controller.dart';
import 'package:task_manager_astad/screens/new_login_screen.dart';

class TmAppbar extends StatelessWidget implements PreferredSize{

  
  const TmAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    void _onTapLogOut() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewLoginScreen()),
    );
  }

  final profilePic = AuthController.userModel!.photo;

    return AppBar(
      backgroundColor: Colors.green,
      title: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              profilePic!
            ),
          ),
          SizedBox(width: 10,),
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${AuthController.userModel!.firstName}${AuthController.userModel!.lastName}',
              style: TextTheme.of(context).bodyMedium!.copyWith(
                color: Colors.white,
                fontSize: 17,
              ),
              ),
              Text('${AuthController.userModel!.email}',
              style: TextTheme.of(context).bodySmall!.copyWith(
                color: Colors.white,
                fontSize: 12,
              ),
              ),
            ],
          )
        ],
      ),
      actions: [
        IconButton(onPressed: _onTapLogOut, icon: Icon(Icons.logout,color: Colors.white,))
      ],
    );
  }
  
  
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  
  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}