//
//  CardsListCell.swift
//  CardsList
//
//  Created by Sergey Tszyu on 16.06.2023.
//

import UIKit

final class CardsListCell: UITableViewCell {
    
    // MARK: - @IBOutlets
    
    @IBOutlet private weak var cardNumberLabel: UILabel!
    @IBOutlet private weak var cardTypeImageView: UIImageView!
    
    // MARK: - Properties
    
    static let identifier = "CardsListCell"
    
    // MARK: - Life cycle

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        cardNumberLabel.text = nil
        cardTypeImageView.image = nil
    }
}

// MARK: - Public

extension CardsListCell {
    
    func fill(_ card: CardListPlainObject) {
        // TODO: - Треба переробити на RegEx
        cardNumberLabel.text = "**** **** **** \(card.number.suffix(4))"
        cardTypeImageView.image = card.type.image
    }
}
