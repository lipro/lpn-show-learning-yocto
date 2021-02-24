:topic: Metadata Layers

Metadata Layers
===============

This section contains direct excerpts and quotes from publicly accessible
documentation: :ref:`ypdoc:overview-manual/concepts:metadata, machine
configuration, and policy configuration`
|nbsp| |---| |nbsp| |copy| 2010 |--| 2021 The Yocto Project.

.. figure:: /metadata-layers/overview-manual/layer-input-landscape.png
   :name: layer-input
   :figclass: align-center
   :align: center

   :ref:`Metadata Layers <ypdoc:overview-manual/concepts:metadata,
   machine configuration, and policy configuration>`
   with Details

In general, three types of layer input exists. You can see them below
:dfn:`User Configuration` box in :numref:`build-system-areas`:

:Metadata (.bb + Patches):

   :strong:`Software Layers` containing user-supplied recipe files, patches,
   and append files. A good example of a software layer might be the
   :oelayer:`meta-qt5 layer <layerindex/branch/master/layer/meta-qt5>`. This
   layer is for version 5.0 of the popular Qt cross-platform application
   development framework for desktop, embedded and mobile.

:Policy Configuration:

   Distribution Layers (i.e. :strong:`Distro Layer` in the following
   :numref:`layer-input`) providing top-level or general policies for
   the images or |SDK|\ s being built for a particular distribution. For
   example, in the
   :ref:`ypdoc:overview-manual/yp-intro:reference embedded distribution (poky)`
   the distro layer is the
   :oelayer:`meta-poky layer <layerindex/branch/master/layer/meta-poky>`.
   Within the distro layer is a :file:`conf/distro` directory that contains
   distro configuration files (e.g. `poky.conf`_ that contain many policy
   configurations for the Poky distribution).

:Machine BSP Configuration:

   |BSP_| Layers (i.e. :strong:`BSP Layer` in the following
   :numref:`layer-input`) providing machine-specific configurations.
   This type of information is specific to a particular target architecture.
   A good example of a |BSP| layer from the
   :ref:`ypdoc:overview-manual/yp-intro:reference embedded distribution (poky)`
   is the
   :oelayer:`meta-yocto-bsp layer <layerindex/branch/master/layer/meta-yocto-bsp>`.

.. _`poky.conf`:
   https://git.yoctoproject.org/cgit/cgit.cgi/meta-yocto/tree/meta-poky/conf/distro/poky.conf

In general, all layers have a similar structure. They all contain a licensing
file (e.g. :file:`COPYING.MIT`) if the layer is to be distributed, a
:file:`README` file as good practice and especially if the layer is to be
distributed, a configuration directory, and recipe directories. You can learn
about the general structure for layers used with the Yocto Project in the
:ref:`ypdoc:dev-manual/common-tasks:creating your own layer` section in the
:doc:`ypdoc:dev-manual/index`.

.. hint::

   BitBake uses the :file:`conf/bblayers.conf` file, which is part of the
   :dfn:`User Configuration`, to find what layers it should be using as part
   of the build.

.. rubric:: Software Layer

The software layer provides the Metadata for additional software packages used
during the build. This layer does not include Metadata that is specific to the
distribution or the machine, which are found in their respective layers.

This layer contains any recipes (:file:`.bb`), append files (:file:`.bbappend`),
and patches, that your project needs.

.. rubric:: Distro Layer

The distribution layer provides policy configurations for your distribution.
Best practices dictate that you isolate these types of configurations into
their own layer. Settings you provide in :file:`conf/distro/distro.conf`
override similar settings that BitBake finds in your :file:`conf/local.conf`
file in the Build Directory.

The following list provides some explanation and references for what you
typically find in the distribution layer:

:classes:

   Class files (:file:`.bbclass`) hold common functionality that can be
   shared among recipes in the distribution. When your recipes inherit
   a class, they take on the settings and functions for that class. You
   can read more about class files in the :doc:`ypdoc:ref-manual/classes`
   chapter of the :doc:`ypdoc:ref-manual/index`.

:conf:

   This area holds configuration files for the layer (:file:`conf/layer.conf`),
   the distribution (:file:`conf/distro/distro.conf`), and any distribution-wide
   include files.

:recipes-*:

   Recipes (:file:`.bb`) and append files (:file:`.bbappend`) that affect
   common functionality across the distribution. This area could include
   recipes and append files to add distribution-specific configuration,
   initialization scripts, custom image recipes, and so forth. Examples
   of :file:`recipes-*` directories are :file:`recipes-core` and
   :file:`recipes-extra`. Hierarchy and contents within a :file:`recipes-*`
   directory can vary. Generally, these directories contain recipe files
   (:file:`*.bb`), recipe append files (:file:`*.bbappend`), directories
   that are distro-specific for configuration files, and so forth.

.. rubric:: BSP Layer

The |BSP| layer provides machine configurations that target specific hardware.
Everything in this layer is specific to the machine for which you are building
the image or the |SDK|. A common structure or form is defined for |BSP| layers.
You can learn more about this structure in the :doc:`ypdoc:bsp-guide/index`.

.. attention::

   In order for a |BSP| layer to be considered compliant with the Yocto Project,
   it must meet some structural requirements.

The |BSP| layer's configuration directory contains configuration files for the
machine (:file:`conf/machine/machine.conf`) and, of course, the layer
(:file:`conf/layer.conf`). The remainder of the layer is dedicated to specific
recipes by function: :file:`recipes-bsp`, :file:`recipes-core`,
:file:`recipes-graphics`, :file:`recipes-kernel`, and so forth. Metadata can
exist for multiple form factors, graphics support systems, and so forth.

.. note::

   While :numref:`layer-input` shows several :file:`recipes-*` directories,
   not all these directories appear in all |BSP| layers.

.. Local variables:
   coding: utf-8
   mode: text
   mode: rst
   End:
   vim: fileencoding=utf-8 filetype=rst :
