# JSDocPlugin

This package provides an RStudio plugin to insert skeleton JSDoc markup into a Javascript source file.

For example, with Javascript source

```{javascript}
    this.repeatToLen = function(arr, len) {
      arr = [].concat(arr);
      while (arr.length < len/2)
        arr = arr.concat(arr);
      return arr.concat(arr.slice(0, len - arr.length));
    };
```

it will insert markup so it looks like

```{javascript}
    /**
     * ?
     * @param arr
     * @param len
     */
    this.repeatToLen = function(arr, len) {
      arr = [].concat(arr);
      while (arr.length < len/2)
        arr = arr.concat(arr);
      return arr.concat(arr.slice(0, len - arr.length));
    };
```

It's up to you to add the descriptive comments.

To install in RStudio, simply install this package in R and in RStudio it
will appear as  "Insert JSDoc Skeleton" in the Tools menu.  To
attach to a hotkey,  use RStudio's "Tools | Addins | Browse Addins... | Keyboard Shortcuts" menu
to set a shortcut.
