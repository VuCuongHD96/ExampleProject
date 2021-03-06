//
//  PhoneViewController.swift
//  CoreDataExample
//
//  Created by Sun on 13/12/2021.
//

import UIKit

final class PhoneViewController: BaseViewController {
    
    // MARK: - Outlet
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var ageLabel: UILabel!
    
    // MARK: - Property
    var user: User!
    let phoneRepository = PhoneRepository(manager: DBManager.shared)
    var phoneArray = [Phone]() {
        didSet {
            tableView.reloadData()
        }
    }
    lazy var alert = UIAlertController(title: "Thông báo",
                                       message: "Nhập thông tin device",
                                       preferredStyle: .alert)
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        setupView()
    }
    
    // MARK: - View
    private func setupView() {
        tableView.do {
            $0.dataSource = self
        }
        setupAlert()
        setupRightButtonBar()
    }
    
    private func setupRightButtonBar() {
        let barbuttonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showPopup))
        navigationItem.rightBarButtonItem = barbuttonItem
    }
    
    private func setupAlert() {
        let okAction = UIAlertAction(title: "OK", style: .default, handler: okAlertAction)
        alert.addAction(okAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        alert.addTextField { (textField) in
            textField.placeholder = "Name"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Version"
        }
    }
    
    // MARK: - Data
    private func fetchData() {
        phoneArray = phoneRepository.getList(by: user)
    }
    
    private func savePhone(name: String, version: String) {
        let phone = Phone(name: name, version: version)
        phoneRepository.savePhone(user: user, phone: phone)
        fetchData()
    }
    
    // MARK: - Action
    @objc func showPopup() {
        present(alert, animated: true, completion: nil)
    }
    
    private func okAlertAction(alertAction: UIAlertAction) {
        if let name = alert.textFields?[0].text,
           let age = alert.textFields?[1].text {
            savePhone(name: name, version: age)
            alert.textFields?[0].text = ""
            alert.textFields?[1].text = ""
        }
    }
}

extension PhoneViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return phoneArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let data = phoneArray[row]
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = data.name
        cell.detailTextLabel?.text = data.version
        return cell
    }
}
