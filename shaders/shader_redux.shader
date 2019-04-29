attribute vec3 in_Position; 
attribute vec2 in_TextureCoord; 
varying vec2 vTc;
void main()
{
gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION]*vec4(in_Position.xyz,1.);
vTc=in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 vTc;
uniform float colorAmount;

void main()
{
    vec3 irgb= texture2D(gm_BaseTexture,vTc).rgb;
    float alpha= texture2D(gm_BaseTexture,vTc).a;
    float red = floor((irgb.r)*colorAmount)/colorAmount;
    float green = floor((irgb.g)*colorAmount)/colorAmount;
    float blue = floor((irgb.b)*colorAmount)/colorAmount;
    
    gl_FragColor=vec4(red, green, blue, alpha);
   //gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
}
