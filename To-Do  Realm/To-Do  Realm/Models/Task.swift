//
//  Task.swift
//  To-Do  Realm
//
//  Created by Yuliya Lapenak on 10/19/22.
//

import UIKit
import RealmSwift


struct Task {
    var title: String
    var detail: String
    var isDone: Bool
}

class TaskRealmModel: Object {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title = ""
    @Persisted var detail = ""
    @Persisted var isDone: Bool = false
    
   
    
    static func create(title: String, detail: String, isDone: Bool) -> TaskRealmModel {
        let model = TaskRealmModel()
        model.title = title
        model.detail = detail
        model.isDone = isDone
        return model
    }
}


