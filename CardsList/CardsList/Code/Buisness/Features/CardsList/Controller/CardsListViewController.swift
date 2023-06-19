//
//  CardsListViewController.swift
//  CardsList
//
//  Created by Sergey Tszyu on 16.06.2023.
//

import UIKit

final class CardsListViewController: UIViewController {
    
    // MARK: - @IBOutlets
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    
    fileprivate var cards = [CardListPlainObject]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
}

// MARK: -

private extension CardsListViewController {
    
    func configure() {
        configureNavigationItems()
        tableView.registerCells(for: [CardsListCell.identifier])
        loadCards()
    }
    
    func loadCards() {
        var cards = Array(mainRealm.objects(CardListPlainObject.self))
        cards.sort(by: { $0.dateOfCreation.compare($1.dateOfCreation) == .orderedDescending })
        self.cards = cards
    }
    
    func configureNavigationItems() {
        title = "Картки"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewCard))
    }
    
    func generateNewCard() {
        let randomInt = Int.random(in: LocalCardType.visa.prefix...LocalCardType.masterCard.prefix)
        guard let paymentSystem = LocalCardType(rawValue: randomInt) else {
            return
        }
        let card = CardGenerator.generateCardWith(paymentSystem)
        cards.insert(card, at: 0)
    }
    
    @objc func addNewCard() {
        generateNewCard()
    }
}

// MARK: - UITableViewDelegate

extension CardsListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let detailViewController = UIStoryboard(name: "CardsList", bundle: nil).instantiateViewController(withIdentifier: "CardsListDetailViewController") as? CardsListDetailViewController else {
            return
        }
        let card = cards[indexPath.row]
        detailViewController.card = card
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}

// MARK: - UITableViewDataSource

extension CardsListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CardsListCell.identifier) as! CardsListCell
        let card = cards[indexPath.row]
        cell.fill(card)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cards.count
    }
}
