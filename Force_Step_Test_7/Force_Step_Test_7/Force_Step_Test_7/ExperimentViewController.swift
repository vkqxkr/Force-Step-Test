//
//  ExperimentViewController.swift
//  Force_Step_Test_7
//
//  Created by JinHyuck Park on 2020/01/09.
//  Copyright © 2020 JinHyuck Park. All rights reserved.
//

import UIKit

class ExperimentViewController: UIViewController {

    @IBOutlet weak var StepCount_Label: UILabel!
    @IBOutlet weak var SubjectName_Label: UILabel!
    @IBOutlet weak var StepColorView_ProgressView: StepProgreessView!
    @IBOutlet weak var PresentForceView_ProgressView: ForceProgressView!
    @IBOutlet weak var PresentForceColorView_ImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
