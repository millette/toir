'use strict'

// npm
const Koa = require('koa')
const riot = require('riot')

// self
require('./tags/tags')

// core
const fs = require('fs')

const app = new Koa()

// static files
const riotStatic = fs.readFileSync('node_modules/riot/riot.min.js', 'utf-8')
const tagsStatic = fs.readFileSync('tags/tags.js', 'utf-8')

const htmlBody = (p) => fs.readFileSync(p, 'utf-8')
  .replace(
    /<the-app(\b[^]*)>[^]*<\/the-app>/,
    (match, p1) => {
      if (!p1) { return riot.render('the-app') }
      const obj = {}
      // FIXME: parse multiple attributes, doh
      const parts = p1.split('=')
      let k = parts[0].trim()
      let v = parts[1].trim()
      if (k[0] === '"' || k[0] === '\'') { k = k.slice(1, -1) }
      if (v[0] === '"' || v[0] === '\'') { v = v.slice(1, -1) }
      obj[k] = v
      const ret = riot.render('the-app', obj)
      return ret.replace('<the-app>', `<the-app${p1}>`)
    }
  )

app.use((ctx) => {
  switch (ctx.originalUrl) {
    case '/':
    case '/index':
    case '/index.html':
      ctx.type = 'text/html'
      ctx.body = htmlBody('pages/index.html')
      break

    case '/page-2':
    case '/page-2.html':
      ctx.type = 'text/html'
      ctx.body = htmlBody('pages/page-2.html')
      break

    case '/js/riot.min.js':
      ctx.type = 'application/javascript'
      ctx.body = riotStatic
      break

    case '/js/tags.js':
      ctx.type = 'application/javascript'
      ctx.body = tagsStatic
      break

    default:
      ctx.throw(404)
  }
})

app.listen(3020)
