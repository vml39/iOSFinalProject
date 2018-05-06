//
//  ProfileTableViewCell.swift
//  iOSFinal
//
//  Created by Vivian Mengxue Li on 5/4/18.
//  Copyright © 2018 Vivian Mengxue Li. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class ProfileTableViewCell: UITableViewCell {
    
    var colorView: UIView!
    var nameLabel: UILabel!
    var majorLabel: UILabel!
    var funFactLabel: UILabel!
    
    let padding: CGFloat = 16
    let labelHeight: CGFloat = 20
    
    let myColor: UIColor = UIColor(red: 255/255, green: 118/255, blue: 109/255, alpha: 1)
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        colorView = UIView()
        colorView.backgroundColor = myColor
        colorView.layer.cornerRadius = 10
        
        nameLabel = UILabel()
        nameLabel.font = .systemFont(ofSize: 20)
        nameLabel.textColor = .black
        colorView.addSubview(nameLabel)
        
        majorLabel = UILabel()
        majorLabel.font = .italicSystemFont(ofSize: 16)
        majorLabel.textColor = .white
        colorView.addSubview(majorLabel)
        
        funFactLabel = UILabel()
        funFactLabel.font = .systemFont(ofSize: 14)
        funFactLabel.textColor = .white
        funFactLabel.numberOfLines = 0
        funFactLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        colorView.addSubview(funFactLabel)
        
        contentView.addSubview(colorView)
    }
    
    override func updateConstraints() {
        colorView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(padding)
            make.top.equalToSuperview().offset(padding)
            make.height.equalTo(labelHeight)
        }
        
        majorLabel.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel.snp.trailing).offset(padding)
            make.bottom.equalTo(nameLabel.snp.bottom)
            make.height.equalTo(labelHeight)
        }
        
        funFactLabel.snp.makeConstraints { make in
            make.top.equalTo(majorLabel.snp.bottom).offset(padding)
            make.leading.equalTo(nameLabel)
        }
        
        super.updateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

