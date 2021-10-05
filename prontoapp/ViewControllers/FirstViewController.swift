//
//  ViewController.swift
//  prontoapp
//
//  Created by Navoda on 10/5/21.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var btnScan: UIButton!
    @IBOutlet weak var viewHello: UIView!
    @IBOutlet weak var lblMMsg: UILabel!
    
    private var firstViewhandler : FirstViewDataHandler!

    override func viewDidLoad() {
        super.viewDidLoad()
        btnScan.layer.cornerRadius = 22

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.viewHello.isHidden = true

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ScanViewController{
            let vc = segue.destination as! ScanViewController
            vc.delegate = self
        }
    }
    
    func checkQRCode(qrString : String){
        if firstViewhandler == nil{
            firstViewhandler = FirstViewDataHandler(delegate: self)
        }
        firstViewhandler.manageQR(qrString: qrString)
    }
    
    func showSccessAndGoToNextScreen(name : String){
        lblMMsg.text = name
        lblMMsg.textColor = UIColor.darkGray

        UIView.transition(with: view, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.viewHello.isHidden = false
        },completion: {_ in
            self.goToMainScreen()
        })
    }
    
    func showErrorMsgView(errMsg : String){
        lblMMsg.text = errMsg
        lblMMsg.textColor = UIColor(named: "err_red")
        
        UIView.transition(with: view, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.viewHello.isHidden = false
        }, completion: {_ in
            UIView.transition(with: self.view, duration: 2, options: .transitionCrossDissolve, animations: {
                self.viewHello.isHidden = true
            })
        })
        

    }

    
    func goToMainScreen(){
        performSegue(withIdentifier: "goToMainScreen", sender: nil)
    }

}

extension FirstViewController : ScanViewDelegate{
    
    func scanSuccess(returnString: String) {
        checkQRCode(qrString: returnString)
    }
}

extension FirstViewController : FirstViewDelegate {
    
    func authSuccessUser(name: String) {
        showSccessAndGoToNextScreen(name: name)
    }
    
    func authFailQrCode(errMsg: String) {
        showErrorMsgView(errMsg: errMsg)
    }
    
    
}
