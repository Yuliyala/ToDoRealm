//
//  CellTableViewCell.swift
//  To-Do  Realm
//
//  Created by Yuliya Lapenak on 10/19/22.
//

import UIKit

class CellTableViewCell: UITableViewCell {
    
    static let identifier = "CellTableViewCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func setupCell(task: Task) {
        nameLabel.text = task.title
        detailLabel.text = task.detail
        if task.isDone == false {
            accessoryType = .none
        } else {
            accessoryType = .checkmark
        }
    }
   
}
