.. Never add or change more than structure, instead edit content in files:
   *.rsti

Source Files
============

This section contains direct excerpts and quotes from publicly accessible
documentation: :ref:`ypdoc:overview-manual/concepts:sources`
|nbsp| |---| |nbsp| |copy| 2010 |--| 2021 The Yocto Project.

.. figure:: /source-files/overview-manual/source-input.png
   :name: source-files
   :figclass: align-center
   :align: center

   :ref:`ypdoc:overview-manual/concepts:sources`
   with Details

The general workflow in :numref:`build-system-areas` represents source files
using the :dfn:`Upstream Project Releases`, :dfn:`Local Projects`, and
:dfn:`SCMs (optional)` boxes. The figure represents mirrors, which also play
a role in locating source files, with the :dfn:`Source Material` box.

BitBake uses the :term:`ypdoc:SRC_URI` variable to point to source files
regardless of their location. Each recipe must have a :code:`SRC_URI`
variable that points to the source.

Another area that plays a significant role in where source files come from is
pointed to by the :term:`ypdoc:DL_DIR` variable. This area is a cache that can
hold previously downloaded source. Judicious use of a :code:`DL_DIR` directory
can save the build system a trip across the Internet when looking for files.
A good method for using a download directory is to have :code:`DL_DIR` point
to an area outside of your Build Directory. Doing so allows you to safely
delete the Build Directory if needed without fear of removing any downloaded
source file.

.. tip::

   The method by which source files are ultimately organized is a function
   of the project. For example, for released software, projects tend to use
   tarballs or other archived files that can capture the state of a release
   guaranteeing that it is statically represented. On the other hand, for a
   project that is more dynamic or experimental in nature, a project might
   keep source files in a repository controlled by a |SCMS_| such as Git.
   Pulling source from a repository allows you to control the point in the
   repository (the revision) from which you want to build software. Finally,
   a combination of the two might exist, which would give the consumer
   a choice when deciding where to get source files.

.. rubric:: Upstream Project Releases

:dfn:`Upstream Project Releases` exist anywhere in the form of an archived
file (e.g. tarball or zip file). These files correspond to individual recipes.
For example, the figure uses specific releases each for BusyBox, Qt, and
D-Bus. An archive file can be for any released product that can be built
using a recipe.

.. rubric:: Local Projects

:dfn:`Local Projects` are custom bits of software the user provides. These bits
reside somewhere local to a project |nbsp| |--| |nbsp| perhaps a directory into
which the user checks in items (e.g. a local directory containing a development
source tree used by the group).

The canonical method through which to include a local project is to use the
:ref:`ypdoc:ref-classes-externalsrc` class to include that local project. You
use either the :file:`local.conf` or a recipe's append file to override or set
the recipe to point to the local directory on your disk to pull in the whole
source tree.

.. rubric:: Source Control Managers (Optional)

Another place from which the build system can get source files is with
:ref:`fetchers <bbdoc:bitbake-user-manual/bitbake-user-manual-fetching:fetchers>`
employing various |SCMS_| such as Git or Subversion. In such cases, a
repository is cloned or checked out. The :ref:`ypdoc:ref-tasks-fetch` task
inside BitBake uses the :term:`ypdoc:SRC_URI` variable and the argument's
prefix to determine the correct fetcher module.

When fetching a repository, BitBake uses the :term:`ypdoc:SRCREV` variable to
determine the specific revision from which to build.

.. rubric:: Source Mirror(s)

Two kinds of mirrors exist:

:pre-mirrors:

   The :term:`ypdoc:PREMIRRORS` variables point to this. BitBake checks
   pre-mirrors before looking upstream for any source files. Pre-mirrors
   are appropriate when you have a shared directory that is not a directory
   defined by the :term:`ypdoc:DL_DIR` variable. A Pre-mirror typically points
   to a shared directory that is local to your organization.

:regular mirrors:

   The :term:`ypdoc:MIRRORS` variables point to this. Regular mirrors can be any
   site across the Internet that is used as an alternative location for source
   code should the primary site not be functioning for some reason or another.

.. Local variables:
   coding: utf-8
   mode: text
   mode: rst
   End:
   vim: fileencoding=utf-8 filetype=rst :
