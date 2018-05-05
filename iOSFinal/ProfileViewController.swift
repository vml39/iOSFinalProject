//
//  ProfileViewController.swift
//  iOSFinal
//
//  Created by Vivian Mengxue Li on 5/5/18.
//  Copyright © 2018 Vivian Mengxue Li. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var nameLabel: UILabel!
    var nameLabel1: UILabel!
    
    var majorLabel: UILabel!
    var majorLabel1: UILabel!
    
    var funFactLabel: UILabel!
    
    // figure out what the return type of the slider is and determine some way to represent it
    
    var dismissButton: UIButton!
    var delegate: SaveButtonDelegate?
    var row: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        nameLabel = UILabel()
        nameLabel.text = "Name"
        
        // set the background color of the label1 to be the color
        
        majorLabel = UILabel()
        majorLabel.text = "Major"
        
        // for fun fact, concatenate the quotes to the user submitted fun fact
        
        dismissButton = UIButton()
        dismissButton.setTitle("Dismiss", for: .normal)
        dismissButton.setTitleColor(UIColor.darkGray, for: .normal)
        dismissButton.addTarget(self, action: #selector(dismissButtonPressed), for: .touchUpInside)
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        
    }
    
    @objc func dismissButtonPressed(sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
