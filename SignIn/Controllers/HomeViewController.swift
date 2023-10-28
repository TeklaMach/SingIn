//
//  HomePageViewController.swift
//  SignIn
//
//  Created by Tekla Matcharashvili on 27.10.23.
//

import UIKit

class HomePageViewController: UIViewController, ColorPaletteDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        let presentButton = UIButton(type: .system)
        presentButton.setTitle("Present Color Palette Page", for: .normal)
        presentButton.addTarget(self, action: #selector(presentColorPalettePage), for: .touchUpInside)
        presentButton.backgroundColor = .white
        presentButton.center = view.center
        presentButton.setTitleColor(.systemIndigo, for: .normal)
        presentButton.layer.cornerRadius = 16
        presentButton.frame = CGRect(x: 50, y: 300, width: 300, height: 40)
        
        let pushButton = UIButton(type: .system)
        pushButton.setTitle("Push Color Palette Page", for: .normal)
        pushButton.addTarget(self, action: #selector(pushColorPalettePage), for: .touchUpInside)
        pushButton.backgroundColor = .white
        pushButton.setTitleColor(.systemCyan, for: .normal)
        pushButton.center = view.center
        pushButton.layer.cornerRadius = 16
        pushButton.frame = CGRect(x: 50, y: 350, width: 300, height: 40)
        
        
        view.addSubview(presentButton)
        view.addSubview(pushButton)
        
        
    }
    
    @objc func presentColorPalettePage() {
        let colorPaletteVC = ColorPaletteViewController()
        colorPaletteVC.delegate = self
        present(colorPaletteVC, animated: true, completion: nil)
    }
    
    @objc func pushColorPalettePage() {
        let colorPaletteVC = ColorPaletteViewController()
        colorPaletteVC.delegate = self
        navigationController?.pushViewController(colorPaletteVC, animated: true)
    }
    
    func changeBackgroundColor(color: UIColor) {
        view.backgroundColor = color
    }
    
}
