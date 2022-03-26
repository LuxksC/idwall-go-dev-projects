import Foundation
import UIKit

class TaskTableViewCell: UITableViewCell {

    static let identifier = "TaskTableViewCell"
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var descLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var dueAtLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var contentStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.contentMode = .top
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var topContentStackView: UIStackView = {
           let stack = UIStackView()
            stack.axis = .horizontal
            stack.translatesAutoresizingMaskIntoConstraints = false
            return stack
        }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            contentStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            contentStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
        
        topContentStackView.addArrangedSubview(titleLabel)
        topContentStackView.addArrangedSubview(dueAtLabel)
        
        contentStackView.addArrangedSubview(topContentStackView)
        contentStackView.addArrangedSubview(descLabel)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(task: Task) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YY"
        
        dueAtLabel.text = dateFormatter.string(from: task.dueAt!)
        titleLabel.text = task.title
        descLabel.text = task.desc
    }
    
}
