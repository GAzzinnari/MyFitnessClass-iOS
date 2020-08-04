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
    private enum DashboardConstants {
        static let topLabelPrefix = "Welcome "
        static let loadingText = "Loading your schedule!"
        
        static let scheduleCell = "ImageTitleCell"
        static let loadingCell = "LoadingCell"
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
        #warning("TODO: Add real data when working on login feature.")
        self.user = FitnessUser(userId: "123456", name: "John", lastname: "Doe", username: "jdoe42")
        
        updateTimeUI()
    }
    
    // MARK: Private methods
    private func setupViews() {
        topLabel.text = DashboardConstants.topLabelPrefix

        scheduleTableView.separatorStyle = .none
        scheduleTableView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
    }
    
    private func setupTableView() {
        // Delegate & data source, cell registration.
        scheduleTableView.delegate = self
        scheduleTableView.dataSource = self
        scheduleTableView.rowHeight = UITableView.automaticDimension
        scheduleTableView.sectionFooterHeight = UITableView.automaticDimension
        scheduleTableView.register(UINib(nibName: DashboardConstants.loadingCell, bundle: nil), forCellReuseIdentifier: DashboardConstants.loadingCell)
        scheduleTableView.register(UINib(nibName: DashboardConstants.scheduleCell, bundle: nil), forCellReuseIdentifier: DashboardConstants.scheduleCell)
        
        // View customization.
    }
    
    private func updateUserUI(user: FitnessUser) {
        topLabel.text = DashboardConstants.topLabelPrefix + user.name + "!"
    }
    
    private func updateTimeUI() {
        #warning("TODO: Add real implementation when working on dashboard.")
        middleLabel.text = "Thursday 16, July"
    }
}

extension DashboardController: UITableViewDelegate, UITableViewDataSource {
    // MARK: Data Source & Delegate
    #warning("TODO: Correct below methods when working on dashboard feature.")
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            return getLoadingCell(tableView)
        } else {
            return getScheduleCell(tableView, row: indexPath.row)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        // If last section, add schedule button
        if section == tableView.numberOfSections - 1 {
            return getNewScheduleView()
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 20))
        return view
    }
    
    // MARK: Private methods
    private func getLoadingCell(_ tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DashboardConstants.loadingCell) as! LoadingCell
        cell.setup(withText: DashboardConstants.loadingText)
        return cell
    }
    
    private func getScheduleCell(_ tableView: UITableView, row: Int) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DashboardConstants.scheduleCell) as! ImageTitleCell
        let image = UIImage(named: "dumbell-icon")
        cell.setup(withImage: image, title: "Friday, 18:00")
        return cell
    }
    
    private func getNewScheduleView() -> UIView {
        let view = ButtonView()
        let action = { [weak self] in
            guard let self = self else { return }
            let controller = ScheduleNewController()
            let navController = UINavigationController(rootViewController: controller)
            self.present(navController, animated: true, completion: nil)
        }
        view.setup(withTitle: "Schedule new class!", action: action)
        view.backgroundColor = .lightGray
        return view
    }
}
