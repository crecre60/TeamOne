//
//  DBLiaison.swift
//  test2
//
//  Created by Young Ju on 2/18/22.
//

import Foundation
import SQLite3

class DBLiaison {
    
    static func getDatabasePointer(databaseName: String) -> OpaquePointer? {
        
        var databasePointer: OpaquePointer?
        
        let documentDatabasePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("quiz_temp.db").path
        
//        let filePath = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("StudentDetailDB.sqlite")

        if FileManager.default.fileExists(atPath: documentDatabasePath) {
            print("Database exists already!")
        }
        else {
            guard let bundleDatabasePath = Bundle.main.resourceURL?.appendingPathComponent("quiz_temp.db").path
            else {
                print("Unwrapping Error: Bundle Database Path doesn't exist.")
                return  nil
            }
            
            do  {
                try FileManager.default.copyItem(atPath: bundleDatabasePath, toPath: documentDatabasePath)
                print("Datqbase created(copied).")
            } catch {
                print("Error!: \(error.localizedDescription)")
                return nil
            }
        }
        if sqlite3_open(documentDatabasePath, &databasePointer) == SQLITE_OK {
            print("Successfully opened database.")
            print("Database path: \(documentDatabasePath)")
        }
        else {
            print("Could not open database.")
        }
        
        return databasePointer
    }
}
