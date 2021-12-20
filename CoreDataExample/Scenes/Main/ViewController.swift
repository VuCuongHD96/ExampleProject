//
//  ViewController.swift
//  CoreDataExample
//
//  Created by Sun on 10/12/2021.
//

import UIKit
import Then

final class ViewController: BaseViewController {
    
    // MARK: - Outlet
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Property
    var userArray = [User]() {
        didSet {
            tableView.reloadData()
        }
    }
    lazy var alert = UIAlertController(title: "Thông báo",
                                  message: "Nhập thông tin user",
                                  preferredStyle: .alert)
    let userRepository = UserRepository(manager: DBManager.shared)
    
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
            $0.delegate = self
        }
        setupAlert()
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
            textField.placeholder = "Age"
        }
    }
    
    // MARK: - Data
    private func fetchData() {
        userArray = userRepository.getListUser()
    }
    
    private func saveUser(name: String, age: String) {
        userRepository.saveUser(name: name, age: age)
        fetchData()
    }
    
    // MARK: - Action
    @IBAction func showAlert(_ sender: Any) {
        present(alert, animated: true, completion: nil)
    }
    
    private func okAlertAction(alertAction: UIAlertAction) {
        if let name = alert.textFields?[0].text,
            let age = alert.textFields?[1].text {
            saveUser(name: name, age: age)
            alert.textFields?[0].text = ""
            alert.textFields?[1].text = ""
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let data = userArray[row]
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = data.name
        cell.detailTextLabel?.text = data.age
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        let data = userArray[row]
        let phoneViewController = PhoneViewController()
        phoneViewController.user = data
        navigationController?.pushViewController(phoneViewController, animated: true)
    }
}
