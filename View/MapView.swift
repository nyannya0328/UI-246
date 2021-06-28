//
//  MapView.swift
//  UI-246
//
//  Created by nyannyan0328 on 2021/06/27.
//

import SwiftUI
import MapKit
import CoreLocation
import CoreLocationUI

struct MapView: View {
    
    @StateObject var model = MapViewModel()
    
    var body: some View {
        ZStack(alignment:.bottomTrailing){
            
            
            Map(coordinateRegion: $model.region,showsUserLocation: true,annotationItems: model.coffeeshops,annotationContent: { shop in
                
                
                
                MapMarker(coordinate:shop.item.placemark.coordinate , tint: .green)
                
                
                
            })
                .ignoresSafeArea()
            
            
            LocationButton(.currentLocation){
                
                model.manager.requestLocation()
                
                
                
            }
            .frame(width: 250, height: 50)
            .foregroundColor(.white)
            .symbolVariant(.fill)
            .tint(.red)
            .clipShape(Capsule())
            .shadow(color: .black, radius: 10, x: 5, y: 5)
            
            
        }
        .overlay(
        Text("Coffe shops")
        
            .font(.title.weight(.heavy))
            .foregroundColor(.white)
        
            .frame(maxWidth: .infinity, alignment: .leading)
            
            .padding()
            .background(.ultraThinMaterial)
        
        ,alignment: .top
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

class MapViewModel : NSObject,ObservableObject,CLLocationManagerDelegate{
    
    @Published var region : MKCoordinateRegion = .init()
    
    @Published var manager = CLLocationManager()
    
    @Published var coffeeshops : [Shops] = []
    
    
   override init(){
        
        super.init()
        manager.delegate = self
        
        
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.last?.coordinate else {return}
                region = MKCoordinateRegion(center: location, latitudinalMeters: 1000, longitudinalMeters: 1000)
                
                
                async{
                    
                    await fetchCoffeeShops()
                }
                
                
                
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    func fetchCoffeeShops()async{
        
        do{
            
            let request = MKLocalSearch.Request()
            request.region = region
            request.naturalLanguageQuery = "STAR"
            
            let query = MKLocalSearch(request: request)
            
            let responce = try await query.start()
            
            
            await MainActor.run{
                
                
                
                self.coffeeshops = responce.mapItems.compactMap({ item in
                  return  Shops(item: item)
                })
                
            }
            
            
        }
        
        catch{
            
            
            
        }
        
    }
    
    
}

struct Shops : Identifiable{
    
    var id = UUID().uuidString
    var item : MKMapItem
    
}


