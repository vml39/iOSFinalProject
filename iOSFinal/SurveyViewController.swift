//
//  SurveyViewController.swift
//  iOSFinal
//
//  Created by Vivian Mengxue Li on 5/4/18.
//  Copyright © 2018 Vivian Mengxue Li. All rights reserved.
//

import UIKit
import SnapKit

class SurveyViewController: UIViewController {
    
    var scrollView: UIScrollView!
    
    var stackView: UIStackView!
    
    var profilePicture: UIImageView!
    
    var nameLabel: UILabel!
    var nameTextfield: UITextField!
    
    var majorLabel: UILabel!
    var majorTextfield: UITextField!
    
    var funFactLabel: UILabel!
    var funFactTextView: UITextView!
    
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
    //nsbutton with instance of ns switch button
//    var sleepingButton1: UIButton!
//    var sleepingButton2: UIButton!
//    var sleepingButton3: UIButton!
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
    
    let smallerPadding: CGFloat = 8
    let padding: CGFloat = 16
    let textfieldHeight: CGFloat = 40
    let labelHeight: CGFloat = 20
    
    let textFieldColor: UIColor = UIColor(red: 255/255, green: 118/255, blue: 109/255, alpha: 0.1)
    let borderColor: UIColor = UIColor(red: 255/255, green: 118/255, blue: 109/255, alpha: 0.2)
    let buttonColor: UIColor = UIColor(red: 255/255, green: 118/255, blue: 109/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationItem.title = "About You"
        view.backgroundColor = .white
        
        scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        view.addSubview(scrollView)
        
        nameLabel = UILabel()
        nameLabel.text = "Name"
        
        nameTextfield = UITextField()
        nameTextfield.delegate = self
        nameTextfield.placeholder = "What's your name?"
        nameTextfield.backgroundColor = textFieldColor
        nameTextfield.layer.cornerRadius = 10
        nameTextfield.layer.borderColor = borderColor.cgColor
        nameTextfield.layer.borderWidth = 1
        nameTextfield.returnKeyType = .done
        
        majorLabel = UILabel()
        majorLabel.text = "Major"
        
        majorTextfield = UITextField()
        majorTextfield.delegate = self
        majorTextfield.placeholder = "What do you want to study?"
        majorTextfield.backgroundColor = textFieldColor
        majorTextfield.layer.cornerRadius = 10
        majorTextfield.layer.borderColor = borderColor.cgColor
        majorTextfield.layer.borderWidth = 1
        majorTextfield.returnKeyType = .done
        
        funFactLabel = UILabel()
        funFactLabel.text = "Fun Fact"
        
        funFactTextView = UITextView()
        funFactTextView.delegate = self
        funFactTextView.text = "Tell everyone something about you."
        funFactTextView.font = UIFont.boldSystemFont(ofSize: 16)
        funFactTextView.textColor = .black
        funFactTextView.backgroundColor = textFieldColor
        funFactTextView.layer.cornerRadius = 10
        funFactTextView.layer.borderColor = borderColor.cgColor
        funFactTextView.layer.borderWidth = 1
        funFactTextView.returnKeyType = .done
        
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
        
//        sleepingButton1 = UIButton()
//        sleepingButton1.setTitle("Before 11 PM", for: .normal)
//        sleepingButton1.setTitleColor(.black, for: .normal)
//        sleepingButton1.titleLabel?.numberOfLines = 0
//        sleepingButton1.layer.cornerRadius = 10
//        sleepingButton1.layer.borderColor = borderColor.cgColor
//        sleepingButton1.layer.borderWidth = 1
//        sleepingButton1.layer.backgroundColor = textFieldColor.cgColor
//
//        sleepingButton2 = UIButton()
//        sleepingButton2.setTitle("11 PM - 1 AM", for: .normal)
//        sleepingButton2.setTitleColor(.black, for: .normal)
//        sleepingButton2.titleLabel?.numberOfLines = 0
//        sleepingButton2.layer.cornerRadius = 10
//        sleepingButton2.layer.borderColor = borderColor.cgColor
//        sleepingButton2.layer.borderWidth = 1
//        sleepingButton2.layer.backgroundColor = textFieldColor.cgColor
//
//        sleepingButton3 = UIButton()
//        sleepingButton3.setTitle("After 1 AM", for: .normal)
//        sleepingButton3.setTitleColor(.black, for: .normal)
//        sleepingButton3.titleLabel?.numberOfLines = 0
//        sleepingButton3.layer.cornerRadius = 10
//        sleepingButton3.layer.borderColor = borderColor.cgColor
//        sleepingButton3.layer.borderWidth = 1
//        sleepingButton3.layer.backgroundColor = textFieldColor.cgColor
        
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
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.black, for: .normal)
        saveButton.layer.backgroundColor = buttonColor.cgColor
        saveButton.layer.cornerRadius = 10
        saveButton.addTarget(self, action: #selector(surveySaveButtonPressed), for: .touchUpInside)
        
        stackView = UIStackView(arrangedSubviews: [nameLabel, nameTextfield, majorLabel, majorTextfield, funFactLabel, funFactTextView, noiseToleranceLabel, noiseToleranceStackView, noiseToleranceSlider, cleanlinessLabel, cleanlinessStackView, cleanlinessSlider, sleepingLabel, sleepingStackView, sleepingSlider, wakingLabel, wakingStackView, wakingSlider, saveButton])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.setCustomSpacing(8, after: nameLabel)
        stackView.setCustomSpacing(8, after: majorLabel)
        stackView.setCustomSpacing(8, after: funFactLabel)
        stackView.setCustomSpacing(8, after: noiseToleranceStackView)
        stackView.setCustomSpacing(8, after: cleanlinessStackView)
        stackView.setCustomSpacing(8, after: sleepingStackView)
        stackView.setCustomSpacing(8, after: wakingStackView)
        
        scrollView.addSubview(stackView)
        
        setUpConstraints()
    }
    
    private func setUpConstraints(){
        scrollView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        nameTextfield.snp.makeConstraints { make in
            make.height.equalTo(textfieldHeight)
        }
        
        majorTextfield.snp.makeConstraints { make in
            make.height.equalTo(textfieldHeight)
        }
        
        funFactTextView.snp.makeConstraints { make in
            make.height.equalTo(2*textfieldHeight)
        }
        
        stackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().offset(-32)
            make.width.equalToSuperview().offset(-64)
            make.height.equalToSuperview()
        }
        
        saveButton.snp.makeConstraints { make in
            make.width.equalTo(stackView.snp.width)
            make.height.equalTo(50)
        }
        
//        nameLabel.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(100)
//            make.leading.equalToSuperview().offset(32)
//            make.height.equalTo(labelHeight)
//        }
//
//        nameTextfield.snp.makeConstraints { make in
//            make.leading.equalTo(nameLabel.snp.leading)
//            make.trailing.equalToSuperview().offset(-32)
//            make.top.equalTo(nameLabel.snp.bottom).offset(smallerPadding)
//            make.height.equalTo(textfieldHeight)
//        }
//
//        majorLabel.snp.makeConstraints { make in
//            make.leading.equalTo(nameLabel.snp.leading)
//            make.top.equalTo(nameTextfield.snp.bottom).offset(padding)
//            make.height.equalTo(labelHeight)
//        }
//
//        majorTextfield.snp.makeConstraints { make in
//            make.leading.equalTo(nameLabel.snp.leading)
//            make.trailing.equalToSuperview().offset(-32)
//            make.top.equalTo(majorLabel.snp.bottom).offset(smallerPadding)
//            make.height.equalTo(textfieldHeight)
//        }
//
//        funFactLabel.snp.makeConstraints { make in
//            make.leading.equalTo(nameLabel.snp.leading)
//            make.top.equalTo(majorTextfield.snp.bottom).offset(padding)
//            make.height.equalTo(labelHeight)
//        }
//
//        funFactTextView.snp.makeConstraints { make in
//            make.leading.equalTo(nameLabel.snp.leading)
//            make.trailing.equalToSuperview().offset(-32)
//            make.top.equalTo(funFactLabel.snp.bottom).offset(smallerPadding)
//            make.height.equalTo(2*textfieldHeight)
//        }
//
//        noiseToleranceLabel.snp.makeConstraints { make in
//            make.leading.equalTo(nameLabel.snp.leading)
//            make.top.equalTo(funFactTextView.snp.bottom).offset(padding)
//            make.height.equalTo(labelHeight)
//        }
//
//        noiseToleranceLowLabel.snp.makeConstraints { make in
//            make.leading.equalTo(nameLabel.snp.leading)
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
//            make.leading.equalTo(nameLabel.snp.leading)
//            make.trailing.equalTo(noiseToleranceHighLabel.snp.trailing)
//            make.top.equalTo(noiseToleranceLowLabel.snp.bottom).offset(smallerPadding)
//        }
//
//        cleanlinessLabel.snp.makeConstraints { make in // word wrap
//            make.leading.equalTo(nameLabel.snp.leading)
//            make.top.equalTo(noiseToleranceSlider.snp.bottom).offset(padding)
//            make.height.equalTo(labelHeight)
//        }
//
//        cleanlinessMessyLabel.snp.makeConstraints { make in
//            make.leading.equalTo(nameLabel.snp.leading)
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
//            make.leading.equalTo(nameLabel.snp.leading)
//            make.trailing.equalTo(cleanlinessNeatLabel.snp.trailing)
//            make.top.equalTo(cleanlinessMessyLabel.snp.bottom).offset(smallerPadding)
//        }
//
//        sleepingLabel.snp.makeConstraints { make in
//            make.leading.equalTo(nameLabel.snp.leading)
//            make.top.equalTo(cleanlinessSlider.snp.bottom).offset(padding)
//            make.height.equalTo(labelHeight)
//        }
//
//        sleepingButton.snp.makeConstraints { make in
//            make.leading.equalTo(nameLabel.snp.leading)
//            make.top.equalTo(sleepingLabel.snp.bottom).offset(smallerPadding) // have 3 buttons, figure out how to do this
//        }
//
//        wakingLabel.snp.makeConstraints { make in
//            make.leading.equalTo(nameLabel.snp.leading)
//            make.top.equalTo(sleepingButton.snp.bottom).offset(padding)
//            make.height.equalTo(100)
//        }
//
//        wakingButton.snp.makeConstraints { make in
//            make.leading.equalTo(nameLabel.snp.leading)
//            make.top.equalTo(wakingLabel.snp.bottom).offset(smallerPadding)
//        }
//
//        saveButton.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.bottom.equalToSuperview().offset(-64)
//        }
        
    }
    
    @objc func surveySaveButtonPressed() {
        if let _ = nameTextfield.text {
            delegate?.surveySaveButtonPressed()
        }
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

extension SurveyViewController: UITextFieldDelegate, UITextViewDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextfield.endEditing(true)
        majorTextfield.endEditing(true)
        return true
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            funFactTextView.resignFirstResponder()
            return false
        }
        return true
    }

}
