//
//  ViewController.swift
//  StanfordCalculator
//
//  Created by Александр on 05.06.17.
//  Copyright © 2017 Александр. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var Display: UILabel!
	
	var displayText:String {
		get {
			if Display.text == nil{
				return ""
			} else {
				return Display.text!
			}
		}
		set {
			Display.text = newValue
		}
	}
	
	var displayValue:Double {
		get {
			if let value = Double(displayText) {
				return value
			} else {
				return 0
			}
		}
		set {
			displayText = String(newValue)
		}
	}
	
	var userInMiddeleOfTyping = false

	@IBAction func operandButtonTouch(_ sender: UIButton) {
		if let pressedSimbol = sender.currentTitle {
			if userInMiddeleOfTyping {
				displayText = displayText + pressedSimbol
			} else {
				displayText = pressedSimbol
				userInMiddeleOfTyping = true
			}
		}
	}
	
	@IBAction func functionalBattonTouch(_ sender: UIButton) {
		if let pressedSimbol = sender.currentTitle {
			userInMiddeleOfTyping = false
			switch pressedSimbol {
			case "√":
				displayValue = sqrt(displayValue)
			case "π":
				displayValue = Double.pi
			default:
				break
			}
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

