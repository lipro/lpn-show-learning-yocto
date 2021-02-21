.. Never add or change more than structure, instead edit content in files:
   *.rsti

User Configuration
==================

This section contains direct excerpts and quotes from publicly accessible
documentation: :ref:`ypdoc:overview-manual/concepts:user configuration`
|nbsp| |---| |nbsp| |copy| 2010 |--| 2021 The Yocto Project.

.. figure:: /user-configuration/overview-manual/user-configuration.png
   :name: user-configuration
   :figclass: align-center
   :align: center

   :ref:`ypdoc:overview-manual/concepts:user configuration`
   with Details

BitBake needs some basic configuration files in order to complete a build.
These files are :file:`*.conf` files. The minimally necessary ones reside
as example files in the :file:`build/conf` directory of the :dfn:`Source
Directory`. For simplicity, this section and :numref:`user-configuration`
refers to the :dfn:`Source Directory` as the :dfn:`Poky Directory`.

The :file:`meta-poky` layer inside Poky contains a :file:`conf` directory
that has example configuration files. These example files are used as a
basis for creating actual configuration files when you source
:ref:`ypdoc:structure-core-script`, which is the build environment script.

Sourcing the build environment script creates a :dfn:`Build Directory`
if one does not already exist. BitBake uses the :dfn:`Build Directory`
for all its work during builds. The :dfn:`Build Directory` has a
:file:`conf` directory that contains default versions of your
:file:`local.conf` and :file:`bblayers.conf` configuration files. These
default configuration files are created only if versions do not already
exist in the :dfn:`Build Directory` at the time you source the build
environment setup script.

.. attention::

   Because the Poky repository is fundamentally an aggregation of
   existing repositories, some users might be familiar with running the
   :ref:`ypdoc:structure-core-script` script in the context of separate
   |OE_| Core and BitBake repositories rather than a single Poky
   repository. This discussion :strong:`assumes the script is executed
   from within a cloned or unpacked version of Poky`.

The :file:`conf/local.conf` file provides many basic variables that define
a build environment. Here is a list of a few:

:Target Machine Selection: Controlled by the :term:`ypdoc:MACHINE` variable.
:Download Directory:       Controlled by the :term:`ypdoc:DL_DIR` variable.
                           Mostly set in :file:`conf/site.conf`.
                           |CRT| :strong:`Local Storage`
                           |CRT| :strong:`Source Material (mirrored)`
:Shared State Directory:   Controlled by the :term:`ypdoc:SSTATE_DIR` variable.
                           Mostly set in :file:`conf/site.conf`.
                           |CRT| :strong:`Shared State Cache`
:Build Output:             Controlled by the :term:`TMPDIR` variable.
:Distribution Policy:      Controlled by the :term:`DISTRO` variable.
:Packaging Format:         Controlled by the :term:`PACKAGE_CLASSES` variable.
:SDK Target Architecture:  Controlled by the :term:`SDKMACHINE` variable.
:Extra Image Packages:     Controlled by the :term:`EXTRA_IMAGE_FEATURES` variable.

.. note::

   Configurations set in the :file:`conf/local.conf` file can also be set in
   the :file:`conf/site.conf` and :file:`conf/auto.conf` configuration files.
   Both files are not created by the environment initialization script
   (:ref:`ypdoc:structure-core-script`). If you want the :file:`conf/site.conf`
   file, you need to create that yourself. The :file:`conf/auto.conf` file is
   typically created by an autobuilder running on a |CI|/|CD| environment.

The :file:`conf/bblayers.conf` file tells BitBake what layers you want
considered during the build. By default, the layers listed in this file include
layers minimally needed by the build system. However, :strong:`you must manually
add any custom layers you have created`. You can find more information on
working with the :file:`bblayers.conf` file in the
:ref:`ypdoc:dev-manual/common-tasks:enabling your layer` section in the
:doc:`ypdoc:dev-manual/index`.

When you launch your build with the :command:`bitbake target` command, BitBake
sorts out the configurations to ultimately define your build environment. It is
important to understand that the :doc:`./bitbake-tool` reads the configuration
files in a specific order: :file:`conf/site.conf`, :file:`conf/auto.conf`, and
:file:`conf/local.conf`. And, the build system applies the normal assignment
statement rules as described in the
:doc:`bbdoc:bitbake-user-manual/bitbake-user-manual-metadata` chapter of the
:doc:`bbdoc:index`. Because the files are parsed in a specific order, variable
assignments for the same variable could be affected. For example, if the
:file:`conf/auto.conf` file and the :file:`conf/local.conf` set
:code:`VARIABLE_1` to different values, because the build system parses
:file:`conf/local.conf` after :file:`conf/auto.conf`, :code:`VARIABLE_1`
is assigned the value from the :file:`conf/local.conf` file.

.. Local variables:
   coding: utf-8
   mode: text
   mode: rst
   End:
   vim: fileencoding=utf-8 filetype=rst :
