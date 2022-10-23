//
//  ViewController.swift
//  To-Do  Realm
//
//  Created by Yuliya Lapenak on 10/19/22.
//

import UIKit


class ViewController: UIViewController, AddTaskViewControllerDelegate  {
    
    @IBOutlet weak var itemsTableView: UITableView!
    
    var tasks = [Task]()
    private let realmManager = RealmManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
    }
    
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
        readData()
    }
    
    func readData() {
        tasks = realmManager.getTask()
        itemsTableView.reloadData()
    }
    
    func deleteData(indexPath: IndexPath) {
        realmManager.deleteTask(id: tasks[indexPath.row].id)
    }
    
    
    @IBAction func addButtonPressed(_ sender: Any) {
        guard let destination = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddTaskViewController") as? AddTaskViewController  else { return }
        navigationController?.pushViewController(destination, animated: true)
    }
    
    func setupTable() {
        itemsTableView.delegate = self
        itemsTableView.dataSource = self
        itemsTableView.rowHeight = 60
        itemsTableView.register(UINib(nibName: "CellTableViewCell", bundle: nil), forCellReuseIdentifier: CellTableViewCell.identifier)
        
    }
    
    func addNewTask(task: Task) {
        tasks.append(task)
        itemsTableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellTableViewCell.identifier, for: indexPath)
                as? CellTableViewCell else {
            return UITableViewCell()
        }
        cell.setupCell(task: tasks[indexPath.row])
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = itemsTableView.cellForRow(at: indexPath) {
            var task = tasks[indexPath.row]
            task.isDone = !task.isDone
                  cell.accessoryType = task.isDone ? .checkmark : .none
              }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal, title: "delete") { _, _, completion in
            self.tasks.remove(at: indexPath.row)
            self.deleteData(indexPath: indexPath)
            self.itemsTableView.reloadData()
            completion(true)
        }
        action.backgroundColor = .red
        return UISwipeActionsConfiguration(actions: [action])
    }
    
}

