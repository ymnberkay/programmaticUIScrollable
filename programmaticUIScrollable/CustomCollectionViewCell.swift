//
//  CustomCollectionViewCell.swift
//  programmaticUIScrollable
//
//  Created by Berkay Yaman on 19.10.2023.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    var imageView: UIImageView!
    var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height - 30))
        imageView.contentMode = .scaleAspectFit
        contentView.addSubview(imageView)
        
        label = UILabel(frame: CGRect(x: 0, y: frame.size.height - 30, width: frame.size.width, height: 30))
        label.textAlignment = .center
        contentView.addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
