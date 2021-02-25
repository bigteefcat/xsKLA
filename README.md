<h1 align="center">xsKLA</h1>
<b> WIP: NOT YET FUNCTIONAL</b><br>

`xsKLA` or [xeran's smart Keyboard Layout Analyzer] is a bash script made to analyze keyboard layouts and typing styles. There are many other layout analyzers but xsKLA stands out by being extremely customizable and allowing scoring of different styles of typing so you aren't only confined to test against a strict robotic touchtype method that doesn't take into account the intricacies of real typing. xsKLA also has support for typo simulation, dynamic finger movement, capslock usage, in-depth penalty rules, and much more.


### To-do
- [ ] Per finger stress maps
- [ ] Best finger per move calculation
- [ ] Typo simulation
- [ ] Caps lock simulation
- [ ] Finger-key memory
- [ ] Symmetric and asymmetric column/row stagger
- [ ] Finger cross over penalties
- [ ] Bigram penalties
- [ ] Finger travel penalty
- [ ] Distance from adjacent fingers penalties
- [ ] Distance from key of lowest strain penalty
- [ ] Chording Penalty
- [ ] Multiple character per key support
- [ ] Bigram analysis based off a corpus
- [ ] Optimizations


### Usage

#### running the script
Make the script executable with `chmod +x` and run<br>
There are no arguments to pass when you run xsKLA; everything is handled by the config file.

#### script configuration
- You can enable global strain maps by setting `globalStrain` to true and defining the strain maps to use.
- `globalPenalties` does the same for penalties.
- `globalBehavior` does the same for behavior.

#### layout configuration
Check layouts/qwerty-planck_adaptive.txt for an in-depth explanation of how to set up a layout file.
