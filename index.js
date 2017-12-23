'use strict'

const riot = require('riot')
require('./tags/tags')

const boo = 'qqqq'
const x = riot.render('the-app', { boo })

console.log('XXX1:', x)
