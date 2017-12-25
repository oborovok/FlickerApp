//
//  OBNetworkManager.swift
//  tvOSFlickr
//
//  Created by Oleksandr Borovok on 12/18/17.
//  Copyright © 2017 Oleksandr Borovok. All rights reserved.
//

import UIKit

// MARK: - Flickr Images Size
enum OBImageSize:String {
    case thumbnail = "t"
    case medium = "z"
    case large = "b"
}

// MARK: - Properties Constants
struct OBNetworkConst {
    static let kFlickrApiKey = "5319f8d9dd4d55c891c270ebcd8a14ee"
    static let kImagesPerPage = 50
}

class OBNetworkManager: NSObject {
    // MARK: -
    class func searchImage(_ named: String, _ competition:@escaping (_ searchResult: OBSearchImageEntity?, _ error: Error?) -> ()) {
        if let searchName = named.addingPercentEncoding(withAllowedCharacters: CharacterSet.alphanumerics) {
            let path = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=\(OBNetworkConst.kFlickrApiKey)&text=" + searchName + "&per_page=\(OBNetworkConst.kImagesPerPage)&format=json&nojsoncallback=1"
            
            if let url = URL(string: path) {
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                    if (error != nil) {
                        competition(nil, error)
                    }
                    
                    if let responseData = data {
                        do {
                            let decoder = JSONDecoder()
                            let entity = try decoder.decode(OBSearchImageEntity.self, from: responseData)

                            competition(entity, nil)
                        }
                        catch {
                            debugPrint("error trying to convert data to JSON")
                            debugPrint(error)
                        }
                    }
                    
                }.resume()
            }
        }
    }
    
    class func createImageURL(fromEntity entity: OBPhotoEntity, imageSize: OBImageSize) -> URL? {
        let urlString = "https://farm\(entity.farm).staticflickr.com/\(entity.server)/\(entity.id)_\(entity.secret)_\(imageSize).jpg"
        
        return URL(string: urlString)
    }
    
    class func createImageURLRequestFromJSON(fromEntity entity: OBPhotoEntity, imageSize: OBImageSize) -> URLRequest {
        var request = URLRequest(url: OBNetworkManager.createImageURL(fromEntity: entity, imageSize: imageSize)!)
        request.addValue("image/*", forHTTPHeaderField: "Accept")
        
        return request
    }
}
