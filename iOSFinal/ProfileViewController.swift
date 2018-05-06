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
    var nameString: String?
    
    var majorLabel: UILabel!
    var majorString: String?
    
    var funFactLabel: UILabel!
    var funFactString: String?
    
    var whiteView: UIView!
    
    var noiseToleranceLabel: UILabel!
    var noiseToleranceValueLabel: UILabel!
    var noiseToleranceValueString: String?
    
    var cleanlinessLabel: UILabel!
    var cleanlinessValueLabel: UILabel!
    var cleanlinessValueString: String?
    
    var sleepingLabel: UILabel!
    var sleepingValueLabel: UILabel!
    var sleepingValueString: String?
    
    var wakingLabel: UILabel!
    var wakingValueLabel: UILabel!
    var wakingValueString: String?
    
    // figure out what the return type of the slider is and determine some way to represent it
    
    var dismissButton: UIButton!
    var delegate: SaveButtonDelegate?
    var row: Int?
    
    let labelHeight: CGFloat = 20
    let viewColor = UIColor(red: 255/255, green: 118/255, blue: 109/255, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        colorView = UIView()
        colorView.backgroundColor = viewColor
        
        nameLabel = UILabel()
        nameLabel.text = nameString ?? "Name"
        nameLabel.textColor = .white
        nameLabel.font = UIFont.boldSystemFont(ofSize: 30)
        colorView.addSubview(nameLabel)
        
        // set the background color of the label1 to be the color
        
        majorLabel = UILabel()
        majorLabel.text = majorString ?? "Major"
        majorLabel.textColor = .white
        colorView.addSubview(majorLabel)
        
        funFactLabel = UILabel()
        funFactLabel.text = funFactString ?? "Fun Fact"
        funFactLabel.textColor = .white
        funFactLabel.numberOfLines = 0
        funFactLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        colorView.addSubview(funFactLabel)
        
        whiteView = UIView()
        whiteView.backgroundColor = .white
        
        noiseToleranceLabel = UILabel()
        noiseToleranceLabel.text = "Noise Tolerance"
        noiseToleranceLabel.textColor = .gray
        noiseToleranceLabel.font = UIFont.boldSystemFont(ofSize: 18)
        whiteView.addSubview(noiseToleranceLabel)
        
        noiseToleranceValueLabel = UILabel()
        noiseToleranceValueLabel.text = noiseToleranceValueString
        noiseToleranceValueLabel.textColor = viewColor
        whiteView.addSubview(noiseToleranceValueLabel)
        
        cleanlinessLabel = UILabel()
        cleanlinessLabel.text = "Cleanliness"
        cleanlinessLabel.textColor = .gray
        cleanlinessLabel.font = UIFont.boldSystemFont(ofSize: 18)
        whiteView.addSubview(cleanlinessLabel)
    
        cleanlinessValueLabel = UILabel()
        cleanlinessValueLabel.text = cleanlinessValueString
        cleanlinessValueLabel.textColor = viewColor
        whiteView.addSubview(cleanlinessValueLabel)
        
        sleepingLabel = UILabel()
        sleepingLabel.text = "Sleeping Habits"
        sleepingLabel.textColor = .gray
        sleepingLabel.font = UIFont.boldSystemFont(ofSize: 18)
        whiteView.addSubview(sleepingLabel)
        
        sleepingValueLabel = UILabel()
        sleepingValueLabel.text = sleepingValueString
        sleepingValueLabel.textColor = viewColor
        whiteView.addSubview(sleepingValueLabel)
        
        wakingLabel = UILabel()
        wakingLabel.text = "Waking Up"
        wakingLabel.textColor = .gray
        wakingLabel.font = UIFont.boldSystemFont(ofSize: 18)
        whiteView.addSubview(wakingLabel)
        
        wakingValueLabel = UILabel()
        wakingValueLabel.text = wakingValueString
        wakingValueLabel.textColor = viewColor
        whiteView.addSubview(wakingValueLabel)
        
        dismissButton = UIButton()
        dismissButton.setTitle("Dismiss", for: .normal)
        dismissButton.setTitleColor(UIColor.white, for: .normal)
        dismissButton.layer.backgroundColor = viewColor.cgColor
        dismissButton.layer.cornerRadius = 5
        dismissButton.addTarget(self, action: #selector(dismissButtonPressed), for: .touchUpInside)
        whiteView.addSubview(dismissButton)
        
        view.addSubview(colorView)
        view.addSubview(whiteView)
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        colorView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.height.equalTo(250)
        }
        
        whiteView.snp.makeConstraints { make in
            make.top.equalTo(colorView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(64)
            make.centerX.equalToSuperview()
            make.height.equalTo(nameLabel.intrinsicContentSize)
        }
        
        majorLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.height.equalTo(majorLabel.intrinsicContentSize)
        }
        
        funFactLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(32)
            make.top.equalTo(majorLabel.snp.bottom).offset(32)
        }
        
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
        
        wakingValueLabel.snp.makeConstraints { make in
             make.trailing.equalTo(noiseToleranceValueLabel.snp.trailing)
             make.top.equalTo(wakingLabel.snp.top)
            }
        
        dismissButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-32)
            make.width.equalToSuperview().offset(-32)
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
