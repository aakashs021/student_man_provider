import 'package:student_management/database/databasedesktop.dart';
import 'package:student_management/database/databasemobile.dart';
import 'package:student_management/student%20model/student_model.dart';
import 'package:universal_io/io.dart' as io;

bool platformfinder=(io.Platform.isWindows || io.Platform.isLinux || io.Platform.isMacOS);

initdb()async{
  if (platformfinder){
    await initDbforlinux();
  }else{
    await initDbformobile();
  }
}
get()async{
  if(platformfinder){
    await getforlinux();
  }else{
    await getformobile();
  }
}
add(StudentModel sd)async{
  if(platformfinder){
    await addforlinux(sd);
  }else{
    await addformobile(sd);
  }
}
delete(int id)async{
  if(platformfinder){
    await deleteforlinux(id);
  }else{
    await deleteformobile(id);
  }
}
update(StudentModel sd)async{
  if(platformfinder){
await updateforlinux(sd);
  }else{
    await updateformobile(sd);
  }
}