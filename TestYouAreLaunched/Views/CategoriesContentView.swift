//
//  CategoriesContentView.swift
//  TestYouAreLaunched
//
//  Created by Alex on 25.04.2023.
//

import SwiftUI

struct CategoriesContentView<Content>: View where Content: View {
    
    private let categories: [Category]
    private var font: UIFont
    private let padding: CGFloat
    private let parentWidth: CGFloat
    private let content: (Category?) -> Content
    private var elementsCountByRow: [Int] = []
    
    init(categories: [Category], font: UIFont, padding: CGFloat, parentWidth: CGFloat, content: @escaping (Category?) -> Content) {
        self.categories = categories
        self.font = font
        self.padding = padding
        self.parentWidth = parentWidth
        self.content = content
        self.elementsCountByRow = getElementsCountByRow(parentWidth)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(0 ..< self.elementsCountByRow.count, id: \.self) { rowIndex in
                HStack {
                    ForEach(0 ..< self.elementsCountByRow[rowIndex], id: \.self) { elementIndex in
                        self.content(self.getCategory(elementsCountByRow: self.elementsCountByRow, rowIndex: rowIndex, elementIndex: elementIndex))
                    }
                    Spacer()
                }.padding(.vertical, 4)
            }
        }
    }
    
    private func getElementsCountByRow(_ rowSize: CGFloat) -> [Int] {
        let categoryWidths = self.categories.map ({($0.name ?? "").widthOfString(usingFont: font)})
        
        var currentRowTotalWidth: CGFloat = 0.0
        var currentRowElementsCount: Int = 0
        var result: [Int] = []
        
        for categoryWidth in categoryWidths {
            let fixedCategoryWidth = categoryWidth + (2 * self.padding)
            if currentRowTotalWidth + fixedCategoryWidth <= rowSize {
                currentRowTotalWidth += fixedCategoryWidth
                currentRowElementsCount += 1
                guard result.count != 0 else { result.append(1); continue }
                result[result.count - 1] = currentRowElementsCount
            } else {
                currentRowTotalWidth = fixedCategoryWidth
                currentRowElementsCount = 1
                result.append(1)
            }
        }
        return result
    }
    
    private func getCategory(elementsCountByRow: [Int], rowIndex: Int, elementIndex: Int) -> Category? {
        let sumOfPreviousRows = elementsCountByRow.enumerated().reduce(0) { total, next in
            if next.offset < rowIndex {
                return total + next.element
            } else {
                return total
            }
        }
        let orderedTagsIndex = sumOfPreviousRows + elementIndex
        guard self.categories.count > orderedTagsIndex else { return nil }
        return self.categories[orderedTagsIndex]
    }
}

struct CategoriesContentView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            CategoriesContentView(categories: [
                Category(id: 1, name: "Name", image: nil),
                Category(id: 2, name: "Full name", image: nil),
                Category(id: 3, name: "First name", image: nil),
                Category(id: 4, name: "Last name", image: nil)
            ], font: .systemFont(ofSize: 20, weight: .regular), padding: 10, parentWidth: geometry.size.width) { category in
                CategoryItemRowView(category: category)
            }
            .padding(.all)
        }
    }
}
