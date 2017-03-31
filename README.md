# Eman Stories

[![build status image](https://api.travis-ci.org/deengames-prototypes/eman-stories.svg?branch=master)](https://travis-ci.org/deengames-prototypes/eman-stories)

**Goal:** Procedurally-generate hyrbrid action-RPG with a unique story and world each time you play. Stories are based on solid moral values, and hopefully give you an eman rush!

Web-deployed game (HTML5), probably with an HD desktop version for Steam.

# Architectural Goals

- As unit-testable as possible. Keep things separate from "view" (HaxeFlixel) code.
- Same story number generates the same game every time. (Challenge mode.)
- Dynamic hue rotation! (Seriously.)

# Running Tests

Run `./test.sh` or `test.bat` depending on your OS. 