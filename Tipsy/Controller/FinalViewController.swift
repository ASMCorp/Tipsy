//
//  FinalViewController.swift
//  Tipsy
//
//  Created by Asaduzzaman Anik on 6/16/20.
//  Copyright © 2020 Asaduzzaman Anik. All rights reserved.
//

import UIKit

class FinalViewController: UIViewController {
    
    @IBOutlet weak var SplitAmount: UILabel!
    @IBOutlet weak var comment: UILabel!
    @IBOutlet weak var recalculate: UIButton!
    
    var result = ""
    var split = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recalculate.layer.cornerRadius = 20.0
        SplitAmount.text = result
        comment.text = "Between \(split) Persons"

    }
    
    @IBAction func recalculate(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
