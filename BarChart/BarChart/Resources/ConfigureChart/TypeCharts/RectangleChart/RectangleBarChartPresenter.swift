//
//  RectangleBarChartPresenter.swift
//  BarChart
//
//  Created by Krasivo on 21.08.2022.
//

import Foundation
import CoreGraphics.CGGeometry

class RectangleBarChartPresenter {
    /// the width of each bar
    let barWidth: CGFloat
    
    /// the space between bars
    let space: CGFloat
    
    /// space at the bottom of the bar to show the title
    private let bottomSpace: CGFloat = 40.0
    
    /// space at the top of each bar to show the value
    private let topSpace: CGFloat = 40.0
    
    var dataEntries: [DataEntry] = []
    
    init(barWidth: CGFloat = 40, space: CGFloat = 20) {
        self.barWidth = barWidth
        self.space = space
    }
    
    func computeContentWidth() -> CGFloat {
        return (barWidth + space) * CGFloat(dataEntries.count) + space
    }
    
    func computeBarEntries(viewHeight: CGFloat) -> [RectangleBarEntry] {
        var result: [RectangleBarEntry] = []
        
        for (index, entry) in dataEntries.enumerated() {
            let entryHeight = CGFloat(entry.height) * (viewHeight - bottomSpace - topSpace)
            let xPosition: CGFloat = space + CGFloat(index) * (barWidth + space)
            let yPosition = viewHeight - bottomSpace - entryHeight
            let origin = CGPoint(x: xPosition, y: yPosition)
            
            let barEntry = RectangleBarEntry(origin: origin, barWidth: barWidth, barHeight: entryHeight, space: space, data: entry)
            
            result.append(barEntry)
        }
        return result
    }
    
    func computeHorizontalLines(viewHeight: CGFloat) -> [HorizontalLine] {
        var result: [HorizontalLine] = []
        
        let horizontalLineInfos = [
            (value: CGFloat(0.0), isDashed: false),
            (value: CGFloat(0.5), isDashed: true),
            (value: CGFloat(1.0), isDashed: false)
        ]
        
        for lineInfo in horizontalLineInfos {
            let yPosition = viewHeight - bottomSpace -  lineInfo.value * (viewHeight - bottomSpace - topSpace)
            
            let length = self.computeContentWidth()
            let lineSegment = LineSegment(
                startPoint: CGPoint(x: 0, y: yPosition),
                endPoint: CGPoint(x: length, y: yPosition)
            )
            let line = HorizontalLine(
                segment: lineSegment,
                isDashed: lineInfo.isDashed,
                width: 0.5)
            result.append(line)
        }
        
        return result
    }
}
