//
//  Product.swift
//  TableViewTemplate
//
//  Created by Arken Sarsenov on 04.04.2022.
//

import UIKit

//MARK: - Product

struct Product {
    var name: String
    var details: String
    var price: Double
    var feedBacks: [Feedback] = []
    
    var image: UIImage?
}

//MARK: - Feedback

struct Feedback {
    
    private let date = Date()
    
    let text: String
    let feedbackRaiting: Double
    
    var dateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale(identifier: "ru_Ru")
        return dateFormatter.string(from: date)
    }
}

