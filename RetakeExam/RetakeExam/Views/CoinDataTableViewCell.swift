//
//  CoinDataTableViewCell.swift
//  RetakeExam
//
//  Created by Hristo Papanov on 12.02.23.
//

import UIKit

class CoinDataTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tickerLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var imageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(with data: MarketTrackerElement){
        self.nameLabel.text = "\(data.name)"
        self.tickerLabel.text = "\(data.symbol)"
        self.priceLabel.text = "\(data.currentPrice)"
        self.imageLabel.text = "\(data.image)"
    }
}
