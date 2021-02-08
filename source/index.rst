:topic: |title| |--| |subtitle|

.. _home:

##################
|subtitle| |title|
##################

.. include:: docsummary.rsti
.. include:: docpreample.rsti

.. revealjs_section::
   :data-background-image: _static/lpn.svg
   :data-background-position: top 52px left 86px
   :data-background-size: 128px 128px
   :data-background-opacity: 0.33

.. only:: revealjs and not latex

   .. include:: /challenge/revealjs.rsti
   .. include:: /decision/revealjs.rsti
   .. include:: /about/revealjs.rsti
   .. include:: /intensions/revealjs.rsti
   .. include:: /concepts/revealjs.rsti
   .. include:: /manifest/revealjs.rsti
   .. include:: /build-system/revealjs.rsti
   .. include:: /user-configuration/revealjs.rsti
   .. include:: /metadata-layers/revealjs.rsti
   .. include:: /source-files/revealjs.rsti
   .. include:: /package-feeds/revealjs.rsti
   .. include:: /bitbake-tool/revealjs.rsti
   .. include:: /images/revealjs.rsti
   .. include:: /sdk/revealjs.rsti
   .. include:: /final/revealjs.rsti
   .. include:: /rtd/revealjs.rsti
   .. include:: /thanks/revealjs.rsti

.. only:: latex and not html

   .. include:: doclegal.rsti
   .. include:: docversions.rsti

:raw-latex:`\cleardoublepage\phantomsection`

.. ...........................................................................

.. toctree::
   :caption: Table of Contents:
   :numbered: 2
   :maxdepth: 4
   :hidden:
   :includehidden:

   challenge
   decision
   about
   intensions
   concepts
   manifest
   build-system
   user-configuration
   metadata-layers
   source-files
   package-feeds
   bitbake-tool
   images
   sdk
   final
   rtd
   thanks

:raw-latex:`\appendix`
   
.. toctree::
   :caption: Appendices
   :titlesonly:
   :hidden:

   appendix
   glossary

.. toctree::
   :caption: Lists and References
   :titlesonly:
   :hidden:
   
   acronyms
   indexlol
   indexlot
   indexlof
   indexloe
   indexlod
   indexloi
   bibliography

.. ...........................................................................

.. only:: html and not latex

   .. include:: docversions.rsti

.. Local variables:
   coding: utf-8
   mode: text
   mode: rst
   End:
   vim: fileencoding=utf-8 filetype=rst :
