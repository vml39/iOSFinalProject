//
//  FilterViewController.swift
//  iOSFinal
//
//  Created by Vivian Mengxue Li on 5/4/18.
//  Copyright © 2018 Vivian Mengxue Li. All rights reserved.
//

import UIKit
import SnapKit

class FilterViewController: UIViewController {
    
    var filterLabel: UILabel!
    
    var noiseToleranceLabel: UILabel!
    var noiseToleranceLowLabel: UILabel!
    var noiseToleranceAlrightLabel: UILabel!
    var noiseToleranceHighLabel: UILabel!
    var noiseToleranceSlider: UISlider!
    
    var cleanlinessLabel: UILabel!
    var cleanlinessMessyLabel: UILabel!
    var cleanlinessAlrightLabel: UILabel!
    var cleanlinessNeatLabel: UILabel!
    var cleanlinessSlider: UISlider!
    
    var sleepingLabel: UILabel!
    var sleepingButton: UIButton!
    
    var wakingLabel: UILabel!
    var wakingButton: UIButton!
    
    var saveButton: UIButton!
    
    var dismissButton: UIButton!
    
    let smallerPadding: CGFloat = 8
    let padding: CGFloat = 16
    let labelHeight: CGFloat = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        filterLabel = UILabel()
        filterLabel.text = "Filter"
        view.addSubview(filterLabel)
        
        noiseToleranceLabel = UILabel()
        noiseToleranceLabel.text = "Noise Tolerance"
        view.addSubview(noiseToleranceLabel)
        
        noiseToleranceLowLabel = UILabel()
        noiseToleranceLowLabel.text = "Low"
        noiseToleranceLowLabel.textColor = .gray
        view.addSubview(noiseToleranceLowLabel)
        
        noiseToleranceAlrightLabel = UILabel()
        noiseToleranceAlrightLabel.text = "Alright"
        noiseToleranceAlrightLabel.textColor = .gray
        view.addSubview(noiseToleranceAlrightLabel)
        
        noiseToleranceHighLabel = UILabel()
        noiseToleranceHighLabel.text = "High"
        noiseToleranceHighLabel.textColor = .gray
        view.addSubview(noiseToleranceHighLabel)
        
        noiseToleranceSlider = UISlider()
        view.addSubview(noiseToleranceSlider)
        
        cleanlinessLabel = UILabel()
        cleanlinessLabel.text = "Cleanliness"
        view.addSubview(cleanlinessLabel)
        
        cleanlinessMessyLabel = UILabel()
        cleanlinessMessyLabel.text = "Messy"
        cleanlinessMessyLabel.textColor = .gray
        view.addSubview(cleanlinessMessyLabel)
        
        cleanlinessAlrightLabel = UILabel()
        cleanlinessAlrightLabel.text = "Alright"
        cleanlinessAlrightLabel.textColor = .gray
        view.addSubview(cleanlinessAlrightLabel)
        
        cleanlinessNeatLabel = UILabel()
        cleanlinessNeatLabel.text = "Neat"
        cleanlinessNeatLabel.textColor = .gray
        view.addSubview(cleanlinessNeatLabel)
        
        cleanlinessSlider = UISlider()
        view.addSubview(cleanlinessSlider)
        
        sleepingLabel = UILabel()
        sleepingLabel.text = "Sleeping Habits"
        view.addSubview(sleepingLabel)
        
        sleepingButton = UIButton()
        sleepingButton.setTitleColor(.black, for: .normal)
        view.addSubview(sleepingButton)
        
        wakingLabel = UILabel()
        wakingLabel.text = "Waking Up"
        view.addSubview(wakingLabel)
        
        wakingButton = UIButton()
        wakingButton.setTitleColor(.black, for: .normal)
        view.addSubview(wakingButton)
        
        saveButton = UIButton()
        saveButton.setTitle("All Done!", for: .normal)
        saveButton.setTitleColor(.black, for: .normal)
//        saveButton.addTarget(self, action: #selector(filterSaveButtonPressed), for: .touchUpInside)
        view.addSubview(saveButton)
        
        dismissButton = UIButton()
        dismissButton.setTitle("Dismiss", for: .normal)
        dismissButton.setTitleColor(.black, for: .normal)
        dismissButton.addTarget(self, action: #selector(dismissButtonPressed), for: .touchUpInside)
        view.addSubview(dismissButton)
        
        setUpConstraints()
    }
    
    private func setUpConstraints(){
        filterLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(64)
            make.centerX.equalToSuperview()
            make.height.equalTo(labelHeight)
        }
        
        noiseToleranceLabel.snp.makeConstraints { make in
            make.top.equalTo(filterLabel.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(32)
            make.height.equalTo(labelHeight)
        }
        
        noiseToleranceLowLabel.snp.makeConstraints { make in
            make.leading.equalTo(noiseToleranceLabel.snp.leading)
            make.top.equalTo(noiseToleranceLabel.snp.bottom).offset(padding)
            make.height.equalTo(labelHeight)
        }
        
        noiseToleranceAlrightLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(noiseToleranceLowLabel.snp.top)
            make.height.equalTo(labelHeight)
        }
        
        noiseToleranceHighLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-32)
            make.top.equalTo(noiseToleranceLowLabel.snp.top)
            make.height.equalTo(labelHeight)
        }
        
        noiseToleranceSlider.snp.makeConstraints { make in
            make.leading.equalTo(noiseToleranceLabel.snp.leading)
            make.trailing.equalTo(noiseToleranceHighLabel.snp.trailing)
            make.top.equalTo(noiseToleranceLowLabel.snp.bottom).offset(smallerPadding)
        }
        
        cleanlinessLabel.snp.makeConstraints { make in
            make.leading.equalTo(noiseToleranceLabel.snp.leading)
            make.top.equalTo(noiseToleranceSlider.snp.bottom).offset(padding)
            make.height.equalTo(labelHeight)
        }
        
        cleanlinessMessyLabel.snp.makeConstraints { make in
            make.leading.equalTo(noiseToleranceLabel.snp.leading)
            make.top.equalTo(cleanlinessLabel.snp.bottom).offset(padding)
            make.height.equalTo(labelHeight)
        }
        
        cleanlinessAlrightLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(cleanlinessMessyLabel.snp.top)
            make.height.equalTo(labelHeight)
        }
        
        cleanlinessNeatLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-32)
            make.top.equalTo(cleanlinessMessyLabel.snp.top)
            make.height.equalTo(labelHeight)
        }
        
        cleanlinessSlider.snp.makeConstraints { make in
            make.leading.equalTo(noiseToleranceLabel.snp.leading)
            make.trailing.equalTo(cleanlinessNeatLabel.snp.trailing)
            make.top.equalTo(cleanlinessMessyLabel.snp.bottom).offset(smallerPadding)
        }
        
        sleepingLabel.snp.makeConstraints { make in
            make.leading.equalTo(noiseToleranceLabel)
            make.top.equalTo(cleanlinessSlider.snp.bottom).offset(padding)
            make.height.equalTo(labelHeight)
        }
        
        sleepingButton.snp.makeConstraints { make in
            make.leading.equalTo(noiseToleranceLabel)
            make.top.equalTo(sleepingLabel.snp.bottom).offset(smallerPadding)
        }
        
        wakingLabel.snp.makeConstraints { make in
            make.leading.equalTo(noiseToleranceLabel)
            make.top.equalTo(sleepingButton.snp.bottom).offset(padding)
            make.height.equalTo(labelHeight)
        }
        
        wakingButton.snp.makeConstraints { make in
            make.leading.equalTo(noiseToleranceLabel)
            make.top.equalTo(wakingLabel.snp.bottom).offset(smallerPadding)
        }
        
        dismissButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-64)
        }
    }
    
    @objc func dismissButtonPressed(sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
//    @objc func filterSaveButtonPressed() {
//        delegate?.filterSaveButtonPressed()
//        // do something
//    }
    
    
    /*
     // MARK: - Navigation
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

