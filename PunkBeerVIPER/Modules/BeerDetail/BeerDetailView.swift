//
//  BeerDetailView.swift
//  PunkBeerVIPER
//
//  Created by Jon Gonzalez on 14/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit
import SDWebImage

class BeerDetailView: BaseViewController, BeerDetailViewContract {

	var presenter: BeerDetailPresenterContract!
    var datasource: FoodTableViewDatasource!
    var delegate: FoodTableViewDelegate!
    
    // MARK: - Outlets
    @IBOutlet weak var beerImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var taglineLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var abvLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var foodTableView: UITableView!
    
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    
	// MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.presenter.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter.viewWillAppear()
    }

    private func setupView() {
        datasource = FoodTableViewDatasource()
        delegate = FoodTableViewDelegate()
        
        foodTableView.delegate = delegate
        foodTableView.dataSource = datasource
    }
    
    // MARK: - Public methods
    func reloadBeerData(withBeer beer: Beer) {
        beerImage.sd_setImage(with: beer.imageURL, placeholderImage: UIImage(named: "BeerBottle"))
        nameLabel.text = beer.name
        
        if let tagline = beer.tagline {
            taglineLabel.text = tagline
        } else {
            taglineLabel.text = "This beer doesn't have tagline"
        }
        
        if let firstBrewed = beer.firstBrewed {
            dateLabel.text = DateFormatter.beerAPIDateFormatter.string(from: firstBrewed)
        } else {
            dateLabel.text = "n/a"
        }
        
        if let abv = beer.abv {
            abvLabel.text = "\(abv)%"
        } else {
            abvLabel.text = "n/a"
        }
        
        if let description = beer.description {
            descriptionTextView.text = description
        } else {
            descriptionTextView.text = "This beer doesn't have description."
        }
        
        if let count = beer.foodPairing?.count {
            tableViewHeightConstraint.constant = CGFloat(count) * 30
            if let foodList = beer.foodPairing {
                datasource.foodList = foodList
            }
            foodTableView.reloadData()
        } else {
            datasource.foodList = []
            tableViewHeightConstraint.constant = 0
        }
    }
}

class FoodTableViewDatasource: NSObject, UITableViewDataSource {
    
    var foodList = [String]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "foodCell")
        
        cell.imageView?.image = UIImage(named: "food")
        cell.textLabel?.text = foodList[indexPath.row]
        return cell
    }
}

class FoodTableViewDelegate: NSObject, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
}
