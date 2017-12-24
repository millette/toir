<tag-two>
  <h3>Tag Two</h3>
  <p><b>{boo}</b></p>

  <script>
    this.boo = (this.opts.boo === undefined && this.parent) ? this.parent.boo : this.opts.boo
    // this.on('*', (evn) => console.log(new Date(), 'tag-two', evn, this.opts.boo, this.boo))
  </script>
</tag-two>
