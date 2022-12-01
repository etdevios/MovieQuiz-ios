import Foundation

protocol StatisticService {
    var totalAccuracy: Double { get }
    var gamesCount: Int { get }
    var bestGame: GameRecord { get }
    func store(correct count: Int, total amount: Int)
}

final class StatisticServiceImplementation: StatisticService {
    
    private let userDefaults = UserDefaults.standard
    
    private enum Keys: String {
        case correct, total, bestGame, gamesCount
    }
    
    private(set) var totalAccuracy: Double {
        get {
            let double = userDefaults.double(forKey: Keys.total.rawValue)
            return double
        }
        set {
            userDefaults.set(newValue, forKey: Keys.total.rawValue)
        }
    }
    
    private(set) var gamesCount: Int {
        get {
            let integer = userDefaults.integer(forKey: Keys.gamesCount.rawValue)
            return integer
        }
        set {
            userDefaults.set(newValue, forKey: Keys.gamesCount.rawValue)
        }
    }
    
    private(set) var correct: Int {
        get {
            let integer = userDefaults.integer(forKey: Keys.correct.rawValue)
            return integer
        }
        set {
            userDefaults.set(newValue, forKey: Keys.correct.rawValue)
        }
    }
    
    private(set) var bestGame: GameRecord {
        get {
            guard let data = userDefaults.data(forKey: Keys.bestGame.rawValue),
                  let record = try? JSONDecoder().decode(GameRecord.self, from: data) else {
                return .init(correct: 0, total: 0, date: Date())
            }
            return record
        }
        
        set {
            guard let data = try? JSONEncoder().encode(newValue) else {
                print("Невозможно сохранить результат")
                return
            }
            userDefaults.set(data, forKey: Keys.bestGame.rawValue)
        }
    }
    
    func store(correct count: Int, total amount: Int) {
        if bestGame.correct < count {
            bestGame = GameRecord(correct: count, total: amount, date: Date())
        }
        gamesCount += 1
        correct += count
        totalAccuracy = Double(correct) / Double(gamesCount) * 10
    }
}
