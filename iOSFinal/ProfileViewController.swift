//
//  ProfileViewController.swift
//  iOSFinal
//
//  Created by Vivian Mengxue Li on 5/5/18.
//  Copyright © 2018 Vivian Mengxue Li. All rights reserved.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    
    var colorView: UIView!
    
    var nameLabel: UILabel!
    
    var majorLabel: UILabel!
    
    var funFactLabel: UILabel!
    
    var whiteView: UIView!
    
    var noiseToleranceLabel: UILabel!
    var noiseToleranceValueLabel: UILabel!
    
    var cleanlinessLabel: UILabel!
    var cleanlinessValueLabel: UILabel!
    
    var sleepingLabel: UILabel!
    var sleepingValueLabel: UILabel!
    
    var wakingLabel: UILabel!
    var wakingValueLabel: UILabel!
    
    // figure out what the return type of the slider is and determine some way to represent it
    
    var dismissButton: UIButton!
    var delegate: SaveButtonDelegate?
    var row: Int?
    
    let labelHeight: CGFloat = 20
    let viewColor = UIColor(red: 255/255, green: 118/255, blue: 109/255, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = viewColor
        
        colorView = UIView()
        colorView.backgroundColor = viewColor
        
        nameLabel = UILabel()
        nameLabel.text = "Name"
        nameLabel.textColor = .white
        nameLabel.font = UIFont.boldSystemFont(ofSize: 14)
        colorView.addSubview(nameLabel)
        
        // set the background color of the label1 to be the color
        
        majorLabel = UILabel()
        majorLabel.text = "Major"
        majorLabel.textColor = .white
        colorView.addSubview(majorLabel)
        
        funFactLabel = UILabel()
        funFactLabel.text = "\"Fun Fact\""
        funFactLabel.textColor = .white
//        funFactLabel.contentMode = .scaleToFill
        funFactLabel.numberOfLines = 0
        colorView.addSubview(funFactLabel)
        
        whiteView = UIView()
        whiteView.backgroundColor = .white
        
        noiseToleranceLabel = UILabel()
        noiseToleranceLabel.text = "Noise Tolerance"
        noiseToleranceLabel.textColor = .gray
        noiseToleranceLabel.font = UIFont.boldSystemFont(ofSize: 14)
        whiteView.addSubview(noiseToleranceLabel)
        
        noiseToleranceValueLabel = UILabel()
        noiseToleranceValueLabel.text = "My Noise Tolerance"
        noiseToleranceValueLabel.textColor = viewColor
        whiteView.addSubview(noiseToleranceValueLabel)
        
        cleanlinessLabel = UILabel()
        cleanlinessLabel.text = "Cleanliness"
        cleanlinessLabel.textColor = .gray
        cleanlinessLabel.font = UIFont.boldSystemFont(ofSize: 14)
        whiteView.addSubview(cleanlinessLabel)
    
        cleanlinessValueLabel = UILabel()
        cleanlinessValueLabel.text = "My Cleanliness"
        cleanlinessLabel.textColor = viewColor
        whiteView.addSubview(cleanlinessValueLabel)
        
        sleepingLabel = UILabel()
        sleepingLabel.text = "Sleeping Habits"
        sleepingLabel.textColor = .gray
        sleepingLabel.font = UIFont.boldSystemFont(ofSize: 14)
        whiteView.addSubview(sleepingLabel)
        
        sleepingValueLabel = UILabel()
        sleepingValueLabel.text = "My Sleeping Habits"
        sleepingValueLabel.textColor = viewColor
        whiteView.addSubview(sleepingValueLabel)
        
        wakingLabel = UILabel()
        wakingLabel.text = "Waking Up"
        wakingLabel.textColor = .gray
        wakingLabel.font = UIFont.boldUIFont.boldSystemFont(ofSize: 14)
        whiteView.addSubview(wakingLabel)
        
        wakingValueLabel = UILabel()
        wakingValueLabel.text = "My Wakeup Time"
        wakingValueLabel.textColor = view.Color
        whiteView.addSubview(wakingValueLabel)
        
        dismissButton = UIButton()
        dismissButton.setTitle("Dismiss", for: .normal)
        dismissButton.setTitleColor(UIColor.white, for: .normal)
        dismissButton.layer.backgroundColor = viewColor.cgColor
        dismissButton.layer.cornerRadius = 5
        dismissButton.addTarget(self, action: #selector(dismissButtonPressed), for: .touchUpInside)
        whiteView.addSubview(dismissButton)
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        noiseToleranceLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(32)
            make.top.equalTo(whiteView.snp.top).offset(32)
            make.height.equalTo(labelHeight)
        }
        
        noiseToleranceValueLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-32)
            make.top.equalTo(noiseToleranceLabel.snp.top)
        }
        
        cleanlinessLabel.snp.makeConstraints { make in
            make.leading.equalTo(noiseToleranceLabel.snp.leading)
            make.top.equalTo(noiseToleranceLabel.snp.bottom).offset(50)
            make.height.equalTo(labelHeight)
        }
        
        cleanlinessValueLabel.snp.makeConstraints { make in
            make.trailing.equalTo(noiseToleranceValueLabel.snp.trailing)
            make.top.equalTo(cleanlinessLabel.snp.top)
        }
        
        sleepingLabel.snp.makeConstraints { make in
             make.leading.equalTo(noiseToleranceLabel.snp.leading)
             make.top.equalTo(cleanlinessLabel.snp.bottom).offset(50)
             make.height.equalTo(labelHeight)  
        }
        
        sleepingValueLabel.snp.makeConstraints { make in
             make.trailing.equalTo(noiseToleranceValueLabel.snp.trailing)
             make.top.equalTo(sleepingLabel.snp.top)
             }
        
        wakingLabel.snp.makeConstraints { make in
             make.leading.equalTo(noiseToleranceLabel.snp.leading)       
             make.top.equalTo(sleepingLabel.snp.bottom).offset(50)
             make.height.equalTo(labelHeight) 
            }
        
        WakingValueLabel.snp.makeConstraints { make in
             make.trailing.equalTo(noiseToleranceValueLabel.snp.trailing)
             make.top.equalTo(wakingLabel.snp.top)
            }
        
        dismissButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.SafeAreaLayoutGuide.snp.bottom).offset(-32)
            make.width.equalToSuperview().offset(32)
            make.height.equalTo(50)
        }
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
