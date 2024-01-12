//
//  MarsPhotosAPI.swift
//  MarsList
//
//  Created by Bodgar Espinosa Miranda on 11/01/24.
//

import Foundation

///
struct MarsData: Decodable {
    ///
    struct Photos: Decodable {
        ///
        struct Camera: Decodable {
            ///
            var fullName: String
            
            enum CodingKeys: String, CodingKey {
                case fullName = "full_name"
            }
        }
        
        ///
        let id: Int
        ///
        let camera: Camera
        ///
        let image: String
        ///
        var isFavorite: Bool = false
        
        /// cdfvgbnhj
        ///
        ///   - Parameters:
        ///     - id: sdfgh
        ///     - camera: sdfg
        ///     - image: adfgtres
        init(id: Int, camera: Camera, image: String) {
            self.id = id
            self.camera = camera
            self.image = image
        }
        
        enum CodingKeys: String, CodingKey {
            case id, camera
            case image = "img_src"
        }
    }
    
    ///
    let photos: [Photos]
}

final class MarsPhotosAPI {
    
    func callService(completion: @escaping (Result<MarsData, Error>) -> Void) {
        let session = URLSession.shared
        guard let url = URL(string: "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?api_key=ebIStTbKmXzyVhtxkCOpqLeNX616o5Ry9lcthjQx&sol=2000&page=1") else {return}
        let dataTask = session.dataTask(with: URLRequest(url: url)) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                } else if let response = response as? HTTPURLResponse,
                        response.statusCode >= 200,
                        let data = data {
                    do {
                        let marsResponse = try JSONDecoder().decode(MarsData.self, from: data)
                        completion(.success(marsResponse))
                    } catch {
                        completion(.failure(error))
                    }
                } else {
                    completion(.failure(NSError(domain: "Invalid code response", code: -1)))
                }
            }
        }
        dataTask.resume()
    }
}
