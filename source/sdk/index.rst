:topic: Application Development SDK

Application Development SDK
===========================

This section contains direct excerpts and quotes from publicly accessible
documentation: :ref:`ypdoc:overview-manual/concepts:application development sdk`
|nbsp| |---| |nbsp| |copy| 2010 |--| 2021 The Yocto Project.

.. figure:: /sdk/overview-manual/sdk.png
   :name: sdk
   :figclass: align-center
   :align: center

   :ref:`ypdoc:overview-manual/concepts:application development sdk`
   with Details

In :numref:`build-system-areas`, the output labeled :dfn:`Application
Development SDK` represents an |SDK|. The |SDK| generation process differs
depending on whether you build an :dfn:`Extensible SDK` (e.g. :command:`bitbake
-c populate_sdk_ext imagename`) or a :dfn:`Standard SDK` (e.g. :command:`bitbake
-c populate_sdk imagename`).

.. hint::

   * The Yocto Project supports several methods by which you can set up this
     cross-development environment. These methods include downloading pre-built
     SDK installers (e.g. from a tool vendor) or building and installing your
     own SDK installer with the help of the Yocto Project.
   * For background information on cross-development toolchains in the Yocto
     Project development environment, see the
     :ref:`ypdoc:overview-manual/concepts:cross-development toolchain generation`
     section as part of the :dfn:`BitBake Tool Area`.
   * For information on setting up a cross-development environment, see the
     :doc:`ypdoc:sdk-manual/index` manual.

The specific form of this output is a set of files that includes a
self-extracting |SDK| installer (:file:`*.sh`), host and target manifest files,
and files used for |SDK| testing. When the |SDK| installer file is run, it
installs the |SDK|. The |SDK| consists of a cross-development toolchain, a set
of libraries and headers, and an |SDK| environment setup script. Running this
installer essentially sets up your cross-development environment. You can think
of the cross-toolchain as the :dfn:`host` part because it runs on the |SDK|
machine. You can think of the libraries and headers as the :dfn:`target` part
because they are built for the target hardware. The environment setup script
is added so that you can initialize the environment before using the tools.

.. rubric:: Two different SDK types

All the output files for an |SDK| are written to the :file:`deploy/sdk` folder
inside the :dfn:`Build Directory` as shown in :numref:`sdk`. Depending on the
type of |SDK|, several variables exist that help configure these files. For a
side-by-side comparison of main features supported for an :dfn:`Extensible SDK`
as compared to a :dfn:`Standard SDK`, see the
:doc:`ypdoc:sdk-manual/intro` chapter in the :doc:`ypdoc:sdk-manual/index`.

.. tabularcolumns:: L{38mm}|C{58mm}C{58mm}
.. list-table:: Features summary for the two SDK types
   :class: longtable
   :align: center
   :width: 100 %
   :widths: 38 58 58
   :header-rows: 1
   :stub-columns: 1

   * - Feature
     - :dfn:`Standard SDK`
     - :dfn:`Extensible SDK`
   * - Toolchain
     - Yes
     - Yes [1]_
   * - Debugger
     - Yes
     - Yes [1]_
   * - Size
     - 100+ |MB|
     - 1+ |GB| (or 300+ |MB| for minimal w/toolchain)
   * - :doc:`devtool <ypdoc:ref-manual/devtool-reference>`
     - No
     - Yes
   * - Build Images
     - :yellow:`No`
     - :green:`Yes`
   * - Updateable
     - :yellow:`No`
     - :green:`Yes`
   * - Managed Sysroot [2]_
     - :green:`No`
     - :red:`Yes`
   * - Installed Packages
     - No [3]_
     - Yes [4]_
   * - Construction
     - :green:`Packages`
     - :yellow:`Shared State`

.. [1] :dfn:`Extensible SDK` contains the toolchain and debugger if
       :term:`ypdoc:SDK_EXT_TYPE` is :code:`full` or
       :term:`ypdoc:SDK_INCLUDE_TOOLCHAIN` is :code:`1`,
       :strong:`which is the default`.
.. [2] Sysroot is managed through the use of the :command:`devtool` command.
       Thus, it is less likely that you will :strong:`corrupt your SDK sysroot`
       when you try to add additional libraries.
.. [3] You can add runtime package management to the :dfn:`Standard SDK` but
       it :strong:`is not supported by default`.
.. [4] You :strong:`must build and make the Shared State Cache available` to
       :dfn:`Extensible SDK` users for :dfn:`packages` you want to enable
       users to install.

.. rubric:: Extensible SDK

.. code-block:: bash

   bitbake -c populate_sdk_ext imagename

The Yocto Project :dfn:`Extensible SDK` (eSDK) has tools that allow you to
easily add new applications and libraries to an image, modify the source of
an existing component and test changes on the target hardware. The main benefit
over the :dfn:`Standard SDK` is improved team workflow due to tighter
integration with the |OE_| build system and have access to developer tools. For
a detailed description see the :doc:`ypdoc:sdk-manual/extensible` chapter in
the :doc:`ypdoc:sdk-manual/index`. News about development can read on the
:wikiyp:`Extensible SDK`.

The following list shows the variables associated with an :dfn:`Extensible SDK`:

* :term:`ypdoc:DEPLOY_DIR`: Points to the :dfn:`Deploy Directory` inside the
  :dfn:`Build Directory`.
* :term:`ypdoc:SDK_EXT_TYPE`: Controls whether or not shared state artifacts
  are copied into the :dfn:`Extensible SDK`. By default, all required shared
  state artifacts are copied into the |SDK|.
* :term:`ypdoc:SDK_INCLUDE_PKGDATA`: Specifies whether or not package data is
  included in the :dfn:`Extensible SDK` for all recipes in the :dfn:`world`
  target.
* :term:`ypdoc:SDK_INCLUDE_TOOLCHAIN`: Specifies whether or not the toolchain
  is included when building the :dfn:`Extensible SDK`.
* :term:`ypdoc:SDK_LOCAL_CONF_WHITELIST`: A list of variables allowed through
  from the build system configuration into the :dfn:`Extensible SDK`
  configuration.
* :term:`ypdoc:SDK_LOCAL_CONF_BLACKLIST`: A list of variables not allowed
  through from the build system configuration into the :dfn:`Extensible SDK`
  configuration.
* :term:`ypdoc:SDK_INHERIT_BLACKLIST`: A list of classes to remove from the
  :term:`ypdoc:INHERIT` value globally within the :dfn:`Extensible SDK`
  configuration.

.. seealso::

   * :wikiyp:`Application Development with Extensible SDK`
   * :wikiyp:`Extensible SDK`

.. rubric:: Standard SDK

.. code-block:: bash

   bitbake -c populate_sdk imagename

The Standard |SDK| provides a cross-development toolchain and libraries
tailored to the contents of a specific image. You would use the :dfn:`Standard
SDK` if you want a more traditional toolchain experience as compared to the
:dfn:`Extensible SDK`. For a detailed description see the
:doc:`ypdoc:sdk-manual/using` chapter in the :doc:`ypdoc:sdk-manual/index`.
Some use case scenarios can read on the :wikiyp:`SDK Generator`.

This next list, shows the variables associated with a :dfn:`Standard SDK`:

* :term:`ypdoc:DEPLOY_DIR`: Points to the deploy directory.
* :term:`ypdoc:SDKMACHINE`: Specifies the architecture of the machine on
  which the cross-development tools are run to create packages for the
  target hardware.
* :term:`ypdoc:SDKIMAGE_FEATURES`: Lists the features to include in the
  :dfn:`target` part of the |SDK|.
* :term:`ypdoc:TOOLCHAIN_HOST_TASK`: Lists packages that make up the host
  part of the |SDK| (i.e. the part that runs on the :term:`ypdoc:SDKMACHINE`).
  When you use BitBake to create the |SDK|, a set of default packages apply.
  This variable allows you to add more packages.
* :term:`ypdoc:TOOLCHAIN_TARGET_TASK`: Lists packages that make up the target
  part of the |SDK| (i.e. the part built for the target hardware).
* :term:`ypdoc:SDKPATH`: Defines the default |SDK| installation path offered
  by the installation script.
* :term:`ypdoc:SDK_HOST_MANIFEST`: Lists all the installed packages that make
  up the host part of the |SDK|. This variable also plays a minor role for
  :dfn:`Extensible SDK` development as well. However, it is mainly used for the
  :dfn:`Standard SDK`.
* :term:`ypdoc:SDK_TARGET_MANIFEST`: Lists all the installed packages that make
  up the target part of the |SDK|. This variable also plays a minor role for
  :dfn:`Extensible SDK` development as well. However, it is mainly used for the
  :dfn:`Standard SDK`.

.. seealso::

   * :wikiyp:`Application Development with Legacy SDK`
   * :wikiyp:`TipsAndTricks/Cmake,Eclipse, and SDKS`

.. ...........................................................................

.. spelling::

   eSDK
   Sysroot
   Updateable
   toolchains

.. Local variables:
   coding: utf-8
   mode: text
   mode: rst
   End:
   vim: fileencoding=utf-8 filetype=rst :
