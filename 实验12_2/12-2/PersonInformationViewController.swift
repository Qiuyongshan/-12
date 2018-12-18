//
//  PersonInformationViewController.swift
//  12-2
//
//  Created by student on 2018/12/18.
//  Copyright © 2018年 QYS. All rights reserved.
//

import UIKit

class PersonInformationViewController: UIViewController {
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbPhone: UILabel!
    
    var person:Person?
    override func viewDidLoad() {
        super.viewDidLoad()
        lbName.text = person?.name
        lbPhone.text = person?.age
    }
}
