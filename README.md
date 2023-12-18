# Sylveon

### demo

https://github.com/Ultramicroscope/Sylveon/assets/76135269/26b649f7-f602-4594-906b-298a949d886c

# Info
Tryfle was making a Sylveon themed resource pack, and it inspired me to make a prancing sylveon overlay as a shader.

> This is absolutely not what shaders are intended to be used for.
>
> Shaders mess with many lighting and rendering settings by default and as far as I know, there is no way to simply apply the client's configured settings.
> 
> Because of this, the game will look different. Most notably, it force enables old lighting and disables vignette in most cases.
> 
> Furthermore, setting your client's maximum fps to unlimited is likely to cause the gif to appear laggy.
> 
> This is because the method I use for progressing each frame is based off of the `frameTimeCounter` uniform which is unreliable at absurdly high fps.
