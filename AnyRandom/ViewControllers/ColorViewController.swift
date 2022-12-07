//
//  RandomColorViewController.swift
//  AnyRandom
//
//  Created by Вячеслав Горбатенко on 06.12.2022.
//

import UIKit

class ColorViewController: UIViewController {
    
    // MARK: - IB Outlets
    
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var hexLabel: UILabel!
    
    // MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.borderWidth = 3
        colorView.layer.borderColor = UIColor.black.cgColor
    }
    
    // MARK: - IB Actions
    
    @IBAction func copyButtonTapped() {
        copyText(for: hexLabel)
    }
    
    @IBAction func generateButtonTapped() {
        colorView.backgroundColor = UIColor(
            red: Double.random(in: 0...1),
            green: Double.random(in: 0...1),
            blue: Double.random(in: 0...1),
            alpha: 1
        )
        hexLabel.text = colorView.backgroundColor?.convertToHex()
    }
}

// MARK: - Color To HEX

extension UIColor {
    func convertToHex() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 1
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        
        return String(format:"#%06x", rgb)
    }
}




