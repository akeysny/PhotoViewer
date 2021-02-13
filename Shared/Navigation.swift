//
//  Navigation.swift
//  PhotoViewer
//
//  Created by Anna Taylor on 2/13/21.
//

import SwiftUI

struct Navigation: View {
    
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    
    @ViewBuilder var body: some View {
        if horizontalSizeClass == .compact {
            AppTabNavigation()
        }else{
            AppSideBarNavigation()
        }
     
    }
}

struct Navigation_Previews: PreviewProvider {
    static var previews: some View {
        Navigation()
    }
}
