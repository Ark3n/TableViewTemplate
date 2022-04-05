//
//  ReviewsCell.swift
//  TableViewTemplate
//
//  Created by Arken Sarsenov on 05.04.2022.
//

import UIKit

class ReviewsViewCell: UITableViewCell {
    
    //MARK: - Properties
    
    lazy var dateLabel: UILabel = {
        let date = UILabel()
        date.textColor = .systemTeal
        date.font = UIFont.systemFont(ofSize: 12)
        return date
    }()
    
    let starRatingView = JStarRatingView(frame: CGRect(origin: .zero, size: CGSize(width: 250, height: 50)), rating: 0, color: UIColor.systemOrange, starRounding: .roundToFullStar)
    
    let reviewLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - ConfigureUI
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(dateLabel)
        dateLabel.anchor(top: topAnchor, left: leftAnchor, paddingTop: 16, paddingLeft: 8)
        addSubview(starRatingView)
        starRatingView.anchor(top: topAnchor, right: rightAnchor, paddingTop: 16, paddingRight: 8)
        addSubview(reviewLabel)
        reviewLabel.anchor(top: dateLabel.bottomAnchor, left: dateLabel.leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 8, paddingBottom: 8)
    }
    
    func setReview(date: String, star: Float, review: String) {
        dateLabel.text = date
        starRatingView.rating = star
        reviewLabel.text = review
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
