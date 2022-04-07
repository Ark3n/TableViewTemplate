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
    
    var ratingBar: Float{
        if let rating  = rating {
            return rating
        } else {
            return 0
        }
    }
    
    private var rating: Float? {
        if feedBacks.isEmpty {
            return nil
        } else {
            var sum: Float = 0
            for review in feedBacks {
                sum += review.feedbackRaiting
            }
            return sum / Float(feedBacks.count)
        }
    }
}

//MARK: - Feedback

struct Feedback {
    
    private let date = Date()
    
    let text: String
    let feedbackRaiting: Float
    

    
    var dateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale(identifier: "ru_Ru")
        return dateFormatter.string(from: date)
    }
}

