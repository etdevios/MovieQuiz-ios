import Foundation

protocol MovieQuizViewControllerProtocol: AnyObject {
    func show(quiz step: QuizStepViewModel)
    
    func hideBorder()
    
    func activatedButton()
    
    func highlightImageBorder(isCorrectAnswer: Bool)
    
    func hideLoadIndicator()
    
    func showLoadingIndicator()
}
