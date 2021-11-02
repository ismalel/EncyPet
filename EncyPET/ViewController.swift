//
//  ViewController.swift
//  EncyPET
//
//  Created by Ismael on 30/10/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var btn_scan: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        btn_scan.backgroundColor = .black
        btn_scan.layer.cornerRadius = 8
    }


}

