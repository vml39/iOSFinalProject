//
//  ViewController.swift
//  iOSFinal
//
//  Created by Vivian Mengxue Li on 5/4/18.
//  Copyright © 2018 Vivian Mengxue Li. All rights reserved.
//

import UIKit
import SnapKit

protocol SaveButtonDelegate {
    func surveySaveButtonPressed()
    func filterSaveButtonPressed()
}

class ViewController: UIViewController, SaveButtonDelegate, UITableViewDataSource, UITableViewDelegate {
    
    let profile1 = Profile(name: "Vivian Li", major: "Information Science, French", funFact: "I am Canadian", noiseTolerance: "Low", cleanliness: "Clean", sleeping: "11 PM - 1 AM", waking: "8 AM - 10 AM")
    let profile2 = Profile(name: "Cedric Castillo", major: "Information Science", funFact: "I am a designer", noiseTolerance: "Alright", cleanliness: "Messy", sleeping: "After 1 AM", waking: "Before 8 AM")
     let profile3 = Profile(name: "Linus Setiabrata", major: "Mathematics", funFact: "I like to cut loops", noiseTolerance: "High", cleanliness: "Messy", sleeping: "11 PM - 1 AM", waking: "Before 8 AM")
     let profile4 = Profile(name: "Joanna Li", major: "GPHS", funFact: "I am extra and I like taking photos", noiseTolerance: "High", cleanliness: "Messy", sleeping: "After 1 AM", waking: "8 AM - 10 AM")
     let profile5 = Profile(name: "Ally Yuan", major: "Information Science", funFact: "I am really tall", noiseTolerance: "High", cleanliness: "Alright", sleeping: "After 1 AM", waking: "After 10 AM")
     let profile6 = Profile(name: "Nuri Yi", major: "Biology, Comparative Lit", funFact: "I live in Korea and I like sadboiz", noiseTolerance: "Alright", cleanliness: "Messy", sleeping: "After 1 AM", waking: "Before 8 AM")
     let profile7 = Profile(name: "David Li", major: "Math, Econ", funFact: "I am Vivian's brother", noiseTolerance: "Alright", cleanliness: "Clean", sleeping: "After 1 AM", waking: "After 10 AM")
    
    var profiles: [Profile] = []
    
    var tableView: UITableView!
    
    var surveyButton: UIButton!
    var surveyBarButtonItem: UIBarButtonItem!
    
    var searchLabel: UILabel!
    var searchBar: UISearchBar!
    
    var filterButton: UIButton!
    
    let reuseIdentifier = "ReuseIdentifier"
    
    let padding: CGFloat = 16
    
    let myColor: UIColor = UIColor(red: 255/255, green: 118/255, blue: 109/255, alpha: 0.4)
    let buttonColor: UIColor = UIColor(red: 255/255, green: 118/255, blue: 109/255, alpha: 1)
    let cellColor: UIColor = UIColor(red: 255/255, green: 182/255, blue: 193/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = .white
        self.navigationItem.title = "Discover"
        
        profiles.append(profile1)
        profiles.append(profile2)
        profiles.append(profile3)
        profiles.append(profile4)
        profiles.append(profile5)
        profiles.append(profile6)
        profiles.append(profile7)
        
        surveyButton = UIButton(type: .system)
        surveyButton.setTitle("Me", for: .normal)
        surveyButton.setTitleColor(UIColor.black, for: .normal)
        surveyButton.addTarget(self, action: #selector(surveyButtonPressed), for: .touchUpInside)
        view.addSubview(surveyButton)
        
        surveyBarButtonItem = UIBarButtonItem(customView: surveyButton)
        self.navigationItem.rightBarButtonItem = surveyBarButtonItem
        
        filterButton = UIButton(type: .system)
        filterButton.setTitle("Filter", for: .normal)
        filterButton.setTitleColor(UIColor.white, for: .normal)
        filterButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        filterButton.backgroundColor = buttonColor
        filterButton.layer.cornerRadius = 5
        filterButton.addTarget(self, action: #selector(filterButtonPressed), for: .touchUpInside)
        view.addSubview(filterButton)
        
        searchLabel = UILabel()
        searchLabel.text = "Search"
        view.addSubview(searchLabel)
        
        searchBar = UISearchBar()
        searchBar.barTintColor = .white
        searchBar.layer.borderColor = myColor.cgColor
        searchBar.layer.cornerRadius = 10
        searchBar.layer.borderWidth = 1
        view.addSubview(searchBar)
        
        tableView = UITableView()
        tableView.bounces = true
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.separatorStyle = .none
        // register all cells into a stackview --> scrollview
        view.addSubview(tableView)
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        
        filterButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-32)
            make.height.equalTo(50)
        }
        
        searchLabel.snp.makeConstraints { make in
            make.top.equalTo(filterButton.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(32)
            make.height.equalTo(32)
        }
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(searchLabel.snp.top)
            make.leading.equalTo(searchLabel.snp.trailing).offset(padding)
            make.trailing.equalToSuperview().offset(-32)
            make.height.equalTo(32)
        }
        
        tableView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(searchLabel.snp.bottom).offset(16)
            make.width.equalToSuperview().offset(-40)
            make.height.equalToSuperview().offset(-118)
        }
    }
    
    @objc func surveyButtonPressed(sender: UIButton) {
        let surveyVC = SurveyViewController()
        surveyVC.delegate = self
        navigationController?.pushViewController(surveyVC, animated: true)
    }
    
    @objc func filterButtonPressed(sender: UIButton) {
        let filterVC = FilterViewController()
        filterVC.delegate = self
        present(filterVC, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profiles.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 16
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? ProfileTableViewCell {
            cell.nameLabel.text = profiles[indexPath.row].name
            cell.majorLabel.text = profiles[indexPath.row].major
            cell.funFactLabel.text = profiles[indexPath.row].funFact
            
            cell.funFactLabel.numberOfLines = 0
            cell.funFactLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
            
            cell.backgroundColor = cellColor
            cell.layer.borderColor = UIColor.white.cgColor
            cell.layer.borderWidth = 5
            
            cell.setNeedsUpdateConstraints()
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as! ProfileTableViewCell
        
        cell.nameLabel.text = profiles[indexPath.row].name
        cell.majorLabel.text = profiles[indexPath.row].major
        cell.funFactLabel.text = profiles[indexPath.row].funFact
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let profileVC = ProfileViewController()
        profileVC.delegate = self
        profileVC.nameString =  cell.nameLabel.text
        profileVC.majorString = cell.majorLabel.text
        profileVC.funFactString = cell.funFactLabel.text
        profileVC.noiseToleranceValueString = profiles[indexPath.row].noiseTolerance
        profileVC.cleanlinessValueString = profiles[indexPath.row].cleanliness
        profileVC.sleepingValueString = profiles[indexPath.row].sleeping
        profileVC.wakingValueString = profiles[indexPath.row].waking
        profileVC.row = indexPath.row
        present(profileVC, animated: true, completion: nil)
    }
    
    func surveySaveButtonPressed() {
        // send info to database: send a post request using the values we obtained from the survey
        navigationController?.popToRootViewController(animated: true)
    }
    
    func filterSaveButtonPressed() {
        // filter info from database using the values we obtained from the slider functions
        dismiss(animated: true, completion: nil)
//        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


