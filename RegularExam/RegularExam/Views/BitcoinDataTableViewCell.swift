//
//  BitcoinDataTableViewCell.swift
//  RegularExam
//
//  Created by Hristo Papanov on 5.02.23.
//

import UIKit

class BitcoinDataTableViewCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setupCell(with data: BlockChain){
        self.titleLabel.text = "\(data.blockbook?.bestHeight)"
        self.detailLabel.text = "\(data.blockbook?.lastBlockTime)"
    }
}
