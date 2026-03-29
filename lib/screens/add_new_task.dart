import 'package:flutter/material.dart';
import 'package:task_manager_astad/Data/Models/api_response.dart';
import 'package:task_manager_astad/Data/services/api_caller.dart';
import 'package:task_manager_astad/utils/urls.dart';
import 'package:task_manager_astad/widgets/screen_background.dart';
import 'package:task_manager_astad/widgets/tm_appbar.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({super.key});

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  bool isLoading = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TmAppbar(),
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 80),
                Text(
                  'Add New Task',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _subjectController,
                  decoration: InputDecoration(hintText: 'Subject'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Title';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _descriptionController,
                  maxLines: 4,
                  decoration: InputDecoration(hintText: 'Description'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Description';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 20),
                FilledButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _addNewTask();
                    }
                  },
                  child: Icon(Icons.arrow_circle_right_outlined),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _addNewTask() async {
    Map<String, dynamic> requestBody = {
      "title": _subjectController.text,
      "description":_descriptionController.text ,
      "status": "New",
    };
    setState(() {
      isLoading = true;
    });
    final ApiResponse response = await ApiCaller.PostRequest(
      URL: Urls.AddTaskUrl,
      body: requestBody,
    );
    setState(() {
      isLoading = false;
    });

    if (response.isSuccess) {
   
      ScaffoldMessenger.of(
        // ignore: use_build_context_synchronously
        context,
      ).showSnackBar(SnackBar(content: Text('Task Added Successfully.')));
    } else {
      ScaffoldMessenger.of(
        // ignore: use_build_context_synchronously
        context,
      ).showSnackBar(SnackBar(content: Text(response.responseData['data'])));
    }
  }
}
