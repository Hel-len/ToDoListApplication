//
//  DataManager.swift
//  ToDoList
//
//  Created by Елена Дранкина on 18.05.2021.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    private init() {}
    
    func createTempData(_ completion: @escaping () -> Void) {
        if !UserDefaults.standard.bool(forKey: "done") {
            UserDefaults.standard.set(true, forKey: "done")
            
            let shoppingList = TaskList()
            shoppingList.name = "Shopping List"
            
            let milk = Task()
            milk.name = "Milk"
            milk.note = "2L"
            let bread = Task(value: ["Bread", "", Date(), true])
            let apples = Task(value: ["name": "Apples", "note": "2 kg"])
            
            shoppingList.tasks.insert(contentsOf: [milk, bread, apples], at: 0)
            let moviesList = TaskList(value: ["Movies List", Date(), [["Legend", "with Tom Hardy"], ["Mortal Combat", "New one", Date(), true]]])
            
            DispatchQueue.main.async {
                StorageManager.shared.save(taskLists: [shoppingList, moviesList])
                completion()
            }
        }
    }
}
