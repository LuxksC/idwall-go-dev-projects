import UIKit

public class GoDevButton: UIButton {
    
    //injeção por via de constructor
    private var config: Config {
        didSet {
            updateDisplay()
        }
    }
    
    //definição do construtor do button
    public init(config: Config) {
        self.config = config
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        config = .light()
        super.init(coder: coder)
        configure()
    }
    
    public override var intrinsicContentSize: CGSize {
        CGSize(width: 140, height: 40)
    }
    
    public override var isHighlighted: Bool {
        
        didSet {
            UIView.animate(withDuration: 0.1, delay: 0, options: [.beginFromCurrentState, .curveEaseOut]) {
                
                self.backgroundColor = self.isHighlighted ? self.config.highlightBackgroundColor : self.config.backgroundColor
                
                self.applyShadow(shadow: self.isHighlighted ? .pressed() : .standard())
                
                self.transform = self.isHighlighted ? .init(translationX: 0, y: 1) : .identity
                
            } completion: { _ in
                
            }
            
        }
    }
    
    //estado inicial do button. Aqui não entram mudanças relacionadas ao display pos isso está ligado as structs
    private func configure() {
        layer.cornerRadius = 6
        titleLabel?.font = UIFont.systemFont(ofSize: 14)
        applyShadow(shadow: .standard())
        updateDisplay() // cores iniciais do button
    }
    
    // manipulação da estilização do Button
    private func updateDisplay() {
        backgroundColor = config.backgroundColor
        setTitleColor(config.foregroundColor, for: .normal)
    }
    
    //manipulação da sombra do button
    private func applyShadow(shadow: Shadow) {
        layer.shadowOffset = shadow.offset
        layer.shadowColor = shadow.color.cgColor
        layer.shadowRadius = shadow.radius
        layer.shadowOpacity = shadow.opacity
    }
    
}

public extension GoDevButton {
    
    // configurações das cores do botão
    struct Config {
        
        public let backgroundColor: UIColor
        public let highlightBackgroundColor: UIColor
        public let foregroundColor: UIColor
        
        public static func light() -> Config {
            
            Config(backgroundColor: .white,
                   highlightBackgroundColor: .gray,
                   foregroundColor: .blue)
            
        }
        
        public static func dark() -> Config {
            
            Config(backgroundColor: .darkGray,
                   highlightBackgroundColor: .black,
                   foregroundColor: .red)
            
        }
        
    }
    
    //configurações de sombra do butão
    struct Shadow {
        
        public let offset: CGSize
        public let radius: CGFloat
        public let color: UIColor
        public let opacity: Float
        
        public static func standard() -> Shadow {
            
            Shadow(offset: .init(width: 0, height: 2),
                   radius: 3,
                   color: .systemBlue,
                   opacity: 0.2)
            
        }
        
        public static func pressed() -> Shadow {
            
            Shadow(offset: .init(width: 0, height: 1),
                   radius: 1,
                   color: .systemBlue,
                   opacity: 0.2)
            
        }
        
    }
}
