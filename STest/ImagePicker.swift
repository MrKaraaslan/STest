//
//  ImagePicker.swift
//  STest
//
//  Created by Mehmet Karaaslan on 8.04.2020.
//  Copyright © 2020 Mehmet Karaaslan. All rights reserved.
//

import SwiftUI

struct CaptureImageView {

    // MARK:  properties
    @Binding var isShown: Bool
    @Binding var image: Image?
    @Binding var useCamera: Bool

    func makeCoordinator() -> Coordinator {
        return Coordinator(isShown: $isShown, image: $image)
    }
}

extension CaptureImageView: UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<CaptureImageView>) -> UIImagePickerController {
        
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        if useCamera {
            picker.sourceType = .camera
        }
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController,
    context: UIViewControllerRepresentableContext<CaptureImageView>) {

    }
}


class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @Binding var isCoordinatorShown: Bool
    @Binding var imageInCoordinator: Image?

    init(isShown: Binding<Bool>, image: Binding<Image?>) {
        _isCoordinatorShown = isShown
        _imageInCoordinator = image
    }

    func imagePickerController(_ picker: UIImagePickerController,
    didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let unwrapImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        imageInCoordinator = Image(uiImage: unwrapImage)
        isCoordinatorShown = false
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isCoordinatorShown = false
    }
}
