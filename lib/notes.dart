import 'package:flutter/material.dart';


class Notes extends StatefulWidget {
  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  TextEditingController createFolderController = TextEditingController();

 final _formKey = GlobalKey<FormState>();


  //local database - hive
  //form validation
  //dialog,appbar,listview.builder,listtile,card,

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 5,
        backgroundColor: Color(0xff6573F5),
        leading: IconButton(onPressed:(){
        Navigator.pop(context);
        }, icon:Icon(Icons.arrow_back,color: Colors.white,)),
       actions: [
        IconButton(onPressed: (){
          showDialog(context: context, builder: (context){
            return Dialog(
              
              child: Container(
                height: 230,
                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Enter your Folder name',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                        const SizedBox(height: 8,),
                        TextFormField(
                            controller: createFolderController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please, Enter your folder name';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder()
                            ),
                          ),
                          const SizedBox(height: 10,),
                        Center(child: ElevatedButton(onPressed: ()async{
                          if (_formKey.currentState!.validate()) {
                        
                            Navigator.pop(context);
                          }
                        }, child: Text('Create New')))
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
        }, icon:Icon(Icons.folder,color: Colors.white,))
       ],

      ),
      body: Center(child: Text('Notes'))
    );
  }
}


