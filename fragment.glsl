precision highp float;

varying vec3 vposition;
varying vec3 vnormal;
uniform vec3 eye;

#pragma glslify: Light = require('glsl-light')
#pragma glslify: attenuation = require('glsl-light-attenuation')
#pragma glslify: direction = require('glsl-light-direction')
#pragma glslify: orenn = require('glsl-diffuse-oren-nayar')

struct Style {
  vec3 ambient;
  vec3 diffuse;
  vec3 specular;
  float shininess;
};

uniform Light lighting[LIGHTCOUNT];
uniform Style style;

void main() {
    vec3 N = normalize(vnormal);
    vec3 result = vec3(0.0);

  for (int i = 0; i < LIGHTCOUNT; ++i) {
    if (lighting[i].visible) {
      vec3 L = normalize(lighting[i].position.xyz - vposition);
      vec3 E = normalize(-vposition); // we are in Eye Coordinates, so EyePos is (0,0,0)
      vec3 R = normalize(-reflect(L,N));

      //calculate Ambient Term:
      vec3 Iamb = style.ambient;
      //calculate Diffuse Term:
      vec3 Idiff = style.diffuse * max(dot(N,L), 0.0);
      Idiff = clamp(Idiff, 0.0, 1.0);

      // calculate Specular Term:
      vec3 Ispec = style.specular
             * pow(max(dot(R,E),0.0),0.3*style.shininess);
      Ispec = clamp(Ispec, 0.0, 1.0);

      result += Iamb + Idiff + Ispec;

    }
  }
  result = result;

  gl_FragColor = vec4(result, 1);
}
