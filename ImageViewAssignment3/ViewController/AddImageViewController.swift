//
//  AddImageViewController.swift
//  ImageViewAssignment3
//
//  Created by user193216 on 11/11/21.
//

import UIKit

protocol AddingImageProtocol {
    func controllerDidFinishWithAddingImage(img: Image)
    func controllerDidCancel()
}

class AddImageViewController: UIViewController {
    
    var delegate : AddingImageProtocol?

    @IBOutlet weak var txtImageUrl: UITextField!
    @IBOutlet weak var txtImageTitle: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnCancelClicked(_ sender: Any) {
        delegate?.controllerDidCancel()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnAddClicked(_ sender: Any) {
        if let imgTitle = txtImageTitle.text {
            if let imgUrl = txtImageUrl.text {
                if !imgTitle.isEmpty && !imgUrl.isEmpty {
                    var imgObj = Image(title: imgTitle, url: imgUrl)
                    delegate?.controllerDidFinishWithAddingImage(img: imgObj)
                    dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
