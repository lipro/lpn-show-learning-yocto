.. Never add or change more than content, instead edit structure in files:
   /about/index.rst

Yocto Project Provides
======================

.. figure:: /about/yp-provides.*
   :name: yp-provides
   :figclass: align-center
   :align: center

   Yocto Project Deliveries :cite:`osiermixonmcgrath2015ypembos`

* embedded tools
* best practices
* reference implementation

.. rubric:: Yocto Project and OpenEmbedded

.. admonition:: OpenEmbedded
   :class: note

   .. only:: html

      .. image:: /_extra/_static/oe.*
         :align: right
         :width: 96px

   * Created by merging the work of the OpenZaurus project with contributions
     from other projects such as Familiar Linux and OpenSIMpad into a common
     code base
   * Community project focusing on broad hardware and architectures
   * Large library of recipes to cross-compile over 1000 packages
   * Switched from flat meta-data architecture (|OE_| Classic) to
     layered architecture based on |OE_| Core layer, which is in
     common with the Yocto Project and the Ångström Distribution

.. admonition:: Yocto Project
   :class: note

   .. only:: html

      .. image:: /_extra/_static/yp.*
         :align: right
         :width: 96px

   * Family of projects for developing Linux-based devices
   * Self-contained build environment providing tools and blueprints for
     building Linux OS stacks
   * Supported by silicon vendors, OSVs (also providing commercial support),
     open source projects for hardware and software, electronics companies
   * Standardized components with compliance program
   * Focused on tooling and maintenance, major release every 6 months

.. rubric:: Why not just use OpenEmbedded?

.. admonition:: OpenEmbedded
   :class: danger

   .. only:: html

      .. image:: /_extra/_static/oe.*
         :align: right
         :width: 96px

   * |OE_| is an Open Source Project providing a Build Framework for
     Embedded Linux Systems

     * Not a reference distribution
     * Designed to be the foundation for others
     * Cutting-edge technologies and software packages

.. admonition:: Yocto Project
   :class: tip

   .. only:: html

      .. image:: /_extra/_static/yp.*
         :align: right
         :width: 96px

   * The Yocto Project is focused on enabling Commercial Product Development

     * Provides a reference distribution policy and root file system blueprints
     * Co-maintains |OE_| components and improves their quality
     * Provides additional tooling such as Autobuilder, QA Tests
     * Provides tools for application development such as ADT and Eclipse Plugin

.. Local variables:
   coding: utf-8
   mode: text
   mode: rst
   End:
   vim: fileencoding=utf-8 filetype=rst :
