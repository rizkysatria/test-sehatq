//
//  RealmConfig.swift
//  TestSehatq
//
//  Created by rizky satria on 05/07/21.
//

import Foundation
import RealmSwift

class RealmConfig {
    
    static let databaseVersion: UInt64 = 2

    var realm: Realm
   
    init(inMemoryId: String? = nil) {
        if let inMemoryId = inMemoryId {
            realm = try! Realm(configuration:
                Realm.Configuration(inMemoryIdentifier: inMemoryId))
        } else {
            RealmConfig.initializeRealm()
            realm = try! Realm()
        }
    }
    
    class func initializeRealm() {
        let config = Realm.Configuration(
            schemaVersion: RealmConfig.databaseVersion,
            migrationBlock: { migration, oldSchemaVersion in
                if (oldSchemaVersion < RealmConfig.databaseVersion) {
                    //auto upgrade
                }
        })
        Realm.Configuration.defaultConfiguration = config
    }
    
}
