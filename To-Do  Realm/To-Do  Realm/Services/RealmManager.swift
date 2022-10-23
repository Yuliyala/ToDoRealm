//
//  RealmManager.swift
//  To-Do  Realm
//
//  Created by Yuliya Lapenak on 10/23/22.
//

import Foundation
import RealmSwift

class RealmManager {
    
    private let realm = try! Realm()
    
    func saveTask(title:String, detail: String, isDone: Bool) {
        let task = TaskRealmModel.create(title: title, detail: detail, isDone: isDone)
        try! realm.write({
            realm.add(task)
        })
    
}
    func getTask() -> [Task] {
        let tasks = realm.objects(TaskRealmModel.self)
        var result = [Task]()
        for task in tasks {
            let model = Task(model: task)
            result.append(model)
    }
        return result
}
    
    func deleteTask(id: String) {
      
        guard let key = try?  ObjectId(string: id),
              let task = realm.object(ofType: TaskRealmModel.self, forPrimaryKey: key) else {return}
        try! realm.write({
            realm.delete(task)
        })

    }
}
    

