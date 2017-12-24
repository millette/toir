<the-app>
  <h1>This is the app</h1>
  <tag-one boo={boo}></tag-one>

  <script>
    this.boo = this.opts.boo || 'hourra'

/*
    if (typeof window === 'undefined') {
      this.on('*', (evn) => console.log(new Date(), 'SRV-the-app', evn, this.opts.boo, this.boo))
    } else {
      this.on('*', (evn) => console.log(new Date(), 'WEB-the-app', evn, this.opts.boo, this.boo))
    }
*/
  </script>
</the-app>
