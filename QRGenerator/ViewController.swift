//
//  ViewController.swift
//  QRGenerator
//
//  Created by marco rodriguez on 27/06/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imagenQR: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagenQR.image = generateQRCode(from: "https://github.com/marcoalonso?tab=repositories")
    }

    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)

        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)

            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }

        return nil
    }

    

}

