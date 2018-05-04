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
    
    // sign up with name, netid --> take them to view with the form
    // if already signed in, lead them to survey
    // otherwise takes them to main vc
    
    var scrollView: UIScrollView!
    
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
    var noiseToleranceSlider: UISlider!
    
    var cleanlinessLabel: UILabel!
    var cleanlinessMessyLabel: UILabel!
    var cleanlinessAlrightLabel: UILabel!
    var cleanlinessNeatLabel: UILabel!
    var cleanlinessSlider: UISlider!
    
    var sleepingLabel: UILabel!
    //nsbutton with instance of ns switch button
    var sleepingButton: UIButton!
    
    var wakingLabel: UILabel!
    var wakingButton: UIButton!
    
    var saveButton: UIButton!
    var delegate: SaveButtonDelegate?
    
    let smallerPadding: CGFloat = 8
    let padding: CGFloat = 16
    let textfieldHeight: CGFloat = 40
    let labelHeight: CGFloat = 20
    
    let textFieldColor: UIColor = UIColor(red: 255/255, green: 118/255, blue: 109/255, alpha: 0.3)
    let borderColor: UIColor = UIColor(red: 255/255, green: 118/255, blue: 109/255, alpha: 0.6)
    
    let myColor: UIColor = UIColor.black
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationItem.title = "About You"
        view.backgroundColor = .white
        
        nameLabel = UILabel()
        nameLabel.text = "Name"
        view.addSubview(nameLabel)
        
        nameTextfield = UITextField()
        nameTextfield.delegate = self
        nameTextfield.placeholder = "What's your name?"
        nameTextfield.backgroundColor = textFieldColor
        nameTextfield.layer.cornerRadius = 10
//        nameTextfield.layer.borderColor = myColor.cgColor
        nameTextfield.returnKeyType = .done
        view.addSubview(nameTextfield)
        
        
        majorLabel = UILabel()
        majorLabel.text = "Major"
        view.addSubview(majorLabel)
        
        majorTextfield = UITextField()
        majorTextfield.delegate = self
        majorTextfield.placeholder = "What do you want to study?"
        majorTextfield.backgroundColor = textFieldColor
        majorTextfield.layer.cornerRadius = 10
        majorTextfield.returnKeyType = .done
        view.addSubview(majorTextfield)
        
        funFactLabel = UILabel()
        funFactLabel.text = "Fun Fact"
        view.addSubview(funFactLabel)
        
        funFactTextView = UITextView()
        funFactTextView.delegate = self
        funFactTextView.text = "Tell everyone something about you."
        funFactTextView.font = UIFont.boldSystemFont(ofSize: 16)
        funFactTextView.textColor = .black
        funFactTextView.backgroundColor = textFieldColor
        funFactTextView.layer.cornerRadius = 10
        funFactTextView.returnKeyType = .done
        view.addSubview(funFactTextView)
        
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
        view.addSubview(sleepingButton)
        
        wakingLabel = UILabel()
        wakingLabel.text = "Waking Up"
        view.addSubview(wakingLabel)
        
        wakingButton = UIButton()
        view.addSubview(wakingButton)
        
        saveButton = UIButton()
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.black, for: .normal)
        saveButton.addTarget(self, action: #selector(surveySaveButtonPressed), for: .touchUpInside)
        view.addSubview(saveButton)
        
        setUpConstraints()
    }
    
    private func setUpConstraints(){
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.equalToSuperview().offset(32)
            make.height.equalTo(labelHeight)
        }
        
        nameTextfield.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel.snp.leading)
            make.trailing.equalToSuperview().offset(-32)
            make.top.equalTo(nameLabel.snp.bottom).offset(smallerPadding)
            make.height.equalTo(textfieldHeight)
        }
        
        majorLabel.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel.snp.leading)
            make.top.equalTo(nameTextfield.snp.bottom).offset(padding)
            make.height.equalTo(labelHeight)
        }
        
        majorTextfield.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel.snp.leading)
            make.trailing.equalToSuperview().offset(-32)
            make.top.equalTo(majorLabel.snp.bottom).offset(smallerPadding)
            make.height.equalTo(textfieldHeight)
        }
        
        funFactLabel.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel.snp.leading)
            make.top.equalTo(majorTextfield.snp.bottom).offset(padding)
            make.height.equalTo(labelHeight)
        }
        
        funFactTextView.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel.snp.leading)
            make.trailing.equalToSuperview().offset(-32)
            make.top.equalTo(funFactLabel.snp.bottom).offset(smallerPadding)
            make.height.equalTo(2*textfieldHeight)
        }
        
        noiseToleranceLabel.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel.snp.leading)
            make.top.equalTo(funFactTextView.snp.bottom).offset(padding)
            make.height.equalTo(labelHeight)
        }
        
        noiseToleranceLowLabel.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel.snp.leading)
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
            make.leading.equalTo(nameLabel.snp.leading)
            make.trailing.equalTo(noiseToleranceHighLabel.snp.trailing)
            make.top.equalTo(noiseToleranceLowLabel.snp.bottom).offset(smallerPadding)
        }
        
        cleanlinessLabel.snp.makeConstraints { make in // word wrap
            make.leading.equalTo(nameLabel.snp.leading)
            make.top.equalTo(noiseToleranceSlider.snp.bottom).offset(padding)
            make.height.equalTo(labelHeight)
        }
        
        cleanlinessMessyLabel.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel.snp.leading)
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
            make.leading.equalTo(nameLabel.snp.leading)
            make.trailing.equalTo(cleanlinessNeatLabel.snp.trailing)
            make.top.equalTo(cleanlinessMessyLabel.snp.bottom).offset(smallerPadding)
        }
        
        sleepingLabel.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel.snp.leading)
            make.top.equalTo(cleanlinessSlider.snp.bottom).offset(padding)
            make.height.equalTo(labelHeight)
        }
        
        sleepingButton.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel.snp.leading)
            make.top.equalTo(sleepingLabel.snp.bottom).offset(smallerPadding) // have 3 buttons, figure out how to do this
        }
        
        wakingLabel.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel.snp.leading)
            make.top.equalTo(sleepingButton.snp.bottom).offset(padding)
            make.height.equalTo(labelHeight)
        }
        
        wakingButton.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel.snp.leading)
            make.top.equalTo(wakingLabel.snp.bottom).offset(smallerPadding)
        }
        
        saveButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-64)
        }
        
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
