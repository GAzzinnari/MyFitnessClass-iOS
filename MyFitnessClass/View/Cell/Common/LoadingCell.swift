//
//  LoadingCell.swift
//  MyFitnessClass
//
//  Created by Gabriel on 7/15/20.
//  Copyright © 2020 Example. All rights reserved.
//
import UIKit

class LoadingCell: UITableViewCell {
    // MARK: Outlets
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var loadingText: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        // Disable selection of cell.
        super.setSelected(false, animated: false)
    }
    
    func setup(withText text: String? = nil) {
        if let text = text {
            self.loadingText.text = text
        }
        self.activityIndicator.startAnimating()
    }
}
