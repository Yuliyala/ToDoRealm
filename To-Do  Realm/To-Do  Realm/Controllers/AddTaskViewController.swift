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
    
    weak var delegate: AddTaskViewControllerDelegate!
    
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
        var task: Task!
        if let name = nameTextField.text, name.count > 0,
           let detail = detailTextField.text, detail.count > 0 {
            task = Task(title: name, detail: detail, isDone: false)}
        delegate?.addNewTask(task: task!)
        navigationController?.popViewController(animated: true)
        
    }
}
