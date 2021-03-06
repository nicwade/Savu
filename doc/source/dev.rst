Savu Developer Guide
********************

Developing new Plugins
======================

The architecture of the savu package is that new plugins can be easily developed
without having to take the framework into consideration.  This is mostly true for
simple cases, however there are some thigns which cannot be done with such 
simple methodologies and the developer may need to take more into consideration.

Every plugin in Savu needs to be a subclass of the Plugin class, however there 
are several convenience subclasses which already exist for doing standard 
processes such as filtering, reconstruction and augmentation/passthrough

Although there are many plugins defined in the core savu code, plugins can be 
written anywhere and included easily as shown below without having to be submitted
to the core code.

Median Filter Example
---------------------

This examples recreates one of the core plugins, a median filter.  The code is 
available in the main Savu repository under the plugin_examples folder.

.. literalinclude:: ../../plugin_examples/example_median_filter.py
   :linenos:

As you can see this is a pretty small implementation, and the key features of
which are detailed in the comments associated with the code.

Testing the new plugin
======================

So now that you have the new plugin written, you can test it using the following
command, you will need to make sure that savu is installed or included in your
$PYTHON_PATH

.. code:: bash

   python $SAVU_HOME/savu/test/framework_test.py -p $SAVU_HOME/plugin_examples/example_median_filter /tmp/savu_output/


Testing a new plugin using DAWN
===============================

DAWN can be downloaded from http://www.dawnsci.org/ and general user tutorials 
are found at https://www.youtube.com/user/DAWNScience

Using the Debug perspective, create a new test, e.g. "plugin_test_recon.py"
to test your plugin in "/Savu/savu/test/", in this case the 
"example_filter_back_projection.py" plugin for reconstructing data, setting the
self.plugin_name appropriately.  After saving the file, right-click on it in 
the PyDev Package Explorer window and Run As a Python unit-test

.. literalinclude:: ../../savu/test/plugin_test_recon.py
   :linenos:

This runs a series of tests and produces an output file with the result of the
plugin, whether it be a filter or a reconstruction, allowing for visualisation
of the data, providing a check of whether the process has worked successfully.

The output file is saved in a tmp directory as a .h5 file, e.g.
"/tmp/tmp32bexK.h5".  This can be viewed in DAWN.