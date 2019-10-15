//
//  ViewController.swift
//  toDoList
//
//  Created by Мария on 15.10.2019.
//  Copyright © 2019 Мария. All rights reserved.
//

import UIKit

var data = ["Call mammy", "Do my homework", "Create an App", "Do cleaning"]

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (data.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(data[indexPath.row])
    }
    
//    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
    
    @IBOutlet weak var viewController: UITableView!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

