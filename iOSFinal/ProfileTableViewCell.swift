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
    
    var profileImage: UIImageView!
    var nameLabel: UILabel!
    var funFactLabel: UILabel!
    
    let padding: CGFloat = 8
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        profileImage = UIImageView()
        profileImage.contentMode = .scaleAspectFill
        contentView.addSubview(profileImage)
        
        nameLabel = UILabel()
        nameLabel.font = .systemFont(ofSize: 14)
        contentView.addSubview(nameLabel)
        
        funFactLabel = UILabel()
        funFactLabel.font = .systemFont(ofSize: 12)
        contentView.addSubview(funFactLabel)
    }
    
    override func updateConstraints() {
        profileImage.snp.makeConstraints { make in
            make.edges.equalToSuperview().offset(padding)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImage.snp.trailing).offset(padding)
            make.trailing.equalToSuperview().offset(-padding)
            make.top.height.equalTo(16)
        }
        
        funFactLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(padding)
            make.leading.equalTo(nameLabel)
        }
        
        super.updateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

