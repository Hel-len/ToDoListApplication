//
//  StorageManager.swift
//  ToDoList
//
//  Created by Елена Дранкина on 16.05.2021.
//

import RealmSwift

class StorageManager {
    static let shared = StorageManager()
    private let realm = try! Realm()
    
    private init() {}
    
    func save(taskLists: [TaskList]) {
        try! realm.write {
            realm.add(taskLists)
        }
    }
}
