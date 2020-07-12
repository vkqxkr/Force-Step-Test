//
//  ViewController_feedback_graph_menu.swift
//  Force_Step_Test_8
//
//  Created by JinHyuck Park on 2020/07/12.
//  Copyright © 2020 JinHyuck Park. All rights reserved.
//

import UIKit

class ViewController_feedback_graph_menu: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var SubjectName_TextField: UITextField!
    @IBOutlet weak var RequireTime_TextField: UITextField!
    @IBOutlet weak var StayTime_TextField: UITextField!
    @IBOutlet weak var RepeatCount_TextField: UITextField!
    @IBOutlet weak var StepCount_TextField: UITextField!
    @IBOutlet weak var StartExperiment_Button: UIButton!
    
    var SubjectName_String = ""
    var RequireTime_String = ""
    var StayTime_String = ""
    var RepeatCount_String = ""
    var StepCount_String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SubjectName_TextField.returnKeyType = .done
        self.SubjectName_TextField.delegate = self
        RequireTime_TextField.returnKeyType = .done
        self.RequireTime_TextField.delegate = self
        StayTime_TextField.returnKeyType = .done
        self.StayTime_TextField.delegate = self
        RepeatCount_TextField.returnKeyType = .done
        self.RepeatCount_TextField.delegate = self
        StepCount_TextField.returnKeyType = .done
        self.StepCount_TextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        SubjectName_String = SubjectName_TextField.text ?? ""
        RequireTime_String = RequireTime_TextField.text ?? ""
        StayTime_String = StayTime_TextField.text ?? ""
        RepeatCount_String = RepeatCount_TextField.text ?? ""
        StepCount_String = StepCount_TextField.text ?? ""
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue_feedback_graph" {
            let secondViewController = segue.destination as! ViewController_feedback_color_experiment
            secondViewController.SubjectName_String = SubjectName_String
            secondViewController.RequireTime_String = RequireTime_String
            secondViewController.StayTime_String = StayTime_String
            secondViewController.RepeatCount_String = RepeatCount_String
            secondViewController.StepCount_String = StepCount_String
        }
    }
}

