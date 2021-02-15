.. Never add or change more than structure, instead edit content in files:
   *.rsti

About
=====

This section contains direct excerpts and quotes from publicly accessible
presentations: :cite:`streif2015introyp,osiermixonmcgrath2015ypembos`.
|nbsp| |---| |nbsp| |copy| 2015 The Linux Foundation.

The Yocto Project\ |regs| is an open source collaboration project that helps
developers create custom Linux-based systems for embedded products, regardless
of the hardware architecture. For additional information about the project,
please visit: :homeyp:`About the Yocto Project <about>`.

.. include:: /about/about.rsti

.. rubric:: What is the Yocto Project?

* Open source project with a strong community
* A collection of embedded projects and tooling

  * Place for Industry to publish BSPs
  * Application Development Tools including Eclipse plug-ins and emulators

* Key project is the reference distribution build environment (Poky)

  * Complete Build System for Linux OS
  * Releases every 6 months with latest (but stable) kernel (LTSI), toolchain,
    and package versions
  * Full documentation representative of a consistent system

.. admonition:: Yocto Project
   :class: important

   It’s not an embedded Linux distribution |nbsp| |--| |nbsp|
   it creates a custom one for you.

.. ..............................................................................

.. include:: /about/governance.rsti

.. rubric:: Who is the Yocto Project?

Advisory Board and Technical Leadership

* Organized under the Linux Foundation
* Individual Developers
* Embedded Hardware Companies
* Semiconductor Manufacturers
* Embedded Operating System Vendors
* |OE_| / LTSI Community

.. ..............................................................................

.. include:: /about/achievement.rsti

.. rubric:: What the Yocto Project Provides

* The industry needed a common build system and core technology

  * Bitbake and |OE_| Core = |OE| build system

* The benefit of doing so is:

  * Designed for the long term
  * Designed for embedded
  * Transparent Upstream changes
  * Vibrant Developer Community

.. admonition:: Best Practices
   :class: important

   .. only:: not revealjs

      .. image:: /_extra/_static/yp.*
         :align: right
         :width: 96px

   Less time spent on things which don’t make money
   (build system, core Linux components)

   More time spent on things which do make money
   (app & product development, |nbsp| |...|)

.. ..............................................................................

.. include:: /about/offer.rsti

.. rubric:: Why Should a Developer Care?

* Build a complete Linux system
  |nbsp| |--| |nbsp| from source |nbsp| |--| |nbsp|
  in about an hour (about 90 minutes with X)

  * Multiple cores (i.e. quad i7)
  * Lots of RAM (i.e. 16 GB of ram or more)
  * Fast disk (RAID, SSD, etc |...|)

* Start with a validated collection of software (toolchain, kernel, user space)
* Blueprints to get you started quickly and that you can customize for your own needs
* We distinguish app developers from system developers and we support both
* Access to a great collection of app developer tools (performance, debug, power analysis, Eclipse)
* Supports all major embedded architectures

  * x86, x86-64, ARM, PPC, MIPS
  * MIPS64, ARM Arch 64, PPC64
  * and more exotic like MicroBlaze or Nios2

* Advanced kernel development tools
* Layer model encourages modular development, reuse, and easy customizations
* Compatibility program that is used to encourage interoperability and best practices

.. ..............................................................................

.. include:: /about/provides.rsti

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
     common with the Yocto Project and the Angstrom Distribution

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

.. ..............................................................................

.. include:: /about/community.rsti

.. rubric:: The Yocto Project Ecosystem

:Product Showcase:

   * Hardware Platforms
   * Distributions – Open Source and Commercial
   * Projects – Open Source Project using the Yocto Project

:Participants:

   * Organizations who participate in the Yocto Project Compliance Program
   * They also support the project through contributions and engineering
     resources

:Member Organizations:

   * Organizations who provide the administrative leadership of the
     Yocto Project
   * Their support includes membership dues for infrastructure etc.
     and engineering resources
   * Members of the Yocto Project Advisory Board

:Supporting Organizations:

   * Organizations who support the Yocto Project through contributions,
     product development, etc.

.. rubric:: Yocto Project Branding and Compliance Program

:Goals:

   * Strengthen the Yocto Project through a consistent branding.
   * Provide recognition to participating organizations.
   * Reduce fragmentation in the embedded Linux market by encouraging
     collaborative development of a common set of tools, standards, and
     practices and ensure that these tools, standards, and practices are
     architecturally independent as much as possible.

.. admonition:: Yocto Project Participant
   :class: note

   .. image:: /about/yp-participant.*
      :align: right
      :width: 96px

   * Organizations and entities who use and support the Yocto Project publicly.
   * Open to open source projects, non-profit organizations, small companies,
     and Yocto Project member organizations.

.. admonition:: Yocto Project Compatible
   :class: note

   .. image:: /about/yp-compatible.*
      :align: right
      :width: 96px

   * Products, BSPs, OpenEmbedded-compatible layers and other open source
     software projects that are built and work with the Yocto Project.
   * These products and components must be submitted by open source projects,
     non-profit entities, or Yocto Project member organizations.

.. ..............................................................................

.. Local variables:
   coding: utf-8
   mode: text
   mode: rst
   End:
   vim: fileencoding=utf-8 filetype=rst :
