.. Never add or change more than structure, instead edit content in files:
   *.rsti

Build System
============

.. figure:: /build-system/concepts/areas.*
   :figclass: align-center
   :align: center

   :ref:`ypdoc:overview-manual/concepts:openembedded build system concepts`
   as part of Yocto Build System Workflow

In general, the build’s workflow consists of several functional areas:

:User Configuration:          Setup values you can use to control the
                              build process.
:Metadata Layers:             Various layers that provide software, machine,
                              and distro metadata.
:Source Files:                Upstream releases, local projects, and |SCMS|.
:Package Feeds:               Directories containing output packages (RPM, DEB
                              or IPK), which are subsequently used in the
                              construction of an image or Software Development
                              Kit (SDK), produced by the build system. These
                              feeds can also be copied and shared using a web
                              server or other means to facilitate extending or
                              updating existing images on devices at runtime if
                              runtime package management is enabled.
:BitBake Tool:                Processes under the control of BitBake. This
                              block expands on how BitBake fetches source,
                              applies patches, completes compilation, analyzes
                              output for package generation, creates and tests
                              packages, generates images, and generates
                              cross-development tools.
:Images:                      Images produced by the build system workflow.
:Application Development SDK: Cross-development tools that are produced along
                              with an image or separately with BitBake.

.. include:: /build-system/user-configuration.rsti
.. include:: /build-system/metadata-layers.rsti
.. include:: /build-system/source-files.rsti
.. include:: /build-system/package-feeds.rsti
.. include:: /build-system/bitbake-tool.rsti
.. include:: /build-system/images.rsti
.. include:: /build-system/sdk.rsti

.. Local variables:
   coding: utf-8
   mode: text
   mode: rst
   End:
   vim: fileencoding=utf-8 filetype=rst :
