//
//  ViewController.swift
//  QRGenerator
// https://www.youtube.com/channel/UCknu6vH4a8tXLFpM_uQ-hBA/videos
//  Created by marco rodriguez on 27/06/22.
// Visita mi canal en YT Marco Alonso

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imagenPersonalizada: UIImageView!
    @IBOutlet weak var textQRTF: UITextField!
    @IBOutlet weak var imagenQR: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        imagenQR.image = generateQRCode(from: "https://github.com/marcoalonso?tab=repositories")
    }
    
    @IBAction func generarBtn(_ sender: Any) {
        imagenPersonalizada.image = generateQRCode(from: textQRTF.text!)
        
    }
    

    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)

        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 4, y: 4)

            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }

        return nil
    }

    

}

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.cornerRadius
        }
        
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
