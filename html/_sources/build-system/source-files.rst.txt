.. Never add or change more than content, instead edit structure in files:
   /build-system/index.rst

Source Area
===========

.. figure:: /build-system/concepts/source-files-area.*
   :name: source-files-area
   :figclass: align-center
   :align: center

   :ref:`ypdoc:overview-manual/concepts:sources`
   as part of Yocto Build System Workflow

In order for the OpenEmbedded build system to create an image or any
target, it must be able to access source files. The general workflow
figure represents source files using the "Upstream Project Releases",
"Local Projects", and "|SCMS| (optional)" boxes. The figure represents
mirrors, which also play a role in locating source files, with the
"Source Materials" box. See :doc:`/source-files/index` for more details.

.. Local variables:
   coding: utf-8
   mode: text
   mode: rst
   End:
   vim: fileencoding=utf-8 filetype=rst :
