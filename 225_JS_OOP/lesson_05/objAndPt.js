// objAndPt.js - Objects and Prototypes
// 1)
var prot = {};

var foo = Object.create(prot);

Object.getPrototypeOf(foo) === prot;

prot.isPrototypeOf(foo) === true;

/*
4)  true; true
    Line 5 returns `true` because we created the object `foo` using `prot`
    as its prototype on line 3 using `Object.create()`. Line 6 returns `true`
    because the `Object.prototype` object is at the end of every object chain.

    [More specifically, `prot` was created without a prototype since it was
     made via object literal notation. JS automatically assigns `Object.prototype`
     as its prototype, and thus given that `prot` is `foo`'s prototype,
     `Object.prototype` is also foo's prototype]
/*
