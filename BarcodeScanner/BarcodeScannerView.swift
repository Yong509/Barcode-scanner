//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by Yong on 18/12/2566 BE.
//

import SwiftUI


struct AlertItem: Identifiable{
    let id = UUID()
    let title: String
    let message: String
    let dismissButton: Alert.Button
    
}

struct AlertContext{
    static let invalidDeviceInput = AlertItem(title: "Invalid Device Input", 
                                              message: "Something wrong with camera",
                                              dismissButton: .default(Text("Ok")))
    static let invalidScanType = AlertItem(title: "Invalid Scan Type",
                                           message: "The value scan is not valid.",
                                           dismissButton: .default(Text("Ok")))
}


struct BarcodeScannerView: View {
    @State private var scannedCode = ""
    @State private var alertItem: AlertItem?
    var body: some View {
        NavigationView{
            VStack{
                ScannerView(scannedCode: $scannedCode,
                            alertItem: $alertItem
                ).frame(
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
            .alert(item: $alertItem){
                alertItem in Alert(title: Text(alertItem.title), message: Text(alertItem.message), dismissButton: alertItem.dismissButton)
            }
        }
    }
}

#Preview {
    BarcodeScannerView()
}
