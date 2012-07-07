# 1. Useful alternatives for certain javascript functions
# ------------------------------------------------------------
after   = (ms, cb)    -> setTimeout cb, ms
prevent = (timeout)   -> clearTimeout timeout
every   = (ms, cb)    -> setInterval cb, ms
finish  = (interval)  -> clearInterval interval

# example usage
timebomb = after 1000, -> # explode
prevent timebomb
chore = every 1000, -> # do chore
finish chore


# 2. Adding Global utility methods.
# ------------------------------------------------------------
# When adding a method or property to the global scope.
# instead of this:
window.after   = (ms, cb)    -> setTimeout cb, ms
window.prevent = (timeout)   -> clearTimeout timeout
window.every   = (ms, cb)    -> setInterval cb, ms
window.finish  = (interval)  -> clearInterval interval

# do this:
@after   = (ms, cb)    -> setTimeout cb, ms
@prevent = (timeout)   -> clearTimeout timeout
@every   = (ms, cb)    -> setInterval cb, ms
@finish  = (interval)  -> clearInterval interval
# Since the scope for `this` in a coffeescript file will reference
# to the wrapped function's context. (function(){ ... }).call(this)
# unless, of course, the command line option has the --bare in it.


# 3. Creating Arrays with multiple objects.
# ------------------------------------------------------------
# A.1 Compressed (Curly Braces)
platoons = [
  {id:0, name: 'Alpha'}
  {id:1, name: 'Bravo'}
  {id:2, name: 'Charlie'}
]
# A.2 Compressed (Parenthesis)
platoons = [
  (id:0, name: 'Alpha')
  (id:1, name: 'Bravo')
  (id:2, name: 'Charlie')
]

# B. Compact
platoons = [
  id: 0, name: 'Alpha'
,
  id: 1, name: 'Bravo'
,
  id: 2, name: 'Charlie'
]
# C. Expanded
platoons = [
  id: 0
  name: 'Alpha'
,
  id: 1
  name: 'Bravo'
,
  id: 2
  name: 'Charlie'
]
