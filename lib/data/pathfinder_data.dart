import 'package:pathmaker/model/ancestry.dart';
import 'package:pathmaker/enum.dart';
import 'package:pathmaker/model/feat.dart';
import 'package:pathmaker/model/heritage.dart';

class PathFinderData {
  final List<Ancestry> _ancestryLibrary = [
    Ancestry(
      id: 0,
      name: 'Dwarf',
      description:
          'Dwarves are a short, stocky people who are often stubborn, fierce, and devoted.',
      freeBoosts: 1,
      boosts: [Ability.con, Ability.wis],
      flaws: [Ability.cha],
      initialHP: 10,
      languages: [
        Language.common,
        Language.dwarven,
      ],
      traits: [
        'Darkvision',
      ],
      heritages: [
        Heritage(
          id: 0,
          name: 'Ancient-Blooded Dwarf',
          description:
              'Dwarven heroes of old could shrug off their enemies’ magic, and some of that resistance manifests in you.',
          features: [
            'You gain the Call on Ancient Blood reaction.',
          ],
        ),
        Heritage(
          id: 1,
          name: 'Death Warden Dwarf',
          description:
              'Your ancestors have been tomb guardians for generations, and the power they cultivated to ward off necromancy has passed on to you.',
          features: [
            'If you roll a success on a saving throw against a necromancy effect, you get a critical success instead.',
          ],
        ),
        Heritage(
          id: 2,
          name: 'Forge Dwarf',
          description:
              'You have a remarkable adaptation to hot environments from ancestors who inhabited blazing deserts or volcanic chambers beneath the earth.',
          features: [
            'This grants you fire resistance equal to half your level (minimum 1), and you treat environmental heat effects as if they were one step less extreme.',
          ],
        ),
        Heritage(
          id: 3,
          name: 'Rock Dwarf',
          description:
              'Your ancestors lived and worked among the great ancient stones of the mountains or the depths of the earth. This makes you solid as a rock when you plant your feet.',
          features: [
            'You gain a +2 circumstance bonus to your Fortitude or Reflex DC against attempts to Shove or Trip you. This bonus also applies to saving throws against spells or effects that attempt to knock you prone.',
            'If any effect would force you to move 10 feet or more, you are moved only half the distance.',
          ],
        ),
        Heritage(
          id: 4,
          name: 'Strong-Blooded Dwarf',
          description:
              'Your blood runs hearty and strong, and you can shake off toxins.',
          features: [
            'You gain poison resistance equal to half your level (minimum 1), and each of your successful saving throws against a poison affliction reduces its stage by 2, or by 1 for a virulent poison.',
          ],
        ),
      ],
      feats: [
        Feat(
          id: 0,
          name: 'Dwarven Lore',
          description:
              'You eagerly absorbed the old stories and traditions of your ancestors, your gods, and your people, studying in subjects and techniques passed down for generation upon generation.\n\nYou gain the trained proficiency rank in Crafting and Religion. If you would automatically become trained in one of those skills (from your background or class, for example), you instead become trained in a skill of your choice. You also become trained in Dwarven Lore.',
          skillTrained: [Skill.crafting, Skill.religion, Skill.lore],
        ),
        Feat(
          id: 1,
          name: 'Dwarven Weapon Familiarity',
          description:
              'Your kin have instilled in you an affinity for hard-hitting weapons, and you prefer these to more elegant arms.\n\nYou are trained with the battle axe, pick, and warhammer. You also gain access to all uncommon dwarf weapons. For the purpose of determining your proficiency, martial dwarf weapons are simple weapons and advanced dwarf weapons are martial weapons. ',
          weaponProficiencies: ['Battle axe', 'Pick', 'Warhammer'],
        ),
        Feat(
          id: 2,
          name: 'Rock Runner',
          description:
              'Your innate connection to stone makes you adept at moving across uneven surfaces. You can ignore difficult terrain caused by rubble and uneven ground made of stone and earth.\n\nIn addition, when you use the Acrobatics skill to Balance on narrow surfaces or uneven ground made of stone or earth, you aren’t flat-footed, and when you roll a success at one of these Acrobatics checks, you get a critical success instead.',
        ),
        Feat(
          id: 3,
          name: 'Stonecunning',
          description:
              'You have a knack for noticing even small inconsistencies and craftsmanship techniques in the stonework around you. You gain a +2 circumstance bonus to Perception checks to notice unusual stonework. This bonus applies to checks to discover mechanical traps made of stone or hidden within stone.\n\nIf you aren’t using the Seek action or searching, the GM automatically rolls a secret check for you to notice unusual stonework anyway. This check doesn’t gain the circumstance bonus, and it takes a –2 circumstance penalty',
        ),
        Feat(
          id: 4,
          name: 'Unburdened Iron',
          description:
              'You’ve learned techniques first devised by your ancestors during their ancient wars, allowing you to comfortably wear massive suits of armor. Ignore the reduction to your Speed from any armor you wear.\n\nIn addition, any time you’re taking a penalty to your Speed from some other reason (such as from the encumbered condition or from a spell), deduct 5 feet from the penalty.\n\nFor example, the encumbered condition normally gives a –10-foot penalty to Speed, but it gives you only a –5-foot penalty. If your Speed is taking multiple penalties, pick only one penalty to reduce',
        ),
        Feat(
          id: 5,
          name: 'Vengeful Hatred',
          description:
              'You heart aches for vengeance against those who have wronged your people. Choose one of the following dwarven ancestral foes when you gain Vengeful Hatred: drow, duergar, giant, or orc.\n\nYou gain a +1 circumstance bonus to damage with weapons and unarmed attacks against creatures with that trait. If your attack would deal more than one weapon die of damage (as is common at higher levels than 1st), the bonus is equal to the number of weapon dice or unarmed attack dice.\n\nIn addition, if a creature critically succeeds at an attack against you and deals damage to you, you gain your bonus to damage against that creature for 1 minute regardless of whether it has the chosen trait.\n\nSpecial Your GM can add appropriate creature traits to the ancestral foes list if your character is from a community that commonly fights other types of enemies.',
        ),
      ],
      size: Size.medium,
      speed: 20,
    ),
    Ancestry(
      id: 1,
      name: 'Elf',
      description:
          'Elves are a tall, slender, long-lived people with a strong tradition of art and magic.',
      freeBoosts: 1,
      boosts: [Ability.dex, Ability.intl],
      flaws: [Ability.con],
      initialHP: 6,
      languages: [
        Language.common,
        Language.elven,
      ],
      traits: [
        'Low-Light vision',
      ],
      heritages: [
        Heritage(
          id: 0,
          name: 'Arctic Elf',
          description:
              'You dwell deep in the frozen north and have gained incredible resilience against cold.',
          features: [
            'Cold resistance equal to half your level (minimum 1). You treat environmental cold effects as if they were one step less extreme',
          ],
        ),
        Heritage(
          id: 1,
          name: 'Cavern Elf',
          description:
              'You were born or spent many years in underground tunnels or caverns where light is scarce',
          features: [
            'You gain darkvision.',
          ],
        ),
        Heritage(
          id: 2,
          name: 'Seer Elf',
          description:
              'You have an inborn ability to detect and understand magical phenomena.',
          features: [
            'You can cast the detect magic cantrip as an arcane innate spell at will.',
            'You gain a +1 circumstance bonus to checks to Identify Magic and to Decipher Writing of a magical nature.'
          ],
        ),
        Heritage(
          id: 3,
          name: 'Whisper Elf',
          description:
              'Your ears are finely tuned, able to detect even the slightest whispers of sound.',
          features: [
            'As long as you can hear normally, you can use the Seek action to sense undetected creatures in a 60-foot cone instead of a 30-foot cone.',
            'You gain a +2 circumstance bonus to locate undetected creatures that you could hear within 30 feet with a Seek action. ',
          ],
        ),
        Heritage(
          id: 4,
          name: 'Woodland Elf',
          description:
              'You’re adapted to life in the forest or the deep jungle, and you know how to climb trees and use foliage to your advantage.',
          features: [
            'When Climbing trees, vines, and other foliage, you move at half your Speed on a success and at full Speed on a critical success',
            'You can always use the Take Cover action when you are within forest terrain to gain cover, even if you’re not next to an obstacle you can Take Cover behind.'
          ],
        ),
      ],
      feats: [
        Feat(
          id: 0,
          name: 'Ancestral Longevity',
          description:
              'You have accumulated a vast array of lived knowledge over the years. During your daily preparations, you can reflect upon your life experiences to gain the trained proficiency rank in one skill of your choice. This proficiency lasts until you prepare again.\n\nSince this proficiency is temporary, you can’t use it as a prerequisite for a skill increase or a permanent character option like a feat.',
        ),
        Feat(
          id: 1,
          name: 'Elven Lore',
          description:
              'You’ve studied in traditional elven arts, learning about arcane magic and the world around you.\n\nYou gain the trained proficiency rank in Arcana and Nature. If you would automatically become trained in one of those skills (from your background or class, for example), you instead become trained in a skill of your choice. You also become trained in Elven Lore',
          skillTrained: [Skill.arcana, Skill.nature, Skill.lore],
        ),
        Feat(
          id: 2,
          name: 'Elven Weapon Familiarity',
          description:
              'You favor bows and other elegant weapons. You are trained with longbows, composite longbows, longswords, rapiers, shortbows, and composite shortbows.\n\nIn addition, you gain access to all uncommon elf weapons. For the purpose of determining your proficiency, martial elf weapons are simple weapons and advanced elf weapons are martial weapons.',
          weaponProficiencies: [
            'Longbow',
            'Composite Longbow',
            'Longsword',
            'Rapier',
            'Shortbow',
            'Composite Shortbow',
          ],
        ),
        Feat(
          id: 3,
          name: 'Forlorn',
          description:
              'Watching your friends age and die fills you with moroseness that protects you against harmful emotions. You gain a +1 circumstance bonus to saving throws against emotion effects.\n\nIf you roll a success on a saving throw against an emotion effect, you get a critical success instead.',
        ),
        Feat(
          id: 4,
          name: 'Nimble Elf',
          description:
              'Your muscles are tightly honed. Your Speed increases by 5 feet.',
          speedBonus: 5,
        ),
        Feat(
          id: 5,
          name: 'Otherworldly Magic',
          description:
              'Your elven magic manifests as a simple arcane spell, even if you aren’t formally trained in magic. Choose one cantrip from the arcane spell list. You can cast this cantrip as an arcane innate spell at will. A cantrip is heightened to a spell level equal to half your level rounded up.',
          cantrips: 1,
        ),
        Feat(
          id: 6,
          name: 'Unwavering Mien',
          description:
              'Your mystic control and meditations allow you to resist external influences upon your consciousness. Whenever you are affected by a mental effect that lasts at least 2 rounds, you can reduce the duration by 1 round.\n\nYou still require natural sleep, but you treat your saving throws against effects that would cause you to fall asleep as one degree of success better. This protects only against sleep effects, not against other forms of falling unconscious.',
        ),
      ],
      size: Size.medium,
      speed: 30,
    ),
    Ancestry(
      id: 2,
      name: 'Gnome',
      description:
          'Gnomes are short and hardy folk, with an unquenchable curiosity and eccentric habits.',
      freeBoosts: 1,
      boosts: [Ability.con, Ability.cha],
      flaws: [Ability.str],
      initialHP: 8,
      languages: [
        Language.common,
        Language.gnomish,
        Language.sylvan,
      ],
      traits: [
        'Low-Light vision',
      ],
      heritages: [
        Heritage(
          id: 0,
          name: 'Chameleon Gnome',
          description:
              'The color of your hair and skin is mutable, possibly due to latent magic. You can slowly change the vibrancy and the exact color, and the coloration can be different across your body, allowing you to create patterns or other colorful designs.',
          features: [
            'When you’re in an area where your coloration is roughly similar to the environment, you can use the single action to make minor localized shifts designed to help you blend into your surroundings. This grants you a +2 circumstance bonus to Stealth checks.',
          ],
        ),
        Heritage(
          id: 1,
          name: 'Fey-Touched Gnome',
          description:
              'The blood of the fey is so strong within you that you’re truly one of them. You gain the fey trait, in addition to the gnome and humanoid traits.',
          features: [
            'Choose one cantrip from the primal spell list. You can cast this spell as a primal innate spell at will.',
          ],
        ),
        Heritage(
          id: 2,
          name: 'Sensate Gnome',
          description:
              'You see all colors as brighter, hear all sounds as richer, and especially smell all scents with incredible detail.',
          features: [
            'You gain a special sense: imprecise scent with a range of 30 feet. This means you can use your sense of smell to determine the exact location of a creature.',
            'You gain a +2 circumstance bonus to Perception checks whenever you’re trying to locate an undetected creature that is within the range of your scent.'
          ],
        ),
        Heritage(
          id: 3,
          name: 'Umbral Gnome',
          description:
              'Whether from a connection to dark or shadowy fey, from the underground deep gnomes also known as svirfneblin, or another source, you can see in complete darkness.',
          features: [
            'You gain darkvision.',
          ],
        ),
        Heritage(
          id: 4,
          name: 'Wellspring Gnome',
          description:
              'Some other source of magic has a greater hold on you than the primal magic of your fey lineage does.',
          features: [
            'Choose arcane, divine, or occult. You gain one cantrip from that magical tradition’s spell list. You can cast this spell as an innate spell at will, as a spell of your chosen tradition.',
          ],
        ),
      ],
      feats: [
        Feat(
          id: 0,
          name: 'Animal Accomplice',
          description:
              'You build a rapport with an animal, which becomes magically bonded to you. You gain a familiar. The type of animal is up to you, but most gnomes choose animals with a burrow Speed.',
        ),
        Feat(
          id: 1,
          name: 'Burrow Elocutionist',
          description:
              'You recognize the chittering of ground creatures as its own peculiar language. You can ask questions of, receive answers from, and use the Diplomacy skill with animals that have a burrow Speed, such as badgers, ground squirrels, moles, and prairie dogs. The GM determines which animals count for this ability.',
        ),
        Feat(
          id: 2,
          name: 'Fey Fellowship',
          description:
              'Your enhanced fey connection affords you a warmer reception from creatures of the First World as well as tools to foil their tricks. You gain a +2 circumstance bonus to both Perception checks and saving throws against fey.\n\nIn addition, whenever you meet a fey creature in a social situation, you can immediately attempt a Diplomacy check to Make an Impression on that creature rather than needing to converse for 1 minute.\n\nYou take a –5 penalty to the check. If you fail, you can engage in 1 minute of conversation and attempt a new check at the end of that time rather than accepting the failure or critical failure result.\n\nSpecial If you have the Glad-Hand skill feat, you don’t take the penalty on your immediate Diplomacy check if the target is a fey.',
        ),
        Feat(
          id: 3,
          name: 'First World Magic',
          description:
              'Your connection to the First World grants you a primal innate spell, much like those of the fey. Choose one cantrip from the primal spell list. You can cast this spell as a primal innate spell at will. A cantrip is heightened to a spell level equal to half your level rounded up.',
          cantrips: 1,
        ),
        Feat(
          id: 4,
          name: 'Gnome Obsession',
          description:
              'You might have a flighty nature, but when a topic captures your attention, you dive into it headfirst. Pick a Lore skill. You gain the trained proficiency rank in that skill.\n\nAt 2nd  level,  you gain expert proficiency in the chosen Lore as well as the Lore granted by your background, if any.\n\nAt 7th level you gain master proficiency in these Lore skills, and at 15th level you gain legendary proficiency in them.',
          skillTrained: [Skill.lore],
        ),
        Feat(
          id: 5,
          name: 'Gnome Weapon Familiarity',
          description:
              'You favor unusual weapons tied to your people, such as blades with curved and peculiar shapes. You are trained with the glaive and kukri.\n\nIn addition, you gain access to all uncommon gnome weapons. For the purpose of determining your proficiency, martial gnome weapons are simple weapons and advanced gnome weapons are martial weapons.',
          weaponProficiencies: [
            'Glaive',
            'Kukri',
          ],
        ),
        Feat(
          id: 6,
          name: 'Illusion Sense',
          description:
              'Your ancestors spent their days cloaked and cradled in illusions, and as a result, sensing illusion magic is second nature to you.\n\nYou gain a +1 circumstance bonus to both Perception checks and Will saves against illusions. When you come within 10 feet of an illusion that can be disbelieved, the GM rolls a secret check for you to disbelieve it, even if you didn’t spend an action to Interact with the illusion.',
        ),
      ],
      size: Size.small,
      speed: 25,
    ),
    Ancestry(
      id: 3,
      name: 'Goblin',
      description:
          'Goblins are a short, scrappy, energetic people who have spent millennia maligned and feared.',
      freeBoosts: 1,
      boosts: [Ability.dex, Ability.cha],
      flaws: [Ability.wis],
      initialHP: 6,
      languages: [
        Language.common,
        Language.goblin,
      ],
      traits: [
        'Darkvision',
      ],
      heritages: [
        Heritage(
          id: 0,
          name: 'Charhide Goblin',
          description:
              'Your ancestors have always had a connection to fire and a thicker skin, which allows you to resist burning.',
          features: [
            'You gain fire resistance equal to half your level (minimum 1). ',
            'Your flat check to remove persistent fire damage is DC  10 instead of DC  15, which is reduced to DC 5 if another creature uses a particularly appropriate action to help.'
          ],
        ),
        Heritage(
          id: 1,
          name: 'Irongut Goblin',
          description:
              'You can subsist on food that most folks would consider spoiled.',
          features: [
            'You can keep yourself fed with poor meals in a settlement as long as garbage is readily available.',
            'You gain a +2 circumstance bonus to saving throws against afflictions, against gaining the sickened condition, and to remove the sickened condition.'
          ],
        ),
        Heritage(
          id: 2,
          name: 'Razortooth Goblin',
          description: 'Your family’s teeth are formidable weapons.',
          features: [
            'You gain a jaws unarmed attack that deals 1d6 piercing damage.',
          ],
        ),
        Heritage(
          id: 3,
          name: 'Snow Goblin',
          description:
              'You are acclimated to living in frigid lands and have skin ranging from sky blue to navy in color, as well as blue fur.',
          features: [
            'You gain cold resistance equal to half your level (minimum 1). You treat environmental cold effects as if they were one step less extreme.',
          ],
        ),
        Heritage(
          id: 4,
          name: 'Unbreakable Goblin',
          description:
              'You’re able to bounce back from injuries easily due to an exceptionally thick skull, cartilaginous bones, or some other mixed blessing.',
          features: [
            'You gain 10 Hit Points from your ancestry instead of 6.',
            'When you fall, reduce the falling damage you take as though you had fallen half the distance.'
          ],
        ),
      ],
      feats: [
        Feat(
          id: 0,
          name: 'Burn It!',
          description:
              'Fire fascinates you. Your spells and alchemical items that deal fire damage gain a status bonus to damage equal to half the spell’s level or one-quarter the item’s level (minimum 1).\n\nYou also gain a +1 status bonus to any persistent fire damage you deal.',
        ),
        Feat(
          id: 1,
          name: 'City Scavenger',
          description:
              'You know that the greatest treasures often look like refuse, and you scoff at those who throw away perfectly good scraps. You gain a +1 circumstance bonus to checks to Subsist, and you can use Society or Survival when you Subsist in a settlement.\n\nWhen you Subsist in a city, you also gather valuable junk that silly longshanks threw away.\n\nYou can Earn Income using Society or Survival in the same time as you Subsist, without spending any additional days of downtime. You also gain a +1 circumstance bonus to this check.\n\nSpecial If you have the irongut goblin heritage, increase the bonuses to +2.',
        ),
        Feat(
          id: 2,
          name: 'Goblin Lore',
          description:
              'You’ve picked up skills and tales from your goblin community. You gain the trained proficiency rank in Nature and Stealth.\n\nIf you would automatically become trained in one of those skills (from your background or class, for example), you instead become trained in a skill of your choice. You also become trained in Goblin Lore.',
          skillTrained: [
            Skill.nature,
            Skill.stealth,
            Skill.lore,
          ],
        ),
        Feat(
          id: 3,
          name: 'Goblin Scuttle',
          description:
              'Reaction: An ally ends a move action adjacent to you. You take advantage of your ally’s movement to adjust your position. You Step.',
        ),
        Feat(
          id: 4,
          name: 'Goblin Song',
          description:
              'You sing annoying goblin songs, distracting your foes with silly and repetitive lyrics.\n\nAttempt a Performance check against the Will DC of a single enemy within 30 feet. This has all the usual traits and restrictions of a Performance check.\n\nYou can affect up to two targets within range if you have expert proficiency in Performance, four if you have master proficiency, and eight if you have legendary proficiency.\n\nCritical Success The target takes a –1 status penalty to Perception checks and Will saves for 1 minute.\n\nSuccess The target takes a –1 status penalty to Perception checks and Will saves for 1 round.\n\nCritical Failure The target is temporarily immune to attempts to use Goblin Song for 1 hour.',
        ),
        Feat(
          id: 5,
          name: 'Goblin Weapon Familiarity',
          description:
              'Others might look upon them with disdain, but you know that the weapons of your people are as effective as they are sharp. You are trained with the dogslicer and horsechopper.\n\nIn addition, you gain access to all uncommon goblin weapons. For the purpose of determining your proficiency, martial goblin weapons are simple weapons and advanced goblin weapons are martial weapons',
          weaponProficiencies: [
            'Dogslicer',
            'Horsechopper',
          ],
        ),
        Feat(
          id: 6,
          name: 'Junk Tinker',
          description:
              'You can make useful tools out of even twisted or rusted scraps. When using the Crafting skill to Craft, you can make level 0 items, including weapons but not armor, out of junk.\n\nThis reduces the Price to one-quarter the usual amount but always results in a shoddy item.\n\nShoddy items normally give a penalty, but you don’t take this penalty when using shoddy items you made.\n\nYou can also incorporate junk to save money while you Craft any item. This grants you a discount on the item as if you had spent 1 additional day working to reduce the cost, but the item is obviously made of junk.\n\nAt the GM’s discretion, this might affect the item’s resale value depending on the buyer’s tastes.',
        ),
        Feat(
          id: 7,
          name: 'Rough Rider',
          description:
              'You are especially good at riding traditional goblin mounts. You gain the Ride feat, even if you don’t meet the prerequisites.\n\nYou gain a +1 circumstance bonus to Nature checks to use Command an Animal on a goblin dog or wolf mount. You can always select a wolf as your animal companion, even if you would usually select an animal companion with the mount special ability, such as for a champion’s steed ally.',
        ),
        Feat(
          id: 8,
          name: 'Very Sneaky',
          description:
              'Taller folk rarely pay attention to the shadows at their feet, and you take full advantage of this. You can move 5 feet farther when you take the Sneak action, up to your Speed.\n\nIn addition, as long as you continue to use Sneak actions and succeed at your Stealth check,  you don’t become observed if you don’t have cover or greater cover and aren’t concealed at the end of the Sneak action, as long as you have cover or greater cover or are concealed at the end of your turn.',
        ),
      ],
      size: Size.small,
      speed: 25,
    ),
    Ancestry(
      id: 4,
      name: 'Halfling',
      description:
          'Halflings are a short, adaptable people who exhibit remarkable curiosity and humor.',
      freeBoosts: 1,
      boosts: [Ability.dex, Ability.wis],
      flaws: [Ability.str],
      initialHP: 6,
      languages: [
        Language.common,
        Language.halfling,
      ],
      traits: [
        'Keen Eyes',
      ],
      heritages: [
        Heritage(
          id: 0,
          name: 'Gutsy Halfling',
          description:
              'Your family line is known for keeping a level head and staving off fear when the chips were down, making them wise leaders and sometimes even heroes.',
          features: [
            'When you roll a success on a saving throw against an emotion effect, you get a critical success instead.',
          ],
        ),
        Heritage(
          id: 1,
          name: 'Hillock Halfling',
          description:
              'Accustomed to a calm life in the hills, your people find rest and relaxation especially replenishing, particularly when indulging in creature comforts.',
          features: [
            'When you regain Hit Points overnight, add your level to the Hit Points regained.',
            'When anyone uses the Medicine skill to Treat your Wounds, you can eat a snack to add your level to the Hit Points you regain from their treatment.'
          ],
        ),
        Heritage(
          id: 2,
          name: 'Nomadic Halfling',
          description:
              'Your ancestors have traveled from place to place for generations, never content to settle down.',
          features: [
            'You gain two additional languages of your choice, chosen from among the common and uncommon languages available to you.',
            'Every time you take the Multilingual feat, you gain another new language.'
          ],
        ),
        Heritage(
          id: 3,
          name: 'Twilight Halfling',
          description:
              'Your ancestors performed many secret acts under the concealing cover of dusk, whether for good or ill, and over time they developed the ability to see in twilight beyond even the usual keen sight of halflings.',
          features: [
            'You gain low-light vision.',
          ],
        ),
        Heritage(
          id: 4,
          name: 'Wildwood Halfling',
          description:
              'You hail from deep in a jungle or forest, and you’ve learned how to use your small size to wriggle through undergrowth, vines, and other obstacles.',
          features: [
            'You ignore difficult terrain from trees, foliage, and undergrowth.',
          ],
        ),
      ],
      feats: [
        Feat(
          id: 0,
          name: 'Distracting Shadows',
          description:
              'You have learned to remain hidden by using larger folk as a distraction to avoid drawing attention to yourself. You can use creatures that are at least one size larger than you (usually Medium or larger) as cover for the Hide and Sneak actions, though you still can’t use such creatures as cover for other uses, such as the Take Cover action.',
        ),
        Feat(
          id: 1,
          name: 'Halfling Lore',
          description:
              'You’ve dutifully learned how to keep your balance and how to stick to the shadows where it’s safe, important skills passed down through generations of halfling tradition.\n\nYou gain the trained proficiency rank in Acrobatics and Stealth. If you would automatically become trained in one of those skills (from your background or class, for example), you instead become trained in a skill of your choice. You also become trained in Halfling Lore.',
          skillTrained: [
            Skill.acrobatics,
            Skill.stealth,
            Skill.lore,
          ],
        ),
        Feat(
          id: 2,
          name: 'Halfling Luck',
          description:
              'Special action (once per day): You fail a skill check or saving throw. Your happy-go-lucky nature makes it seem like misfortune avoids you, and to an extent, that might even be true.\n\nYou can reroll the triggering check, but you must use the new result, even if it’s worse than your first roll.',
        ),
        Feat(
          id: 3,
          name: 'Halfling Weapon Familiarity',
          description:
              'You favor traditional halfling weapons, so you’ve learned how to use them more effectively. You have the trained proficiency with the sling, halfling sling staff, and shortsword.\n\nIn addition, you gain access to all uncommon halfling weapons. For you, martial halfling weapons are simple weapons, and advanced halfling weapons are martial weapons.',
          weaponProficiencies: [
            'Sling',
            'Halfling Sling Staff',
            'Shortsword',
          ],
        ),
        Feat(
          id: 4,
          name: 'Sure Feet',
          description:
              'Whether keeping your balance or scrambling up a tricky climb, your hairy, calloused feet easily find purchase.\n\nIf you roll a success on an Acrobatics check to Balance or an Athletics check to Climb, you get a critical success instead. You’re not flat-footed when you attempt to Balance or Climb.',
        ),
        Feat(
          id: 5,
          name: 'Titan Slinger',
          description:
              'You have learned how to use your sling to fell enormous creatures. When you hit on an attack with a sling against a Large or larger creature, increase the size of the weapon damage die by one step.',
        ),
        Feat(
          id: 6,
          name: 'Unfettered Halfling',
          description:
              'You were forced into service as a laborer, either pressed into indentured servitude or shackled by the evils of slavery, but you’ve since escaped and have trained to ensure you’ll never be caught again.\n\nWhenever you roll a success on a check to Escape or a saving throw against an effect that would impose the grabbed or restrained condition on you, you get a critical success instead. Whenever a creature rolls a failure on a check to Grapple you, they get a critical failure instead.\n\nIf a creature uses the Grab ability on you, it must succeed at an Athletics check to grab you instead of automatically grabbing you.',
        ),
        Feat(
          id: 7,
          name: 'Watchful Halfling',
          description:
              'Your communal lifestyle causes you to pay close attention to the people around you, allowing you to more easily notice when they act out of character. You gain a +2 circumstance bonus to Perception checks when using the Sense Motive basic action to notice enchanted or possessed characters.\n\nIf you aren’t actively using Sense Motive on an enchanted or possessed character, the GM rolls a secret check, without the usual circumstance and with a –2 circumstance penalty, for you to potentially notice the enchantment or possession anyway.\n\nIn addition to using it for skill checks, you can use the Aid basic action to grant a bonus to another creature’s saving throw or other check to overcome enchantment or possession. As usual for Aid, you need to prepare by using an action on your turn to encourage the creature to fight against the effect.',
        ),
      ],
      size: Size.small,
      speed: 25,
    ),
    Ancestry(
      id: 5,
      name: 'Human',
      description:
          'Humans are incredibly diverse. Some, such as half-elves and half-orcs, even have non-human ancestors.',
      freeBoosts: 2,
      boosts: [],
      flaws: [],
      initialHP: 8,
      languages: [
        Language.common,
      ],
      traits: [],
      heritages: [
        Heritage(
          id: 0,
          name: 'Half-Elf',
          description:
              'Either one of your parents was an elf, or one or both were half-elves. You have pointed ears and other telltale signs of elf heritage.',
          features: [
            'You gain the elf trait and low-light vision.',
            'you can select elf, half-elf, and human feats whenever you gain an ancestry feat.',
          ],
        ),
        Heritage(
          id: 1,
          name: 'Half-Orc',
          description:
              'One of your parents was an orc, or one or both were half-orcs. You have a green tinge to your skin and other indicators of orc heritage.',
          features: [
            'You gain the orc trait and low-light vision.',
            'you can select orc, half-orc, and human feats whenever you gain an ancestry feat.'
          ],
        ),
        Heritage(
          id: 2,
          name: 'Skilled Heritage',
          description:
              'Your ingenuity allows you to train in a wide variety of skills.',
          features: [
            'You become trained in one skill of your choice. At 5th level, you become an expert in the chosen skill.',
          ],
        ),
        Heritage(
          id: 3,
          name: 'Versatile Heritage',
          description:
              'Humanity’s versatility and ambition have fueled its ascendance to be the most common ancestry in most nations throughout the world.',
          features: [
            'Select a general feat of your choice for which you meet the prerequisites',
          ],
        ),
      ],
      feats: [
        Feat(
          id: 0,
          name: 'Adapted Cantrip',
          description:
              'Through study of multiple magical traditions, you’ve altered a spell to suit your spellcasting style. Choose one cantrip from a magical tradition other than your own. If you have a spell repertoire or a spellbook, replace one of the cantrips you know or have in your spellbook with the chosen spell.\n\nIf you prepare spells without a spellbook (if you’re a cleric or druid, for example), one of your cantrips must always be the chosen spell, and you prepare the rest normally. You can cast this cantrip as a spell of your class’s tradition.\n\nIf you swap or retrain this cantrip later, you can choose its replacement from the same alternate tradition or a different one.',
          cantrips: 1,
        ),
        Feat(
          id: 1,
          name: 'Cooperative Nature',
          description:
              'The short human life span lends perspective and has taught you from a young age to set aside differences and work with others to achieve greatness. You gain a +4 circumstance bonus on checks to Aid.',
        ),
        Feat(
          id: 2,
          name: 'General Training',
          description:
              'Your adaptability manifests in your mastery of a range of useful abilities. You gain a 1st-level general feat. You must meet the feat’s prerequisites, but if you select this feat during character creation, you can select the feat later in the process in order to determine which prerequisites you meet.\n\nSpecial You can select this feat multiple times, choosing a different feat each time.',
          generalFeats: 1,
        ),
        Feat(
          id: 3,
          name: 'Haughty Obstinacy',
          description:
              'Your powerful ego makes it harder for others to order you around. If you roll a success on a saving throw against a mental effect that attempts to directly control your actions, you critically succeed instead.\n\nIf a creature rolls a failure on a check to Coerce you using Intimidation, it gets a critical failure instead (so it can’t try to Coerce you again for 1 week).',
        ),
        Feat(
          id: 4,
          name: 'Natural Ambition',
          description:
              'You were raised to be ambitious and always reach for the stars, leading you to progress quickly in your chosen field. You gain a 1st-level class feat for your class. You must meet the prerequisites,  but you can select the feat later in the character creation process in order to determine which prerequisites you meet.',
          classFeats: 1,
        ),
        Feat(
          id: 5,
          name: 'Natural Skill',
          description:
              'Your ingenuity allows you to learn a wide variety of skills. You gain the trained proficiency rank in two skills of your choice.',
          freeSkills: 2,
        ),
        Feat(
          id: 6,
          name: 'Unconventional Weaponry',
          description:
              'You’ve familiarized yourself with a particular weapon, potentially from another ancestry or culture. Choose an uncommon simple or martial weapon with a trait corresponding to an ancestry (such as dwarf, goblin, or orc) or that is common in another culture. You gain access to that weapon, and for the purpose of determining your proficiency, that weapon is a simple weapon.\n\nIf you are trained in all martial weapons, you can choose an uncommon advanced weapon with such a trait. You gain access to that weapon, and for the purpose of determining your proficiency, that weapon is a martial weapon.',
          weaponProficiencies: ['Choose'],
        ),
      ],
      size: Size.medium,
      speed: 25,
    )
  ];

  get AncestryLibrary => _ancestryLibrary;

  Ancestry getAncestryByID(int id) {
    return _ancestryLibrary[id];
  }

  Heritage getHeritageByID(int ancestryID, int id) {
    return _ancestryLibrary[ancestryID].heritages[id];
  }

  Feat getFeatByID(int ancestryID, int id) {
    return _ancestryLibrary[ancestryID].feats[id];
  }
}
