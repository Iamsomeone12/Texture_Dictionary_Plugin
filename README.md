# Texture_Dictionary_Plugin
This is a little side project I made while making a game. I needed a way to make a dictionary that I can use to reference sprites easily in my game.
If you move the sprite around and it causes the file path to change, make sure to readd it to the dictionary because the plugin automatically deletes nonexistent filepaths

Global Node: SpriteDict:
SpriteDict has one method called get_sprite and it has the arguments sprite: String
Give it a string and it references it with sprite_dict which is populated wth the Sprite_dict_stuff.json file.

How to add to the json file:
The plugin adds a dock in the bottom left with sprite name and sprite file path. The sprite must exist in the res:// file for your project.
You type the name you want to use to reference in your game in "sprite name" and then you paste the file path into "sprite file path". 
When you press enter it puts the name in the dictionary as a key and the path as a value.

BetterSprite:
BetterSprite is a new class that has an @export variable that grabs the sprite from the texture dictionary global node and makes it its own sprite.
