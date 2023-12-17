import SwiftUI

struct StoresContainerView: View {
    
    let title = "Lojas"
    
    @State private var ratingFilter = 0
    
    var stores: [StoreType]
    
    var filteredStores: [StoreType] {
        return stores.filter { store in
            store.stars >= ratingFilter
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Text(title).font(.headline)
                Spacer()
                Menu("Filtrar"){
                    Button{
                        ratingFilter = 0
                    } label: {
                        Text("Limpar")
                    }
                    Divider()
                    ForEach(1...5, id: \.self){ rating in
                        Button{
                            ratingFilter = rating
                            
                        } label:{
                            if rating>1{
                                Text("\(rating) estrelas ou mais")
                            } else{
                                Text("\(rating) estrela ou mais")
                            }
                        }
                        
                    }
                        
                }
            }
            
            VStack(alignment: .leading, spacing: 30){
                if filteredStores.isEmpty{
                    Text("Nenhum resultado encontrado")
                        .font(.title2)
                        .bold()
                        .foregroundStyle(Color("ColorRed"))
                        .padding(.vertical, 32)
                        .frame(maxWidth: .infinity)
                } else{
                    ForEach(filteredStores) {
                        mock in
                        NavigationLink{
                            StoreDetailView(store: mock)
                        } label: {
                            StoreItemView(store: mock)
                        }
                    }
                }
                
            }
            .foregroundStyle(.black)
            
        }
        .padding(20)
        
    }
}

struct StoresContainer_Preview: PreviewProvider{
    static var previews: some View{
        StoresContainerView(stores: storesMock).previewLayout(.sizeThatFits)
    }
}
