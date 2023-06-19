//
//  UITableView+Extensions.swift
//  CardsList
//
//  Created by Sergey Tszyu on 16.06.2023.
//

import Foundation

import UIKit

extension UITableView {
    
    func registerCells(for identifiers: [String]) {
        identifiers.forEach {self.register(UINib(nibName: $0, bundle: nil), forCellReuseIdentifier: $0)}
    }
}
