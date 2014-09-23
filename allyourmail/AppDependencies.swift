//
//  AppDependencies.swift
//  allyourmail
//
//  Created by Laura Skelton on 9/23/14.
//  Copyright (c) 2014 skelovenko. All rights reserved.
//

import Foundation
import UIKit

class AppDependencies {
    var inboxWireframe = InboxWireframe()
    
    init() {
        configureDependencies()
    }
    
    func installRootViewControllerIntoWindow(window: UIWindow) {
        inboxWireframe.presentInboxInterfaceFromWindow(window)
    }
    
    func configureDependencies() {
        let coreDataStore = CoreDataStore()
        let rootWireframe = RootWireframe()
        
        let inboxPresenter = InboxPresenter()
        let inboxDataManager = InboxDataManager()
        let inboxInteractor = InboxInteractor(dataManager: inboxDataManager)
        
        inboxInteractor.output = inboxPresenter
        
        inboxPresenter.inboxInteractor = inboxInteractor
        inboxPresenter.inboxWireframe = inboxWireframe
        
        inboxWireframe.inboxPresenter = inboxPresenter
        inboxWireframe.rootWireframe = rootWireframe
        
        inboxDataManager.coreDataStore = coreDataStore
        
//        
//        let copyManager = CopyManager()
//        copyManager.dataStore = coreDataStore
//        copyManager.saveNewEntry("Jules", subject: "Thanks!", message: "The poor fellow really felt sad when—melancholy reminiscence of his youth!—he donned his costume, adorned with vari-coloured wings, and fastened to his natural feature a false nose six feet long. But he cheered up when he thought that this nose was winning him something to eat.")
//        copyManager.saveNewEntry("Jules", subject: "This weekend", message: "He went upon the stage, and took his place beside the rest who were to compose the base of the Car of Juggernaut. They all stretched themselves on the floor, their noses pointing to the ceiling. A second group of artists disposed themselves on these long appendages, then a third above these, then a fourth, until a human monument reaching to the very cornices of the theatre soon arose on top of the noses. This elicited loud applause, in the midst of which the orchestra was just striking up a deafening air, when the pyramid tottered, the balance was lost, one of the lower noses vanished from the pyramid, and the human monument was shattered like a castle built of cards!")
//        copyManager.saveNewEntry("Wells", subject: "Friday night poker", message: "But varied as its composition was, certain things all that host had in common. There were fear and pain on their faces, and fear behind them. A tumult up the road, a quarrel for a place in a waggon, sent the whole host of them quickening their pace; even a man so scared and broken that his knees bent under him was galvanised for a moment into renewed activity. The heat and dust had already been at work upon this multitude. Their skins were dry, their lips black and cracked. They were all thirsty, weary, and footsore. And amid the various cries one heard disputes, reproaches, groans of weariness and fatigue; the voices of most of them were hoarse and weak.")
//        copyManager.saveNewEntry("Alice", subject: "Quick question", message: "As quickly as possible I gained my feet and backing against the wall I witnessed such a battle as it is vouchsafed few beings to see. The strength, agility, and blind ferocity of these two creatures is approached by nothing known to earthly man. My beast had an advantage in his first hold, having sunk his mighty fangs far into the breast of his adversary; but the great arms and paws of the ape, backed by muscles far transcending those of the Martian men I had seen, had locked the throat of my guardian and slowly were choking out his life, and bending back his head and neck upon his body, where I momentarily expected the former to fall limp at the end of a broken neck. In accomplishing this the ape was tearing away the entire front of its breast, which was held in the vise-like grip of the powerful jaws. Back and forth upon the floor they rolled, neither one emitting a sound of fear or pain. Presently I saw the great eyes of my beast bulging completely from their sockets and blood flowing from its nostrils. That he was weakening perceptibly was evident, but so also was the ape, whose struggles were growing momentarily less. Suddenly I came to myself and, with that strange instinct which seems ever to prompt me to my duty, I seized the cudgel, which had fallen to the floor at the commencement of the battle, and swinging it with all the power of my earthly arms I crashed it full upon the head of the ape, crushing his skull as though it had been an eggshell.")
//        copyManager.saveNewEntry("Edgar", subject: "Meeting", message: "I was standing near the window and I knew that once in the street I might gain the plaza and safety before the creature could overtake me; at least there was a chance for safety in flight, against almost certain death should I remain and fight however desperately. It is true I held the cudgel, but what could I do with it against his four great arms? Even should I break one of them with my first blow, for I figured that he would attempt to ward off the cudgel, he could reach out and annihilate me with the others before I could recover for a second attack. In the instant that these thoughts passed through my mind I had turned to make for the window, but my eyes alighting on the form of my erstwhile guardian threw all thoughts of flight to the four winds. He lay gasping upon the floor of the chamber, his great eyes fastened upon me in what seemed a pitiful appeal for protection. I could not withstand that look, nor could I, on second thought, have deserted my rescuer without giving as good an account of myself in his behalf as he had in mine. Without more ado, therefore, I turned to meet the charge of the infuriated bull ape. He was now too close upon me for the cudgel to prove of any effective assistance, so I merely threw it as heavily as I could at his advancing bulk.")
//        copyManager.saveNewEntry("Alice", subject: "Follow up from Tuesday's meeting", message: "'Well, I never heard it before,' said the Mock Turtle; 'but it sounds uncommon nonsense.' Alice said nothing; she had sat down with her face in her hands, wondering if anything would EVER happen in a natural way again. 'I should like to have it explained,' said the Mock Turtle. 'She can't explain it,' said the Gryphon hastily. 'Go on with the next verse.' 'But about his toes?' the Mock Turtle persisted. 'How COULD he turn them out with his nose, you know?' 'It's the first position in dancing.' Alice said; but was dreadfully puzzled by the whole thing, and longed to change the subject. 'Go on with the next verse,' the Gryphon repeated impatiently: 'it begins 'I passed by his garden.'' Alice did not dare to disobey, though she felt sure it would all come wrong, and she went on in a trembling voice:— 'I passed by his garden, and marked, with one eye, How the Owl and the Panther were sharing a pie—' [later editions continued as follows The Panther took pie-crust, and gravy, and meat, While the Owl had the dish as its share of the treat.")
//        copyManager.saveNewEntry("Harold", subject: "Vegas trip", message: "So she called softly after it, 'Mouse dear! Do come back again, and we won't talk about cats or dogs either, if you don't like them!' When the Mouse heard this, it turned round and swam slowly back to her: its face was quite pale (with passion, Alice thought), and it said in a low trembling voice, 'Let us get to the shore, and then I'll tell you my history, and you'll understand why it is I hate cats and dogs.' It was high time to go, for the pool was getting quite crowded with the birds and animals that had fallen into it: there were a Duck and a Dodo, a Lory and an Eaglet, and several other curious creatures. Alice led the way, and the whole party swam to the shore. They were indeed a queer-looking party that assembled on the bank—the birds with draggled feathers, the animals with their fur clinging close to them, and all dripping wet, cross, and uncomfortable. The first question of course was, how to get dry again: they had a consultation about this, and after a few minutes it seemed quite natural to Alice to find herself talking familiarly with them, as if she had known them all her life.")
        
    }
}