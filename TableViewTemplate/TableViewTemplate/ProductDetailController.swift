//
//  ProductDetailController.swift
//  TableViewTemplate
//
//  Created by Arken Sarsenov on 04.04.2022.
//

import UIKit

class ProductDetailController: UIViewController {
    
    //MARK: - Properties
    var index: Int!
    let bg = UIView(frame: .zero)
    
    lazy var productImage: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        img.setHeight(view.frame.width)
        img.setWidth(view.frame.width)
        return img
    }()
    
    let starRatingView = JStarRatingView(frame: CGRect(origin: .zero, size: CGSize(width: 250, height: 50)), rating: 0, color: UIColor.systemOrange, starRounding: .roundToFullStar)
    
    lazy var productTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()
    
    lazy var productPrice: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    lazy var productDetail: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGray
        label.numberOfLines = 0
        return label
    }()
    
    lazy var reviewButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Отзывы", for: .normal)
        btn.setTitleColor(.systemTeal, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btn.addTarget(self, action: #selector(handleReviewBtn), for: .touchUpInside)
        return btn
    }()
    
    lazy var writeReview: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Оставить отзыв", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btn.backgroundColor = .systemTeal
        btn.layer.cornerRadius = 12
        btn.setHeight(50)
        btn.layer.shadowColor = UIColor.darkGray.cgColor
        btn.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        btn.layer.shadowOpacity = 5
        btn.layer.shadowRadius = 5.0
        btn.addTarget(self, action: #selector(handleWriteReviewBtn(_:)), for: .touchUpInside)
        return btn
    }()
    
    
    //MARK: - Lifecyce
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        let product = DataManager.shared.products[index]
        //let feedback = details.feedBacks[index]
        fetchData(image: product.image!, star: product.ratingBar, title: product.name, price: product.price, details: product.details)
    }
    
    //MARK: - Action
    
    @objc func handleWriteReviewBtn(_ sender: UIButton) {
        print("DEBUG: WriteReview button has been pressed")
        let vc = FeedbackController()
        vc.index = index
        present(vc, animated: true)
    }
    
    @objc func handleReviewBtn() {
        let vc = ReviewTableController()
        vc.index  = index
        navigationController?.pushViewController(vc, animated: true)
    }

    
    //MARK: - ConfigureUI
    private func configureUI() {
        navigationItem.backBarButtonItem?.tintColor = UIColor.white
        view.backgroundColor = .systemTeal
        view.addSubview(bg)
        bg.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor)
        bg.backgroundColor = .white
        
        let stackView = UIStackView(arrangedSubviews: [productImage, starRatingView, starRatingView, productTitle, productPrice, productDetail, reviewButton, writeReview])
        starRatingView.isUserInteractionEnabled = false
        
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 8, paddingLeft: 16, paddingRight: 16)
    }
    
    func fetchData(image: UIImage, star: Float , title: String, price: Double, details: String){
        productImage.image = image
        starRatingView.rating = star
        productTitle.text = title
        productPrice.text = "\(price)"
        productDetail.text = details
    }
}
