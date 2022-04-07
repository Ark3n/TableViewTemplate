//
//  ProductsController.swift
//  TableViewTemplate
//
//  Created by Arken Sarsenov on 04.04.2022.
//

import UIKit

class ProductsController: UIViewController {
    
    //MARK: - Properties
    
    var reusedID = "ProductTableViewCell"
    
    var products: [Product] {
        DataManager.shared.products
    }
    let tableView = UITableView()
    
    //MARK: - LifeCycle
    
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Смартфоны"
        navigationController?.navigationBar.barTintColor = .systemTeal
        navigationController?.navigationBar.barStyle = .black
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        configureUI()
    }
    
    
    //MARK: - Actions
    
    
    //MARK: - ConfigureUI
    
    func configureUI() {
        view.backgroundColor  = .systemTeal
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: reusedID)
        
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor)
    }
}

//MARK: - UITableViewDataSource
extension ProductsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: reusedID, for: indexPath) as? ProductTableViewCell {
            let product = products[indexPath.row]
            cell.setupCell(image: product.image!, title: product.name, price: product.price, raiting: product.ratingBar)
            return cell
        }
        fatalError("could not dequeueReusableCell")
    }
}

extension ProductsController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ProductDetailController()
        vc.index = indexPath.row
        title = products[indexPath.row].name
        navigationController?.pushViewController(vc, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.reloadData()
    }
}
