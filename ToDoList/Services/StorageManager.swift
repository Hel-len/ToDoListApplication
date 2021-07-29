//
//  StorageManager.swift
//  ToDoList
//
//  Created by Елена Дранкина on 16.05.2021.
//

import RealmSwift

class StorageManager {
    static let shared = StorageManager()
    let realm = try! Realm()
    
    private init() {}
    // MARK: - Work with TaskLists
    func save(taskLists: [TaskList]) {
        write {
            realm.add(taskLists)
        }
    }
    
    func delete(taskList: TaskList) {
        write {
            realm.delete(taskList.tasks)
            realm.delete(taskList)
        }
    }
    
    func edit(taskList: TaskList, newValue: String) {
        write {
            taskList.name = newValue
        }
    }
    
    func done(taskList: TaskList) {
        write {
            taskList.tasks.setValue(true, forKey: "isComplete")
        }
    }
    
    // MARK: - Work with tasks
    
    func save(taskList: TaskList) {
        write {
            realm.add(taskList)
        }
    }
    
    func deleteTask(task: Task) {
        write {
            realm.delete(task)
        }
    }
    
    func editTask(task: Task, name: String, note: String) {
        write {
            task.name = name
            task.note = note
        }
    }
    
    func doneTask(task: Task) {
        write {
            task.isComplete.toggle()
        }
    }
    
    func save(task: Task, in taskList: TaskList) {
        write {
            taskList.tasks.append(task)
        }
    }
    
    private func write(_ complition: () -> Void) {
        do {
            try realm.write{ complition() }
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
