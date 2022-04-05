//
//  FeedbackController.swift
//  TableViewTemplate
//
//  Created by Arken Sarsenov on 04.04.2022.
//

import UIKit

class FeedbackController: UIViewController {
    
    //MARK: - Properties
    
    var index = 0
    
    lazy var closeBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        btn.setHeight(50)
        btn.setWidth(50)
        btn.tintColor = .systemTeal
        btn.addTarget(self, action: #selector(handlyCloseBtn), for: .touchUpInside)
        return btn
    }()
    
    lazy var feedbackTextView: UITextView = {
        let tv = UITextView()
        tv.setHeight(view.frame.width * 1.1)
        tv.setWidth(view.frame.width)
        tv.layer.cornerRadius = 12
        tv.backgroundColor = UIColor(white: 1, alpha: 0.2)
        tv.layer.borderColor = UIColor.systemTeal.cgColor
        tv.layer.borderWidth = 1
        tv.layer.shadowColor = UIColor.systemTeal.cgColor
        tv.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        tv.layer.shadowOpacity = 1
        tv.layer.shadowRadius = 5
        return tv
    }()
    
    let starRatingView = JStarRatingView(frame: CGRect(origin: .zero, size: CGSize(width: 250, height: 50)), rating: 0, color: UIColor.systemOrange, starRounding: .roundToFullStar)
    
    lazy var saveFeedbackBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Сохранить отзыв", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btn.backgroundColor = .systemTeal
        btn.layer.cornerRadius = 12
        btn.setHeight(50)
        btn.layer.shadowColor = UIColor.darkGray.cgColor
        btn.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        btn.layer.shadowOpacity = 5
        btn.layer.shadowRadius = 5.0
        btn.isEnabled = false
        btn.addTarget(self, action: #selector(handleSaveFeedbackBtn), for: .touchUpInside)
        return btn
    }()
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        feedbackTextView.delegate = self
    }
    
    //MARK: - Actions
    
    @objc func handleSaveFeedbackBtn() {
        let feedback = Feedback(text: feedbackTextView.text, feedbackRaiting: starRatingView.rating)
        DataManager.shared.products[index].feedBacks.append(feedback)
        let vc = ProductsController()
        vc.tableView.reloadData()
        dismiss(animated: true)
    }
    @objc func handlyCloseBtn() {
        dismiss(animated: true)
    }
    //MARK: - ConfigureUI
    func configureUI() {
        
        view.backgroundColor = .secondarySystemBackground
        view.addSubview(closeBtn)
        closeBtn.anchor(top: view.safeAreaLayoutGuide.topAnchor, right: view.safeAreaLayoutGuide.rightAnchor,  paddingTop: 8, paddingRight: 8)
        view.addSubview(feedbackTextView)
        feedbackTextView.anchor(top: closeBtn.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 16, paddingLeft: 16, paddingRight: 16)
        view.addSubview(starRatingView)
        view.addSubview(saveFeedbackBtn)
        starRatingView.anchor(top: feedbackTextView.bottomAnchor, paddingTop: 32)
        starRatingView.centerX(inView: view)
        
        saveFeedbackBtn.anchor(top: starRatingView.bottomAnchor, left: feedbackTextView.leftAnchor, right: feedbackTextView.rightAnchor, paddingTop: 32)
    }
}

//MARK: - UITextViewDelegate
extension FeedbackController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if textView == feedbackTextView {
            let isCountEnough = textView.text.count > 5
            saveFeedbackBtn.isEnabled = isCountEnough
        }
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
}
