//
//  ForceButton.swift
//  Force_Step_Test_7
//
//  Created by JinHyuck Park on 2020/01/13.
//  Copyright © 2020 JinHyuck Park. All rights reserved.
//

import UIKit

class ForceButton: UIButton {
    var startTime: TimeInterval = 0
    var currentTime: TimeInterval = 0
    var previous_Time: Double = 0.0
    var begin_time: TimeInterval = 0
    var finish_Time: TimeInterval = 0
    var temp_Time: TimeInterval = 0
    var button = ""
    var temp_Button = ""
    var temp_State_Button = ""
    var max_force: CGFloat = 0.0
    var temp_Force: CGFloat = 0.0
    var temp_State_Force: CGFloat = 0.0
    var StepCount_Int: Int = 0
    var StepBorder_DoubleList: [Double] = []
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.layer.cornerRadius = 5.0;
        self.backgroundColor = UIColor.darkGray;
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        startTime = 0
        currentTime = 0
        previous_Time = 0.0
        max_force = 0.0
        button = ""
        if let touch = touches.first {
            if #available(iOS 9.0, *) {
                if traitCollection.forceTouchCapability == UIForceTouchCapability.available {
                    startTime = Date.timeIntervalSinceReferenceDate
                    let force = touch.force/touch.maximumPossibleForce
                    if force > max_force {
                        max_force = force
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
                    currentTime = Date.timeIntervalSinceReferenceDate
                    previous_Time = startTime
                    let force = touch.force/touch.maximumPossibleForce
                    SetStateForce(state_force: force)
                    let elapsedTime = (currentTime - startTime) * 1000
                    if elapsedTime < 1000 {
                        if force > max_force {
                            max_force = force
                            SetForce(force: max_force)
                            
                            
                            
                            if StepCount_Int == 2 {
                                if force < 0.2 {
                                    button = "g"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[0]) {
                                    button = "P"
                                    SetColor(color: button)
                                } else if force < 1.0 {
                                    button = "B"
                                    SetColor(color: button)
                                } else {
                                    button = "b"
                                    SetColor(color: button)
                                }
                            } else if StepCount_Int == 3 {
                                if force < 0.2 {
                                    button = "g"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[0]) {
                                    button = "P"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[1]) {
                                    button = "B"
                                    SetColor(color: button)
                                } else if force < 1.0 {
                                    button = "S"
                                    SetColor(color: button)
                                } else {
                                    button = "b"
                                    SetColor(color: button)
                                }
                            } else if StepCount_Int == 4 {
                                if force < 0.2 {
                                    button = "g"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[0]) {
                                    button = "P"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[1]) {
                                    button = "B"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[2]) {
                                    button = "S"
                                    SetColor(color: button)
                                } else if force < 1.0 {
                                    button = "G"
                                    SetColor(color: button)
                                } else {
                                    button = "b"
                                    SetColor(color: button)
                                }
                            } else if StepCount_Int == 5 {
                                if force < 0.2 {
                                    button = "g"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[0]) {
                                    button = "P"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[1]) {
                                    button = "B"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[2]) {
                                    button = "S"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[3]) {
                                    button = "G"
                                    SetColor(color: button)
                                } else if force < 1.0 {
                                    button = "Y"
                                    SetColor(color: button)
                                } else {
                                    button = "b"
                                    SetColor(color: button)
                                }
                            } else if StepCount_Int == 6 {
                                if force < 0.2 {
                                    button = "g"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[0]) {
                                    button = "P"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[1]) {
                                    button = "B"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[2]) {
                                    button = "S"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[3]) {
                                    button = "G"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[4]) {
                                    button = "Y"
                                    SetColor(color: button)
                                } else if force < 1.0 {
                                    button = "O"
                                    SetColor(color: button)
                                } else {
                                    button = "b"
                                    SetColor(color: button)
                                }
                            } else {
                                if force < 0.2 {
                                    button = "g"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[0]) {
                                    button = "P"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[1]) {
                                    button = "B"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[2]) {
                                    button = "S"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[3]) {
                                    button = "G"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[4]) {
                                    button = "Y"
                                    SetColor(color: button)
                                } else if force < CGFloat(StepBorder_DoubleList[5]) {
                                    button = "O"
                                    SetColor(color: button)
                                } else if force < 1.0 {
                                    button = "R"
                                    SetColor(color: button)
                                } else {
                                    button = "b"
                                    SetColor(color: button)
                                }
                            }
                        }
                        
                        if StepCount_Int == 2 {
                            if force < 0.2 {
                                self.backgroundColor = UIColor.gray;
                                SetStateColor(state_color: "g")
                            } else if force < CGFloat(StepBorder_DoubleList[0]) {
                                self.backgroundColor = UIColor.purple;
                                SetStateColor(state_color: "P")
                            } else if force < 1.0 {
                                self.backgroundColor = UIColor.blue;
                                SetStateColor(state_color: "B")
                            } else {
                                self.backgroundColor = UIColor.black
                                SetStateColor(state_color: "b")
                            }
                        } else if StepCount_Int == 3 {
                            if force < 0.2 {
                                self.backgroundColor = UIColor.gray;
                                SetStateColor(state_color: "g")
                            } else if force < CGFloat(StepBorder_DoubleList[0]) {
                                self.backgroundColor = UIColor.purple;
                                SetStateColor(state_color: "P")
                            } else if force < CGFloat(StepBorder_DoubleList[1]) {
                                self.backgroundColor = UIColor.blue;
                                SetStateColor(state_color: "B")
                            } else if force < 1.0 {
                                self.backgroundColor = UIColor(red:0.00, green:0.58, blue:1.00, alpha:1.0)
                                SetStateColor(state_color: "S")
                            } else {
                                self.backgroundColor = UIColor.black
                                SetStateColor(state_color: "b")
                            }
                        } else if StepCount_Int == 4 {
                            if force < 0.2 {
                                self.backgroundColor = UIColor.gray;
                                SetStateColor(state_color: "g")
                            } else if force < CGFloat(StepBorder_DoubleList[0]) {
                                self.backgroundColor = UIColor.purple;
                                SetStateColor(state_color: "P")
                            } else if force < CGFloat(StepBorder_DoubleList[1]) {
                                self.backgroundColor = UIColor.blue;
                                SetStateColor(state_color: "B")
                            } else if force < CGFloat(StepBorder_DoubleList[2]) {
                                self.backgroundColor = UIColor(red:0.00, green:0.58, blue:1.00, alpha:1.0)
                                SetStateColor(state_color: "S")
                            } else if force < 1.0 {
                                self.backgroundColor = UIColor.green;
                                SetStateColor(state_color: "G")
                            } else {
                                self.backgroundColor = UIColor.black
                                SetStateColor(state_color: "b")
                            }
                        } else if StepCount_Int == 5 {
                            if force < 0.2 {
                                self.backgroundColor = UIColor.gray;
                                SetStateColor(state_color: "g")
                            } else if force < CGFloat(StepBorder_DoubleList[0]) {
                                self.backgroundColor = UIColor.purple;
                                SetStateColor(state_color: "P")
                            } else if force < CGFloat(StepBorder_DoubleList[1]) {
                                self.backgroundColor = UIColor.blue;
                                SetStateColor(state_color: "B")
                            } else if force < CGFloat(StepBorder_DoubleList[2]) {
                                self.backgroundColor = UIColor(red:0.00, green:0.58, blue:1.00, alpha:1.0)
                                SetStateColor(state_color: "S")
                            } else if force < CGFloat(StepBorder_DoubleList[3]) {
                                self.backgroundColor = UIColor.green;
                                SetStateColor(state_color: "G")
                            } else if force < 1.0 {
                                self.backgroundColor = UIColor.yellow;
                                SetStateColor(state_color: "Y")
                            } else {
                                self.backgroundColor = UIColor.black
                                SetStateColor(state_color: "b")
                            }
                        } else if StepCount_Int == 6 {
                            if force < 0.2 {
                                self.backgroundColor = UIColor.gray;
                                SetStateColor(state_color: "g")
                            } else if force < CGFloat(StepBorder_DoubleList[0]) {
                                self.backgroundColor = UIColor.purple;
                                SetStateColor(state_color: "P")
                            } else if force < CGFloat(StepBorder_DoubleList[1]) {
                                self.backgroundColor = UIColor.blue;
                                SetStateColor(state_color: "B")
                            } else if force < CGFloat(StepBorder_DoubleList[2]) {
                                self.backgroundColor = UIColor(red:0.00, green:0.58, blue:1.00, alpha:1.0)
                                SetStateColor(state_color: "S")
                            } else if force < CGFloat(StepBorder_DoubleList[3]) {
                                self.backgroundColor = UIColor.green;
                                SetStateColor(state_color: "G")
                            } else if force < CGFloat(StepBorder_DoubleList[4]) {
                                self.backgroundColor = UIColor.yellow;
                                SetStateColor(state_color: "Y")
                            } else if force < 1.0 {
                                self.backgroundColor = UIColor.orange;
                                SetStateColor(state_color: "O")
                            } else {
                                self.backgroundColor = UIColor.black
                                SetStateColor(state_color: "b")
                            }
                        } else {
                            if force < 0.2 {
                                self.backgroundColor = UIColor.gray;
                                SetStateColor(state_color: "g")
                            } else if force < CGFloat(StepBorder_DoubleList[0]) {
                                self.backgroundColor = UIColor.purple;
                                SetStateColor(state_color: "P")
                            } else if force < CGFloat(StepBorder_DoubleList[1]) {
                                self.backgroundColor = UIColor.blue;
                                SetStateColor(state_color: "B")
                            } else if force < CGFloat(StepBorder_DoubleList[2]) {
                                self.backgroundColor = UIColor(red:0.00, green:0.58, blue:1.00, alpha:1.0)
                                SetStateColor(state_color: "S")
                            } else if force < CGFloat(StepBorder_DoubleList[3]) {
                                self.backgroundColor = UIColor.green;
                                SetStateColor(state_color: "G")
                            } else if force < CGFloat(StepBorder_DoubleList[4]) {
                                self.backgroundColor = UIColor.yellow;
                                SetStateColor(state_color: "Y")
                            } else if force < CGFloat(StepBorder_DoubleList[5]) {
                                self.backgroundColor = UIColor.orange;
                                SetStateColor(state_color: "O")
                            } else if force < 1.0 {
                                self.backgroundColor = UIColor.red;
                                SetStateColor(state_color: "R")
                            } else {
                                self.backgroundColor = UIColor.black
                                SetStateColor(state_color: "b")
                            }
                        }
                        SetTime(time: elapsedTime)
                    }else {
                        SetColor(color: "fail")
                        SetTime(time: 1000.0)
                        SetStateForce(state_force: 0.0)
                        self.backgroundColor = UIColor.darkGray;
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
    
    func GetExp()-> String {
        return "1_7_"
    }
    
    func SetTime(time: TimeInterval) {
        temp_Time = round(time * 1000) / 1000
    }
    
    func GetTime()-> String {
        return String(temp_Time)
    }
    
    func SetForce(force: CGFloat) {
        temp_Force = force
    }
    
    func GetForce()-> String {
        return String(Float(temp_Force))
    }
    
    func SetStateForce(state_force: CGFloat) {
        temp_State_Force = state_force
    }
    
    func GetStateForce()-> Float {
        return Float(temp_State_Force)
    }
    
    func SetColor(color: String) {
        temp_Button = color
    }
    
    func GetColor()-> String {
        return temp_Button
    }
    
    func SetStateColor(state_color: String) {
        temp_State_Button = state_color
    }
    
    func GetStateColor()-> String {
        return temp_State_Button
    }
    
    func SetStepCount(StepCount: Int) {
        StepCount_Int = StepCount
    }
    
    func SetStepBorder(StepBorder: [Double]) {
        StepBorder_DoubleList = StepBorder
    }
}

