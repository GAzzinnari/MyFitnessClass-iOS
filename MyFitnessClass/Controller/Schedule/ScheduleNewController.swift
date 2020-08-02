//
//  ScheduleNewController.swift
//  MyFitnessClass
//
//  Created by Gabriel on 8/2/20.
//  Copyright © 2020 Example. All rights reserved.
//

import UIKit

class ScheduleNewController: UIViewController {
    // MARK: Enum, constants
    private enum ScheduleNewConstants {
        static let titleText = "New schedule"
    }
    // MARK: Outlets
    @IBOutlet weak var doneButton: UIButton!
    
    // MARK: Controller events
    override func viewDidLoad() {
        super.viewDidLoad()

        setupController()
    }

    @IBAction func didTapDoneButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func setupController() {
        self.title = ScheduleNewConstants.titleText
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}
