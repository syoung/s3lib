mocha


<entry [Fri 2015:04:10 07:54:09 EST] TEST SCRIPT - HOW TO USE it AND describe>

1. CREATE TEST

mocha.test.js

// # Mocha Guide to Testing
// Objective is to explain describe(), it(), and before()/etc hooks

// 1. `describe()` is merely for grouping, which you can nest as deep
// 2. `it()` is a test case
// 3. `before()`, `beforeEach()`, `after()`, `afterEach()` are hooks to run
// before/after first/each it() or describe().
//
// Which means, `before()` is run before first it()/describe()

// -----------------------------------------------------------------------------

// should.js is the preferred assertion library
var should = require('should');

// **Only 1 test case (in a nameless test suite)**
it('birds should fly', function(){
  /** here.should.be.tested
    * However, as long as no error within a it(),
    * it() is considered PASSED */
})


// **Only 1 test case, but nested 3-level deep**

// describe() are:
// - commonly known as test suites, which contains test cases
// - merely groups, and you can have groups within groups
describe('galaxy', function(){
  describe('earth', function(){
    describe('singapore', function(){
      it('birds should fly', function(){ /** ... */ })
    })
  })
})


// **2 test cases in 1 test suite**

// A common scenario.
describe('singapore', function(){
  it('birds should fly', function(){ /** ... */ })
  it('horse should gallop', function(){ /** ... */ })
})


// **Run once before the first test case**
describe('singapore', function(){
  before(function(){
    console.log('see.. this function is run ONCE only')
  })
  it('birds should fly', function(){ /** ... */ })
  it('horse should gallop', function(){ /** ... */ })
})


// **Run once before each test case**
describe('singapore', function(){
  beforeEach(function(){
    console.log('see.. this function is run EACH time')
  })
  it('birds should fly', function(){ /** ... */ })
  it('horse should gallop', function(){ /** ... */ })
})

// **2 test suites in a big test suite**

// A common scenario.
describe('earth', function(){
  describe('singapore', function(){
    it('birds should fly', function(){ /** ... */ })
  })
  describe('malaysia', function(){
    it('birds should soar', function(){ /** ... */ })
  })
})


// **before() can be applied to describe() too**
describe('earth', function(){
  before(function(){
    console.log('see.. this function is run ONCE only, before first describe()')
  })
  describe('singapore', function(){
    it('birds should fly', function(){ /** ... */ })
  })
  describe('malaysia', function(){
    it('birds should soar', function(){ /** ... */ })
  })
})


// **beforeEach() can be applied to describe() too**
describe('earth', function(){
  beforeEach(function(){
    console.log('see.. this function is run EACH time, before each describe()')
  })
  describe('singapore', function(){
    it('birds should fly', function(){ /** ... */ })
  })
  describe('malaysia', function(){
    it('birds should soar', function(){ /** ... */ })
  })
})



2. RUN TEST

mocha mocha.test.js 


  ✓ birds should fly 
  galaxy
    earth
      singapore
        ✓ birds should fly 

  singapore
    ✓ birds should fly 
    ✓ horse should gallop 

  singapore
see.. this function is run ONCE only
    ✓ birds should fly 
    ✓ horse should gallop 

  singapore
see.. this function is run EACH time
    ✓ birds should fly 
see.. this function is run EACH time
    ✓ horse should gallop 

  earth
    singapore
      ✓ birds should fly 
    malaysia
      ✓ birds should soar 

  earth
see.. this function is run ONCE only, before first describe()
    singapore
      ✓ birds should fly 
    malaysia
      ✓ birds should soar 

  earth
    singapore
see.. this function is run EACH time, before each describe()
      ✓ birds should fly 
    malaysia
see.. this function is run EACH time, before each describe()
      ✓ birds should soar 


  14 passing (9ms)


	
</entry>