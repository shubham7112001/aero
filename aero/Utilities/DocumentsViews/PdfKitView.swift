//
//  PdfViewer.swift
//  taillog
//
//  Created by Shubham Tiwari on 24/09/24.
//

import SwiftUI
import PDFKit

struct PdfKitView: UIViewRepresentable {
    var filePath: String
    var rotationAngle: CGFloat;
    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.autoScales = true

        if let document = PDFDocument(url: URL(fileURLWithPath: filePath)) {
            pdfView.document = document
            pdfView.displayMode = .singlePage
            pdfView.displayDirection = .horizontal
            pdfView.usePageViewController(true)
            
            
        }

        return pdfView
    }

    func updateUIView(_ uiView: PDFView, context: Context) {

        if let document = PDFDocument(url: URL(fileURLWithPath: filePath)) {
            uiView.document = document
        }
        
        uiView.transform = CGAffineTransform(rotationAngle: rotationAngle)
    }
}

#Preview {
    PdfKitView(filePath: MockDataFile.samplePdf,rotationAngle: 0.0)
}
