//
//  BaseViewController.swift
//  PunkBeerVIPER
//
//  Created by Jon Gonzalez on 14/3/21.
//

import UIKit
import SnapKit

enum ViewState {
    case loading
    case failure
    case empty
    case success
}

class BaseViewController: UIViewController {
    
//    lazy var stateView = UIView()
//    lazy var activityIndicator = UIActivityIndicatorView()
//    lazy var stateImage = UIImageView()
//    lazy var stateLabel = UILabel()
//    
//    // MARK: - Properties
//    var state: ViewState = .success {
//        willSet {
//            guard newValue != state else { return }
//            
//            switch newValue {
//            case .loading:
//                [stateView, activityIndicator].forEach { $0?.isHidden = false }
//                [stateLabel, stateImage].forEach { $0?.isHidden = true }
//            case .failure:
//                [stateView, stateLabel, stateImage].forEach { $0?.isHidden = false }
//                activityIndicator.isHidden = true
//                stateLabel.text = "There was a problem loading beers list"
//                stateImage.image = UIImage(systemName: "xmark.circle.fill")
//                stateImage.tintColor = UIColor.systemRed
//            case .empty:
//                [stateView, stateLabel, stateImage].forEach { $0?.isHidden = false }
//                activityIndicator.isHidden = true
//                stateLabel.text = "There aren't beers that fit the search"
//                stateImage.image = UIImage(systemName: "info.circle.fill")
//                stateImage.tintColor = UIColor.systemBlue
//            case .success:
//                stateView.isHidden = true
//            }
//        }
//    }
//    override func viewDidLoad() {
//        self.setupStateUI()
//    }
//    
//    func setupStateUI() {
//        
//        self.view.addSubview(stateView)
//        stateView.snp.makeConstraints { (make) -> Void in
//            make.top.equalTo(self.additionalSafeAreaInsets)
//            make.left.equalTo(self.additionalSafeAreaInsets)
//            make.right.equalTo(self.additionalSafeAreaInsets)
//            make.bottom.equalTo(self.additionalSafeAreaInsets)
//        }
//        stateView.bringSubviewToFront(self.view)
//    }
}
