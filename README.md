# qs-lite
[![Node.js CI](https://github.com/kawanet/qs-lite/workflows/Node.js%20CI/badge.svg?branch=master)](https://github.com/kawanet/qs-lite/actions/)
[![npm version](https://badge.fury.io/js/qs-lite.svg)](http://badge.fury.io/js/qs-lite)

Lightweight querystring parse() & stringify() at less than 1KB minified

### Usage

```js
var qs = require("qs-lite");

var string = qs.stringify({foo: "bar", hoge: "pomu"}); // => "foo=bar&hoge=pomu"

var obj = qs.parse("foo=bar&hoge=pomu"); // => { "foo": "bar", "hoge": "pomu" }
```

### Node.js

```sh
npm install --save qs-lite
```

### Browser

```html
<script src="https://raw.githubusercontent.com/kawanet/qs-lite/master/dist/qs-lite.min.js"></script>
```

### Repository

- https://github.com/kawanet/qs-lite
 
### Documentation

- http://kawanet.github.io/qs-lite/module-qs-lite.html

### See also

- https://github.com/hapijs/qs

### BSD License

Copyright (c) 2015, Yusuke Kawasaki

All rights reserved.
