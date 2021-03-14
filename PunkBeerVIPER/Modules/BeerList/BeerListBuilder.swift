//
//  BeerListBuilder.swift
//  PunkBeerVIPER
//
//  Created by Jon Gonzalez on 14/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class BeerListBuilder {

    static func build() -> BeerListView {
        let view = BeerListView.init(nibName: String(describing: BeerListView.self), bundle: nil)
        let presenter = BeerListPresenter()
        let entity = BeerListEntity()
        let wireframe = BeerListWireframe()
        
        let provider = BeerNetworkProvider()
        let interactor = BeerListInteractor(provider: provider)
        
        view.presenter = presenter
        view.presenter.view = view
        view.presenter.entity = entity
        view.presenter.interactor = interactor
        view.presenter.interactor.output = presenter
        view.presenter.wireframe = wireframe
        
        view.presenter.wireframe.output = presenter
        view.presenter.wireframe.view = view
        
        return view
    }
}
