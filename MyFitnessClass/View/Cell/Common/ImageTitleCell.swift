//
//  ImageTitleCell.swift
//  MyFitnessClass
//
//  Created by Gabriel on 7/16/20.
//  Copyright © 2020 Example. All rights reserved.
//

import UIKit

class ImageTitleCell: UITableViewCell {
    // MARK: Outlets
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func setup(withImage: UIImage? = nil, title: String) {
        titleLabel.text = title
        if let image = withImage {
            iconImageView.image = image
        }
    }
}
