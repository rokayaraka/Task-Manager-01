import 'package:flutter/material.dart';
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
    return AppBar(
      backgroundColor: Colors.green,
      title: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage('https://static.vecteezy.com/system/resources/previews/014/194/215/non_2x/avatar-icon-human-a-person-s-badge-social-media-profile-symbol-the-symbol-of-a-person-vector.jpg'),
          ),
          SizedBox(width: 10,),
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Rokaya Raka',
              style: TextTheme.of(context).bodyMedium!.copyWith(
                color: Colors.white,
                fontSize: 17,
              ),
              ),
              Text('rokayaraka251@gmail.com',
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