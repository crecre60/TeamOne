////
////  QuizEmitter.swift
////  TeamOne
////
////  Created by Young Ju on 3/17/22.
////
//
//import Foundation
//import UIKit
// 
//let sharedInstance = QuizEmitter()
//class QuizEmitter: NSObject {
//var database: FMDatabase? = nil
//class func getInstance() -> QuizEmitter {
//    if(sharedInstance.database == nil) {
//        sharedInstance.database = FMDatabase(path: Util.getPath("quiz_temp.db"))
//    }
//    return sharedInstance
//}
//func fetchFiveQuestions(quizType: QuizType) -> Bool {
//    sharedInstance.database!.open()
//    let fetched = sharedInstance.database!.executeSelect(" INTO student_info (Name, Marks) VALUES (?, ?)", withArgumentsInArray: [studentInfo.Name, studentInfo.Marks])
//    sharedInstance.database!.close()
//    return fetched
//}
//
//    func getAllStudentData() -> NSMutableArray {
//sharedInstance.database!.open()
//let resultSet: FMResultSet! = sharedInstance.database!.executeQuery("SELECT * FROM student_info", withArgumentsInArray: nil)
//let marrStudentInfo : NSMutableArray = NSMutableArray()
//if (resultSet != nil) {
//while resultSet.next() {
//let studentInfo : StudentInfo = StudentInfo()
//studentInfo.RollNo = resultSet.stringForColumn("RollNo")
//studentInfo.Name = resultSet.stringForColumn("Name")
//studentInfo.Marks = resultSet.stringForColumn("Marks")
//marrStudentInfo.addObject(studentInfo)
//}
//}
//sharedInstance.database!.close()
//return marrStudentInfo
//}
//}
