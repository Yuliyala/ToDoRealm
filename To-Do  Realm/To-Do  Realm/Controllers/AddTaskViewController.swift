//
//  AddTaskViewController.swift
//  To-Do  Realm
//
//  Created by Yuliya Lapenak on 10/19/22.
//

import UIKit

protocol AddTaskViewControllerDelegate: AnyObject {
    func addNewTask(task: Task)
}

class AddTaskViewController: UIViewController {
    
    private let realmManager = RealmManager()
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var detailTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton(button: saveButton)
    }
    
    func setupButton(button: UIButton) {
        saveButton.layer.cornerRadius = 10
    }
 
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        if let name = nameTextField.text, name.count > 0,
           let detail = detailTextField.text, detail.count > 0 {
           
            realmManager.saveTask(title: name, detail: detail, isDone: false)
        navigationController?.popViewController(animated: true)
        
    }
}
}
