import UIKit

class ChatTableViewCell: UITableViewCell {
    
    static let identifier = "ChatTableViewCell"
    
    lazy var contactImageView: UIImageView = {
        let image = UIImageView()
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 26
        image.contentMode = .scaleAspectFill
        image.tintColor = .systemPurple
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var contentStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 11
        stack.contentMode = .top
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var contactNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var lastMessageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(contactImageView)
        
        NSLayoutConstraint.activate([
            contactImageView.widthAnchor.constraint(equalToConstant: 52),
            contactImageView.heightAnchor.constraint(equalToConstant: 52),
            contactImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            contactImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            contentStackView.leadingAnchor.constraint(equalTo: contactImageView.trailingAnchor, constant: 16),
            contentStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
        
        contentStackView.addArrangedSubview(contactNameLabel)
        
        contentStackView.addArrangedSubview(lastMessageLabel)
        
        
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    func setup(image: String, contactName: String, lastMessage: String) {
        contactNameLabel.text = contactName
        lastMessageLabel.text = lastMessage
        if let image = UIImage(named: image) {
            contactImageView.image = image
        }
    }
    
    
}
