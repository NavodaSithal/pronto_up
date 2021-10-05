//
//  MainViewController.swift
//  pronto
//
//  Created by Navoda on 10/2/21.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var collView: UICollectionView!
    @IBOutlet weak var btnNew: UIButton!
    
    private lazy var notesList : [NoteItem] = []
    
    private var mainViewmodel : MainViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnNew.layer.cornerRadius = 22
        collView.collectionViewLayout = UICollectionViewFlowLayout()
        callToViewModel()
        getAndSetUserDetails()
        setCollLayout()
    }
    
    func callToViewModel(){
        mainViewmodel = MainViewModel()
        mainViewmodel.getUserDetails()
        getNotes()

    }
    
    @IBAction func onTapBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func setCollLayout()  {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: view.frame.width/2, height: view.frame.width/1.5)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 10
        collView!.collectionViewLayout = layout
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getNotes()
    }
    
    func getNotes(){
        mainViewmodel.getAllNotes()
        mainViewmodel.bindDataToController = {
            self.collView.reloadData()
        }
    }
    
    func getAndSetUserDetails(){
        lblUsername.text = mainViewmodel.username
        lblEmail.text = mainViewmodel.email
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ShowNoteViewController{
            let vc = segue.destination as! ShowNoteViewController
//            vc.viewModel = ShowNoteViewModel(note: mainViewmodel.notesList![sender as! Int])
        }
    }
    
}

extension MainViewController : UICollectionViewDelegate , UICollectionViewDataSource  , UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mainViewmodel.notesList!.count
//        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collView.dequeueReusableCell(withReuseIdentifier: "noteCell", for: indexPath) as! NoteCell
        cell.bgView.layer.cornerRadius = 10
        cell.bgView.layer.borderWidth = 1
        cell.bgView.layer.borderColor = UIColor.lightGray.cgColor
                
        cell.lblNote.text = mainViewmodel.notesList![indexPath.row].note
        cell.lblDate.text = mainViewmodel.notesList![indexPath.row].createdDate?.convertDateToString
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collView.bounds.width
        return CGSize(width: collectionViewWidth/2, height: collectionViewWidth/1.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showFullNote", sender: indexPath.row)
    }
    
    
}

