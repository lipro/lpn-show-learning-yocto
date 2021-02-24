.. Never add or change more than content, instead edit structure in files:
   /manifest/index.rst

Platform Pipeline
=================

This section contains direct excerpts and quotes from publicly accessible
documentation: `Revision Control of your Embedded Linux System`_
|nbsp| |---| |nbsp| |copy| 2019 Ville Baillie.

.. _`Revision Control of your Embedded Linux System`:
   https://medium.com/@villebaillie25/revision-control-of-your-embedded-linux-system-34bf4d5c7979

.. include:: /manifest/platform-pipeline.rsti

.. figure:: /manifest/lpn-central-bsp-pipeline.*
   :name: lpn-central-bsp-pipeline
   :figclass: align-center
   :align: center

   Revision Control of your Embedded Linux System using Git repo

.. rubric:: Revision Control of your Embedded Linux System

Using Yocto you'll need to juggle several repositories at once.
You'll have your "poky" repository (typically you'll get this from
https://git.yoctoproject.org/git/poky), then you'll have your
OpenEmbedded layer (usually retrieved from
https://github.com/openembedded/meta-openembedded.git).

In addition, you'll also have your SoC and SoM specific layers, and then
you'll probably have your own project specific layer. So you may have
anywhere up to 10 or possibly more repositories to handle.

Earlier in this series, a short introduction to the tool named :command:`repo`
was given. This tool allows multiple git repositories to be handled together
as a cohesive whole. At its heart is the idea of a manifest, which is simply
a list of git repositories and commit IDs (or tags or branches), and how to
arrange them on your local filesystem. The :command:`repo` comes in two parts:
One is the :command:`repo` launcher you download and install. It's a Python
script that communicates with the second part and knows how to initialize a
checkout and can download the second part, the full :command:`repo` tool
included in a source code checkout. To install :command:`repo`, e.g. from
the :file:`lipro-yocto` setup:

.. code-block:: bash

   mkdir -p ~/.local/bin
   curl https://raw.githubusercontent.com/lipro-yocto/git-repo/lpn-launcher/repo > \
        ~/.local/bin/repo
   chmod a+x ~/.local/bin/repo
   sha1sum ~/.local/bin/repo

For :strong:`repo launcher version 2.12.2.2021.2.20`, the SHA-1 checksum for
:command:`repo` is :strong:`93cab6406f072e78874dac1d891427c84189f0b6`.

Optionally verify the launcher matches the correct signature:

.. code-block:: bash

   gpg --recv-key 5BA1FE49FB5F4F60C974D991579B34AFDE6AB439
   curl https://raw.githubusercontent.com/lipro-yocto/git-repo/lpn-launcher/repo.asc | \
        gpg --verify - ~/.local/bin/repo

Alternatively, of course, the original can also be `downloaded and installed`_
directly from Google.

.. _`downloaded and installed`:
   https://source.android.com/setup/develop#installing-repo

.. rubric:: Basic repo usage

You need to create a repository to hold your manifest file (I know another
repository) is the last thing you need. But this can be on your local machine
if you wish, at least to begin with.

Once this is done, you should find a folder in which you wish to keep all your
sources, and run the following, e.g. from the :file:`lipro-yocto` setup:

.. code-block:: bash

   mkdir lpn-central-bsp
   cd lpn-central-bsp
   repo init --manifest-url=https://github.com/lipro-yocto/lpn-central-bsp-platform \
             --manifest-branch=master --manifest-name=default.xml

This sets up the current directory as the working directory for this repo
manifest. Now you can run:

.. code-block:: bash

   repo sync

|...| which will fetch all the repositories into the local directory. If you want to see if everything is as it should be (no changes in the repositories and branches with respect to their upstream brothers) you can run:

.. code-block:: bash

   repo status

|...| and if you want to update everything to the manifest discarding all changes you can run

.. code-block:: bash

   repo sync --detach

These tools should give you enough get starting and going with :command:`repo`
and Embedded Linux development. The original project page has a more
comprehensive `command line documentation`_ and should always be consulted if
there are any questions.

.. _`command line documentation`:
   https://source.android.com/setup/develop/repo

.. ..............................................................................

.. spelling::

   Ville Baillie

.. Local variables:
   coding: utf-8
   mode: text
   mode: rst
   End:
   vim: fileencoding=utf-8 filetype=rst :
