//
//  EditViewController.swift
//  Inventory
//
//  Created by Jenifer Brown on 11/6/18.
//  Copyright © 2018 Jenifer Brown. All rights reserved.
//

import UIKit

protocol editDelegate: class {
    func updateItem(updatedItem: Item)
}

class EditViewController: UIViewController {
    weak var delegate:editDelegate?
    var shortText: String = ""
    var longText: String = ""
    @IBOutlet weak var shortDesc: UITextField!
    @IBOutlet weak var longDesc: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shortDesc.text = shortText
        longDesc.text = longText
        let save = UIBarButtonItem(barButtonSystemItem: .save,
                                   target: self,
                                   action: #selector(saveItem))
        self.navigationItem.rightBarButtonItem = save
        
    }
    
    @objc func saveItem(){
        let item = Item(shortDesc: self.shortDesc.text ?? "", longDesc: self.longDesc.text ?? "")
        delegate?.updateItem(updatedItem: item)
        self.navigationController?.popViewController(animated: true)
    }
}
