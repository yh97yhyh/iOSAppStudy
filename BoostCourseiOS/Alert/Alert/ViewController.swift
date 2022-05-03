//
//  ViewController.swift
//  Alert
//
//  Created by MZ01-KYONGH on 2022/04/28.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func touchUpShowAlertButton(_ sender: Any) {
        self.showAlertController(style: UIAlertController.Style.alert)
    }
    
    @IBAction func touchUpShowActionSheetButton(_ sender: Any) {
        self.showAlertController(style: UIAlertController.Style.actionSheet)
    }
    
    func showAlertController(style: UIAlertController.Style) {
        let alertController: UIAlertController
        alertController = UIAlertController(title: "Title",
                                            message: "Message",
                                            preferredStyle: style)
        
        let okAction: UIAlertAction
        okAction = UIAlertAction(title: "OK",
                                 style: UIAlertAction.Style.default) { (action: UIAlertAction) in
            print("OK pressed")
        }
        
        let cancelAction: UIAlertAction
        cancelAction = UIAlertAction(title: "Cancel",
                                     style: UIAlertAction.Style.cancel,
                                     handler: nil)
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        let handler: (UIAlertAction) -> Void
        handler = { (action: UIAlertAction) in
            print("action pressed \(action.title ?? "")")
        }
        
        let someAction: UIAlertAction
        someAction = UIAlertAction(title: "Some",
                                   style: UIAlertAction.Style.destructive,
                                   handler: handler)
        
        let anotherAction: UIAlertAction
        anotherAction = UIAlertAction(title: "Another",
                                      style: UIAlertAction.Style.default,
                                      handler: handler)
        
        alertController.addAction(someAction)
        alertController.addAction(anotherAction)
        
        // ActionSheet에서는 사용 불가
        alertController.addTextField { (field: UITextField) in
            field.placeholder = "플레이스 홀더"
            field.textColor = UIColor.red
        }
        
        self.present(alertController, animated: true) {
            print("Alert controller shown")
        }
    }
    
}

