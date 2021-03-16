//
//  BeerDetailBuilder.swift
//  PunkBeerVIPER
//
//  Created by Jon Gonzalez on 14/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class BeerDetailBuilder {

    static func build(withBeer beer: BeerPresentable) -> BeerDetailView {
        let view = BeerDetailView.init(nibName: String(describing: BeerDetailView.self), bundle: nil)
        let presenter = BeerDetailPresenter()
        let entity = BeerDetailEntity()
        let wireframe = BeerDetailWireframe()
        
        let provider = BeerNetworkProvider()
        let interactor = BeerDetailInteractor(provider: provider, beer: beer)
        
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
