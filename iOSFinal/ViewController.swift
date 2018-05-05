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

//navigate to surveyviewcontroller
//have cells
class ViewController: UIViewController, SaveButtonDelegate, UITableViewDataSource, UITableViewDelegate {
    
    var profiles: [Profile] = []
    
    var scrollView: UIScrollView!
    
    var surveyButton: UIButton!
    var surveyBarButtonItem: UIBarButtonItem!
    
    var searchLabel: UILabel!
    var searchBar: UISearchBar!
    
    var filterButton: UIButton!
    
    let reuseIdentifier = "ReuseIdentifier"
    
    let padding: CGFloat = 16
    
    let myColor: UIColor = UIColor(red: 255/255, green: 118/255, blue: 109/255, alpha: 0.4)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = .white
        self.navigationItem.title = "Discover"
        
        scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        view.addSubview(scrollView)
        
        surveyButton = UIButton(type: .system)
        surveyButton.setTitle("Me", for: .normal)
        surveyButton.setTitleColor(UIColor.black, for: .normal)
        surveyButton.addTarget(self, action: #selector(surveyButtonPressed), for: .touchUpInside)
        view.addSubview(surveyButton)
        
        surveyBarButtonItem = UIBarButtonItem(customView: surveyButton)
        self.navigationItem.rightBarButtonItem = surveyBarButtonItem
        
        searchLabel = UILabel()
        searchLabel.text = "Search"
        view.addSubview(searchLabel)
        
        searchBar = UISearchBar()
        searchBar.barTintColor = .white
        searchBar.layer.borderColor = myColor.cgColor
        searchBar.layer.cornerRadius = 10
        searchBar.layer.borderWidth = 1
        view.addSubview(searchBar)
        
        filterButton = UIButton(type: .system)
        filterButton.setTitle("Filter", for: .normal)
        filterButton.setTitleColor(UIColor.black, for: .normal)
        filterButton.addTarget(self, action: #selector(filterButtonPressed), for: .touchUpInside)
        view.addSubview(filterButton)
        
//                scrollView.addSubview(stackView)
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
         scrollView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
         }
        
//        surveyButton.snp.makeConstraints { make in //ideally put this in the nav
//            make.top.equalTo(view.snp.top).offset(100)
//            make.size.equalTo(surveyButton.intrinsicContentSize)
//            make.centerX.equalToSuperview()
//        }
        
        searchLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(32)
            make.leading.equalToSuperview().offset(32)
            make.height.equalTo(32)
        }
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(searchLabel.snp.top)
            make.leading.equalTo(searchLabel.snp.trailing).offset(padding)
            make.trailing.equalToSuperview().offset(-32)
            make.height.equalTo(32)
        }
        
        filterButton.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.size.equalTo(filterButton.intrinsicContentSize)
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
        return 44.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? ProfileTableViewCell {
            cell.nameLabel.text = profiles[indexPath.row].name
            cell.majorLabel.text = profiles[indexPath.row].major
            cell.funFactLabel.text = profiles[indexPath.row].funFact
            
            cell.setNeedsUpdateConstraints()
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell") as! ProfileTableViewCell
        
        cell.nameLabel.text = profiles[indexPath.row].name
        cell.majorLabel.text = profiles[indexPath.row].major
        cell.funFactLabel.text = profiles[indexPath.row].funFact
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let profileVC = ProfileViewController()
        profileVC.delegate = self
        //p4

        profileVC.row = indexPath.row
        present(profileVC, animated: true, completion: nil)
    }
    
    func surveySaveButtonPressed() {
        // send info to database
        navigationController?.popToRootViewController(animated: true)
    }
    
    func filterSaveButtonPressed() {
        // filter info from database
        dismiss(animated: true, completion: nil)
//        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


