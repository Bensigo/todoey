//
//  ViewController.swift
//  todoey
//
//  Created by Bensigo Egwey on 12/22/18.
//  Copyright © 2018 Bensigo Egwey. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    var itemArray = [Todo]()
    
    let userDefault = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let items = userDefault.array(forKey: "TodoListArray") as? [Todo] {
            itemArray = items
        }
        let newItem = Todo()
        newItem.title = "Clean up"
        itemArray.append(newItem)
        
        let newItem2 = Todo()
        newItem2.title = "Code ios swift"
        itemArray.append(newItem2)
        
        let newItem3 = Todo()
        newItem3.title = "Become a pro with ios dev"
        itemArray.append(newItem3)
        
    }

    // MARK: - tableview datasource methods
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoItemCell", for: indexPath)
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        cell.accessoryType = item.isChecked ? .checkmark : .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // deselect cell with animation
        tableView.deselectRow(at: indexPath, animated: true)
        // get the cell being selected
        itemArray[indexPath.row].isChecked = !itemArray[indexPath.row].isChecked
        tableView.reloadData()
    }
    // MARK: - add new todos  to our list
    @IBAction func addBtnPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        // add a ui alert to our view
        let alert = UIAlertController(title: "Add New Todo", message: nil, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) {
            (action) in
            // add the item to item array
            print(textField.text!)
            if textField.text != "" {
                if let text = textField.text {
                    let newItem = Todo()
                    newItem.title = text
                    self.itemArray.append(newItem)
                    self.userDefault.set(self.itemArray, forKey: "TodoListArray")
                    self.tableView.reloadData()
                }
            }
            
        }
        // add textfield to alert
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "create new Todo"
            textField = alertTextField
        }
        alert.addAction(action)
        // show alert
        present(alert, animated: true, completion: nil)
        
    }
}

