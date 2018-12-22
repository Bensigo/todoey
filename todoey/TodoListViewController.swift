//
//  ViewController.swift
//  todoey
//
//  Created by Bensigo Egwey on 12/22/18.
//  Copyright © 2018 Bensigo Egwey. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    let itemArray = ["Clean up", "submit application porfilo","Code ios swift", "movie"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // MARK: - tableview datasource methods
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // deselect cell with animation
        tableView.deselectRow(at: indexPath, animated: true)
        // get the cell being selected
        let cell = tableView.cellForRow(at: indexPath)
        if cell?.accessoryType == .checkmark {
            cell?.accessoryType = .none
        }else {
            cell?.accessoryType = .checkmark
        }
    }
}

