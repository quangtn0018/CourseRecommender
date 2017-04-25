//
//  Course.swift
//  CourseRec
//
//  Created by Quang Nguyen on 3/21/17.
//  Copyright © 2017 Quang Nguyen. All rights reserved.
//

import UIKit

class Course: NSObject {
    
    // MARK : Override
    // for indexOf array function
    override func isEqual(_ object: Any?) -> Bool {
        if let other = object as? Course {
            return self.name == other.name
        } else {
            return false
        }
    }
    
    // MARK: Struct
    struct CourseConstants {
        static let math1300 = Course(name: "MATH 1300", title: "Trigonometry and Analytic Geometry", descript: "Definitions, properties and graphs of the trigonometric functions. Applications. Analytic geometry of conic sections. A preparatory course for calculus.", prereq: "MATH 1130 or departmental permission. Must complete course with a grade of “C-” or better in order to earn General Education, Area B4, credit", units: "4")!
        static let math1304 = Course(name: "MATH 1304", title: "Calculus I", descript: "Differential calculus. Limits and continuity. Exponential and logarithmic functions. Techniques and applications of differentiation.", prereq: "MATH 1300 or departmental permission. Must complete course with a grade of “C-” or better in order to earn General Education, Area B4, credit", units: "4")!
        static let math1305 = Course(name: "MATH 1305", title: "Calculus II", descript: "Integral calculus. The indefinite integral, area, the Fundamental Theorem and techniques of integration. Applications to volume, arc length, physical and biological problems.", prereq: "MATH 1304", units: "4")!
        static let math2304 = Course(name: "MATH 2304", title: "Calculus III", descript: "Infinite series, convergence of power series. Vectors in space. Partial derivatives, chain rule, directional derivative and gradient. Curves and surfaces. Maxima and minima. Multiple integrals.", prereq: "MATH 1305", units: "4")!
        static let math2150 = Course(name: "MATH 2150", title: "Discrete Structures", descript: "Topics in discrete mathematics. Elementary logic, set theory, and relations; induction, enumeration techniques, recurrence relations, trees and graphs. Boolean algebra, algorithm analysis.", prereq: "MATH 1304", units: "4")!
        static let  math2101 = Course(name: "MATH 2101", title: "Elements of Linear Algebra", descript: "Vector spaces, linear transformations, matrices, systems of linear equations. Stress on 2 and 3 dimensions, including geometric and other applications.", prereq: "MATH 1305", units: "4")!
        static let stat3601 = Course(name: "STAT 3601", title: "Statistics and Probability for Science and Engineering I", descript: "Basic probability rules (independence, Bayes’ Theorem), distributions (binomial, Poisson, normal, exponential), reliability. Descriptive, inferential statistics (control charts, estimation, hypothesis testing: one, two samples), correlation, regression. Emphasizes: computer analysis, simulation; science, engineering applications.", prereq: "MATH 1305", units: "4")!
        static let stat3401 = Course(name: "STAT 3401", title: "Introduction to Probability Theory I", descript: "The theory of probability with applications to science and engineering. Sample spaces; random variables; joint, marginal, conditional distributions; expectations; important distributions (binomial, Poisson, normal, etc.); and moment generating functions.", prereq: "NONE", units: "4")!
        
        
        static let cs1160 = Course(name: "CS 1160", title: "Introduction to Computer Science I", descript: "An introduction to computers and computer science, problem solving, algorithms, and program design. Use of Interactive Development Environment (IDE’s). Programming in C++. Topics include input and output, text files, control structures, functions, arrays. Students with no computer experience are encouraged to take CS 1020 as preparation for this course.", prereq: "MATH 1300 or equivalent", units: "4")!
        static let cs2360 = Course(name: "CS 2360", title: "Introduction to Computer Science II", descript: "Continuation of CS 1160. Focuses on algorithm development, structured program design, testing, and debugging. Topics include abstract data types, pointers, linked lists, recursion. Introduction to classes.", prereq: "CS 1160", units: "4")!
        static let cs2370 = Course(name: "CS 2370", title: "Introduction to Computer Science III", descript: "Continuation of CS 2360. Further development of programming and problem solving skills in Computer Science. Topics include elementary data structures (stacks and queues), object oriented design, and more on searching, sorting and other algorithms.", prereq: "CS 2360", units: "4")!
        static let cs2430 = Course(name: "CS 2430", title: "Computer Organization and Assembly Language Programming", descript: "Functional organization of digital computers and programming in machine and assembly language. Internal representation of data, binary arithmetic, machine instructions, addressing modes, subroutine linkage, macros. Introduction to assemblers, linkers, and loaders.", prereq: "An introductory programming course", units: "4")!
        static let cs3120 = Course(name: "CS 3120", title: "Programming Language Concepts", descript: "Survey and critical comparison of a variety of computer languages. Issues include syntax, semantics, control structures, data representation. Discussion of both design and implementation; of both imperative and declarative languages.", prereq: "CS 2360 and CS 2430", units: "4")!
        static let cs3240 = Course(name: "CS 3240", title: "Data Structures and Algorithms", descript: "Definition, design, implementation of abstract data structures, including hash tables, trees, graphs. Design, implementation, and analysis of algorithms for these data structures.", prereq: "MATH 2150, CS 2370, CS 2430", units: "4")!
        static let cs3340 = Course(name: "CS 3340", title: "Introduction to Object-Oriented Programming and Design", descript: "Programming in an object-oriented language, using object-oriented techniques and concepts. Classes, operator overloading, information hiding, inheritance, and polymorphism. Memory management. Parameterized classes. Exception handling. Object-oriented design of programs.", prereq: "CS 3240", units: "4")!
        static let cs3430 = Course(name: "CS 3430", title: "Computer Architecture", descript: "Logical design of digital computers. Boolean algebra, combinational and sequential circuits, computer arithmetic, memories, integrated circuits, control processors, input/output. No electronics experience needed.", prereq: "MATH 2150, CS 2430", units: "4")!
        static let cs4560 = Course(name: "CS 4560", title: "Operating Systems", descript: "Principles of operating system design and implementation. Concurrent processes, interprocess communication, job and process scheduling; deadlock. Issues in memory management (virtual memory, segmentation, paging) and auxiliary storage management (file systems, directory structuring, protection mechanisms). Performance issues. Case studies.", prereq: "CS 3240 and CS 3430", units: "4")!
        static let cs3560 = Course(name: "CS 3560", title: "Introduction to Systems Programming", descript: "Introduction to systems programming in a modern environment. Introduction to fundamental concepts of operating systems; analysis of a particular operating system (organization, interfaces, system calls, files, process control and communication, resource sharing). Shell and C programming. Development tools.", prereq: "CS 2360", units: "4")!
        static let cs3590 = Course(name: "CS 3590", title: "Data Communications and Networking", descript: "Fundamentals of data communications: media, transmission, encoding and processing, interfacing, error detection and handling, link control, multiplexing, circuit and packet switching. Introduction to network architecture and topology: local and wide area networks", prereq: "CS 2370 and CS 3430", units: "4")!
        static let cs4590 = Course(name: "CS 4590", title: "Computer Networks", descript: "Computer network analysis, design, and implementation. A detailed study of the network, transport and application layers of the TCP/IP model. Specific emphasis on protocols, services, design issues and performance. Programming assignments using TCP/IP.", prereq: "CS 3240, CS 3560 and CS 3590", units: "4")!
        static let cs3520 = Course(name: "CS 3520", title: "Web Site Development", descript: "Web servers and browsers. HTML, images, audio and video files, indexer, forms, CGI scripts, Java programming, JavaScript.", prereq: "CS 3240", units: "4")!
        static let cs4110 = Course(name: "CS 4110", title: "Compiler Design", descript: "Design and construction of high-level language translators. Formal language theory, parsing algorithms, interpreting, code generation, optimization. Construction of a small compiler.", prereq: "CS 3120, CS 3240", units: "4")!
        static let cs4170 = Course(name: "CS 4170", title: "Theory of Automata", descript: "Formal models of automata, language, and computability and their relationships. Finite automata and regular languages. Pushdown automata and context-free languages. Turing machines, recursive functions, algorithms and decidability.", prereq: "MATH 1305, MATH 2101, MATH 2150", units: "4")!
        static let cs4245 = Course(name: "CS 4245", title: "Analysis of Algorithms", descript: "Design, analysis and implementation of algorithms. Methods of algorithm design, including recursion, divide and conquer, dynamic programming, backtracking. Time and space complexity analyses in the best, worst, and average cases. NP-completeness; computationally hard problems. Applications from several areas of Computer Science.", prereq: "MATH 1305, MATH 2101, CS 3240", units: "4")!
        static let cs4310 = Course(name: "CS 4310", title: "Software Engineering", descript: "Concepts and issues in the development of large software projects. Systematic approaches to requirements, analysis, design, implementation, testing, and maintenance of high-quality software.", prereq: "CS 3240", units: "4")!
        static let cs4311 = Course(name: "CS 4311", title: "Software Engineering II", descript: "Continuation of Software Engineering I with emphasis on the object-oriented design to implementation stages of the life cycle. Design methodologies including the Unified Modeling Language, illustrated with example design patterns. Implementation in Java. Topics include standards, documentation, instrumentation, testing.", prereq: "CS 3340, CS 4310", units: "4")!
        static let cs4320 = Course(name: "CS 4320", title: "Software Testing and Quality Assurance", descript: "Concepts and issues in the testing and quality control of large software projects. Topics include white box, black box, unit, integration, and validation testing; quality assurance through planning, review, and use of software metrics.", prereq: "CS 3240", units: "4")!
        static let cs4435 = Course(name: "CS 4435", title: "Computer Architecture II", descript: "Advanced computer organization and design. Topics chosen from among RISC architectures, computer arithmetic, pipelining, cache memory and parallel processors. Recommended prerequisite: knowledge of C programming. ", prereq: "CS 3430", units: "4")!
        static let cs4521 = Course(name: "CS 4521", title: "Mobile & Topics in Web Programming", descript: "Current practices and trends in software design, development, and deployment of mobile and new web applications and systems. Topics include modern mobile device application development, web technologies, social application development, pervasive computing and semantic web.", prereq: "CS 3520", units: "4")!
        static let cs4596 = Course(name: "CS 4596", title: "Wireless and Mobile Networking", descript: "Network protocols and mechanisms to support mobility, e.g., Mobile-IP, M-RSVP, proxies. Issues including routing, tunneling, security, and handoffs. Wireless communication standards including AMPS, IS-95, GSM, PCS, and satellite standards. Underlying technologies including multiplexing and coding.", prereq: "CS 3590", units: "4")!
        static let cs4660 = Course(name: "CS 4660", title: "Database Architecture", descript: "Relational, network, and hierarchical data models. Data description and data manipulation languages. Schemas, query processing, database system architecture. Integrity, concurrency, and security techniques. Distributed databases.", prereq: "CS 3240", units: "4")!
        static let cs4525 = Course(name: "CS 4525", title: "Principles of Network Security", descript: "Computer network security fundamentals. Cryptography (Symmetric key algorithms and Public key algorithms). Authentication and identification, message integrity techniques. Access control and key management. Wireless security. Discussion of particular protocols, e.g., IPSEC, TLS, PGP, S/MIME, etc.", prereq: "CS 3590", units: "4")!
        static let cs4810 = Course(name: "CS 4810", title: "Artificial Intelligence", descript: "“Intelligent” computer programs and models of human intelligence. Game playing, robotics, computer vision, understanding natural language, knowledge engineering, computer learning.", prereq: "CS 3240", units: "4")!
    }
    
    // MARK: Constants
    
    
    
    // MARK: Properties
    // name consists of department abbrev and course #
    // ex: CS 4810
    var name: String, title: String, descript: String, prereq: String, units: String
    var selectedForAdding: Bool = false
    
    // MARK: Initialization
    override init() {
        name = ""
        title = ""
        descript = ""
        prereq = ""
        units = ""
    }
    
    init?(name: String, title: String, descript: String, prereq: String, units: String) {
        
        if name.isEmpty || title.isEmpty {
            return nil
        }

        self.name = name
        self.title = title
        self.descript = descript
        self.prereq = prereq
        self.units = units
    }
    
    static func generateCSCoursesArray() -> [Course] {
        var result = [Course]()
        
        result = [
            CourseConstants.math1300,
            CourseConstants.math1304,
            CourseConstants.math1305,
            CourseConstants.math2304,
            CourseConstants.math2150,
            CourseConstants.math2101,
            CourseConstants.stat3601,
            CourseConstants.stat3401,
            CourseConstants.cs1160,
            CourseConstants.cs2360,
            CourseConstants.cs2370,
            CourseConstants.cs2430,
            CourseConstants.cs3120,
            CourseConstants.cs3240,
            CourseConstants.cs3340,
            CourseConstants.cs3430,
            CourseConstants.cs4560,
            CourseConstants.cs3560,
            CourseConstants.cs3590,
            CourseConstants.cs4590,
            CourseConstants.cs3520,
            CourseConstants.cs4110,
            CourseConstants.cs4170,
            CourseConstants.cs4245,
            CourseConstants.cs4310,
            CourseConstants.cs4311,
            CourseConstants.cs4320,
            CourseConstants.cs4435,
            CourseConstants.cs4521,
            CourseConstants.cs4596,
            CourseConstants.cs4660,
            CourseConstants.cs4525,
            CourseConstants.cs4810
            // add more
        ]
    
        return result
    }
    
    static func generateCSCoursesDictionary() -> [String: Course] {
        var result: [String: Course] = [:]
        
        result = [
            "MATH 1300": CourseConstants.math1300,
            "MATH 1304": CourseConstants.math1304,
            "MATH 1305": CourseConstants.math1305,
            "MATH 2304": CourseConstants.math2304,
            "MATH 2150": CourseConstants.math2150,
            "MATH 2101": CourseConstants.math2101,
            "STAT 3601": CourseConstants.stat3601,
            "STAT 3401": CourseConstants.stat3401,
            "CS 1160": CourseConstants.cs1160,
            "CS 2360": CourseConstants.cs2360,
            "CS 2370": CourseConstants.cs2370,
            "CS 2430": CourseConstants.cs2430,
            "CS 3120": CourseConstants.cs3120,
            "CS 3240": CourseConstants.cs3240,
            "CS 3340": CourseConstants.cs3340,
            "CS 3430": CourseConstants.cs3430,
            "CS 4560": CourseConstants.cs4560,
            "CS 3560": CourseConstants.cs3560,
            "CS 3590": CourseConstants.cs3590,
            "CS 4590": CourseConstants.cs4590,
            "CS 3520": CourseConstants.cs3520,
            "CS 4110": CourseConstants.cs4110,
            "CS 4170": CourseConstants.cs4170,
            "CS 4245": CourseConstants.cs4245,
            "CS 4310": CourseConstants.cs4310,
            "CS 4311": CourseConstants.cs4311,
            "CS 4320": CourseConstants.cs4320,
            "CS 4435": CourseConstants.cs4435,
            "CS 4521": CourseConstants.cs4521,
            "CS 4596": CourseConstants.cs4596,
            "CS 4660": CourseConstants.cs4660,
            "CS 4525": CourseConstants.cs4525,
            "CS 4810": CourseConstants.cs4810
            // add more
        ]
        
        return result
    }
    
}
