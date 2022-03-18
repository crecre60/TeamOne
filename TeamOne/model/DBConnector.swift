//
//  DBConnector.swift
//  TeamOne
//
//  Created by Young Ju on 3/17/22.
//

import Foundation
import SQLite3
  
  
class DBConnector
{
    init()
    {
        db = openDatabase()
    }
  
  
    let dbPath: String = "quiz_temp.db"
    var db:OpaquePointer?
  
  
    func openDatabase() -> OpaquePointer?
    {
        let filePath = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent(dbPath)
        var db: OpaquePointer? = nil
        if sqlite3_open(filePath.path, &db) != SQLITE_OK
        {
            debugPrint("can't open database")
            return nil
        }
        else
        {
            print("Successfully created connection to database at \(dbPath)")
            return db
        }
    }
      
//    func insert(id:Int, name:String, age:Int)
//    {
//        let persons = read()
//        for p in persons
//        {
//            if p.id == id
//            {
//                return
//            }
//        }
//        let insertStatementString = "INSERT INTO person (Id, name, age) VALUES (?, ?, ?);"
//        var insertStatement: OpaquePointer? = nil
//        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
//            sqlite3_bind_int(insertStatement, 1, Int32(id))
//            sqlite3_bind_text(insertStatement, 2, (name as NSString).utf8String, -1, nil)
//            sqlite3_bind_int(insertStatement, 3, Int32(age))
//
//            if sqlite3_step(insertStatement) == SQLITE_DONE {
//                print("Successfully inserted row.")
//            } else {
//                print("Could not insert row.")
//            }
//        } else {
//            print("INSERT statement could not be prepared.")
//        }
//        sqlite3_finalize(insertStatement)
//    }
      
    func read() -> [Question] {
        let queryStatementString = "SELECT q.question_text, q.correct_answer," +
        "MAX(CASE WHEN a.answer_seq = 1 THEN a.answer_text  END) AS 'first'," +
        "MAX(CASE WHEN a.answer_seq = 2 THEN a.answer_text  END) AS 'secon'," +
        "MAX(CASE WHEN a.answer_seq = 3 THEN a.answer_text  END) AS 'third'," +
        "MAX(CASE WHEN a.answer_seq = 4 THEN a.answer_text  END) AS 'fourth'" +
        "FROM questions q" +
        "INNER JOIN answers a ON  q.question_id = a.question_id" +
        "WHERE q.question_id IN" +
          "(SELECT question_id FROM questions ORDER BY random() LIMIT 2)" +
          "GROUP BY q.question_text, q.correct_answer;"
        var queryStatement: OpaquePointer? = nil
        var questions : [Question] = []
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                 let qn = String(describing: String(cString: sqlite3_column_text(queryStatement, 0)))
                let anOne = String(describing: String(cString: sqlite3_column_text(queryStatement, 2)))
                let anTwo = String(describing: String(cString: sqlite3_column_text(queryStatement, 3)))
                let anThree = String(describing: String(cString: sqlite3_column_text(queryStatement, 4)))
                let anFour = String(describing: String(cString: sqlite3_column_text(queryStatement, 5)))
                let correctChoice = Int(bitPattern: sqlite3_column_text(queryStatement, 1))
                questions.append(Question(question: String(qn), firstAnswer: String(anOne), secondAnswer: String(anTwo), thirdAnswer: String(anThree), fourthAnswer: String(anFour), correctAnswer: Int(correctChoice),  wrongAnswer: 0, isAnswered: false))
                print("Query Result:")
                print("\(qn) | \(anOne) | \(anTwo) | \(anThree) | \(anFour)")
            }
        } else {
            print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        return questions
    }
      

}

