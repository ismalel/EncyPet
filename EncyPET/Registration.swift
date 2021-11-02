//
//  Registration.swift
//  EncyPET
//
//  Created by Ismael on 31/10/21.
//
import UIKit

class Registration: UIViewController {

    
    @IBOutlet var txt_pass: UITextField!
    @IBOutlet var txt_email: UITextField!
    @IBOutlet var btn_photo: UIButton!
    var imagePicker: ImagePicker!

    @IBOutlet var img_user: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
      
    }

    @IBAction func btn_clicked(_ sender: UIButton) {
        self.imagePicker.present(from: sender)
        //Create the UIImage
        
       
    }
    
    @IBAction func btn_register_clicked(_ sender: UIButton) {
        
        Configuration.value(value: txt_email.text , forKey: "user")
        Configuration.value(value: txt_pass.text, forKey: "pass")
        
        guard let data = img_user.image!.jpegData(compressionQuality: 0.5) else { return }
            let encoded = try! PropertyListEncoder().encode(data)
           
        
        Configuration.value(value: encoded, forKey: "img")
        
        print(Configuration.value(defaultValue: "", forKey: "user"))
        performSegue(withIdentifier: "Card", sender: nil)
    }
    @IBAction func txt_pass_done(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    @IBAction func txt_email_done(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
}
extension Registration: ImagePickerDelegate {

    func didSelect(image: UIImage?) {
        self.img_user.image = image
    }
}
