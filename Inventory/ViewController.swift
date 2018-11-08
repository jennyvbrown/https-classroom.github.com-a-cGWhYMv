//
//  ViewController.swift
//  Inventory
//
//  Created by Jenifer Brown on 10/26/18.
//  Copyright © 2018 Jenifer Brown. All rights reserved.
//

import UIKit

var lineNumber: Int!
var Items:[Item] = []
//Item(shortDesc: "item 1", longDesc: "itemdsesc 1"),
//Item(shortDesc: "item 2", longDesc: "itemdsesc 2") 



class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, addDelegate, editDelegate{

    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = Items[indexPath.row].shortDesc
        cell.detailTextLabel?.text = Items[indexPath.row].longDesc
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action:UIContextualAction, sourceView:UIView, actionPerformed:(Bool) -> Void) in
            Items.remove(at: indexPath.row)
            tableView.reloadData()
            actionPerformed(true)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    

    
    func addItem(newItem: Item) {
        Items.append(newItem)
        tableView.reloadData()
    }
    
    func updateItem(updatedItem: Item) {
        
        Items[lineNumber].shortDesc = updatedItem.shortDesc
        Items[lineNumber].longDesc = updatedItem.longDesc
        tableView.reloadData()
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addSegue"{
            let view = segue.destination as! AddViewController
            view.delegate = self
        }
        if segue.identifier == "editSegue"{
            lineNumber = tableView.indexPathForSelectedRow?.row
            let view = segue.destination as! EditViewController
            view.shortText = Items[lineNumber].shortDesc
            view.longText = Items[lineNumber].longDesc
            view.delegate = self
        }
    }
}

