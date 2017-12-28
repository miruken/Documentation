=====================
Miruken Documentation
=====================

This repo rolls up all the miruken documentation into a single place. It is intented to be 
consumed by our automated build server.

It expects a very specific folder structure.
.. code::
  .
  |-- miruken
  |   |-- Documentation
  |
  |-- miruken-es5
  |   |-- miruken
  |
  |-- miruken-dotnet
      |-- Miruken
      |-- Miruken.Mediate
      |-- Miruken.Mvc
      |-- SymbolDownloader

The build documentation will eventually be on the Miruken website.

reStructuredText (reST)
-----------------------

This documentation is written with 
`reStructuredText <http://docutils.sourceforge.net/docs/user/rst/quickstart.html>`_
and 
`Sphinx <http://www.sphinx-doc.org/>`_

How to include source code in docs 

* http://docutils.sourceforge.net/docs/ref/rst/directives.html#include
* http://sphinx.readthedocs.io/en/stable/markup/code.html#directive-literalinclude
  



