//
//  BeerListTableViewCell.swift
//  PunkBeerVIPER
//
//  Created by Jon Gonzalez on 14/3/21.
//

import UIKit
import SDWebImage

class BeerListTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    static let reusableId = "BeerListTableViewCell"
    
    var beer: Beer! {
        didSet {
            beerImage.sd_setImage(with: beer.imageURL, placeholderImage: UIImage(named: "BeerBottle"))
            nameLabel.text = beer.name
            if let tagline = beer.tagline {
                taglineLabel.text = tagline
            } else {
                taglineLabel.isHidden = true
            }
            if let firstBrewed = beer.firstBrewed {
                let firstBrewedString = DateFormatter.beerAPIDateFormatter.string(from: firstBrewed)
                dateLabel.text = firstBrewedString
            } else {
                dateLabel.text = "n/a"
            }
            if let abv = beer.abv {
                abvLabel.text = "\(abv)%"
            } else {
                abvLabel.text = "n/a"
            }
        }
    }
    
    // MARK: - Outlets
    @IBOutlet weak var beerImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var taglineLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var abvLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        beerImage.sd_cancelCurrentImageLoad()
    }
    
}
