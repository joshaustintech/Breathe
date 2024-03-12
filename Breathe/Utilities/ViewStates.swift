enum ViewStates : CaseIterable {
    case Starting
    case Breathing
    case Reviewing
    
    var isBouncing: Bool {
        switch self {
        case .Breathing: true
        default: false
        }
    }
    
    var scale: Double {
        switch self {
        case .Starting: 1.5
        default: 0.5
        }
    }
    
    var duration: Double {
        switch self {
        case .Starting: 3.0
        case .Breathing: 5.0
        case .Reviewing: 1.0
        }
    }
    
}
