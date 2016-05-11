![stage7 graphic](https://raw.githubusercontent.com/DigitalSurvival/Stage7/master/ui/stage7_logo.png "stage7 banner graphic")

The goal of stage7 is to provide a perfect "automagic" installer for Gentoo-based Linux distributions. For now the installer works on full size computers, but in the future support may be added for notebooks and other platforms. Many attempts at a way to automatically install Gentoo have, however none of them have been maintained. stage7 is an attempt to create an easy to use, *continually maintained* installer.

### Why the number 7?

In the Bible, the number 7 is the number of fullness, completion, and perfection (Gen 2:2; Ex 21:2; Rev 3:1). In the Gentoo Linux community the term "stage" followed by a number refers to how complete a Gentoo base system is. stage7 provides an easily configured way to
 # generate a freshly-compiled Gentoo Linux system from the original software sources (via a stage3 and Portage)
 # unpack a stage4 tarball.
 # generate a stage7 "perfect" install.

### What are the advantages of using Stage7

Just like other distributions, you should have the freedom to "unattend" your Gentoo-based Linux install. One of the advantages is time savings. Time is saved because the user does not have to be at the PC for each step in the install process, traditionally this hasn't been the case.

Another advantage is stage7 *makes it easy* to install Gentoo. One doesn't have to know much about the command line in order to benefit from the power of the best OS ever. Gentoo is a great challenge and a fine learning experience to setup by hand, however there are advantages and disadvantages to by-hand install method. Stage7 provides end users with a second option: an automated install.

### How do you get stage7?

Download stage7 by running this command on your favorite Linux distribution:
> wget https://raw.githubusercontent.com/digitalsurvival/stage7/master/getstage7.sh .

Then run the script:
> /bin/sh getstage7.sh

### How do you use stage7?

It's not done yet, so you'll have to wait until then before you can use it.

### What are the advantages of Gentoo-based Linux distributions?

Actually there's quite a few advantages.
 #Efficiency: From the core Gentoo Linux is build for speed. It is quick because the "USE" flag system provides the end user with the option to leave out much of the baggage that bloats up other Linux distributions. This enables the end user to create extremely "bare-bone" installations by removing unneeded functions from packages; smaller binaries load faster and use less memory!

1. Flexibility: By default Gentoo-based Linux distributions are the most flexible Linux distributions available! Gentoo is capable of using almost every desktop environment available (Gnome, KDE, XFCE, OpenBox, etc.). With thousands of packages in the Portage tree, and frequent "rolling" releases, Gentoo can be useful in most every situation. 
2. Scalability: Due to its source-based approach to software management, Gentoo is relatively well suited to deploy on tiny embedded systems right up to large cluster machines. 
3. Security: Because of the uniqueness of the Portage system and the ability to build packages with or without certain features, Gentoo can be made more secure than other binary-based Linux distributions. Less features means less opportunities for security holes and bugs.

### How can you help?

* Create some awesome graphics using the text "stage7" in an artistic way. Check out the fonts in the graphics/fonts folder for some ideal fonts...
* Offer suggestions/feature requests. I'm always open to suggestions!
* Review the code and submit pull requests.

Soon a full repository will emerge.

Copyright 2014-2016
Matthew Marchese

======
Standard license, copyright, and disclaimer:

This project was built off the work of Andrew Gaffney.

stage7 is not directed or managed by Gentoo Foundation, Inc.
The name "Gentoo" is a trademark of the Gentoo Foundation, Inc.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, version 2 only.

stage7 is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program. If not, see <http://www.gnu.org/licenses/>.
