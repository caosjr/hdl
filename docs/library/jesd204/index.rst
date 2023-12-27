JESD204 Interface Framework
===========================

The JESD204, JESD204A, JESD204B and the JESD204C data converter serial interface
standard was created through the JEDEC committee to standardize and reduce the
number of data inputs/outputs between high-speed data converters and other
devices, such as FPGAs (field-programmable gate arrays). Fewer interconnects
simplifies layout and allows smaller form factor realization without impacting
overall system performance. These attributes are important to address the system
size and cost constraints of a range of high speed ADC applications, including
wireless infrastructure (GSM, EDGE, W-CDMA, LTE, CDMA2000, WiMAX, TD-SCDMA)
transceiver architectures, software-defined radios, portable instrumentation,
medical ultrasound equipment, and Mil/Aero applications such as radar and secure
communications. Analog Devices is an original participating member of the JEDEC
JESD204 standards committee and we have concurrently developed compliant data
converter technology and tools, and a comprehensive product roadmap to fully
enable our customers to take advantage of this significant interfacing
breakthrough.

Analog Devices supplies a full-stack supporting JESD204B/C which provides a
fully integrated system level experience. This solution includes

.. hint::

   * :ref:`Reference hardware platforms <rapid_prototyping_label>` for rapid-prototyping
   * :ref:`FPGA HDL <fpga_hdl_support_label>` for interfacing JESD204B/C ADCs, DACs, and RF Transceivers
   * :ref:`Software <software_support_label>` to configure the converter devices and FPGA HDL peripherals

How to Obtain a License
-----------------------

When customers and partners download software from github, or e-mail downloaded
software to someone, they are obligated to comply to the terms and conditions of
the `Software License
Agreement <https://github.com/analogdevicesinc/hdl/blob/master/library/jesd204/README.md>`__.
The core is released under two difference licenses. You may choose either:

-  Commercial licenses may be purchased from Analog Devices, Inc. or any
   authorized distributor by ordering
   :adi:`IP-JESD204 <en/design-center/evaluation-hardware-and-software/jesd204-interface-framework.html>`.
   This will allow you to use the core in a closed system.
-  GPL 2, this allows you to use the core for any purpose, but you must release
   anything else that links to the JESD204 core (this would normally be your
   algorithmic IP). You do not need to sign anything purchase anything to use
   the JESD204 core under the GPL license.

There is only one core, the only difference is the license and support. If you
have a question about the license: you can email
`jesd204-licensing@analog.com <jesd204-licensing@analog.com>`__.

.. _fpga_hdl_support_label:

FPGA HDL Support
----------------

|image1|

The JESD204B/C standard defines multiple layers, each layer being responsible
for a particular function. The Analog Devices JESD204B/C HDL solution follows
the standard here and defines 4 layers. Physical layer, link layer, transport
layer and application layer. For the first three layers Analog Devices provides
standard components that can be linked up to provide a full JESD204B/C protocol
processing chain.

Depending on the FPGA and converter combinations that are being interfaced
different components can be chosen for the physical and transport layer. The
FPGA defines which physical layer component should be used and the interfaced
converter defines which transport layer component should be used.

The link layer component is selected based on the direction of the JESD204B/C
link.

The application layer is user defined and can be used to implement application
specific signal processing.

|image2|

Physical Layer
~~~~~~~~~~~~~~

Physical layer peripherals are responsible for interfacing and configuring the
high-speed serial transceivers. Currently we have support for GTXE2, GTHE3,
GTHE4, GTYE4 for Xilinx and Arria 10 transceivers for Intel.

*  :dokuwiki:`AXI_ADXCVR <resources/fpga/docs/axi_adxcvr>`: JESD204B Gigabit 
   Transceiver Register Configuration Peripheral
*  :dokuwiki:`UTIL_ADXCVR <resources/fpga/docs/util_xcvr>`: JESD204B Gigabit 
   Transceiver Interface Peripheral for Xilinx FPGAs

Link Layer
~~~~~~~~~~

Link layer peripherals are responsible for JESD204B/C protocol handling,
including scrambling/descrambling, lane alignment, character replacement and
alignment monitoring.

*  :dokuwiki:`JESD204B/C Transmit Peripheral 
   <resources/fpga/peripherals/jesd204/axi_jesd204_tx>`: JESD204B/C Link
   Layer Transmit Peripheral
*  :dokuwiki:`JESD204B/C Receive Peripheral 
   <resources/fpga/peripherals/jesd204/axi_jesd204_rx>`: JESD204B/C Link
   Layer Receive Peripheral

Transport Layer
~~~~~~~~~~~~~~~

Transport layer peripherals are responsible for converter specific data framing
and de-framing.

*  :dokuwiki:`ADC JESD204B/C Transport Peripheral 
   <resources/fpga/peripherals/jesd204/jesd204_tpl_adc>`:
   JESD204B/C Transport Layer Receive Peripheral
*  :dokuwiki:`DAC JESD204B/C Transport Peripheral 
   <resources/fpga/peripherals/jesd204/jesd204_tpl_dac>`:
   JESD204B/C Transport Layer Transmit Peripheral

Interfaces
~~~~~~~~~~

Interfaces are a well-defined collection of wires that are used to communicate
between components. The following interfaces are used to connect components of
the HDL JESD204B/C processing stack.

.. _software_support_label:

Software Support
----------------

Linux
~~~~~

-  :dokuwiki:`JESD204 (FSM) Interface Linux Kernel
   Framework <resources/tools-software/linux-drivers/jesd204/jesd204-fsm-framework>`
-  :dokuwiki:`JESD204B/C Transmit Linux
   Driver <resources/tools-software/linux-drivers/jesd204/axi_jesd204_tx>`:
   Linux driver for the JESD204B transmit core.
-  :dokuwiki:`JESD204B/C Receive Linux
   Driver <resources/tools-software/linux-drivers/jesd204/axi_jesd204_rx>`:
   Linux driver for the JESD204B receive core.
-  :dokuwiki:`JESD204B/C AXI_ADXCVR Highspeed Transceivers Linux
   Driver <resources/tools-software/linux-drivers/jesd204/axi_adxcvr>`
-  :dokuwiki:`JESD204B Statistical Eyescan
   Application <resources/tools-software/linux-software/jesd_eye_scan>`
-  :dokuwiki:`JESD204B Status
   Utility <resources/tools-software/linux-software/jesd_status>`
-  :dokuwiki:`AXI DAC HDL Linux
   Driver <resources/tools-software/linux-drivers/iio-dds/axi-dac-dds-hdl>`

   -  :dokuwiki:`AD9172 DAC Linux
      Driver <resources/tools-software/linux-drivers/iio-dds/ad9172>`
   -  :dokuwiki:`AD9081 MxFE Linux
      Driver <resources/tools-software/linux-drivers/iio-mxfe/ad9081>`
   -  :dokuwiki:`ADRV9009, ADRV9008 highly integrated, wideband RF transceiver Linux
      device
      driver <resources/tools-software/linux-drivers/iio-transceiver/adrv9009>`
   -  :dokuwiki:`AD9371, AD9375 highly integrated, wideband RF transceiver Linux device
      driver <resources/tools-software/linux-drivers/iio-transceiver/ad9371>`

-  :dokuwiki:`AXI ADC HDL Linux
   Driver <resources/tools-software/linux-drivers/iio-adc/axi-adc-hdl>`

   -  :dokuwiki:`AD9208 ADC Linux
      Driver <resources/tools-software/linux-drivers/iio-adc/ad9208>`
   -  :dokuwiki:`AD9081 MxFE Linux
      Driver <resources/tools-software/linux-drivers/iio-mxfe/ad9081>`
   -  :dokuwiki:`ADRV9009, ADRV9008 highly integrated, wideband RF transceiver Linux
      device
      driver <resources/tools-software/linux-drivers/iio-transceiver/adrv9009>`
   -  :dokuwiki:`AD9371, AD9375 highly integrated, wideband RF transceiver Linux device
      driver <resources/tools-software/linux-drivers/iio-transceiver/ad9371>`

No-OS
~~~~~

-  :dokuwiki:`ADI JESD204B/C AXI_ADXCVR Highspeed Transceivers No-OS
   Driver <resources/tools-software/uc-drivers/jesd204/axi_adxcvr>`
-  :dokuwiki:`ADI JESD204B/C Receive Peripheral No-OS
   Driver <resources/tools-software/uc-drivers/jesd204/axi_jesd204_rx>`
-  :dokuwiki:`ADI JESD204B/C Transmit Peripheral No-OS
   Driver <resources/tools-software/uc-drivers/jesd204/axi_jesd204_tx>`
-  :dokuwiki:`AXI ADC No-OS
   Driver <resources/tools-software/uc-drivers/jesd204/axi_adc_core>`
-  :dokuwiki:`AXI DAC No-OS
   Driver <resources/tools-software/uc-drivers/jesd204/axi_dac_core>`

Tutorial
--------

#. :dokuwiki:`Introduction <resources/fpga/peripherals/jesd204/tutorial/introduction>`
#. :dokuwiki:`System Architecture <resources/fpga/peripherals/jesd204/tutorial/system_architecture>`
#. :dokuwiki:`Generic JESD204B block
   designs <resources/fpga/docs/hdl/generic_jesd_bds>`. This will help you
   understand the generic blocks for the next steps.
#. Checkout the :dokuwiki:`HDL Source <resources/fpga/docs/build>`, and then build
   either one of:

   #. :dokuwiki:`HDL Xilinx <resources/fpga/peripherals/jesd204/tutorial/hdl_xilinx>`
   #. :dokuwiki:`HDL Altera <resources/fpga/peripherals/jesd204/tutorial/hdl_altera>`

#. :dokuwiki:`Linux <resources/fpga/peripherals/jesd204/tutorial/linux>`

Example Projects
----------------

-  :dokuwiki:`AD-FMCADC2-EBZ Reference
   Design <resources/fpga/xilinx/fmc/ad-fmcadc2-ebz>`

   -  `Xilinx
      VC707 <https://github.com/analogdevicesinc/hdl/tree/master/projects/fmcadc2/vc707>`__
   -  `Xilinx
      ZC706 <https://github.com/analogdevicesinc/hdl/tree/master/projects/fmcadc2/zc706>`__

-  :dokuwiki:`AD-FMCADC3-EBZ Reference
   Design <resources/fpga/xilinx/fmc/ad-fmcadc3-ebz>`

   -  `Xilinx
      VC707 <https://github.com/analogdevicesinc/hdl/tree/master/projects/fmcadc2/vc707>`__
   -  `Xilinx
      ZC706 <https://github.com/analogdevicesinc/hdl/tree/master/projects/fmcadc2/zc706>`__

-  :dokuwiki:`AD-FMCADC4-EBZ Reference Design
   (retired) <resources/fpga/xilinx/fmc/ad-fmcadc4-ebz>`

   -  `Xilinx
      ZC706 <https://github.com/analogdevicesinc/hdl/tree/hdl_2018_r2/projects/fmcadc4/zc706>`__

-  :dokuwiki:`AD-FMCJESDADC1-EBZ Reference
   Design <resources/fpga/xilinx/fmc/ad-fmcjesdadc1-ebz>`

   -  `Xilinx
      KC705 <https://github.com/analogdevicesinc/hdl/tree/master/projects/fmcjesdadc1/kc705>`__
   -  `Xilinx
      VC707 <https://github.com/analogdevicesinc/hdl/tree/master/projects/fmcjesdadc1/vc707>`__
   -  `Xilinx
      ZC706 <https://github.com/analogdevicesinc/hdl/tree/master/projects/fmcjesdadc1/zc706>`__

-  :dokuwiki:`AD-FMCOMMS11-EBZ Reference
   Design <resources/eval/user-guides/ad-fmcomms11-ebz>`

   -  `Xilinx
      ZC706 <https://github.com/analogdevicesinc/hdl/tree/master/projects/fmcomms11/zc706>`__

-  :dokuwiki:`AD-FMCDAQ2-EBZ Reference
   Design <resources/eval/user-guides/ad-fmcdaq2-ebz>`

   -  `Intel
      A10SOC <https://github.com/analogdevicesinc/hdl/tree/master/projects/daq2/a10soc>`__
   -  `Xilinx
      KC705 <https://github.com/analogdevicesinc/hdl/tree/master/projects/daq2/kc705>`__
   -  `Xilinx
      KCU105 <https://github.com/analogdevicesinc/hdl/tree/master/projects/daq2/kcu105>`__
   -  `Xilinx
      VC707 <https://github.com/analogdevicesinc/hdl/tree/hdl_2018_r2/projects/daq2/vc707>`__
   -  `Xilinx
      ZC706 <https://github.com/analogdevicesinc/hdl/tree/master/projects/daq2/zc706>`__
   -  `Xilinx
      ZCU102 <https://github.com/analogdevicesinc/hdl/tree/master/projects/daq2/zcu102>`__

-  :dokuwiki:`AD-FMCDAQ3-EBZ Reference
   Design <resources/eval/user-guides/ad-fmcdaq3-ebz>`

   -  `Xilinx
      KCU105 <https://github.com/analogdevicesinc/hdl/tree/master/projects/daq3/kcu105>`__
   -  `Xilinx
      VCU118 <https://github.com/analogdevicesinc/hdl/tree/master/projects/daq3/vcu118>`__
   -  `Xilinx
      ZC706 <https://github.com/analogdevicesinc/hdl/tree/master/projects/daq3/zc706>`__
   -  `Xilinx
      ZCU102 <https://github.com/analogdevicesinc/hdl/tree/master/projects/daq3/zcu102>`__

-  :dokuwiki:`ADRV9371 Reference Design <resources/eval/user-guides/mykonos>`

   -  `Intel
      A10SOC <https://github.com/analogdevicesinc/hdl/tree/master/projects/adrv9371x/a10soc>`__
   -  `Xilinx
      KCU105 <https://github.com/analogdevicesinc/hdl/tree/master/projects/adrv9371x/kcu105>`__
   -  `Xilinx
      ZC706 <https://github.com/analogdevicesinc/hdl/tree/master/projects/adrv9371x/zc706>`__
   -  `Xilinx
      ZCU102 <https://github.com/analogdevicesinc/hdl/tree/master/projects/adrv9371x/zcu102>`__

- :dokuwiki:`ADRV9009 Reference Design <resources/eval/user-guides/adrv9009>`

   -  `Xilinx
      ZCU102 <https://github.com/analogdevicesinc/hdl/tree/master/projects/adrv9009/zcu102>`__

-  :dokuwiki:`ADRV9009-ZU11EG-SOM Reference
   Design <resources/eval/user-guides/adrv9009-zu11eg>`

   -  `ADRV9009-ZU11EG-SOM <https://github.com/analogdevicesinc/hdl/tree/master/projects/adrv9009zu11eg>`__

-  :dokuwiki:`AD917X Reference Design <resources/eval/user-guides/ad-dac-fmc-ebz>`

   -  `Intel
      A10SOC <https://github.com/analogdevicesinc/hdl/tree/master/projects/dac_fmc_ebz/a10soc>`__
   -  `Xilinx
      ZC706 <https://github.com/analogdevicesinc/hdl/tree/master/projects/dac_fmc_ebz/zc706>`__
   -  `Xilinx
      ZCU102 <https://github.com/analogdevicesinc/hdl/tree/master/projects/dac_fmc_ebz/zcu102>`__

-  :dokuwiki:`AD9081 Reference
   Design <resources/eval/user-guides/ad9081_fmca_ebz/ad9081_fmca_ebz_hdl>`

   -  `Xilinx
      ZCU102 <https://github.com/analogdevicesinc/hdl/tree/master/projects/ad9081_fmca_ebz/zcu102>`__
   -  `Xilinx
      VCU118 <https://github.com/analogdevicesinc/hdl/tree/master/projects/ad9081_fmca_ebz/vcu118>`__

Additional Information
----------------------

-  :dokuwiki:`JESD204B Glossary <resources/fpga/peripherals/jesd204/jesd204_glossary>`

Technical Articles
~~~~~~~~~~~~~~~~~~

-  :adi:`JESD204B Survival
   Guide <media/en/technical-documentation/technical-articles/JESD204B-Survival-Guide.pdf>`
-  :adi:`Synchronizing Sample Clocks of a Data Converter
   Array <media/en/technical-documentation/technical-articles/Synchronizing-Sample-Clocks-of-a-Data-Converter-Array-Web.pdf>`

.. _rapid_prototyping_label:

JESD204B Rapid Prototyping Platforms
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-  `EVAL-ADRV9371 <adi>EVAL-ADRV9371>`__ (`User
   Guide </resources/eval/user-guides/mykonos>`__)
-  `EVAL-ADRV9008-9009 <adi>EVAL-ADRV9008-9009>`__ (`User
   Guide </resources/eval/user-guides/adrv9009>`__)
-  ADRV9009-ZU11EG (`User
   Guide </resources/eval/user-guides/adrv9009-zu11eg>`__)
-  `AD-FMCJESDADC1-EBZ <adi>AD-FMCJESDADC1-EBZ>`__
-  `AD-FMCOMMS11-EBZ <adi>AD-FMCOMMS11-EBZ>`__ (`User
   Guide </resources/eval/user-guides/ad-fmcomms11-ebz>`__)
-  `AD-FMCADC2-EBZ <adi>AD-FMCADC2-EBZ>`__
-  `AD-FMCADC3-EBZ <adi>EVAL-AD-FMCADC3-EBZ>`__
-  `AD-FMCADC4-EBZ <adi>EVAL-AD-FMCADC4-EBZ>`__\ (retired)
-  `AD-FMCDAQ2-EBZ <adi>AD-FMCDAQ2-EBZ>`__ (`User
   Guide </resources/eval/user-guides/ad-fmcdaq2-ebz>`__)
-  `EVAL-FMCDAQ3-EBZ <adi>EVAL-FMCDAQ3-EBZ>`__ (`User
   Guide </resources/eval/user-guides/ad-fmcdaq3-ebz>`__)
-  `EVAL-AD917X <adi>EVAL-AD917X>`__

JESD204B Analog-to-Digital Converters
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-  `AD6673 <adi>AD6673>`__: 80 MHz Bandwidth, Dual IF Receiver
-  `AD6674 <adi>AD6674>`__: 385 MHz BW IF Diversity Receiver
-  `AD6676 <adi>AD6676>`__: Wideband IF Receiver Subsystem
-  `AD6677 <adi>AD6677>`__: 80 MHz Bandwidth, IF Receiver
-  `AD6684 <adi>AD6684>`__: 135 MHz Quad IF Receiver
-  `AD6688 <adi>AD6688>`__: RF Diversity and 1.2GHz BW Observation Receiver
-  `AD9208 <adi>AD9208>`__: 14-Bit, 3GSPS, JESD204B, Dual Analog-to-Digital
   Converter
-  `AD9234 <adi>AD9234>`__: 12-Bit, 1 GSPS/500 MSPS JESD204B, Dual
   Analog-to-Digital Converter
-  `AD9250 <adi>AD9250>`__: 14-Bit, 170 MSPS/250 MSPS, JESD204B, Dual
   Analog-to-Digital Converter
-  `AD9625 <adi>AD9625>`__: 12-Bit, 2.6 GSPS/2.5 GSPS/2.0 GSPS, 1.3 V/2.5 V
   Analog-to-Digital Converter
-  `AD9656 <adi>AD9656>`__: Quad, 16-Bit, 125 MSPS JESD204B 1.8 V
   Analog-to-Digital Converter
-  `AD9680 <adi>AD9680>`__: 14-Bit, 1.25 GSPS/1 GSPS/820 MSPS/500 MSPS JESD204B,
   Dual Analog-to-Digital Converter
-  `AD9683 <adi>AD9683>`__: 14-Bit, 170 MSPS/250 MSPS, JESD204B,
   Analog-to-Digital Converter
-  `AD9690 <adi>AD9690>`__: 14-Bit, 500 MSPS / 1 GSPS JESD204B,
   Analog-to-Digital Converter
-  `AD9691 <adi>AD9691>`__: 14-Bit, 1.25 GSPS JESD204B, Dual Analog-to-Digital
   Converter
-  `AD9694 <adi>AD9694>`__: 14-Bit, 500 MSPS JESD204B, Quad Analog-to-Digital
   Converter
-  `AD9083 <adi>AD9083>`__: 16-Channel, 125 MHz Bandwidth, JESD204B
   Analog-to-Digital Converter

JESD204B Digital-to-Analog Converters
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-  `AD9135 <adi>AD9135>`__: Dual, 11-Bit, high dynamic, 2.8 GSPS, TxDAC+®
   Digital-to-Analog Converter
-  `AD9136 <adi>AD9136>`__: Dual, 16-Bit, 2.8 GSPS, TxDAC+® Digital-to-Analog
   Converter
-  `AD9144 <adi>AD9144>`__: Quad, 16-Bit, 2.8 GSPS, TxDAC+® Digital-to-Analog
   Converter
-  `AD9152 <adi>AD9152>`__: Dual, 16-Bit, 2.25 GSPS, TxDAC+ Digital-to-Analog
   Converter
-  `AD9154 <adi>AD9154>`__: Quad, 16-Bit, 2.4 GSPS, TxDAC+® Digital-to-Analog
   Converter
-  `AD9161 <adi>AD9161>`__: 11-Bit, 12 GSPS, RF Digital-to-Analog Converter
-  `AD9162 <adi>AD9162>`__: 16-Bit, 12 GSPS, RF Digital-to-Analog Converter
-  `AD9163 <adi>AD9163>`__: 16-Bit, 12 GSPS, RF DAC and Digital Upconverter
-  `AD9164 <adi>AD9164>`__: 16-Bit, 12 GSPS, RF DAC and Direct Digital
   Synthesizer
-  `AD9172 <adi>AD9172>`__: Dual, 16-Bit, 12.6 GSPS RF DAC with Channelizers
-  `AD9173 <adi>AD9173>`__: Dual, 16-Bit, 12.6 GSPS RF DAC with Channelizers
-  `AD9174 <adi>AD9174>`__: Dual, 16-Bit, 12.6 GSPS RF DAC and Direct Digital
   Synthesizer
-  `AD9175 <adi>AD9175>`__: Dual, 11-Bit/16-Bit, 12.6 GSPS RF DAC with Wideband
   Channelizers
-  `AD9176 <adi>AD9176>`__: Dual, 16-Bit, 12.6 GSPS RF DAC with Wideband
   Channelizers

JESD204B RF Transceivers
~~~~~~~~~~~~~~~~~~~~~~~~

-  `AD9371 <adi>AD9371>`__: SDR Integrated, Dual RF Transceiver with Observation
   Path
-  `AD9375 <adi>AD9375>`__: SDR Integrated, Dual RF Transceiver with Observation
   Path and DPD
-  `ADRV9009 <adi>ADRV9009>`__: SDR Integrated, Dual RF Transceiver with
   Observation Path
-  `ADRV9008-1 <adi>ADRV9008-1>`__: SDR Integrated, Dual RF Receiver
-  `ADRV9008-2 <adi>ADRV9008-2>`__: SDR Integrated, Dual RF Transmitter with
   Observation Path

JESD204B/C Mixed-Signal Front Ends
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-  `AD9081 <adi>AD9081>`__: MxFE™ Quad, 16-Bit, 12GSPS RFDAC and Quad, 12-Bit,
   4GSPS RFADC
-  `AD9082 <adi>AD9082>`__: MxFE™ QUAD, 16-Bit, 12GSPS RFDAC and DUAL, 12-Bit,
   6GSPS RFADC

JESD204B Clocking Solutions
~~~~~~~~~~~~~~~~~~~~~~~~~~~

-  `AD9528 <adi>AD9528>`__: JESD204B Clock Generator with 14 LVDS/HSTL Outputs
-  `HMC7043 <adi>HMC7043>`__: High Performance, 3.2 GHz, 14-Output Fanout Buffer
-  `HMC7044 <adi>HMC7044>`__: High Performance, 3.2 GHz, 14-Output Jitter
   Attenuator with JESD204B
-  `LTC6952 <adi>LTC6952>`__: Ultralow Jitter, 4.5GHz PLL, JESD204B/JESD204C

.. |image1| image:: /resources/fpga/peripherals/jesd204_layers2.png
   :width: 100px
.. |image2| image:: /resources/fpga/peripherals/jesd204_chain.png
