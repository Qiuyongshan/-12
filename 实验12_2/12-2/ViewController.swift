//
//  ViewController.swift
//  12-2
//
//  Created by student on 2018/12/18.
//  Copyright © 2018年 QYS. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfAge: UITextField!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillDisappear(_ animated: Bool) {
        appDelegate.saveContext()
    }
    
    @IBAction func add(_ sender: Any) {
        let p = Person(context: context)
        p.name = tfName.text
        p.age = tfAge.text
        dismiss(animated: true, completion: nil)
    }
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

