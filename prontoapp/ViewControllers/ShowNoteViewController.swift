//
//  ShowNoteViewController.swift
//  pronto
//
//  Created by Navoda on 10/2/21.
//

import UIKit

class ShowNoteViewController: UIViewController {

    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblNote: UILabel!
    @IBOutlet weak var btnBack: UIButton!
    
    var viewModel : ShowNoteViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnBack.layer.cornerRadius = 22
        lblDate.text = viewModel.noteObj.createdDate?.convertDateToString
        lblNote.text = viewModel.noteObj.note
    }
    
    @IBAction func onTapBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
