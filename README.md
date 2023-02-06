# qs-lite
[![Node.js CI](https://github.com/kawanet/qs-lite/workflows/Node.js%20CI/badge.svg?branch=master)](https://github.com/kawanet/qs-lite/actions/)
[![npm version](https://badge.fury.io/js/qs-lite.svg)](http://badge.fury.io/js/qs-lite)

Lightweight querystring parse() & stringify() at less than 1KB minified

### Node.js

```js
const qs = require("qs-lite");

const string = qs.stringify({foo: "bar", hoge: "pomu"}); // => "foo=bar&hoge=pomu"

const object = qs.parse("foo=bar&hoge=pomu"); // => { "foo": "bar", "hoge": "pomu" }
```

### Browser

```html
<script src="https://cdn.jsdelivr.net/npm/qs-lite/dist/qs-lite.min.js"></script>
<script>
  const string = qs.stringify({foo: "bar", hoge: "pomu"}); // => "foo=bar&hoge=pomu"

  const object = qs.parse("foo=bar&hoge=pomu"); // => { "foo": "bar", "hoge": "pomu" }
</script>
```

### TypeScript

- https://github.com/kawanet/qs-lite/blob/master/qs-lite.d.ts

### Repository

- https://github.com/kawanet/qs-lite
 
### Documentation

- http://kawanet.github.io/qs-lite/module-qs-lite.html

### See also

- https://github.com/hapijs/qs

### BSD License

Copyright (c) 2015-2023, Yusuke Kawasaki
All rights reserved.
