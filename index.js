var glslify = require('glslify');

module.exports = {
  fragment: glslify('./fragment.glsl'),
  styles: {
    ambient: {type: 'vec3', default: [0.2, 0.2, 0.2]},
    diffuse: {type: 'vec3', default: [0.8, 0.8, 0.8]},
    specular: {type: 'vec3', default: [0.8, 0.8, 0.8]},
    shininess: {type: 'float', default: 0.7, min: 0, max: 1}
  },
  name: 'phong'
};
