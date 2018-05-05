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
    
    var stackView: UIStackView!
    
    var filterLabel: UILabel!
    
    var noiseToleranceLabel: UILabel!
    var noiseToleranceLowLabel: UILabel!
    var noiseToleranceAlrightLabel: UILabel!
    var noiseToleranceHighLabel: UILabel!
    var noiseToleranceStackView: UIStackView!
    var noiseToleranceSlider: UISlider!
    
    var cleanlinessLabel: UILabel!
    var cleanlinessMessyLabel: UILabel!
    var cleanlinessAlrightLabel: UILabel!
    var cleanlinessNeatLabel: UILabel!
    var cleanlinessStackView: UIStackView!
    var cleanlinessSlider: UISlider!
    
    var sleepingLabel: UILabel!
    var sleepingLabel1: UILabel!
    var sleepingLabel2: UILabel!
    var sleepingLabel3: UILabel!
    var sleepingStackView: UIStackView!
    var sleepingSlider: UISlider!
    
    var wakingLabel: UILabel!
    var wakingLabel1: UILabel!
    var wakingLabel2: UILabel!
    var wakingLabel3: UILabel!
    var wakingStackView: UIStackView!
    var wakingSlider: UISlider!
    
    var saveButton: UIButton!
    var delegate: SaveButtonDelegate?
    
    var dismissButton: UIButton!
    
    let smallerPadding: CGFloat = 8
    let padding: CGFloat = 16
    let labelHeight: CGFloat = 20
    let buttonColor: UIColor = UIColor(red: 255/255, green: 118/255, blue: 109/255, alpha: 1)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        filterLabel = UILabel()
        filterLabel.text = "Filter"
        view.addSubview(filterLabel)
        
        noiseToleranceLabel = UILabel()
        noiseToleranceLabel.text = "Noise Tolerance"
        
        noiseToleranceLowLabel = UILabel()
        noiseToleranceLowLabel.text = "Low"
        noiseToleranceLowLabel.textColor = .gray
        
        noiseToleranceAlrightLabel = UILabel()
        noiseToleranceAlrightLabel.text = "Alright"
        noiseToleranceAlrightLabel.textColor = .gray
        
        noiseToleranceHighLabel = UILabel()
        noiseToleranceHighLabel.text = "High"
        noiseToleranceHighLabel.textColor = .gray
        
        noiseToleranceStackView = UIStackView(arrangedSubviews: [noiseToleranceLowLabel, noiseToleranceAlrightLabel, noiseToleranceHighLabel])
        noiseToleranceStackView.axis = .horizontal
        noiseToleranceStackView.distribution = .equalCentering
        
        noiseToleranceSlider = UISlider()
        
        cleanlinessLabel = UILabel()
        cleanlinessLabel.text = "Cleanliness"
        
        cleanlinessMessyLabel = UILabel()
        cleanlinessMessyLabel.text = "Messy"
        cleanlinessMessyLabel.textColor = .gray
        
        cleanlinessAlrightLabel = UILabel()
        cleanlinessAlrightLabel.text = "Alright"
        cleanlinessAlrightLabel.textColor = .gray
        
        cleanlinessNeatLabel = UILabel()
        cleanlinessNeatLabel.text = "Neat"
        cleanlinessNeatLabel.textColor = .gray
        
        cleanlinessStackView = UIStackView(arrangedSubviews: [cleanlinessMessyLabel, cleanlinessAlrightLabel, cleanlinessNeatLabel])
        cleanlinessStackView.axis = .horizontal
        cleanlinessStackView.distribution = .equalCentering
        
        cleanlinessSlider = UISlider()
        
        sleepingLabel = UILabel()
        sleepingLabel.text = "Sleeping Habits"
        
        sleepingLabel1 = UILabel()
        sleepingLabel1.text = "9 PM"
        sleepingLabel1.textColor = .gray
        
        sleepingLabel2 = UILabel()
        sleepingLabel2.text = "12 AM"
        sleepingLabel2.textColor = .gray
        
        sleepingLabel3 = UILabel()
        sleepingLabel3.text = "3 AM"
        sleepingLabel3.textColor = .gray
        
        sleepingStackView = UIStackView(arrangedSubviews: [sleepingLabel1, sleepingLabel2, sleepingLabel3])
        sleepingStackView.axis = .horizontal
        sleepingStackView.distribution = .equalCentering
        
        sleepingSlider = UISlider()
        
        wakingLabel = UILabel()
        wakingLabel.text = "Waking Up"
        
        wakingLabel1 = UILabel()
        wakingLabel1.text = "6 AM"
        wakingLabel1.textColor = .gray
        
        wakingLabel2 = UILabel()
        wakingLabel2.text = "9 AM"
        wakingLabel2.textColor = .gray
        
        wakingLabel3 = UILabel()
        wakingLabel3.text = "12 PM"
        wakingLabel3.textColor = .gray
        
        wakingStackView = UIStackView(arrangedSubviews: [wakingLabel1, wakingLabel2, wakingLabel3])
        wakingStackView.axis = .horizontal
        wakingStackView.distribution = .equalCentering
        
        wakingSlider = UISlider()
        
        saveButton = UIButton()
        saveButton.setTitle("All Done!", for: .normal)
        saveButton.setTitleColor(.black, for: .normal)
        saveButton.layer.backgroundColor = buttonColor.cgColor
        saveButton.layer.cornerRadius = 10
        saveButton.addTarget(self, action: #selector(filterSaveButtonPressed), for: .touchUpInside)
        
        dismissButton = UIButton()
        dismissButton.setTitle("Dismiss", for: .normal)
        dismissButton.setTitleColor(.black, for: .normal)
        dismissButton.addTarget(self, action: #selector(dismissButtonPressed), for: .touchUpInside)
        view.addSubview(dismissButton)
        
        stackView = UIStackView(arrangedSubviews: [noiseToleranceLabel, noiseToleranceStackView, noiseToleranceSlider, cleanlinessLabel, cleanlinessStackView, cleanlinessSlider, sleepingLabel, sleepingStackView, sleepingSlider, wakingLabel, wakingStackView, wakingSlider, saveButton])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.setCustomSpacing(24, after: filterLabel)
        stackView.setCustomSpacing(8, after: noiseToleranceStackView)
        stackView.setCustomSpacing(8, after: cleanlinessStackView)
        stackView.setCustomSpacing(8, after: sleepingStackView)
        stackView.setCustomSpacing(8, after: wakingStackView)
        view.addSubview(stackView)
        
        setUpConstraints()
    }
    
    private func setUpConstraints(){
        filterLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(64)
            make.centerX.equalToSuperview()
            make.height.equalTo(labelHeight)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(filterLabel.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().offset(-32)
            make.width.equalToSuperview().offset(-64)
        }
        
        saveButton.snp.makeConstraints { make in
            make.width.equalTo(stackView.snp.width)
            make.height.equalTo(50)
        }
//
//        noiseToleranceLabel.snp.makeConstraints { make in
//            make.top.equalTo(filterLabel.snp.bottom).offset(32)
//            make.leading.equalToSuperview().offset(32)
//            make.height.equalTo(labelHeight)
//        }
//
//        noiseToleranceLowLabel.snp.makeConstraints { make in
//            make.leading.equalTo(noiseToleranceLabel.snp.leading)
//            make.top.equalTo(noiseToleranceLabel.snp.bottom).offset(padding)
//            make.height.equalTo(labelHeight)
//        }
//
//        noiseToleranceAlrightLabel.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalTo(noiseToleranceLowLabel.snp.top)
//            make.height.equalTo(labelHeight)
//        }
//
//        noiseToleranceHighLabel.snp.makeConstraints { make in
//            make.trailing.equalToSuperview().offset(-32)
//            make.top.equalTo(noiseToleranceLowLabel.snp.top)
//            make.height.equalTo(labelHeight)
//        }
//
//        noiseToleranceSlider.snp.makeConstraints { make in
//            make.leading.equalTo(noiseToleranceLabel.snp.leading)
//            make.trailing.equalTo(noiseToleranceHighLabel.snp.trailing)
//            make.top.equalTo(noiseToleranceLowLabel.snp.bottom).offset(smallerPadding)
//        }
//
//        cleanlinessLabel.snp.makeConstraints { make in
//            make.leading.equalTo(noiseToleranceLabel.snp.leading)
//            make.top.equalTo(noiseToleranceSlider.snp.bottom).offset(padding)
//            make.height.equalTo(labelHeight)
//        }
//
//        cleanlinessMessyLabel.snp.makeConstraints { make in
//            make.leading.equalTo(noiseToleranceLabel.snp.leading)
//            make.top.equalTo(cleanlinessLabel.snp.bottom).offset(padding)
//            make.height.equalTo(labelHeight)
//        }
//
//        cleanlinessAlrightLabel.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalTo(cleanlinessMessyLabel.snp.top)
//            make.height.equalTo(labelHeight)
//        }
//
//        cleanlinessNeatLabel.snp.makeConstraints { make in
//            make.trailing.equalToSuperview().offset(-32)
//            make.top.equalTo(cleanlinessMessyLabel.snp.top)
//            make.height.equalTo(labelHeight)
//        }
//
//        cleanlinessSlider.snp.makeConstraints { make in
//            make.leading.equalTo(noiseToleranceLabel.snp.leading)
//            make.trailing.equalTo(cleanlinessNeatLabel.snp.trailing)
//            make.top.equalTo(cleanlinessMessyLabel.snp.bottom).offset(smallerPadding)
//        }
//
//        sleepingLabel.snp.makeConstraints { make in
//            make.leading.equalTo(noiseToleranceLabel)
//            make.top.equalTo(cleanlinessSlider.snp.bottom).offset(padding)
//            make.height.equalTo(labelHeight)
//        }
//
//        wakingLabel.snp.makeConstraints { make in
//            make.leading.equalTo(noiseToleranceLabel)
//            make.top.equalTo(sleepingButton.snp.bottom).offset(padding)
//            make.height.equalTo(labelHeight)
//        }
//
        dismissButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-64)
        }
    }
    
    @objc func dismissButtonPressed(sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func filterSaveButtonPressed() {
        delegate?.filterSaveButtonPressed()
        // do something
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

