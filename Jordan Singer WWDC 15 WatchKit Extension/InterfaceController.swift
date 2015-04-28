//
//  InterfaceController.swift
//  Jordan Singer WWDC 15 WatchKit Extension
//
//  Created by Jordan Singer on 4/26/15.
//  Copyright (c) 2015 Jordan Singer. All rights reserved.
//

import WatchKit
import Foundation

class TitleRow: NSObject {
    @IBOutlet weak var titleLabel: WKInterfaceLabel!
}

class InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var titleTable: WKInterfaceTable!
    
    var cells: [(String, String, String, String)] = [
        // [title, home icon, description, detail icon]
        ("Jordan Singer", "avatar.png", "I'm Jordan, an interface designer and software engineer from Scottsdale, Arizona. I build my ideas. I started Shipp and work on Represent, Overboard and more. I'm 19 years young and currently attend the University of Arizona studying Computer Science as a sophomore. I serve as Creative Director for both InnovateUA and Hack Arizona on campus and am actively involved in bringing startups and the entrepreneurial spirit to Tucson, Arizona.", "avatar-large.png"),
        ("InnovateUA", "innovateua.png", "I am Creative Director of InnovateUA, an iniative at the University of Arizona, which is fostering a student-led culture of innovation and entrepreneurship. We hold five initiaves throughout the year (Hack Arizona, Accelerator, Startup Weekend, 1000 Pitches and Innovation Space), inviting newcomers to get involved with building their ideas.", "innovateua-large.png"),
        ("Hack Arizona", "hackarizona.png", "I am Creative Director for Hack Arizona, the largest hackathon in the Southwest. We held our first event this past March with much success, seeing 400+ students from different universities across the US. It was incredible to foster the creativity and energy during the event, and see dreams become reality with all of the hacks that were created.", "hackarizona-large.png"),
        ("Shipp", "shipp.png", "Shipp is a small team of talented designers and developers who execute. Started in February of 2013, Shipp has released a total of 10 projects: a combination of apps, services and open-source plugins. We're comprised of Jeremy Goldberg, a Product Designer at Facebook, and Brandon Jacoby, a freshman at Ohio State University.", "shipp-large.png"),
        ("Represent", "represent.png", "A better way to résumé. Represent was inspired by a book read in February of 2013 to build a project as quickly as you can. A designer and I went from concept to launch in just 8 days. It is now home to over 3,000 résumés. We've partnered with Harvard University in an effort to impact the lives of students.", "represent-large.png"),
        ("WWDC 2014", "wwdc.png", "I was awarded a WWDC Student Scholarship in 2014. It was an incredible experience to meet such young and talented developers who I got the chance to learn so much from. Being in the audience for a Keynote is irreplaceable. The energy and vibe at Moscone West in San Francisco is so uplifting and mind-blowing. You're surrounded by great minds at any given moment, and you take away so much to apply to your own work and skills.", "wwdc-large.png"),
        ("Overboard", "overboard.png", "Overboard is an overview of the things you want to keep track of. It combines all of the things you monitor on a daily basis, including weather, stock prices, breaking news, sports scores and more. In the future, you'll be able to monitor anything you can imagine, from the number of users your startup has, to the daily revenue that your enterprise company generates.", "overboard-large.png"),
        ("Whistl", "whistl.png", "Whistl helps you discover great deals by connecting you with nearby restaurants. For free. Started in March of 2013, Whistl went from concept to reality in just two months. Whistl is now home to more than 1,500 deals and 300+ restaurants in Arizona.", "whistl-large.png"),
        ("Peek", "peek.png", "Face to face conversations aren’t saved. Why should your text messages be? In June of 2013, our team of five worked days on end to ship Peek in October. To this day, over 100,000 messages have been sent along with 275,000+ push notications delivered.", "peek-large.png"),
        ("Haggle", "haggle.png", "Haggle is the best way to buy & sell things near you. Buyers find things closest to them and sellers get interest from people nearby. For buyers, finding things nearby has never been easier, and selling an item to someone who is near you is an incredible experience.", "haggle-large.png"),
        ("Bonfire", "bonfire.png", "Bonfire is the easiest way to stay up to date with people around you. Anonymously, safely and securely share updates and see what's happening near you. Get info when you need it, where you need it.", "bonfire-large.png"),
        ("BullyBox", "bullybox.png", "BullyBox is designed to allow students to anonymously report acts of bullying without becoming directly involved in the incident. When you send a report on the app, it is automatically sent to your school's designated administrator. This way, adults can stop the problem, and nobody can know that you sent in the report, being 100% anonymous.", "bullybox-large.png"),
        ("Trickle", "trickle.png", "Trickle is a fun, addicting new game for iPhone. The object of the game is simple: only tap the dots corresponding to the color of the bar on the top of the screen. If you tap another color, the game is over. As you continue to tap the dots, the faster the dots fall and the more dots appear on the screen.", "trickle-large.png")
    ]
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        loadTable()
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    // custom
    
    func loadTable() {
        if titleTable.numberOfRows != cells.count {
            titleTable.setNumberOfRows(cells.count, withRowType: "TitleRow")
        }
        for (index, title) in enumerate(cells) {
            if let row = titleTable.rowControllerAtIndex(index) as? TitleRow {
                row.titleLabel.setText(cells[index].0)
            }
        }
    }
    
    override func contextForSegueWithIdentifier(segueIdentifier: String,
        inTable table: WKInterfaceTable, rowIndex: Int) -> AnyObject? {
        let cell = cells[rowIndex].2
        return cell
    }

}
