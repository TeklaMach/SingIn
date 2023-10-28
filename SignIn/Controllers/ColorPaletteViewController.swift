//
//  ColorPaletteViewController.swift
//  SignIn
//
//  Created by Tekla Matcharashvili on 27.10.23.
//

import UIKit

protocol ColorPaletteDelegate: AnyObject {
    func changeBackgroundColor(color: UIColor)
}

class ColorPaletteViewController: UIViewController {
    
    weak var delegate: ColorPaletteDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        createColorPalette(title: "Change Home Background Color", yPosition: 250, action: #selector(changeHomeBackgroundColor))
    }
    
    func createColorPalette(title: String, yPosition: CGFloat, action: Selector) {
        
        let label = UILabel()
        label.text = title
        label.textAlignment = .center
        label.frame = CGRect(x: 50, y: yPosition, width: 300, height: 40)
        view.addSubview(label)
        
        for i in 0..<6 {
            let colorButton = UIButton(type: .system)
            colorButton.setTitle("\(i+1)", for: .normal)
            colorButton.addTarget(self, action: action, for: .touchUpInside)
            colorButton.frame = CGRect(x: 50 + i * 50, y: Int(yPosition) + 50, width: 40, height: 40)
            colorButton.backgroundColor = getRandomColor()
            view.addSubview(colorButton)
        }
    }
    
    
    @objc func changeHomeBackgroundColor(sender: UIButton) {
        delegate?.changeBackgroundColor(color: sender.backgroundColor ?? .clear)
        navigationController?.popViewController(animated: true)
    }
    
    func getRandomColor() -> UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
