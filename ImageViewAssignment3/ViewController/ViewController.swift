//
//  ViewController.swift
//  ImageViewAssignment3
//
//  Created by user193216 on 11/11/21.
//

import UIKit

class ViewController: UIViewController,
                      UIPickerViewDelegate,
                      UIPickerViewDataSource,
                      AddingImageProtocol {
    
    var manager: ImageManager = ImageManager()
    
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var imagePickerList: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return manager.getAllImages().count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return manager.getAllImages()[row].title
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let imgUrl = manager.getAllImages()[row].url
        
        guard let imageUrl = URL(string: imgUrl) else {
            print("Error in url")
            return
        }
        
        // Start background thread so that image loading does not make app unresponsive
        DispatchQueue.global().async { [weak self] in
                    
            guard let self = self else { return }
                    
            guard let imageData = try? Data(contentsOf: imageUrl) else {
                print("Error in img data")
                return
            }
            // When from a background thread, UI needs to be updated on main thread
            DispatchQueue.main.async {
                let image = UIImage(data: imageData)
                self.myImage.image = image
            }
        }
    }
    
    func controllerDidFinishWithAddingImage(img: Image) {
        manager.addImage(img: img)
        imagePickerList.reloadAllComponents()
    }
    
    func controllerDidCancel() {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var addingImgVC = segue.destination as! AddImageViewController
        addingImgVC.delegate = self
    }

}

