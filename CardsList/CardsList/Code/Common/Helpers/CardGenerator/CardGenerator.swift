//
//  CardGenerator.swift
//  CardsList
//
//  Created by Sergey Tszyu on 16.06.2023.
//

import Foundation

struct CardGenerator {
    
    static func generateCardWith(_ paymentSystem: LocalCardType) -> CardListPlainObject {
        
        var cardNumber = [Int](repeating: 0, count: 16)
        var startingIndex = 0
        
        if paymentSystem == .visa {
            cardNumber[0] = paymentSystem.prefix
            startingIndex = 1
        } else if paymentSystem == .masterCard {
            cardNumber[0] = paymentSystem.prefix
            cardNumber[1] = Int(arc4random_uniform(5) + 1)
            startingIndex = 2
        }
        
        for i in startingIndex..<cardNumber.count{
             cardNumber[i] = Int(arc4random_uniform(10))
         }
        
         let offset = (cardNumber.count+1)%2
         var sum = 0
         for i in 0..<cardNumber.count-1 {
             if ((i+offset) % 2) == 1 {
                 var temp = cardNumber[i] * 2
                 if temp > 9{
                     temp -= 9
                 }
                 sum += temp
             }
             else{
                 sum += cardNumber[i]
             }
         }
         let finalDigit = (10 - (sum % 10)) % 10
         cardNumber[cardNumber.count-1] = finalDigit
         
        let number = cardNumber.map({ String($0) }).joined(separator: "")
        
        let card = CardListPlainObject()
        card.number = number
        card.dateOfCreation = Date()
        
        realmWrite {
            mainRealm.add(card, update: .all)
        }
        
        return card
    }
}
