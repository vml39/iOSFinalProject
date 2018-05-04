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
    func filterSaveButtonpressed()
}

//navigate to surveyviewcontroller
//have cells
class ViewController: UIViewController, SaveButtonDelegate, UITableViewDataSource, UITableViewDelegate {
    
    var profiles: [Profile] = []
    
    //    var scrollView: UIScrollView!
    
    var surveyButton: UIBarButtonItem!
    
    var searchBar: UISearchBar!
    
    var filterButton: UIButton!
    
    let reuseIdentifier = "ReuseIdentifier"
    
    let padding: CGFloat = 8
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = .white
        self.navigationItem.title = "Discover"
        
        //        scrollView = UIScrollView()
        //        scrollView.alwaysBounceVertical = true
        //        view.addSubview(scrollView)
        
        surveyButton = UIBarButtonItem(type: .system)
        surveyButton.setTitle("Survey", for: .normal)
        surveyButton.setTitleColor(UIColor.black, for: .normal)
        surveyButton.addTarget(self, action: #selector(surveyButtonPressed), for: .touchUpInside)
        view.addSubview(surveyButton)
        
        searchBar = UISearchBar()
        
        filterButton = UIButton(type: .system)
        filterButton.setTitle("Filter", for: .normal)
        filterButton.setTitleColor(UIColor.black, for: .normal)
        filterButton.addTarget(self, action: #selector(filterButtonPressed), for: .touchUpInside)
        view.addSubview(filterButton)
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        //        scrollView.snp.makeConstraints { make in
        //            make.edges.equalToSuperview()
        //        }
        
        surveyButton.snp.makeConstraints { make in //ideally put this in the nav
            make.top.equalTo(view.snp.top).offset(100)
            make.size.equalTo(surveyButton.intrinsicContentSize)
            make.centerX.equalToSuperview()
        }
        
        filterButton.snp.makeConstraints { make in
            make.top.equalTo(surveyButton.snp.bottom).offset(padding)
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
//        filterVC.delegate = self
        present(filterVC, animated: true, completion: nil)
    }
    
    func surveySaveButtonPressed() {
        // do something
        navigationController?.popToRootViewController(animated: true)
    }
    
    func filterSaveButtonpressed() {
        // call dismiss
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profiles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? ProfileTableViewCell {
            cell.setNeedsUpdateConstraints()
            return cell
        }
        return UITableViewCell()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


