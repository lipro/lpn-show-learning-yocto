.. Never add or change more than content, instead edit structure in files:
   /build-system/index.rst

BitBake Tool Area
=================

.. figure:: /build-system/concepts/bitbake-tool-area.*
   :name: bitbake-tool-area
   :figclass: align-center
   :align: center

   :ref:`ypdoc:overview-manual/concepts:bitbake tool`
   as part of Yocto WBuild System orkflow

The OpenEmbedded build system uses BitBake to produce images and |SDK_|.
You can see from the general workflow figure, the BitBake area consists
of several functional areas:

#. Source Fetching
#. Patching
#. Configuration, Compilation, and Staging
#. Package Splitting
#. Image Generation
#. SDK Generation

See :doc:`/bitbake-tool/index` for more details.

.. Local variables:
   coding: utf-8
   mode: text
   mode: rst
   End:
   vim: fileencoding=utf-8 filetype=rst :
