//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by Yong on 18/12/2566 BE.
//

import SwiftUI

struct BarcodeScannerView: View {
    @State private var scannedCode = ""
    
    var body: some View {
        NavigationView{
            VStack{
                ScannerView(scannedCode: $scannedCode)
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: 300
                    )
                
                Spacer().frame(height: 60)
                
                Label("Scan barcode", systemImage: "barcode.viewfinder")
                    .font(.title)
                
                Text(scannedCode.isEmpty ? "Not yet scanned" : scannedCode)
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(scannedCode.isEmpty ? .red : .green)
                    .padding()
            }
            .navigationTitle("Barcode Scanner")
        }
    }
}

#Preview {
    BarcodeScannerView()
}
