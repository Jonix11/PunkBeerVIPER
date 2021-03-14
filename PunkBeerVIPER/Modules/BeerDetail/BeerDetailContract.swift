//
//  BeerDetailContract.swift
//  PunkBeerVIPER
//
//  Created by Jon Gonzalez on 14/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import UIKit

protocol BeerDetailEntityContract: BaseEntity {
    
}

protocol BeerDetailViewContract: BaseViewController {
    var presenter: BeerDetailPresenterContract! { get set }
    
    func reloadBeerData(withBeer beer: Beer)
    
}

protocol BeerDetailPresenterContract: BasePresenter {
    var view: BeerDetailViewContract! { get set }
    var interactor: BeerDetailInteractorContract! { get set }
    var entity: BeerDetailEntityContract! { get set }
    var wireframe: BeerDetailWireframeContract! { get set }

    func viewDidLoad()
    func viewWillAppear()
}

protocol BeerDetailInteractorContract: BaseInteractor {
    var output: BeerDetailInteractorOutputContract! {get set}
    
    func getBeerData() -> Beer
}

protocol BeerDetailInteractorOutputContract: class {
    
}

protocol BeerDetailWireframeContract: BaseWireframe {
    var output: BeerDetailWireframeOutputContract! { get set }
    var view: UIViewController! { get set }
}

protocol BeerDetailWireframeOutputContract: class {

}
