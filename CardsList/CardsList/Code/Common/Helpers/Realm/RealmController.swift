//
//  RealmController.swift
//  CardsList
//
//  Created by Sergey Tszyu on 16.06.2023.
//

import Foundation
import RealmSwift

var mainRealm: Realm!

class RealmController {
    
    static var shared: RealmController = RealmController()
    
    func setup() {
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 1, migrationBlock: nil)
        do {
            mainRealm = try Realm()
        } catch let error as NSError {
            assertionFailure("Realm loading error: \(error)")
        }
    }
    
}
