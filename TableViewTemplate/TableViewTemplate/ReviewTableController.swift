//
//  ReviewTableController.swift
//  TableViewTemplate
//
//  Created by Arken Sarsenov on 04.04.2022.
//

import UIKit

class ReviewTableController: UIViewController {
    
    //MARK: - Properties
    var index = 0
    let reuseID = "ReviewTableViewCell"
    var product: Product {
        DataManager.shared.products[index]
    }
    var tableView = UITableView()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        tableView.dataSource = self
        tableView.register(ReviewsViewCell.self, forCellReuseIdentifier: reuseID)
        tableView.estimatedRowHeight = 250
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    //MARK: - setupTableView
    func setupTableView() {
        view.backgroundColor = .systemTeal
        view.addSubview(tableView)
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor)
    }
}

//MARK: - UITableViewDataSource
extension ReviewTableController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        product.feedBacks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseID, for: indexPath) as? ReviewsViewCell {
            let review = product.feedBacks[indexPath.row]
            cell.setReview(date:review.dateString , star: review.feedbackRaiting, review: review.text)
            return cell
        }
        fatalError("could not dequeueReusableCell")
    }
}

