:topic: Package Feeds

Package Feeds
=============

This section contains direct excerpts and quotes from publicly accessible
documentation: :ref:`ypdoc:overview-manual/concepts:package feeds`
|nbsp| |---| |nbsp| |copy| 2010 |--| 2021 The Yocto Project.

.. figure:: /package-feeds/overview-manual/package-feeds.png
   :name: package-feeds
   :figclass: align-center
   :align: center

   :ref:`ypdoc:overview-manual/concepts:package feeds`
   with Details

Package feeds are an intermediary step in the build process. The |OE_| build
system provides classes to generate different package types, and you specify
which classes to enable through the :term:`ypdoc:PACKAGE_CLASSES` variable.
Before placing the packages into package feeds, the build process validates
them with generated output quality assurance (QA) checks through the
:ref:`ypdoc:ref-classes-insane` class.

The package feed area resides in the :dfn:`Build Directory`. The directory the
build system uses to temporarily store packages is determined by a combination
of variables and the particular package manager in use. See the :dfn:`Package
Feeds` box in :numref:`package-feeds` and note the information to the right of
that area. In particular, the following defines where package files are kept:

* :term:`ypdoc:DEPLOY_DIR`: Defined as :file:`tmp/deploy` in the
  :dfn:`Build Directory` |nbsp| |--| |nbsp| the :dfn:`Deploy Directory`.
* :code:`DEPLOY_DIR_*`: Depending on the package manager used, the package
  type sub-folder. Given RPM, IPK, or DEB packaging and tarball creation, the
  :term:`ypdoc:DEPLOY_DIR_RPM`, :term:`ypdoc:DEPLOY_DIR_IPK`,
  :term:`ypdoc:DEPLOY_DIR_DEB`, or :term:`ypdoc:DEPLOY_DIR_TAR`,
  variables are used, respectively.
* :term:`ypdoc:PACKAGE_ARCH`: Defines architecture-specific sub-folders. For
  example, packages could exist for the :code:`i586` or :code:`qemux86`
  architectures.

.. hint::

   Mostly all that variables set to default values in the BitBake default
   configuration file :file:`conf/bitbake.conf` that residence inside the
   :dfn:`Source Directory`.

BitBake uses the :ref:`do_package_write_* <ypdoc:ref-tasks-package_write_deb>`
tasks to generate packages and place them into the package holding area (e.g.
:ref:`ypdoc:ref-tasks-package_write_ipk` for IPK packages). See the
:ref:`ypdoc:ref-tasks-package_write_deb`,
:ref:`ypdoc:ref-tasks-package_write_ipk`,
:ref:`ypdoc:ref-tasks-package_write_rpm`, and
:ref:`ypdoc:ref-tasks-package_write_tar` sections in the
:doc:`ypdoc:ref-manual/index` for additional information.
As an example, consider a scenario where an IPK packaging manager is being
used and package architecture support for both :code:`i586` and :code:`qemux86`
exist. Packages for the :code:`i586` architecture are placed in
:file:`build/tmp/deploy/ipk/i586`, while packages for the :code:`qemux86`
architecture are placed in :file:`build/tmp/deploy/ipk/qemux86`.

.. Local variables:
   coding: utf-8
   mode: text
   mode: rst
   End:
   vim: fileencoding=utf-8 filetype=rst :
