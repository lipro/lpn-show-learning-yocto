.. Never add or change more than structure, instead edit content in files:
   *.rsti

BitBake Tool
============

This section contains direct excerpts and quotes from publicly accessible
documentation: :ref:`ypdoc:overview-manual/concepts:bitbake tool`
|nbsp| |---| |nbsp| |copy| 2010 |--| 2021 The Yocto Project.

The |OE_| build system uses :term:`ypdoc:BitBake` to produce images and
Software Development Kits (SDKs). You can see from
:numref:`build-system-areas`, the box :dfn:`BitBake Tool Area` in the middle
consists of several functional stages:

.. include:: /bitbake-tool/bitbake-tool.rsti

.. hint::

   Separate documentation exists for the
   :ref:`ypdoc:overview-manual/concepts:bitbake` tool. See the
   :doc:`bbdoc:index` for reference material on BitBake.

.. toctree::
   :hidden:

   inherit
   fetching
   patching
   compilation
   packaging
   image-generation
   sdk-generation

.. Local variables:
   coding: utf-8
   mode: text
   mode: rst
   End:
   vim: fileencoding=utf-8 filetype=rst :
