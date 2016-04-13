//
//  TimePickerViewController.swift
//  RainReminder
//
//  Created by 童超 on 16/4/12.
//  Copyright © 2016年 ChaosTong. All rights reserved.
//

import UIKit

protocol TimePickerViewControllerDelegate: class{
    func timePickerViewControllerDidSelect(controller: TimePickerViewController, didSelectTime time: String)
    func timePickerViewControllerDidCancel(controller: TimePickerViewController)
}

class TimePickerViewController: UIViewController {
    @IBOutlet weak var datePicker: UIDatePicker!
    
    weak var delegate: TimePickerViewControllerDelegate?
    
    
    @IBAction func cancel(sender: AnyObject) {
        delegate?.timePickerViewControllerDidCancel(self)
    }
    
    @IBAction func done(sender: AnyObject) {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "HH:mm"
        let dateString = formatter.stringFromDate(datePicker.date)
        
        delegate?.timePickerViewControllerDidSelect(self, didSelectTime: dateString)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.clearColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        modalPresentationStyle = .Custom
        transitioningDelegate = self
    }
}

extension TimePickerViewController: UIViewControllerTransitioningDelegate{
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        return DimmingPresentationController(presentedViewController: presented, presentingViewController: presenting)
    }
}
