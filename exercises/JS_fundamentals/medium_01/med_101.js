// med_101.js - Logical Operation
(false && undefined);
// false
(false || undefined);
// undefined
((false && undefined) || (false || undefined));
// undefined
((false || undefined) || (false && undefined));
// false
((false && undefined) && (false || undefined));
// false
((false || undefined) && (false && undefined));
// false (incorrect: undefined)
('a' || (false && undefined) || '');
// "a"
((false && undefined) || 'a' || '');
// "a"
('a' && (false || undefined) && '');
// undefined
((false || undefined) && 'a' && '');
// undefined
