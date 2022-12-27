import UIKit

protocol AlertDelegate: AnyObject {
    func presentAlert(_ alert: UIAlertController, animated: Bool)
}
