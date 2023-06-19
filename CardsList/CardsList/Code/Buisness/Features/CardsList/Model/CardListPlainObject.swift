//
//  CardListPlainObject.swift
//  CardsList
//
//  Created by Sergey Tszyu on 16.06.2023.
//

import Foundation
import UIKit
import RealmSwift

enum LocalCardType: Int {
    
    case masterCard = 5
    case visa = 4
    case generic = 0
    
    var prefix: Int  {
        switch self {
        case .visa:
            return 4
        case .masterCard:
            return 5
        case .generic:
            return 0
        }
    }
    
    var image: UIImage {
        switch self {
        case .masterCard:
            return UIImage(named: "CardTypeMastercard")!
        case .visa:
            return UIImage(named: "CardTypeVisa")!
        case .generic:
            return UIImage()
        }
    }
    
    var color: UIColor {
        switch self {
        case .masterCard:
            return UIColor(named: "mastercardColor")!
        case .visa:
            return UIColor(named: "visaColor")!
        case .generic:
            return .clear
        }
    }
    
    static func getCardType(_ number: String) -> LocalCardType {
        if number.prefix(1) == "5" {
            return .masterCard
        } else if number.prefix(1) == "4" {
            return .visa
        } else {
            return .generic
        }
    }
}

class CardListPlainObject: Object {
    
    @objc dynamic var number: String!
    @objc dynamic var dateOfCreation: Date!
    
    override class func primaryKey() -> String? {
        return "number"
    }
    
    var type: LocalCardType {
        return LocalCardType.getCardType(number)
    }
    
}
    
