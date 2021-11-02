//
//  Scanner.swift
//  EncyPET
//
//  Created by Ismael on 31/10/21.
//

import QRScanner
import UIKit
import Toast

// If use the Pod way, please import MercariQRScanner

final class Scanner: UIViewController {
    
    let user : String = "Ochoa.ismael@uabc.edu.mx"
    let pass : String = "elmayo13"
    override func viewDidLoad() {
        super.viewDidLoad()

        let qrScannerView = QRScannerView(frame: view.bounds)
        view.addSubview(qrScannerView)
        qrScannerView.configure(delegate: self)
        qrScannerView.startRunning()
    }
    
    
    }

extension Scanner: QRScannerViewDelegate {
    func qrScannerView(_ qrScannerView: QRScannerView, didFailure error: QRScannerError) {
        print(error)
    }

    func qrScannerView(_ qrScannerView: QRScannerView, didSuccess code: String) {
        print(code)
      
        let user_info = code.components(separatedBy: ";")
        if user_info[0] == user && user_info[1] == pass{
            performSegue(withIdentifier: "Dashboard", sender: nil)

        }else{
            self.view.makeToast("Usuario no encontrado")
            qrScannerView.rescan()
        }
        
        
        
      
    }
}
