//
//  NetworkService.swift
//  Homeworks
//
//  Created by Иван  Балабай  on 03.12.2023.
//

import UIKit
import Foundation

protocol NetworkServiceProtocol {
    func getFriends(completion: @escaping(Result<[Friend], Error>) -> Void)
}
/// Class works with URL inquiries
final class NetworkService: NetworkServiceProtocol {
    private let session = URLSession.shared
    static var token: String? = ""
    static var userId: String? = ""
    
    //MARK: Getting friends
    /// Gets Friends from network
    /// - Parameter completion: Array of Friend model, errors
    func getFriends(completion: @escaping(Result<[Friend], Error>) -> Void)
    {
        guard let url = URL(string: "https://api.vk.com/method/friends.get?fields=photo_400_orig,online&access_token=" + (NetworkService.token ?? "") + "&v=5.131")
        else {
            return
        }
        session.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                completion(.failure(Error.self as! Error))
                return
            }
            if let error = error{
                completion(.failure(error))
                return
            }
            do{
                let friends = try JSONDecoder().decode(FriendsModel.self, from: data)
                completion(.success(friends.response.items))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    //MARK: Getting groups
    /// Gets Groups from network
    /// - Parameter completion: Array of Group model, errors
    func getGroups(completion: @escaping (Result<[Group], Error>) -> Void) {
        guard let url = URL(string: "https://api.vk.com/method/groups.get?access_token=" + (NetworkService.token ?? "") + "&fields=description&v=5.131&extended=1") else {
            return
        }
        
        session.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                completion(.failure(Error.self as! Error))
                return
            }
            if let error = error{
                completion(.failure(error))
                return}
            do {
                let groups = try JSONDecoder().decode(GroupsModel.self, from: data)
                completion(.success(groups.response.items))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    //MARK: Getting photos
    /// Gets Photos from network
    /// - Parameter completion: Array of Photo model
    func getPhotos(completion: @escaping(([Photo]) -> Void)) {
        guard let url = URL(string: "https://api.vk.com/method/photos.get?fields=bdate&access_token=" + (NetworkService.token ?? "") + "&v=5.131&album_id=profile") else {
            return
        }
        session.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                return
            }
            do {
                let photos = try JSONDecoder().decode(PhotosModel.self, from: data)
                completion(photos.response.items)
            }
            catch {
                print(error)
            }
        }.resume() //обязательно, иначе не заработает
    }
    //MARK: Getting profile info
    func getProfileInfo(completion: @escaping(User?) -> Void) {
        guard let url = URL(string: "https://api.vk.com/method/users.get?fields=photo_400_orig&access_token=" + (NetworkService.token ?? "") + "&v=5.131") else {
            return
        }
        session.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                return
            }
            do {
                let user = try JSONDecoder().decode(UserModel.self, from: data)
                completion(user.response.first)
            }
            catch {
                print(error)
            }
        }.resume() 
    }
}
