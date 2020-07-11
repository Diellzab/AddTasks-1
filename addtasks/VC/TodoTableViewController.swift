//
//  TodoTableViewController.swift
//  addtasks
//
//  Created by dardan bakiu on 7/4/20.
//  Copyright © 2020 dardan bakiu. All rights reserved.
//

import UIKit

class TodoTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    //MARK: -Table view data source

   

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        // Configure the cell...
        
        return cell
    }
    

 
    // Table view delegate
    
   override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    let action  = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completion) in
        //TODO : delete
        completion(true)
    }
        action.image = #imageLiteral(resourceName: "trash")
    action.backgroundColor = .red
        return UISwipeActionsConfiguration(actions: [action])
    }

   override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    let action  = UIContextualAction(style: .destructive, title: "Check") { (action, view, completion) in
        //TODO : delete
        completion(true)
    }
    action.image = #imageLiteral(resourceName: "check")
    action.backgroundColor = .green
    return UISwipeActionsConfiguration(actions: [action])
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
