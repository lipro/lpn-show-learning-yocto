:topic: |title| |--| |subtitle|

.. _home:

##################
|subtitle| |title|
##################

.. include:: docsummary.rsti
.. include:: docpreample.rsti

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

   challenge/index
   intentions/index
   decision/index
   about/index
   concepts/index
   manifest/index
   build-system/index
   user-configuration/index
   metadata-layers/index
   source-files/index
   package-feeds/index
   bitbake-tool/index
   images/index
   sdk/index
   final/index
   rtd/index
   thanks/index

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
