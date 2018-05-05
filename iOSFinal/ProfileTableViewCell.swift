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
    // show pic, name, fun fact (at most 2 lines)
    
    var nameLabel: UILabel!
    var majorLabel: UILabel!
    var funFactLabel: UILabel!
    
    let padding: CGFloat = 16
    let labelHeight: CGFloat = 20
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        nameLabel = UILabel()
        nameLabel.font = .systemFont(ofSize: 14)
        contentView.addSubview(nameLabel)
        
        majorLabel = UILabel()
        majorLabel.font = .systemFont(ofSize: 14)
        majorLabel.textColor = .darkGray
        contentView.addSubview(majorLabel)
        
        funFactLabel = UILabel()
        funFactLabel.font = .systemFont(ofSize: 12)
        funFactLabel.textColor = .lightGray
        funFactLabel.numberOfLines = 0
        contentView.addSubview(funFactLabel)
    }
    
    override func updateConstraints() {
        nameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(padding)
            make.top.equalToSuperview().offset(padding)
//            make.trailing.equalToSuperview().offset(-padding)
            make.height.equalTo(labelHeight)
        }
        
        majorLabel.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel.snp.leading)
            make.top.equalTo(nameLabel.snp.bottom).offset(padding)
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

