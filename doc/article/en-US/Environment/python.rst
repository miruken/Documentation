=================
Installing Python
=================

Some of the tools we use require python to be on the environment **PATH** variable.

Currently we are using **version 2.7.12**.

Download the installer from `python.org <https://www.python.org/downloads/release/python-2712/>`_ and run.

.. important:: On the Customize Python page be sure and select "Add python.exe to Path"

Confirm python is installed by running python at the console. 

.. code-block:: none

    python

You should see something like

.. code-block:: none

    Python 2.7.12 (v2.7.12:d33e0cf91556, Jun 27 2016, 15:24:40) [MSC v.1500 64 bit (AMD64)] on win32
    Type "help", "copyright", "credits" or "license" for more information.
    >>>

Type :code:`ctrl-c` to exit.


Update pip
====================

:code:`pip` is pythons package manager.  We use it to install sphinx.  It will probably need updating to the latest version.  You will know you need to update if you get ssl errors :code:`[SSL: TLSV1_ALERT_PROTOCOL_VERSION] tlsv1 alert protocol version (_ssl.c:590) - skipping`


.. code-block:: none

    curl https://bootstrap.pypa.io/get-pip.py | python
