//
//  BeerListView.swift
//  PunkBeerVIPER
//
//  Created by Jon Gonzalez on 14/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class BeerListView: BaseViewController, BeerListViewContract {
    
	var presenter: BeerListPresenterContract!
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var datasource: BeerListDataSource!
    // swiftlint:disable:next weak_delegate
    var delegate: BeerListDelegate!
    // swiftlint:disable:next weak_delegate
    var searchDelegate: BeerSearchBarDelegate!
    
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
        // register tableView cell
        tableView.register(UINib(nibName: BeerListTableViewCell.reusableId, bundle: nil),
                           forCellReuseIdentifier: BeerListTableViewCell.reusableId)
        datasource = BeerListDataSource()
        delegate = BeerListDelegate()
        delegate.presenter = presenter
        searchDelegate = BeerSearchBarDelegate()
        searchDelegate.presenter = presenter
        
        tableView.dataSource = datasource
        tableView.delegate = delegate
        searchBar.delegate = searchDelegate
    }
    
    // MARK: - Public methods
    func updateBeerListData(with beers: [Beer]) {
        datasource.beers = beers
        tableView.reloadData()
    }
}

class BeerListDataSource: NSObject, UITableViewDataSource {
    
    var beers = [Beer]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BeerListTableViewCell.reusableId, for: indexPath)
            // swiftlint:disable:next force_cast
            as! BeerListTableViewCell
        
        cell.beer = beers[indexPath.row]
        return cell
    }
    
}

class BeerListDelegate: NSObject, UITableViewDelegate {
    
    weak var presenter: BeerListPresenterContract!
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.beerSelected(in: indexPath.row)
    }
}

class BeerSearchBarDelegate: NSObject, UISearchBarDelegate {
    
    weak var presenter: BeerListPresenterContract!
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            presenter.getInitialBeerList()
        } else {
            presenter.getSearchedBeerList(withPairingFood: searchText)
        }
    }
}
