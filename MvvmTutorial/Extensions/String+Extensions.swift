
import Foundation

extension String {
    func toDouble() -> Double {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "en_US")
        guard let number = formatter.number(from: self) else {
            return 0.0
        }
        
        return number.doubleValue
    }
}
