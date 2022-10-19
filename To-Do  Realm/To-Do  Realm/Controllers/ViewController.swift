//
//  ViewController.swift
//  To-Do  Realm
//
//  Created by Yuliya Lapenak on 10/19/22.
//

import UIKit

struct Task {
    var title: String
    var detail: String
    var isDone: Bool
}

class ViewController: UIViewController {

    @IBOutlet weak var itemsTableView: UITableView!
    
    let tasks = [Task]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        guard let destination = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddTaskViewController") as? AddTaskViewController  else { return }
        navigationController?.pushViewController(destination, animated: true)
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    
}
