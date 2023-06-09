# TankHelper
super lightweight and barebones addon for turtle wow that shows enemy stats. The name is lazy and not reflective of it's full use cases.
![image](https://github.com/balakethelock/TankHelper/assets/111737968/0456e194-d5a4-42d5-a68f-d26b88db0462)
Things it shows:
1. Shows enemy min-max swing damage (updates real time. Disarm reduces it by 60%, some mob self-buffs like some enrages will increase this value, others won't increase it but the mob will still hit for more)
If the enemy is a duel wielder, it'll say that too. Has false positives but no false negatives as far as I know.

2. Shows enemy attack power (the enemy at base attack power does base damage. attack power reductions linearly reduce swing damage from 100% of base to 70% of base). The demo warning is for max levels only, ignore it if you're not max level. (I might disable it for low levels later)

3. Shows enemy attack speed (updates in real time with thunderclap, thunderfury, flurry effects etc)
4. Shows enemy dps (just calculated based on their swing damage and attack speed)
Warning: This addon only gives stats of the enemy. Obviously this addon will not account for avoidance, crushing blows, and crits. So you still have to do some thinking about those.

How to use: open the game and find it in the center of your screen, left mouse to drag around. Position resets after each client restart because I don't know how to make it save. If anybody wants to volunteer for that, would be awesome.

This addon is good for:
- tanks that want to know how much damage the mob will do before pull, and build their mitigation-threat balance around it.
- healers that want to know how much dps the mob is doing so they can choose the perfect rank.
- anybody in the open world that wants to pick his battles safely, especially hardcore players.
- warriors can disarm the enemy mob and see if their swing damage decreases. This is the best way of testing whether a mob is immune or not, since most of the time the debuff is applied but does nothing.
