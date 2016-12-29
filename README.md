# gl-phong-material

--------------------------------------
> `STYLE PARAMETERS`

> `ambient` : `vec3` ambient color component, default `[0.2, 0.2, 0.2]`

> `diffuse` : `vec3` diffuse color component, default `[0.8, 0.8, 0.8]`

> `specular` : `vec3` specular color component, default `[0.8, 0.8, 0.8]`

> `shininess` : `float` surface roughness, 0 for smooth, 1 for matte, default `0.7`

## install

```
npm install gl-phong-material
```

```javascript
var phong = require('gl-phong-material')
var material = require('gl-material')(gl, phong, {LIGHTCOUNT: 1})
```

Or just get the fragment shader for use elsewhere

```javascript
var fragment = require('gl-phong-material').fragment
```
