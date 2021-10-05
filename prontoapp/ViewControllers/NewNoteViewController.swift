//
//  NewNoteViewController.swift
//  pronto
//
//  Created by Navoda on 10/2/21.
//

import UIKit

class NewNoteViewController: UIViewController {

    @IBOutlet weak var txtView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtView.layer.borderColor = UIColor.lightGray.cgColor
        txtView.layer.borderWidth = 1
        txtView.layer.cornerRadius = 10
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        txtView.becomeFirstResponder()
    }
    
    @IBAction func onTapBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onTapDone(_ sender: Any) {
        txtView.resignFirstResponder()
        
        let text = txtView.text
        if text != "" {
          var _ =  NewNoteHandler(text: text!)
            navigationController?.popViewController(animated: true)
        }else{
            
        }
    }
    
    
    
}
