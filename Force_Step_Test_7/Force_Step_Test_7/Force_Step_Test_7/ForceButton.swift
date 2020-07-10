//
//  ForceButton.swift
//  Force_Step_Test_7
//
//  Created by JinHyuck Park on 2020/01/13.
//  Copyright © 2020 JinHyuck Park. All rights reserved.
//

import UIKit

class ForceButton: UIButton {
    var button = ""
    var temp_Button = ""
    var SelectForceView_Bool = true
    var max_force: CGFloat = 0.0
    var temp_Force: CGFloat = 0.0
    var StepCount_Int: Int = 0
    var StepBorder_DoubleList: [Double] = []
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.layer.cornerRadius = 5.0;
        self.backgroundColor = UIColor.darkGray;
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        max_force = 0.0
        button = ""
        if let touch = touches.first {
            if #available(iOS 9.0, *) {
                if traitCollection.forceTouchCapability == UIForceTouchCapability.available {
                    let force = touch.force/touch.maximumPossibleForce
                    
                    if SelectForceView_Bool {
                        if force > max_force {
                            max_force = force
                        }
                    }
                    if StepCount_Int == 2 {
                        if force < 0.2 {
                            self.backgroundColor = UIColor.gray;
                        } else if force < CGFloat(StepBorder_DoubleList[0]) {
                            self.backgroundColor = UIColor.purple;
                        } else if force < 1.0 {
                            self.backgroundColor = UIColor.blue;
                        } else {
                            self.backgroundColor = UIColor.black
                        }
                    } else if StepCount_Int == 3 {
                       if force < 0.2 {
                            self.backgroundColor = UIColor.gray;
                        
                       } else if force < CGFloat(StepBorder_DoubleList[0]) {
                            self.backgroundColor = UIColor.purple;
                        
                       } else if force < CGFloat(StepBorder_DoubleList[1]) {
                            self.backgroundColor = UIColor.blue;
                        
                       } else if force < 1.0 {
                            self.backgroundColor = UIColor(red:0.00, green:0.58, blue:1.00, alpha:1.0)
                        
                       } else {
                            self.backgroundColor = UIColor.black
                       }
                    } else if StepCount_Int == 4 {
                        if force < 0.2 {
                             self.backgroundColor = UIColor.gray;
                         
                        } else if force < CGFloat(StepBorder_DoubleList[0]) {
                             self.backgroundColor = UIColor.purple;
                         
                        } else if force < CGFloat(StepBorder_DoubleList[1]) {
                             self.backgroundColor = UIColor.blue;
                         
                        } else if force < CGFloat(StepBorder_DoubleList[2]) {
                             self.backgroundColor = UIColor(red:0.00, green:0.58, blue:1.00, alpha:1.0)
                        } else if force < 1.0 {
                            self.backgroundColor = UIColor.green;
                        } else {
                             self.backgroundColor = UIColor.black
                        }
                    } else if StepCount_Int == 5 {
                        if force < 0.2 {
                             self.backgroundColor = UIColor.gray;
                         
                        } else if force < CGFloat(StepBorder_DoubleList[0]) {
                             self.backgroundColor = UIColor.purple;
                         
                        } else if force < CGFloat(StepBorder_DoubleList[1]) {
                             self.backgroundColor = UIColor.blue;
                         
                        } else if force < CGFloat(StepBorder_DoubleList[2]) {
                             self.backgroundColor = UIColor(red:0.00, green:0.58, blue:1.00, alpha:1.0)
                        } else if force < CGFloat(StepBorder_DoubleList[3]) {
                            self.backgroundColor = UIColor.green;
                        } else if force < 1.0 {
                            self.backgroundColor = UIColor.yellow;
                        } else {
                             self.backgroundColor = UIColor.black
                        }
                    } else if StepCount_Int == 6 {
                        if force < 0.2 {
                             self.backgroundColor = UIColor.gray;
                         
                        } else if force < CGFloat(StepBorder_DoubleList[0]) {
                             self.backgroundColor = UIColor.purple;
                         
                        } else if force < CGFloat(StepBorder_DoubleList[1]) {
                             self.backgroundColor = UIColor.blue;
                         
                        } else if force < CGFloat(StepBorder_DoubleList[2]) {
                             self.backgroundColor = UIColor(red:0.00, green:0.58, blue:1.00, alpha:1.0)
                        } else if force < CGFloat(StepBorder_DoubleList[3]) {
                            self.backgroundColor = UIColor.green;
                        } else if force < CGFloat(StepBorder_DoubleList[4]) {
                            self.backgroundColor = UIColor.yellow;
                        } else if force < 1.0 {
                            self.backgroundColor = UIColor.orange;
                        } else {
                             self.backgroundColor = UIColor.black
                        }
                    } else {
                        if force < 0.2 {
                            self.backgroundColor = UIColor.gray;
                        } else if force < CGFloat(StepBorder_DoubleList[0]) {
                            self.backgroundColor = UIColor.purple;
                        } else if force < CGFloat(StepBorder_DoubleList[1]) {
                            self.backgroundColor = UIColor.blue;
                        } else if force < CGFloat(StepBorder_DoubleList[2]) {
                            self.backgroundColor = UIColor(red:0.00, green:0.58, blue:1.00, alpha:1.0)
                        } else if force < CGFloat(StepBorder_DoubleList[3]) {
                            self.backgroundColor = UIColor.green;
                        } else if force < CGFloat(StepBorder_DoubleList[4]) {
                            self.backgroundColor = UIColor.yellow;
                        } else if force < CGFloat(StepBorder_DoubleList[5]) {
                            self.backgroundColor = UIColor.orange;
                        } else if force < 1.0 {
                            self.backgroundColor = UIColor.red;
                        } else {
                            self.backgroundColor = UIColor.black
                        }
                    }
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        if let touch = touches.first {
            if #available(iOS 9.0, *) {
                if traitCollection.forceTouchCapability == UIForceTouchCapability.available {
                    let force = touch.force/touch.maximumPossibleForce
                    
                    if SelectForceView_Bool {
                        if force > max_force {
                            max_force = force
                            SetForce(force: max_force)
                            if StepCount_Int == 2 {
                                if force < 0.2 {
                                    self.backgroundColor = UIColor.gray;
                                    button = "g"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[0]) {
                                    self.backgroundColor = UIColor.purple;
                                    button = "P"
                                    SetColor(color: button)
                                } else if force < 1.0 {
                                    self.backgroundColor = UIColor.blue;
                                    button = "B"
                                    SetColor(color: button)
                                } else {
                                    self.backgroundColor = UIColor.black
                                    button = "b"
                                    SetColor(color: button)
                                }
                            } else if StepCount_Int == 3 {
                                if force < 0.2 {
                                    self.backgroundColor = UIColor.gray;
                                    button = "g"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[0]) {
                                    self.backgroundColor = UIColor.purple;
                                    button = "P"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[1]) {
                                    self.backgroundColor = UIColor.blue;
                                    button = "B"
                                    SetColor(color: button)
                                } else if force < 1.0 {
                                    self.backgroundColor = UIColor(red:0.00, green:0.58, blue:1.00, alpha:1.0)
                                    button = "S"
                                    SetColor(color: button)
                                } else {
                                    self.backgroundColor = UIColor.black
                                    button = "b"
                                    SetColor(color: button)
                                }
                            } else if StepCount_Int == 4 {
                                if force < 0.2 {
                                    self.backgroundColor = UIColor.gray;
                                    button = "g"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[0]) {
                                    self.backgroundColor = UIColor.purple;
                                    button = "P"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[1]) {
                                    self.backgroundColor = UIColor.blue;
                                    button = "B"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[2]) {
                                    self.backgroundColor = UIColor(red:0.00, green:0.58, blue:1.00, alpha:1.0)
                                    button = "S"
                                    SetColor(color: button)
                                } else if force < 1.0 {
                                    self.backgroundColor = UIColor.green;
                                    button = "G"
                                    SetColor(color: button)
                                } else {
                                    self.backgroundColor = UIColor.black
                                    button = "b"
                                    SetColor(color: button)
                                }
                            } else if StepCount_Int == 5 {
                                if force < 0.2 {
                                    self.backgroundColor = UIColor.gray;
                                    button = "g"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[0]) {
                                    self.backgroundColor = UIColor.purple;
                                    button = "P"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[1]) {
                                    self.backgroundColor = UIColor.blue;
                                    button = "B"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[2]) {
                                    self.backgroundColor = UIColor(red:0.00, green:0.58, blue:1.00, alpha:1.0)
                                    button = "S"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[3]) {
                                    self.backgroundColor = UIColor.green;
                                    button = "G"
                                    SetColor(color: button)
                                } else if force < 1.0 {
                                    self.backgroundColor = UIColor.yellow;
                                    button = "Y"
                                    SetColor(color: button)
                                } else {
                                    self.backgroundColor = UIColor.black
                                    button = "b"
                                    SetColor(color: button)
                                }
                            } else if StepCount_Int == 6 {
                                if force < 0.2 {
                                    self.backgroundColor = UIColor.gray;
                                    button = "g"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[0]) {
                                    self.backgroundColor = UIColor.purple;
                                    button = "P"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[1]) {
                                    self.backgroundColor = UIColor.blue;
                                    button = "B"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[2]) {
                                    self.backgroundColor = UIColor(red:0.00, green:0.58, blue:1.00, alpha:1.0)
                                    button = "S"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[3]) {
                                    self.backgroundColor = UIColor.green;
                                    button = "G"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[4]) {
                                    self.backgroundColor = UIColor.yellow;
                                    button = "Y"
                                    SetColor(color: button)
                                } else if force < 1.0 {
                                    self.backgroundColor = UIColor.orange;
                                    button = "O"
                                    SetColor(color: button)
                                } else {
                                    self.backgroundColor = UIColor.black
                                    button = "b"
                                    SetColor(color: button)
                                }
                            } else {
                                if force < 0.2 {
                                    self.backgroundColor = UIColor.gray;
                                    button = "g"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[0]) {
                                    self.backgroundColor = UIColor.purple;
                                    button = "P"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[1]) {
                                    self.backgroundColor = UIColor.blue;
                                    button = "B"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[2]) {
                                    self.backgroundColor = UIColor(red:0.00, green:0.58, blue:1.00, alpha:1.0)
                                    button = "S"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[3]) {
                                    self.backgroundColor = UIColor.green;
                                    button = "G"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[4]) {
                                    self.backgroundColor = UIColor.yellow;
                                    button = "Y"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[5]) {
                                    self.backgroundColor = UIColor.orange;
                                    button = "O"
                                    SetColor(color: button)
                                } else if force < 1.0 {
                                    self.backgroundColor = UIColor.red;
                                    button = "R"
                                    SetColor(color: button)
                                } else {
                                    self.backgroundColor = UIColor.black
                                    button = "b"
                                    SetColor(color: button)
                                }
                            }
                        }
                    } else {
                            max_force = force
                            SetForce(force: max_force)
                            if StepCount_Int == 2 {
                                if force < 0.2 {
                                    self.backgroundColor = UIColor.gray;
                                    button = "g"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[0]) {
                                    self.backgroundColor = UIColor.purple;
                                    button = "P"
                                    SetColor(color: button)
                                } else if force < 1.0 {
                                    self.backgroundColor = UIColor.blue;
                                    button = "B"
                                    SetColor(color: button)
                                } else {
                                    self.backgroundColor = UIColor.black
                                    button = "b"
                                    SetColor(color: button)
                                }
                            } else if StepCount_Int == 3 {
                                if force < 0.2 {
                                    self.backgroundColor = UIColor.gray;
                                    button = "g"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[0]) {
                                    self.backgroundColor = UIColor.purple;
                                    button = "P"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[1]) {
                                    self.backgroundColor = UIColor.blue;
                                    button = "B"
                                    SetColor(color: button)
                                } else if force < 1.0 {
                                    self.backgroundColor = UIColor(red:0.00, green:0.58, blue:1.00, alpha:1.0)
                                    button = "S"
                                    SetColor(color: button)
                                } else {
                                    self.backgroundColor = UIColor.black
                                    button = "b"
                                    SetColor(color: button)
                                }
                            } else if StepCount_Int == 4 {
                                if force < 0.2 {
                                    self.backgroundColor = UIColor.gray;
                                    button = "g"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[0]) {
                                    self.backgroundColor = UIColor.purple;
                                    button = "P"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[1]) {
                                    self.backgroundColor = UIColor.blue;
                                    button = "B"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[2]) {
                                    self.backgroundColor = UIColor(red:0.00, green:0.58, blue:1.00, alpha:1.0)
                                    button = "S"
                                    SetColor(color: button)
                                } else if force < 1.0 {
                                    self.backgroundColor = UIColor.green;
                                    button = "G"
                                    SetColor(color: button)
                                } else {
                                    self.backgroundColor = UIColor.black
                                    button = "b"
                                    SetColor(color: button)
                                }
                            } else if StepCount_Int == 5 {
                                if force < 0.2 {
                                    self.backgroundColor = UIColor.gray;
                                    button = "g"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[0]) {
                                    self.backgroundColor = UIColor.purple;
                                    button = "P"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[1]) {
                                    self.backgroundColor = UIColor.blue;
                                    button = "B"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[2]) {
                                    self.backgroundColor = UIColor(red:0.00, green:0.58, blue:1.00, alpha:1.0)
                                    button = "S"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[3]) {
                                    self.backgroundColor = UIColor.green;
                                    button = "G"
                                    SetColor(color: button)
                                } else if force < 1.0 {
                                    self.backgroundColor = UIColor.yellow;
                                    button = "Y"
                                    SetColor(color: button)
                                } else {
                                    self.backgroundColor = UIColor.black
                                    button = "b"
                                    SetColor(color: button)
                                }
                            } else if StepCount_Int == 6 {
                                if force < 0.2 {
                                    self.backgroundColor = UIColor.gray;
                                    button = "g"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[0]) {
                                    self.backgroundColor = UIColor.purple;
                                    button = "P"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[1]) {
                                    self.backgroundColor = UIColor.blue;
                                    button = "B"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[2]) {
                                    self.backgroundColor = UIColor(red:0.00, green:0.58, blue:1.00, alpha:1.0)
                                    button = "S"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[3]) {
                                    self.backgroundColor = UIColor.green;
                                    button = "G"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[4]) {
                                    self.backgroundColor = UIColor.yellow;
                                    button = "Y"
                                    SetColor(color: button)
                                } else if force < 1.0 {
                                    self.backgroundColor = UIColor.orange;
                                    button = "O"
                                    SetColor(color: button)
                                } else {
                                    self.backgroundColor = UIColor.black
                                    button = "b"
                                    SetColor(color: button)
                                }
                            } else {
                                if force < 0.2 {
                                    self.backgroundColor = UIColor.gray;
                                    button = "g"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[0]) {
                                    self.backgroundColor = UIColor.purple;
                                    button = "P"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[1]) {
                                    self.backgroundColor = UIColor.blue;
                                    button = "B"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[2]) {
                                    self.backgroundColor = UIColor(red:0.00, green:0.58, blue:1.00, alpha:1.0)
                                    button = "S"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[3]) {
                                    self.backgroundColor = UIColor.green;
                                    button = "G"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[4]) {
                                    self.backgroundColor = UIColor.yellow;
                                    button = "Y"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[5]) {
                                    self.backgroundColor = UIColor.orange;
                                    button = "O"
                                    SetColor(color: button)
                                } else if force < 1.0 {
                                    self.backgroundColor = UIColor.red;
                                    button = "R"
                                    SetColor(color: button)
                                } else {
                                    self.backgroundColor = UIColor.black
                                    button = "b"
                                    SetColor(color: button)
                                }
                            }
                        
                    }
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        self.backgroundColor = UIColor.darkGray;
        max_force = 0.0
    }
    
    func SetForce(force: CGFloat) {
        temp_Force = force
    }
    
    func GetForce()-> String {
        return String(Float(temp_Force))
    }
    
    func SetColor(color: String) {
        temp_Button = color
    }
    
    func GetColor()-> String {
        return temp_Button
    }
    
    func SetStepCount(StepCount: Int) {
        StepCount_Int = StepCount
    }
    
    func SetStepBorder(StepBorder: [Double]) {
        StepBorder_DoubleList = StepBorder
        StepBorder_DoubleList.remove(at: 0)
    }
    
    func SetForceView(SetForceView_String: String) {
        if SetForceView_String == "Max" {
            SelectForceView_Bool = true
        } else {
            SelectForceView_Bool = false
        }
    }
}

