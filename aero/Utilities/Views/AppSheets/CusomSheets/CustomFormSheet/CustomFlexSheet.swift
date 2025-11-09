//
//  CustomFlexSheet.swift
//  taillog
//
//  Created by Shubham Tiwari on 10/12/24.
//

import SwiftUI

class ModalHostingController<Content>: UIHostingController<Content>, UIPopoverPresentationControllerDelegate where Content : View {
    
    var onDismiss: (() -> Void)
    
    required init?(coder: NSCoder) { fatalError("") }
    
    init(onDismiss: @escaping () -> Void, rootView: Content) {
        self.onDismiss = onDismiss
        super.init(rootView: rootView)

        preferredContentSize = CGSize(width: Dimensions.flexSheetWidth, height: Dimensions.flexSheetHeight)
        
        modalPresentationStyle = .formSheet
        presentationController?.delegate = self
    }
    
    func presentationControllerWillDismiss(_ presentationController: UIPresentationController) {
        print("modal dismiss")
        onDismiss()
    }
}

class ModalViewController<Content: View>: UIViewController {
    var isPresented: Bool
    var content: () -> Content
    var onDismiss: (() -> Void)
    private var hostVC: ModalHostingController<Content>
    
    private var isViewDidAppear = false
    
    required init?(coder: NSCoder) { fatalError("") }
    
    init(isPresented: Bool = false, onDismiss: @escaping () -> Void, content: @escaping () -> Content) {
        self.isPresented = isPresented
        self.onDismiss = onDismiss
        self.content = content
        self.hostVC = ModalHostingController(onDismiss: onDismiss, rootView: content())
        super.init(nibName: nil, bundle: nil)
    }
    
    func show() {
        guard isViewDidAppear else { return }
        self.hostVC = ModalHostingController(onDismiss: onDismiss, rootView: content())
        present(hostVC, animated: true)
    }
    
    func hide() {
        guard !hostVC.isBeingDismissed else { return }
        dismiss(animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        isViewDidAppear = true
        if isPresented {
            show()
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        isViewDidAppear = false
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        show()
    }
}

struct CustomFlexSheet<Content: View> : UIViewControllerRepresentable {
    
    @Binding var show: Bool
    
    let content: () -> Content
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<CustomFlexSheet<Content>>) -> ModalViewController<Content> {
    
        let onDismiss = {
            self.show = false
        }
        
        let vc = ModalViewController(isPresented: show, onDismiss: onDismiss, content: content)
        return vc
    }
    
    func updateUIViewController(_ uiViewController: ModalViewController<Content>,
                                context: UIViewControllerRepresentableContext<CustomFlexSheet<Content>>) {
        if show {
            uiViewController.show()
        }
        else {
            uiViewController.hide()
        }
    }
}
