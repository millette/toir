<tag-one>
  <h2>Tag One</h2>
  <p>{boo}</p>
  <tag-two></tag-two>

  <script>
    this.boo = this.opts.boo === undefined ? this.parent.boo : this.opts.boo
  </script>
</tag-one>
