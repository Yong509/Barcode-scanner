//
//  ScannerView.swift
//  BarcodeScanner
//
//  Created by Yong on 18/12/2566 BE.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    
    @Binding var scannedCode: String
    @Binding var alertItem: AlertItem?
    func makeCoordinator() -> Coordinator {
        Coordinator(scannerView: self)
    }
    
    func makeUIViewController(context: Context) -> ScannerVC {
        ScannerVC(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {}
    
    
    final class Coordinator: NSObject, ScannerVCDelegate{
        private let scannerView: ScannerView
        
        init(scannerView: ScannerView){
            self.scannerView = scannerView
        }
        func didFind(barcode: String) {
            scannerView.scannedCode = barcode
            print(barcode)
        }
        
        func didSurface(error: CameraError) {
            switch error{
            case .invalidDeviceInput:
                scannerView.alertItem = AlertContext.invalidDeviceInput
            case .invalidScannerValue:
                scannerView.alertItem = AlertContext.invalidScanType
            }
        }
        
    }
    

    
}

//#Preview {
//    ScannerView(scannedCode: .constant("123456"))
//}
