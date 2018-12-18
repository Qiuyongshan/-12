//
//  PersonTableViewController.swift
//  12-2
//
//  Created by student on 2018/12/18.
//  Copyright © 2018年 QYS. All rights reserved.
//

import UIKit
import CoreData

class PersonTableViewController: UITableViewController {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var persons:[Person]?
    fileprivate func reloadData() {
        let fetch:NSFetchRequest<Person> = Person.fetchRequest()
        fetch.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        persons = try? context.fetch(fetch)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reloadData()
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "MyPersonList"
    }
    override func viewWillAppear(_ animated: Bool) {
        reloadData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return persons?.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        if let person = persons?[indexPath.row] {
            cell.textLabel?.text = person.name
        }
        // Configure the cell...
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            let secVC = segue.destination as! PersonInformationViewController
            
            if let indexPath = self.tableView.indexPath(for: sender as! UITableViewCell)
            {
                secVC.person = persons?[indexPath.row]
            }
        }
    }
    
    
}
