//
//  TaskListViewController.swift
//  ToDoList
//
//  Created by Елена Дранкина on 15.05.2021.
//

import UIKit

class TaskListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        createTestData()
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskListCell", for: indexPath)

        // Configure the cell...

        return cell
    }
    
    private func createTestData() {
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
        }
        
    }
}

extension TaskListViewController {
    private func showAlert() {
        let alert = AlertController(title: "New List", message: "Please insert new value", preferredStyle: .alert)
        
        alert.action { newValue in
            
        }
        
        present(alert, animated: true)
    }
}
