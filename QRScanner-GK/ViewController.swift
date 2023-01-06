//
//  ViewController.swift
//  QRScanner-GK
//
//  Created by GOVIND KUMAR on 05/01/23.
//

import UIKit

class ViewController: UIViewController{
    
    var isWantExtraOption:Bool = false // If you want extra option(flash, front camera etc.) on the QR screen true this flag

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func openScanner(_ sender: UIButton) {
        //Configuration for QR Code Scanner
        var scanner = QRCodeScannerController()
        if !isWantExtraOption{
            var configuration = QRScannerConfiguration()
            configuration.cameraImage = UIImage(named: "camera")
            configuration.flashOnImage = UIImage(named: "flash-on")
            configuration.galleryImage = UIImage(named: "photos")
            scanner = QRCodeScannerController(qrScannerConfiguration: configuration)
        }
        scanner.delegate = self
        self.present(scanner, animated: true, completion: nil)
    }
    
}
extension ViewController: QRScannerCodeDelegate {
    func qrScanner(_ controller: UIViewController, scanDidComplete result: String) {
        print(result)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.presentAlert(withTitle: "Data", message: "\(result)")
        }
    }
    
    func qrScannerDidFail(_ controller: UIViewController, error: QRCodeError) {
        
    }
    
    func qrScannerDidCancel(_ controller: UIViewController) {
        
    }
}

