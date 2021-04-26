# Shards Sound Pack
*As used by Shards EU-Kazzak.*

World of Warcraft Addon which makes a collection of sound files available to addons which support `LibSharedMedia`.

## Making Changes

1) Make changes
    - Sound files should be in `mp3` or `ogg` format.
    - Sound files must be stored in the `sound` directory.
    - Sounds will appear in game with the same name as their file but without the extension (e.g. `Beware of Yeti.ogg` will become `Beware of Yeti`).
2) If changes have modified the `sound` directory in *any* way then run the `MakeAddon` executable to generate the `main.lua` file.
*Note that you may need to recompile the executable depending on your OS.*
3) Update `ChangeLog.md` according the versioning policy below.
4) After pushing/merging tag the commit with the version number suffixed by `-release` or `-beta`.
5) Hope it works...

## Versioning

This addon follows the versioning policy style of A.B.C.[D] (MAJOR.MAJOR.MINOR.[PATCH]). 

- A - Used for large breaking changes and overhauls (e.g. 1.2.3.4 becomes 2.0.0)
- B - Used for smaller breaking changes such as removing a certain sound file (e.g. 1.2.3.4 becomes 1.3.0)
- C - Used for non-breaking changes such as adding a new sound file (e.g. 1.2.3.4 becomes 1.2.4)
- D - Used for big fixes and documentation changes (e.g. 1.2.3.4 becomes 1.2.3.5)
    - D can be omitted if 0 (e.g. 1.2.3 is a valid version number)