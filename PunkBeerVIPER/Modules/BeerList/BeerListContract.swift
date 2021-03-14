//
//  BeerListContract.swift
//  PunkBeerVIPER
//
//  Created by Jon Gonzalez on 14/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import UIKit

protocol BeerListEntityContract: BaseEntity {
    
}

protocol BeerListViewContract: BaseViewController {
    var presenter: BeerListPresenterContract! { get set }
    
    func updateBeerListData(with beers: [Beer])
    
}

protocol BeerListPresenterContract: BasePresenter {
    var view: BeerListViewContract! { get set }
    var interactor: BeerListInteractorContract! { get set }
    var entity: BeerListEntityContract! { get set }
    var wireframe: BeerListWireframeContract! { get set }

    func viewDidLoad()
    func viewWillAppear()
    func getInitialBeerList()
    func getSearchedBeerList(withPairingFood food: String)
    func beerSelected(in index: Int)
}

protocol BeerListInteractorContract: BaseInteractor {
    var output: BeerListInteractorOutputContract! {get set}
    
    func getInitialBeerList(onsuccess success: @escaping ([Beer]) -> Void, failure: @escaping (Error) -> Void)
    func getSearchedBeerList(withPairingFood food: String,
                             success: @escaping ([Beer]) -> Void,
                             failure: @escaping (Error) -> Void)
}

protocol BeerListInteractorOutputContract: class {
    
}

protocol BeerListWireframeContract: BaseWireframe {
    var output: BeerListWireframeOutputContract! { get set }
    var view: UIViewController! { get set }
    
    func showBeerDetailView(withBeer beer: Beer)
}

protocol BeerListWireframeOutputContract: class {

}
