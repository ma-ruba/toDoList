//
//  TableViewController.swift
//  toDoList
//
//  Created by Мария on 16.10.2019.
//  Copyright © 2019 Мария. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    
    @IBAction func editItem(_ sender: Any) {
        tableView.setEditing(!tableView.isEditing, animated: true)
    }
    
    
    @IBAction func addNewItem(_ sender: Any) {
       //элемент, при помощи которого выводятся стандартные всплывающие окна
        let alertController = UIAlertController(title: "Add Item", message: "", preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "New Item"
        }
        let alertAction1 = UIAlertAction(title: "Create", style: .cancel) { (action) in
            let name = alertController.textFields![0].text
            addItem(name!)
            self.tableView.reloadData()
        }
        let alertAction2 = UIAlertAction(title: "Cancel", style: .default) { (action) in
            
        }
        alertController.addAction(alertAction1)
        alertController.addAction(alertAction2)
        present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDoItem.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let dict = toDoItem[indexPath.row]
        cell.textLabel?.text = dict["Name"] as? String
        // Configure the cell...
        if dict["Is done"] as! Bool == true {
            cell.imageView?.image = #imageLiteral(resourceName: "check")
        } else {
            cell.imageView?.image = #imageLiteral(resourceName: "uncheck")
        }

        return cell
    }

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            removeItem(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true) //снимаем выделение с ячейки
        if changeStatus(at: indexPath.row) == true {
            tableView.cellForRow(at: indexPath)?.imageView?.image = #imageLiteral(resourceName: "check")
        } else {
            tableView.cellForRow(at: indexPath)?.imageView?.image = #imageLiteral(resourceName: "uncheck")
        }
    }

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        moveItem(from: fromIndexPath.row, to: to.row)
//        let from = toDoItem[fromIndexPath.row]
//        toDoItem.remove(at: fromIndexPath.row)
//        toDoItem.insert(from, at: to.row)
        tableView.reloadData()
    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
