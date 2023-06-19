//
//  Realm+WriteFunctions.swift
//  CardsList
//
//  Created by Sergey Tszyu on 16.06.2023.
//

import Foundation
import RealmSwift

extension Realm {
    public func realmWrite(_ block: (() -> Void)) {
        if isInWriteTransaction {
            block()
        } else {
            do {
                try write(block)
            } catch {
                assertionFailure("Realm write error: \(error)")
            }
        }
    }
}

func realmWrite(realm: Realm = mainRealm, _ block: (() -> Void)) {
    realm.realmWrite(block)
}
