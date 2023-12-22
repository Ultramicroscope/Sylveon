#version 120

uniform sampler2D colortex0; // gcolor
uniform sampler2D colortex7; // textures/pan.png

uniform float viewWidth;
uniform float viewHeight;
uniform float frameTimeCounter; // shader time (loops after 1 hour)

// horizontally concatenated prancing sylveon gif frames resolution
const vec2 panRes = vec2(768, 128);
const float fps = 50.0 / 3.0; // fps to render the gif (16.667)

void main() {
    // resolution of gcolor (window size)
    vec2 texRes = vec2(viewWidth, viewHeight);

    // fragment shader coordinate
    vec2 fragCoord = gl_FragCoord.xy;
    // normalized coordinate
    vec2 texCoord = fragCoord / texRes;
    // color at normalized coordinate
    vec4 color = texture2D(colortex0, texCoord);

    // relative sylveon size
    vec2 d = 128.0 / texRes;
    // if shader is in bottom right sylveon-sized-unit
    if (texCoord.x > 1 - d.x && texCoord.y < d.y) {
        // x of nth frame from time (breaks if fps is unreasonable high)
        int n = int(floor(frameTimeCounter * fps)) % 6 * 128;

        // feels like black magic but it actually makes a lot of sense
        float u = fragCoord.x - viewWidth + n; // (deceptively simplified)
        vec2 uv = vec2(u, -fragCoord.y) / panRes;

        vec4 panColor = texture2D(colortex7, uv);
        if (panColor.w == 1) { // if the color is opaque (not transparent)
            color = panColor;
        }
    }

    gl_FragData[0] = color; // gl_FragColor
}

/* whole screen sylveon
    vec2 texRes = textureSize(colortex0, 0);

    vec2 fragCoord = gl_FragCoord.xy;
    vec2 texCoord = fragCoord / texRes;

    int t = int(floor(frameTimeCounter * fps)) % 6;
    float x = (t + texCoord.x) / 6;

    vec2 panCoord = vec2(x, -texCoord.y);
    vec4 color = texture2D(colortex7, panCoord);
    if (color.w == 0) {
        color = texture2D(colortex0, texCoord);
    }

    gl_FragData[0] = color;
*/
