//
//  RealmHelper.swift
//  Assignment
//
//  Created by M.Shariq Hasnain on 01/06/2024.
//

import Foundation
import RealmSwift

public class RealmHelper {
    
    public static func saveObject<T:Object>(object: T) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(object, update: .modified)
                print("Realm Object add")
            }
            
        } catch let error as NSError {
            print("error - \(error.localizedDescription)")
        }
    }
    
    public static func updateObject<T:Object>(object: T) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(object, update: .all)
                print("RealmHelper->Object Modified")
            }
            
        } catch let error as NSError {
            print("error - \(error.localizedDescription)")
        }
    }
    
    public static func removeObject<T:Object>(object: T) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.delete(object)
                print("RealmHelper->Object deleted")
            }
            
        } catch let error as NSError {
            print("error - \(error.localizedDescription)")
        }
    }
    
    public static func getObjects<T:Object>(with type:T.Type) -> [T] {
        let realm = try! Realm()
        let realmResults = realm.objects(T.self)
        return Array(realmResults)
    }
}

