//
//  SLTableViewCell.swift
//  CustomUI
//
//  Created by Taeyoun Lee on 2020/03/23.
//  Copyright © 2020 SinoLab. All rights reserved.
//

import UIKit

class SLTableViewCell: UITableViewCell {
    
    public var titleLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    // MARK: - Initialize
    private func initialize() {
        
    }
    // MARK: - Initialize Items
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
