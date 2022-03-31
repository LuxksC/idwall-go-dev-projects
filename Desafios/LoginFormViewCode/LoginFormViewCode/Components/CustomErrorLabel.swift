import UIKit

class CustomErrorLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        textColor = .red
        font = UIFont.systemFont(ofSize: 14)
        isHidden = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
