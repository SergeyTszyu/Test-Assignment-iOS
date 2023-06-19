//
//  CardsListDetailViewController.swift
//  CardsList
//
//  Created by Sergey Tszyu on 16.06.2023.
//

import UIKit

class CardsListDetailViewController: UIViewController {
    
    // MARK: - @IBOutlets
    
    @IBOutlet private weak var cardNumberLabel: UILabel!
    @IBOutlet private weak var cardTypeImage: UIImageView!
    @IBOutlet private weak var cardView: UIView!
    
    // MARK: - Properties
    
    var card: CardListPlainObject!
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        cardNumberLabel.text = "**** \(card.number.suffix(4))"
        cardTypeImage.image = card.type.image
        cardView.backgroundColor = card.type.color
    }
}
