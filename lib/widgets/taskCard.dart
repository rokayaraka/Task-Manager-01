import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          title: Text('Task Title',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 23,),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Description',style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 18,),),
              Text('Date: 27 Feb 2026',style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 18,),),
              Row(
                children: [
                  Chip(label: Text('New',),
                  backgroundColor: Colors.blue,
                  labelStyle: TextStyle(color: Colors.white,),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(25),
                  ),
                  ),
                  Spacer(),
                  IconButton(onPressed: (){}, icon: Icon(Icons.edit,color: Colors.orange,)),
                  IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: Colors.red,)),
        
                ],
              ),
        
            ],
          ),
        
        ),
      ),
    );
  }
}