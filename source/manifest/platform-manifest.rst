.. Never add or change more than content, instead edit structure in files:
   /manifest/index.rst

:raw-latex:`\clearpage\phantomsection`

Platform Manifest
=================

This section contains direct excerpts and quotes from publicly accessible
documentation: `Manifest Format`_
|nbsp| |---| |nbsp| |copy| 2008 |--| 2021 Google LLC.

.. include:: /manifest/platform-manifest.rsti

.. |repo_manifest| replace:: :dfn:`manifest`

.. rubric:: Element |repo_manifest|

The root element of the file.

.. |repo_include| replace:: :dfn:`include`

.. rubric:: Element |repo_include|

This element provides the capability of including another manifest file into
the originating manifest. Normal rules apply for the target manifest to include
|nbsp| |--| |nbsp| it must be a usable manifest on its own.

.. |repo_include_name| replace:: :dfn:`name`

:Attribute |repo_include_name|:

   The name of the manifest file to include, specified relative to the manifest
   repository's root.

.. |repo_default| replace:: :dfn:`default`

.. rubric:: Element |repo_default|

At most one default element may be specified. Its remote and revision
attributes are used when a project element does not specify its own
remote or revision attribute.

.. |repo_default_remote| replace:: :dfn:`remote`

:Attribute |repo_default_remote|:

   See |repo_project| |CRT| |repo_project_remote|. Name of a previously
   defined remote element. Project elements lacking a remote attribute of
   their own will use this remote.

.. |repo_default_revision| replace:: :dfn:`revision`

:Attribute |repo_default_revision|:

   See |repo_remote| |CRT| |repo_remote_revision|. Project elements lacking
   their own revision attribute will use this revision.

.. |repo_default_sync_j| replace:: :dfn:`sync-j`

:Attribute |repo_default_sync_j|:

   Number of parallel jobs to use when synching.

.. |repo_default_sync_s| replace:: :dfn:`sync-s`

:Attribute |repo_default_sync_s|:

   Set to true to also sync sub-projects (Git submodules).

.. |repo_remote| replace:: :dfn:`remote`

.. rubric:: Element |repo_remote|

One or more remote elements may be specified. Each remote element specifies
a Git URL shared by one or more projects and (optionally) the Gerrit review
server those projects upload changes through.

.. |repo_remote_name| replace:: :dfn:`name`

:Attribute |repo_remote_name|:

   A short name unique to this manifest file. The name specified here is
   used as the remote name in each project's .git/config, and is therefore
   automatically available to commands like :command:`git fetch`,
   :command:`git remote`, :command:`git pull` and :command:`git push`.

.. |repo_remote_alias| replace:: :dfn:`alias`

:Attribute |repo_remote_alias|:

   The alias, if specified, is used to override |repo_remote_name| to be
   set as the remote name in each project's :file:`.git/config`. Its value
   can be duplicated while attribute name has to be unique in the manifest
   file. This helps each project to be able to have same remote name which
   actually points to different remote URL.

.. |repo_remote_fetch| replace:: :dfn:`fetch`

:Attribute |repo_remote_fetch|:

   The Git URL prefix for all projects which use this remote. Each
   project's name is appended to this prefix to form the actual URL
   used to clone the project.

.. |repo_remote_pushurl| replace:: :dfn:`pushurl`

:Attribute |repo_remote_pushurl|:

   The Git "push" URL prefix for all projects which use this remote. Each
   project's name is appended to this prefix to form the actual URL used
   to :command:`git push` the project. This attribute is optional; if not
   specified then :command:`git push` will use the same URL as the
   |repo_remote_fetch| attribute.

.. |repo_remote_review| replace:: :dfn:`review`

:Attribute |repo_remote_review|:

   Hostname of the Gerrit server where reviews are uploaded to by
   :command:`repo upload`. This attribute is optional; if not specified
   then :command:`repo upload` will not function.

.. |repo_remote_revision| replace:: :dfn:`revision`

:Attribute |repo_remote_revision|:

   Name of a Git branch or specific reference (e.g. :file:`master` or
   :file:`refs/heads/master`, and also possible :file:`refs/tags/1.0.0`).
   Tags and/or explicit SHA-1s should work in theory, but have not been
   extensively tested. Remotes with their own revision will override the
   |repo_default| |CRT| |repo_default_revision|.

.. |repo_project| replace:: :dfn:`project`

.. rubric:: Element |repo_project|

One or more project elements may be specified. Each element describes
a single Git repository to be cloned into the repo client workspace. You
may specify Git submodules by creating a nested project. Git submodules
will be automatically recognized and inherit their parent's attributes,
but those may be overridden by an explicitly specified project element.

.. |repo_project_name| replace:: :dfn:`name`

:Attribute |repo_project_name|:

   A unique name for this project. The project‘s name is appended onto its
   remote's |repo_remote_fetch| URL to generate the actual URL to configure
   the Git remote with. The URL gets formed as:

   .. code-block:: none

      ${remote_fetch}/${project_name}.git

.. |repo_project_path| replace:: :dfn:`path`

:Attribute |repo_project_path|:

   An optional path relative to the top directory of the repo client where
   the Git working directory for this project should be placed. If not
   supplied the project |repo_project_name| is used. If the project has
   a parent element, its path will be prefixed by the parent's.

.. |repo_project_remote| replace:: :dfn:`remote`

:Attribute |repo_project_remote|:

   Name of a previously defined |repo_remote| element. If not supplied the
   remote given by the |repo_default| element is used.

.. |repo_project_revision| replace:: :dfn:`revision`

:Attribute |repo_project_revision|:

   Name of the Git branch the manifest wants to track for this project.
   See |repo_remote| |CRT| |repo_remote_revision|. If not supplied the
   revision given by the |repo_remote| element is used if applicable, else
   the |repo_default| element is used.

.. |repo_project_sync_s| replace:: :dfn:`sync-s`

:Attribute |repo_project_sync_s|:

   Set to true to also sync sub-projects (Git submodules).

.. |repo_copyfile| replace:: :dfn:`copyfile`

.. rubric:: Element |repo_copyfile|

Zero or more copyfile elements may be specified as children of a |repo_project|
element. Each element describes a source-destination-pair of files; the
|repo_copyfile_src| file will be copied to the |repo_copyfile_dest| place
during :command:`repo sync` command.

Copying from paths outside of the project or to paths outside of the repo
client is not allowed. Directories or symlinks are not allowed. Intermediate
paths must not be symlinks either.

.. |repo_copyfile_src| replace:: :dfn:`src`

:Attribute |repo_copyfile_src|:

   The source file; is project relative and must be a file.

.. |repo_copyfile_dest| replace:: :dfn:`dest`

:Attribute |repo_copyfile_dest|:

   The destination file; is relative to the top of the tree and must be
   a file. Parent directories will be automatically created if missing.

.. |repo_linkfile| replace:: :dfn:`linkfile`

.. rubric:: Element |repo_linkfile|

It's just like |repo_copyfile| and runs at the same time as |repo_copyfile|
but instead of copying it creates a symlink.

The symlink is created at |repo_copyfile_dest| (relative to the top of the
tree) and points to the path specified by |repo_copyfile_src| which is a
path in the project. Parent directories of |repo_copyfile_dest| will be
automatically created if missing. The symlink target may be a file or
directory, but it may not point outside of the repo client.

.. ..............................................................................

.. spelling::

   copyfile
   linkfile
   submodules
   symlink
   symlinks

.. Local variables:
   coding: utf-8
   mode: text
   mode: rst
   End:
   vim: fileencoding=utf-8 filetype=rst :
