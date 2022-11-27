import UIKit

protocol AlertPresenterDelegate: AnyObject {
    func didShow(alert: UIAlertController)
}
