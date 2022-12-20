
import Foundation

protocol MoviesLoading {
    func loadMovies(handler: @escaping (Result<MostPopularMovies, Error>) -> Void)
}

struct MoviesLoader: MoviesLoading {
    // MARK: - NetworkClient
    private let networkClient = NetworkClient()
    
    // MARK: - URL
    private var mostPopularMoviesUrl: URL {
        guard let url = URL(string: "https://imdb-api.com/en/API/Top250Movies/k_7n1r5mhv") else {
            preconditionFailure("Unable to construct mostPopularMoviesUrl")
        }
        return url
    }
    
    func loadMovies(handler: @escaping (Result<MostPopularMovies, Error>) -> Void) {
        networkClient.fetch(url: mostPopularMoviesUrl) { result in
            do {
                let data = try result.get()
                let decodedData = try JSONDecoder().decode(MostPopularMovies.self, from: data)
                if decodedData.errorMessage.isEmpty {
                    handler(.success(decodedData))
                } else {
                    let error = NSError(domain: decodedData.errorMessage, code: 0)
                    handler(.failure(error))
                }
            } catch let error {
                handler(.failure(error))
            }
        }
    }
}

