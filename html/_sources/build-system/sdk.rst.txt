.. Never add or change more than content, instead edit structure in files:
   /build-system/index.rst

SDK Area
========

.. figure:: /build-system/concepts/sdk-area.*
   :name: sdk-area
   :figclass: align-center
   :align: center

   :ref:`ypdoc:overview-manual/concepts:application development sdk`
   as part of Yocto Build System Workflow

In the general workflow figure, the output labeled "Application Development
SDK" represents an |SDK|. The |SDK| generation process differs depending on
whether you build an extensible |SDK| (e.g. :file:`bitbake -c populate_sdk_ext
imagename`) or a standard SDK (e.g. :file:`bitbake -c populate_sdk imagename`).
See :doc:`/sdk/index` for more details.

.. Local variables:
   coding: utf-8
   mode: text
   mode: rst
   End:
   vim: fileencoding=utf-8 filetype=rst :
