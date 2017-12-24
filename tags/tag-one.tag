<tag-one>
  <h2>Tag One</h2>
  <p>{boo}</p>
  <tag-two boo={boo}></tag-two>

  <h3>Pages</h3>
  <ul>
    <li><a onclick={click} href="/">Index</a></li>
    <li><a onclick={click} href="/page-2">page 2</a></li>
  </ul>

  <script>
    if (typeof window === 'object') {
      window.onpopstate = (event) => {
        // event.preventUpdate = true
        // event.preventDefault()
        //console.log("location: " + document.location + ", state: " + JSON.stringify(event.state));
        const boo = event.state.boo
        // this.boo = boo
        // this.opts.boo = boo
        // console.log('POP', event.state)
        this.tags['tag-two'].update({ boo })
        this.update({ boo })
        // riot.update()
      }
    }

    this.boo = (this.opts.boo === undefined && this.parent) ? this.parent.boo : this.opts.boo

    this.click = (e) => {
      e.preventUpdate = true
      e.preventDefault()
      // console.log('TAG-ONE-CLICK', e)
      // console.log('TAG-ONE-CLICK (url)', e.target.pathname, this.refs)
      // console.log('TAG-ONE-CLICK (keys)', Object.keys(e))
      // this.parent.opts.boo = e.target.pathname
      const boo = e.target.pathname === '/' ? 'jolly' : 'PAGE-2!!!'
      history.pushState({ boo }, boo, e.target.pathname)
      this.tags['tag-two'].update({ boo })
      this.update({ boo })
      // riot.update({ boo: e.target.pathname })
    }

    // this.on('*', (evn) => console.log(new Date(), 'tag-one', evn, this.opts.boo, this.boo, 'REFS', this.tags))
  </script>
</tag-one>
