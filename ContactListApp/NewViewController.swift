//
//  NewViewController.swift
//  ContactListApp
//
//  Created by IMCS2 on 8/13/19.
//  Copyright © 2019 com.phani. All rights reserved.
//

import UIKit

class NewViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @IBOutlet weak var imageView: UIImageView!
    var savedName: String = ""
    @IBOutlet weak var label: UILabel!
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imageView.image = pickedImage
        }else{
            print("Error picking image")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func importImageAction(_ sender: Any) {
        
        let imageController = UIImagePickerController()
        imageController.delegate = self
        imageController.sourceType = UIImagePickerController.SourceType.camera
        imageController.allowsEditing = false
        self.present(imageController, animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = savedName
        
        // Do any additional setup after loading the view.
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
