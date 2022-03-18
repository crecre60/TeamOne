////
////  Util.swift
////  TeamOne
////
////  Created by Young Ju on 3/17/22.
////
//
//import UIKit
// 
//class Util: NSObject {
//class func getPath(fileName: String) -> String {
//    
//    let documentDatabasePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(fileName).path
//    
////        let filePath = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("StudentDetailDB.sqlite")
//
////    let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
////    let fileURL = documentsURL.appendingPathComponent(fileName)
//    return documentDatabasePath
//}
//    
//class func copyFile(fileName: String) {
//    let dbPath: String = getPath(fileName: fileName as String)
//    let fileManager = FileManager.default
//    
//    if !fileManager.fileExists(atPath: dbPath) {
//        let documentsURL = Bundle.main.resourceURL
//            let fromPath = documentsURL!.appendingPathComponent(fileName as String)
//            var error : Error?
//            do {
//                try fileManager.copyItem(atPath: fromPath.path, toPath: dbPath)
//            } catch let error1 as Error {
//                error = error1
//            }
//    }
//    let alert: UIAlertView = UIAlertView()
//    if (error != nil) {
//        alert.title = "Error Occured"
//        alert.message = error?.localizedDescription
//    } else {
//        alert.title = "Successfully Copy"
//        alert.message = "Your database copy successfully"
//    }
//    alert.delegate = nil
//    alert.addButton(withTitle: "Ok")
//    alert.show()
//}
//    
//class func invokeAlertMethod(strTitle: NSString, strBody: NSString, delegate: AnyObject?) {
//}
//    let alert: UIAlertView = UIAlertView()
//    alert.message = strBody asString
//    alert.title = strTitle asString
//    alert.delegate = delegate
//    alert.addButtonWithTitle("Ok")
//    alert.show()
//}
