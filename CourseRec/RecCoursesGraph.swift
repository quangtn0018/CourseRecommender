//
//  RecCoursesGraph.swift
//  CourseRec
//
//  Created by Quang Nguyen on 3/22/17.
//  Copyright © 2017 Quang Nguyen. All rights reserved.
//

import UIKit

// Recommended Courses Graph
class RecCoursesGraph {
    // TODO
    // create directed graph for cs courses
    
    var recCoursesGraph = UnweightedGraph<Course>()
    
    // MARK: Initialization
    init() {
        initGraph()
    }
    
    func initGraph() {
        var indexFrom: Int
        var indexTo: Int
        
        // add edges for courses with prereq: MATH 1300
        indexFrom = recCoursesGraph.addVertex(Course.CourseConstants.math1300) // vertex 0
        indexTo = recCoursesGraph.addVertex(Course.CourseConstants.cs1160) // vertex 1
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        indexTo = recCoursesGraph.addVertex(Course.CourseConstants.math1304) // vertex 2
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)

        // add edges for courses with prereq: MATH 1304
        indexFrom = indexTo
        indexTo = recCoursesGraph.addVertex(Course.CourseConstants.math2150) // vertex 3
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        indexTo = recCoursesGraph.addVertex(Course.CourseConstants.math1305) // vertex 4
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        // add edges for courses with prereq: MATH 1305
        indexFrom = indexTo
        indexTo = recCoursesGraph.addVertex(Course.CourseConstants.math2304) // vertex 5
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        indexTo = recCoursesGraph.addVertex(Course.CourseConstants.math2101) // vertex 6
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        indexTo = recCoursesGraph.addVertex(Course.CourseConstants.stat3601) // vertex 7
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        // no edges for STAT 3401
        recCoursesGraph.addVertex(Course.CourseConstants.stat3401) // vertex 8
        
        // add edges for courses with prereq: CS 1160
        indexFrom = 1
        indexTo = recCoursesGraph.addVertex(Course.CourseConstants.cs2360) // vertex 9
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        indexTo = recCoursesGraph.addVertex(Course.CourseConstants.cs2430) // vertex 10
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        // add edges for courses with prereq: CS 2360
        indexFrom = 9
        indexTo = recCoursesGraph.addVertex(Course.CourseConstants.cs2370) // vertex 11
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)

        indexTo = recCoursesGraph.addVertex(Course.CourseConstants.cs3560) // vertex 17
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        // add edges for courses with prereq: CS 2360 and CS 2430
        indexFrom = 9
        indexTo = recCoursesGraph.addVertex(Course.CourseConstants.cs3120) // vertex 12
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        indexFrom = 10
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        // add edges for courses with prereq: MATH 2150, CS 2370, CS 2430
        indexFrom = 3
        indexTo = recCoursesGraph.addVertex(Course.CourseConstants.cs3240) // vertex 13
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)

        indexFrom = 11
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)

        indexFrom = 10
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)

        // add edges for courses with prereq: CS 3240
        indexFrom = 13
        indexTo = recCoursesGraph.addVertex(Course.CourseConstants.cs3340) // vertex 14
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        indexTo = recCoursesGraph.addVertex(Course.CourseConstants.cs3520) // vertex 20
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        indexTo = recCoursesGraph.addVertex(Course.CourseConstants.cs4310) // vertex 24
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        indexTo = recCoursesGraph.addVertex(Course.CourseConstants.cs4320) // vertex 26
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        indexTo = recCoursesGraph.addVertex(Course.CourseConstants.cs4660) // vertex 30
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        indexTo = recCoursesGraph.addVertex(Course.CourseConstants.cs4810) // vertex 32
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        // add edges for courses with prereq: MATH 2150, CS 2430
        indexFrom = 3
        indexTo = recCoursesGraph.addVertex(Course.CourseConstants.cs3430) // vertex 15
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        indexFrom = 10
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)

        // add edges for courses with prereq: CS 3240 and CS 3430
        indexFrom = 13
        indexTo = recCoursesGraph.addVertex(Course.CourseConstants.cs4560) // vertex 16
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        indexFrom = 15
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        // add edges for courses with prereq: CS 2370 and CS 3430
        indexFrom = 11
        indexTo = recCoursesGraph.addVertex(Course.CourseConstants.cs3590) // vertex 18
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        indexFrom = 15
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        // add edges for courses with prereq: CS 3240, CS 3560 and CS 3590
        indexFrom = 13
        indexTo = recCoursesGraph.addVertex(Course.CourseConstants.cs4590) // vertex 19
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        indexFrom = 17
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        indexFrom = 18
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        // add edges for courses with prereq: CS 3120, CS 3240
        indexFrom = 12
        indexTo = recCoursesGraph.addVertex(Course.CourseConstants.cs4110) // vertex 21
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        indexFrom = 13
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        // add edges for courses with prereq: MATH 1305, MATH 2101, MATH 2150
        indexFrom = 4
        indexTo = recCoursesGraph.addVertex(Course.CourseConstants.cs4170) // vertex 22
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        indexFrom = 6
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        indexFrom = 3
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        // add edges for courses with prereq: MATH 1305, MATH 2101, CS 3240
        indexFrom = 4
        indexTo = recCoursesGraph.addVertex(Course.CourseConstants.cs4245) // vertex 23
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        indexFrom = 6
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        indexFrom = 13
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        // add edges for courses with prereq: CS 3340, CS 4310
        indexFrom = 14
        indexTo = recCoursesGraph.addVertex(Course.CourseConstants.cs4311) // vertex 25
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        indexFrom = 24
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        // add edges for courses with prereq: CS 3430
        indexFrom = 15
        indexTo = recCoursesGraph.addVertex(Course.CourseConstants.cs4435) // vertex 27
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        // add edges for courses with prereq: CS 3520
        indexFrom = 20
        indexTo = recCoursesGraph.addVertex(Course.CourseConstants.cs4521) // vertex 28
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        // add edges for courses with prereq: CS 3590
        indexFrom = 18
        indexTo = recCoursesGraph.addVertex(Course.CourseConstants.cs4596) // vertex 29
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
        indexTo = recCoursesGraph.addVertex(Course.CourseConstants.cs4525) // vertex 31
        recCoursesGraph.addEdge(from: indexFrom, to: indexTo, directed: true)
        
    }
    
    func getRecCourses(uCourses: [Course]) -> [Course] {
        var dict = [String: Course]()
        var toRtn = [Course]()
        
        for course in uCourses {
            for neighbor in self.recCoursesGraph.neighborsForVertex(course)! {
                dict[neighbor.name] = neighbor
            }
        }
        
        for (_, value) in dict {
            toRtn.append(value)
        }
        
        return toRtn
    }
    
}
