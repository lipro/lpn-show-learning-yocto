:topic: Images

Images
======

This section contains direct excerpts and quotes from publicly accessible
documentation: :ref:`ypdoc:overview-manual/concepts:images`
|nbsp| |---| |nbsp| |copy| 2010 |--| 2021 The Yocto Project.

.. figure:: /images/overview-manual/images.png
   :name: images
   :figclass: align-center
   :align: center

   :ref:`ypdoc:overview-manual/concepts:images`
   with Details

The images produced by the build system are compressed forms of the root
filesystem and are ready to boot on a target device. You can see from
:numref:`build-system-areas` that BitBake output, in part, consists of
image artifacts.

.. hint::

   For a list of example images that the Yocto Project provides, see the
   :doc:`ypdoc:ref-manual/images` chapter in the :doc:`ypdoc:ref-manual/index`.

The build process writes images out to the :dfn:`Build Directory` inside the
:file:`tmp/deploy/images/machine/` folder as shown in :numref:`images`. This
folder contains any files expected to be loaded on the target device. The
:term:`ypdoc:DEPLOY_DIR` variable points to the :dfn:`Deploy Directory`,
while the :term:`ypdoc:DEPLOY_DIR_IMAGE` variable points to the appropriate
directory containing images for the current configuration.

:kernel-image:

   A kernel binary file. The :term:`ypdoc:KERNEL_IMAGETYPE` variable determines
   the naming scheme for the kernel image file. Depending on this variable, the
   file could begin with a variety of naming strings. The
   :file:`deploy/images/machine` directory can contain multiple image files for
   the machine.

:root-filesystem-image:

   Root filesystems for the target device (e.g. :file:`*.ext3` or :file:`*.bz2`
   files). The :term:`ypdoc:IMAGE_FSTYPES` variable determines the root
   filesystem image type. The :file:`deploy/images/machine` directory can
   contain multiple root filesystems for the machine.

:kernel-modules:

   Tarballs that contain all the modules built for the kernel. Kernel module
   tarballs exist for legacy purposes and can be suppressed by setting the
   :term:`ypdoc:MODULE_TARBALL_DEPLOY` variable to :code:`0`. The
   :file:`deploy/images/machine` directory can contain multiple kernel module
   tarballs for the machine.

:bootloaders:

   If applicable to the target machine, bootloaders supporting the image. The
   :file:`deploy/images/machine` directory can contain multiple bootloaders
   for the machine.

:symlinks:

   The :file:`deploy/images/machine` folder contains a symbolic link that
   points to the most recently built file for each machine. These links might
   be useful for external scripts that need to obtain the latest version of
   each file.

.. spelling::

   filesystems
   bootloaders

.. Local variables:
   coding: utf-8
   mode: text
   mode: rst
   End:
   vim: fileencoding=utf-8 filetype=rst :
