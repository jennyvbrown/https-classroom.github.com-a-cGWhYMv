//
//  AddViewController.swift
//  Inventory
//
//  Created by Jenifer Brown on 11/6/18.
//  Copyright © 2018 Jenifer Brown. All rights reserved.
//

import UIKit

protocol addDelegate: class {
    func addItem(newItem: Item)
}

class AddViewController: UIViewController {

    weak var delegate:addDelegate?
    
    @IBOutlet weak var shortDesc: UITextField!
    @IBOutlet weak var longDesc: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let save = UIBarButtonItem(barButtonSystemItem: .save,
                                   target: self,
                                   action: #selector(saveItem))
        self.navigationItem.rightBarButtonItem = save
       
    }
    
    @objc func saveItem(){
        let item = Item(shortDesc: self.shortDesc.text ?? "", longDesc: self.longDesc.text ?? "")
        delegate?.addItem(newItem: item)
        self.navigationController?.popViewController(animated: true)
    }

}
