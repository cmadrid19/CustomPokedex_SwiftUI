//
//  DownloadImage.swift
//  RegistrationApi
//
//  Created by Maxim Macari on 09/11/2020.
//

import SwiftUI
import Foundation

struct ImageLoader: View {
    private enum LoadState {
        case loading, success, failure
    }
    
    private class Loader: ObservableObject {
        var data = Data()
        var state = LoadState.loading
        
        init(pokemonName: String) {
            
            let parsedName = pokemonName.lowercased()
                .replacingOccurrences(of: "♀", with: "-f")
                .replacingOccurrences(of: "♂", with: "-m")
                .replacingOccurrences(of: ".", with: "-")
                .replacingOccurrences(of: "'", with: "")
                .replacingOccurrences(of: " ", with: "")
                .folding(options: .diacriticInsensitive, locale: .current)
            
            guard let parsedURL = URL(string: "http://img.pokemondb.net/artwork/\(parsedName).jpg") else {
                fatalError("Invalid URL: \("http://img.pokemondb.net/artwork/\(parsedName).jpg")")
            }
            print("url: \(parsedURL)")
            URLSession.shared.dataTask(with: parsedURL) { (data, response, error) in
                
                if let data = data, data.count > 0 {
                    self.data = data
                    self.state = .success
                } else {
                    self.state = .failure
                }
                
                DispatchQueue.main.async {
                    self.objectWillChange.send()
                }
            }
            .resume()
        }
    }
    
    @StateObject private var loader: Loader
    
    var loading: Image
    var failure: Image
    
    var body: some View{
        selectImage()
    }
    
    init(nombrePokmon: String, loading: Image = Image(systemName: "photo"), failure: Image = Image(systemName: "multiply.circle")) {
        _loader = StateObject(wrappedValue: Loader(pokemonName: nombrePokmon))
        self.loading = loading
        self.failure = failure
    }
    
    private func selectImage() -> Image{
        switch loader.state {
        case .loading:
            return loading
        case .failure:
            return failure
        default:
            if let image = UIImage(data: loader.data) {
                return Image(uiImage: image)
                    .resizable()
            } else {
                return failure
            }
        }
    }
}


