//
//  DashboardController.swift
//  MyFitnessClass
//
//  Created by Gabriel on 7/15/20.
//  Copyright © 2020 Example. All rights reserved.
//

import UIKit

class DashboardController: UIViewController {
    // MARK: Constants
    private enum ViewConstants {
        static let topLabelPrefix = "Welcome "
        static let middleLabelPrefix = "Today is "
        static let loadingText = "Loading your schedule!"
    }
    private enum CellIdentifiers {
        static let schedule = "ScheduleCell"
        static let loading = "LoadingCell"
    }
    
    // MARK: Outlets
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var middleLabel: UILabel!
    @IBOutlet weak var scheduleTableView: UITableView!
    
    // MARK: Properties
    var user: FitnessUser? {
        didSet {
            guard let newUser = user else { return }
            updateUserUI(user: newUser)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // TODO: Add real data when working on login feature.
        self.user = FitnessUser(userId: "123456", name: "John", lastname: "Doe", username: "jdoe42")
    }
    
    // MARK: Private methods
    private func setupViews() {
        topLabel.text = ViewConstants.topLabelPrefix
        middleLabel.text = ViewConstants.middleLabelPrefix
        
        scheduleTableView.separatorStyle = .none
        scheduleTableView.backgroundColor = .gray
    }
    
    private func setupTableView() {
        // Delegate & data source, cell registration.
        scheduleTableView.delegate = self
        scheduleTableView.dataSource = self
        scheduleTableView.register(UINib(nibName: "LoadingCell", bundle: nil), forCellReuseIdentifier: CellIdentifiers.loading)
        scheduleTableView.register(UINib(nibName: "LoadingCell", bundle: nil), forCellReuseIdentifier: CellIdentifiers.loading)
        
        // View customization.
    }
    
    private func updateUserUI(user: FitnessUser) {
        
    }
}

extension DashboardController: UITableViewDelegate, UITableViewDataSource {
    // TODO: Correct below methods when working on dashboard feature.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.loading) as! LoadingCell
        cell.setup(withText: ViewConstants.loadingText)
        return cell
    }
}
