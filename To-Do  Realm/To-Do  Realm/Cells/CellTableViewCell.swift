//
//  CellTableViewCell.swift
//  To-Do  Realm
//
//  Created by Yuliya Lapenak on 10/19/22.
//

import UIKit

class CellTableViewCell: UITableViewCell {

    static let identifier = "Cell"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    
    }
    
    func setupCell() {
//        nameLabel.text
    }
    
}
