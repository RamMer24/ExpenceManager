
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class Databasehandler
{
  Database? db;

   Future<Database>create_db()  async
  {
   if (db!=null)
     {
       return db!;
     }
   else
     {
       Directory dir = await getApplicationDocumentsDirectory();
       String dbpath = join(dir.path,"transaction_db");
       var db = await openDatabase(dbpath,version: 1,onCreate: create_table);
       return db;
     }
  }
  create_table(Database db,int version)
  {
    db.execute("create table transation(tid integer primary key autoincrement,title text,remark text,date text,Amount double,type text,ctaegory text)");
    print("table created");
  }
  Future<int> inserttarnsaction(title,remark,date,Amount,type,ctaegory) async
  {
   var db = await create_db();

   var id  = await db.rawInsert("insert into transation(title,remark,date,Amount,type,ctaegory)"
       "values(?,?,?,?,?,?)",[title,remark,date,Amount,type,ctaegory]);
   return id;
  }


  Future<List> viewtarnsaction(trtype)async
  {
    var query="";
    if(trtype=="all")
      {
        query="select * from transation order by date DESC";
      }
    else if(trtype=="income")
      {
        query="select * from transation where type='income'";
      }
    else
      {
        query="select * from transation where type='expense'";
      }
    var db = await create_db();
    var data =await db.rawQuery(query);
    return data.toList();
  }

  Future<int> deletetarnsaction(id) async
  {
    var db = await create_db();
    var status =await db.rawUpdate("delete from transation where tid=?",[id]);
    return status;
  }
  Future<List> getsingletarnsction(id)async
  {
    var db = await create_db();
    var data =await db.rawQuery("select * from transation where tid=?",[id]);
    return data.toList();
  }
  Future<int> UpdateTransaction(title,remark,date,Amount,type,ctaegory,updateid)async
  {
    var db = await create_db();
    var status = await db.rawUpdate("update transation set title=?,remark=?,date=?,Amount=?,type=?,ctaegory=?where tid=?",
    [title,remark,date,Amount,type,ctaegory,updateid]);
    return status;
  }
}