//
//  UserCard.swift
//  EncyPET
//
//  Created by Ismael on 01/11/21.
//

import UIKit
import Toast

class UserCard: UIViewController {

  
    @IBOutlet var btn_save: UIButton!
    @IBOutlet var img_userphoto: UIImageView!
    @IBOutlet var txt_userinfo: UILabel!
    @IBOutlet var img_qr: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let user_info = Configuration.value(defaultValue: "", forKey: "user")
        let user_pass = Configuration.value(defaultValue: "", forKey: "pass")
        txt_userinfo.text = user_info
        let data = Configuration.value(defaultValue: Data(), forKey: "img")
        let decoded = try! PropertyListDecoder().decode(Data.self, from: data)
        let image = UIImage(data: decoded)
        
        let qr = user_info + ";" + user_pass
        img_userphoto.image = image
        img_qr.image = generateQRCode(from: qr)
      
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
       print("asd")
      //  AppDelegate.AppUtility.lockOrientation(.landscape)
       // Or to rotate and lock
        AppDelegate.AppUtility.lockOrientation(.landscape, andRotateTo: .landscapeRight)
       
   }

   override func viewWillDisappear(_ animated: Bool) {
       super.viewWillDisappear(animated)
       
       // Don't forget to reset when view is being removed
       AppDelegate.AppUtility.lockOrientation(.all)
   }
    
    @IBAction func btn_save_clicked(_ sender: UIButton) {
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()!
           UIGraphicsEndImageContext()
           //Save it to the camera roll
           UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        self.view.makeToast("Tarjeta de Usuario descargada")
    }
    func generateQRCode(from string: String) -> UIImage?
        {
            let data = string.data(using: String.Encoding.ascii)

            if let filter = CIFilter(name: "CIQRCodeGenerator")
            {
                filter.setValue(data, forKey: "inputMessage")

                guard let qrImage = filter.outputImage else {return nil}
                let scaleX = self.img_qr.frame.size.width / qrImage.extent.size.width
                let scaleY = self.img_qr.frame.size.height / qrImage.extent.size.height
                let transform = CGAffineTransform(scaleX: scaleX, y: scaleY)

                if let output = filter.outputImage?.transformed(by: transform)
                {
                    return UIImage(ciImage: output)
                }
            }
            return nil
        }

}
