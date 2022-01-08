import 'package:pathmaker/model/ancestry.dart';
import 'package:pathmaker/enum.dart';
import 'package:pathmaker/model/heritage.dart';

class PathFinderData {
  final List<Ancestry> _ancestryLibrary = [
    Ancestry(
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
          name: 'Ancient-Blooded Dwarf',
          description:
              'Dwarven heroes of old could shrug off their enemies’ magic, and some of that resistance manifests in you.',
          features: [
            'You gain the Call on Ancient Blood reaction.',
          ],
        ),
        Heritage(
          name: 'Death Warden Dwarf',
          description:
              'Your ancestors have been tomb guardians for generations, and the power they cultivated to ward off necromancy has passed on to you.',
          features: [
            'If you roll a success on a saving throw against a necromancy effect, you get a critical success instead.',
          ],
        ),
        Heritage(
          name: 'Forge Dwarf',
          description:
              'You have a remarkable adaptation to hot environments from ancestors who inhabited blazing deserts or volcanic chambers beneath the earth.',
          features: [
            'This grants you fire resistance equal to half your level (minimum 1), and you treat environmental heat effects as if they were one step less extreme.',
          ],
        ),
        Heritage(
          name: 'Rock Dwarf',
          description:
              'Your ancestors lived and worked among the great ancient stones of the mountains or the depths of the earth. This makes you solid as a rock when you plant your feet.',
          features: [
            'You gain a +2 circumstance bonus to your Fortitude or Reflex DC against attempts to Shove or Trip you. This bonus also applies to saving throws against spells or effects that attempt to knock you prone.',
            'If any effect would force you to move 10 feet or more, you are moved only half the distance.',
          ],
        ),
        Heritage(
          name: 'Strong-Blooded Dwarf',
          description:
              'Your blood runs hearty and strong, and you can shake off toxins.',
          features: [
            'You gain poison resistance equal to half your level (minimum 1), and each of your successful saving throws against a poison affliction reduces its stage by 2, or by 1 for a virulent poison.',
          ],
        ),
      ],
      size: Size.medium,
      speed: 20,
    ),
    Ancestry(
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
          name: 'Arctic Elf',
          description:
              'You dwell deep in the frozen north and have gained incredible resilience against cold.',
          features: [
            'Cold resistance equal to half your level (minimum 1). You treat environmental cold effects as if they were one step less extreme',
          ],
        ),
        Heritage(
          name: 'Cavern Elf',
          description:
              'You were born or spent many years in underground tunnels or caverns where light is scarce',
          features: [
            'You gain darkvision.',
          ],
        ),
        Heritage(
          name: 'Seer Elf',
          description:
              'You have an inborn ability to detect and understand magical phenomena.',
          features: [
            'You can cast the detect magic cantrip as an arcane innate spell at will.',
            'You gain a +1 circumstance bonus to checks to Identify Magic and to Decipher Writing of a magical nature.'
          ],
        ),
        Heritage(
          name: 'Whisper Elf',
          description:
              'Your ears are finely tuned, able to detect even the slightest whispers of sound.',
          features: [
            'As long as you can hear normally, you can use the Seek action to sense undetected creatures in a 60-foot cone instead of a 30-foot cone.',
            'You gain a +2 circumstance bonus to locate undetected creatures that you could hear within 30 feet with a Seek action. ',
          ],
        ),
        Heritage(
          name: 'Woodland Elf',
          description:
              'You’re adapted to life in the forest or the deep jungle, and you know how to climb trees and use foliage to your advantage.',
          features: [
            'When Climbing trees, vines, and other foliage, you move at half your Speed on a success and at full Speed on a critical success',
            'You can always use the Take Cover action when you are within forest terrain to gain cover, even if you’re not next to an obstacle you can Take Cover behind.'
          ],
        ),
      ],
      size: Size.medium,
      speed: 30,
    ),
    Ancestry(
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
          name: 'Chameleon Gnome',
          description:
              'The color of your hair and skin is mutable, possibly due to latent magic. You can slowly change the vibrancy and the exact color, and the coloration can be different across your body, allowing you to create patterns or other colorful designs.',
          features: [
            'When you’re in an area where your coloration is roughly similar to the environment, you can use the single action to make minor localized shifts designed to help you blend into your surroundings. This grants you a +2 circumstance bonus to Stealth checks.',
          ],
        ),
        Heritage(
          name: 'Fey-Touched Gnome',
          description:
              'The blood of the fey is so strong within you that you’re truly one of them. You gain the fey trait, in addition to the gnome and humanoid traits.',
          features: [
            'Choose one cantrip from the primal spell list. You can cast this spell as a primal innate spell at will.',
          ],
        ),
        Heritage(
          name: 'Sensate Gnome',
          description:
              'You see all colors as brighter, hear all sounds as richer, and especially smell all scents with incredible detail.',
          features: [
            'You gain a special sense: imprecise scent with a range of 30 feet. This means you can use your sense of smell to determine the exact location of a creature.',
            'You gain a +2 circumstance bonus to Perception checks whenever you’re trying to locate an undetected creature that is within the range of your scent.'
          ],
        ),
        Heritage(
          name: 'Umbral Gnome',
          description:
              'Whether from a connection to dark or shadowy fey, from the underground deep gnomes also known as svirfneblin, or another source, you can see in complete darkness.',
          features: [
            'You gain darkvision.',
          ],
        ),
        Heritage(
          name: 'Wellspring Gnome',
          description:
              'Some other source of magic has a greater hold on you than the primal magic of your fey lineage does.',
          features: [
            'Choose arcane, divine, or occult. You gain one cantrip from that magical tradition’s spell list. You can cast this spell as an innate spell at will, as a spell of your chosen tradition.',
          ],
        ),
      ],
      size: Size.small,
      speed: 25,
    ),
    Ancestry(
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
          name: 'Charhide Goblin',
          description:
              'Your ancestors have always had a connection to fire and a thicker skin, which allows you to resist burning.',
          features: [
            'You gain fire resistance equal to half your level (minimum 1). ',
            'Your flat check to remove persistent fire damage is DC  10 instead of DC  15, which is reduced to DC 5 if another creature uses a particularly appropriate action to help.'
          ],
        ),
        Heritage(
          name: 'Irongut Goblin',
          description:
              'You can subsist on food that most folks would consider spoiled.',
          features: [
            'You can keep yourself fed with poor meals in a settlement as long as garbage is readily available.',
            'You gain a +2 circumstance bonus to saving throws against afflictions, against gaining the sickened condition, and to remove the sickened condition.'
          ],
        ),
        Heritage(
          name: 'Razortooth Goblin',
          description: 'Your family’s teeth are formidable weapons.',
          features: [
            'You gain a jaws unarmed attack that deals 1d6 piercing damage.',
          ],
        ),
        Heritage(
          name: 'Snow Goblin',
          description:
              'You are acclimated to living in frigid lands and have skin ranging from sky blue to navy in color, as well as blue fur.',
          features: [
            'You gain cold resistance equal to half your level (minimum 1). You treat environmental cold effects as if they were one step less extreme.',
          ],
        ),
        Heritage(
          name: 'Unbreakable Goblin',
          description:
              'You’re able to bounce back from injuries easily due to an exceptionally thick skull, cartilaginous bones, or some other mixed blessing.',
          features: [
            'You gain 10 Hit Points from your ancestry instead of 6.',
            'When you fall, reduce the falling damage you take as though you had fallen half the distance.'
          ],
        ),
      ],
      size: Size.small,
      speed: 25,
    ),
    Ancestry(
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
          name: 'Gutsy Halfling',
          description:
              'Your family line is known for keeping a level head and staving off fear when the chips were down, making them wise leaders and sometimes even heroes.',
          features: [
            'When you roll a success on a saving throw against an emotion effect, you get a critical success instead.',
          ],
        ),
        Heritage(
          name: 'Hillock Halfling',
          description:
              'Accustomed to a calm life in the hills, your people find rest and relaxation especially replenishing, particularly when indulging in creature comforts.',
          features: [
            'When you regain Hit Points overnight, add your level to the Hit Points regained.',
            'When anyone uses the Medicine skill to Treat your Wounds, you can eat a snack to add your level to the Hit Points you regain from their treatment.'
          ],
        ),
        Heritage(
          name: 'Nomadic Halfling',
          description:
              'Your ancestors have traveled from place to place for generations, never content to settle down.',
          features: [
            'You gain two additional languages of your choice, chosen from among the common and uncommon languages available to you.',
            'Every time you take the Multilingual feat, you gain another new language.'
          ],
        ),
        Heritage(
          name: 'Twilight Halfling',
          description:
              'Your ancestors performed many secret acts under the concealing cover of dusk, whether for good or ill, and over time they developed the ability to see in twilight beyond even the usual keen sight of halflings.',
          features: [
            'You gain low-light vision.',
          ],
        ),
        Heritage(
          name: 'Wildwood Halfling',
          description:
              'You hail from deep in a jungle or forest, and you’ve learned how to use your small size to wriggle through undergrowth, vines, and other obstacles.',
          features: [
            'You ignore difficult terrain from trees, foliage, and undergrowth.',
          ],
        ),
      ],
      size: Size.small,
      speed: 25,
    ),
    Ancestry(
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
          name: 'Half-Elf',
          description:
              'Either one of your parents was an elf, or one or both were half-elves. You have pointed ears and other telltale signs of elf heritage.',
          features: [
            'You gain the elf trait and low-light vision.',
            'you can select elf, half-elf, and human feats whenever you gain an ancestry feat.',
          ],
        ),
        Heritage(
          name: 'Half-Orc',
          description:
              'One of your parents was an orc, or one or both were half-orcs. You have a green tinge to your skin and other indicators of orc heritage.',
          features: [
            'You gain the orc trait and low-light vision.',
            'you can select orc, half-orc, and human feats whenever you gain an ancestry feat.'
          ],
        ),
        Heritage(
          name: 'Skilled Heritage',
          description:
              'Your ingenuity allows you to train in a wide variety of skills.',
          features: [
            'You become trained in one skill of your choice. At 5th level, you become an expert in the chosen skill.',
          ],
        ),
        Heritage(
          name: 'Versatile Heritage',
          description:
              'Humanity’s versatility and ambition have fueled its ascendance to be the most common ancestry in most nations throughout the world.',
          features: [
            'Select a general feat of your choice for which you meet the prerequisites',
          ],
        ),
      ],
      size: Size.medium,
      speed: 25,
    )
  ];

  get AncestryLibrary => _ancestryLibrary;
}
