//
//  Extension.swift
//  QRScanner-GK
//
//  Created by GOVIND KUMAR on 05/01/23.
//
#if os(iOS)
import Foundation
import UIKit

extension UIImage {
    func parseQR() -> String? {
        guard let image = CIImage(image: self) else {
            return nil
        }
        let detector = CIDetector(ofType: CIDetectorTypeQRCode,
                                  context: nil,
                                  options: [CIDetectorAccuracy: CIDetectorAccuracyHigh])
        let features = detector?.features(in: image) ?? []
        return features.compactMap { feature in
            return (feature as? CIQRCodeFeature)?.messageString
        }.joined()
    }
}

extension UIViewController {
    
    func presentAlert(withTitle title: String, message : String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { action in
            print("You've pressed OK Button")
        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}
#endif
