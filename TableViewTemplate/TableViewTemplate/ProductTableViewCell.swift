//
//  ProductTableViewCell.swift
//  TableViewTemplate
//
//  Created by Arken Sarsenov on 04.04.2022.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    lazy var productImage: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        return img
    }()
    
    lazy var productTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    lazy var productPrice: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let starRatingView = JStarRatingView(frame: CGRect(origin: .zero, size: CGSize(width: 250, height: 50)), rating: 0, color: UIColor.systemOrange, starRounding: .roundToFullStar)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(productImage)
        productImage.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor ,paddingTop: 8, paddingLeft: 8, paddingBottom: 8)
        productImage.setDimensions(height: 80, width: 80)
        
        let stackView = UIStackView(arrangedSubviews: [productTitle, productPrice])
        stackView.axis = .vertical
        stackView.spacing = 8
        addSubview(stackView)
        stackView.anchor(top: productImage.topAnchor, left: productImage.rightAnchor, right: rightAnchor)
        addSubview(starRatingView)
        starRatingView.isUserInteractionEnabled = false
        starRatingView.setDimensions(height: 20, width: 100)
        starRatingView.anchor(top: stackView.bottomAnchor, left: stackView.leftAnchor, bottom: bottomAnchor, paddingTop: 16, paddingBottom: 8)
    }
    func setupCell(image: UIImage, title: String, price: Double, raiting: Float) {
        productImage.image = image
        productTitle.text = title
        productPrice.text = "\(price)"
        starRatingView.rating = raiting
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
