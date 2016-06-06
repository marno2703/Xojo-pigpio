#tag Module
Protected Module pigpio
	#tag Method, Flags = &h1, Description = 546869732066756E6374696F6E207374617274732061206E657720656D7074792077617665666F726D2E200A596F7520776F756C646E2774206E6F726D616C6C79206E65656420746F2063616C6C20746869732066756E6374696F6E206173206974206973206175746F6D61746963616C6C792063616C6C656420616674657220612077617665666F726D2069732063726561746564207769746820746865206770696F576176654372656174652066756E6374696F6E2E20
		Protected Sub AddWaveForm()
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.gpioWaveAddNew()
		    if result < 0 then MakeException (result) 
		  #else
		    PigpioErrorCheck
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 52657475726E7320746865206E657720746F74616C206E756D626572206F662070756C73657320696E207468652063757272656E742077617665666F726D206966204F4B2E
		Protected Function AddWaveForm(NumberOfPulses As UInteger, Pulse as pigpio.pigpioPulse) As UInteger
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.gpioWaveAddGeneric(NumberOfPulses, Pulse)
		    if result < 0 then MakeException (result) else return result
		  #else
		    PigpioErrorCheck
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 4164647320612077617665666F726D20726570726573656E74696E672073657269616C206461746120746F20746865206578697374696E672077617665666F726D2028696620616E79292E205468652073657269616C206461746120737461727473206F6666736574206D6963726F7365636F6E64732066726F6D20746865207374617274206F66207468652077617665666F726D2E200A52657475726E7320746865206E657720746F74616C206E756D626572206F662070756C73657320696E207468652063757272656E742077617665666F726D206966204F4B2E
		Protected Function AddWaveForm(UserGpio as uinteger, baud as uinteger, dataBits as Uinteger, StopBits As Uinteger, Offset as uinteger, NumberofBytes As Uinteger = -1, WaveData As Xojo.Core.MemoryBlock) As UInteger
		  
		  #If TargetARM And TargetLinux Then
		    if NumberofBytes <-1 then NumberofBytes = WaveData.Size
		    dim result as integer = pigpio.gpioWaveAddSerial(UserGpio, baud, dataBits, StopBits, Offset, NumberofBytes, waveData.data)
		    if result < 0 then MakeException (result) else return result
		  #else
		    PigpioErrorCheck
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 52656769737465727320612066756E6374696F6E20746F2062652063616C6C65642028612063616C6C6261636B29207768656E2074686520737065636966696564204750494F206368616E6765732073746174652E20536565207468652074656D706C61746520666F722072657475726E2076616C7565732E
		Protected Sub AlertFunction(GPIO As UInteger, assigns  AlertFunction as Ptr)
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.gpioSetAlertFunc(GPIO, AlertFunction)
		    if result < 0 then MakeException (result) 
		  #else
		    PigpioErrorCheck
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 52656769737465727320612066756E6374696F6E20746F2062652063616C6C65642028612063616C6C6261636B29207768656E2074686520737065636966696564204750494F206368616E6765732073746174652E2054616B657320616E206164646974696F6E616C20636F72652E6D656D6F7279626C6F636B20617320757365726461746120636F6E7461696E65722E20536565207468652074656D706C61746520666F722072657475726E2076616C7565732E
		Protected Sub AlertFunction(GPIO As UInteger, userdata as xojo.core.memoryblock, assigns  AlertFunction as Ptr)
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.gpioSetAlertFuncEx(GPIO, AlertFunction, userdata.Data)
		    if result < 0 then MakeException (result) 
		  #else
		    PigpioErrorCheck
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AlertFunctionTemplate(GPIO As Integer, Level as Integer, Tick as Uint32, UserData as Ptr)
		  // These are the parameters an AlertFunction receives
		  
		  #Pragma unused GPIO
		  #Pragma unused Level
		  #Pragma unused Tick
		  #Pragma Unused UserData
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 52657475726E732074686520647574796379636C652072616E6765207573656420666F7220746865204750494F206966204F4B2E0A4966206120686172647761726520636C6F636B206F722068617264776172652050574D20697320616374697665206F6E20746865204750494F20746865207265706F727465642072616E67652077696C6C2062652031303030303030
		Protected Function AnalogRange(User_GPIO As UInteger) As uinteger
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.gpioGetPWMrange(User_GPIO)
		    if result < 0 then MakeException (result) else return result
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 53656C656374732074686520647574796379636C652072616E676520746F206265207573656420666F7220746865204750494F2E2053756273657175656E742063616C6C7320746F206770696F50574D2077696C6C20757365206120647574796379636C65206265747765656E203020286F66662920616E642072616E6765202866756C6C79206F6E292E200A52616E6765206D757374206265206265747765656E20323520616E642034303030302E
		Protected Sub AnalogRange(User_GPIO As UInteger, assigns range as uinteger)
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.gpioSetPWMrange(User_GPIO, range)
		    if result < 0 then MakeException (result)
		  #else
		    PigpioErrorCheck
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 52657475726E7320746865207265616C2072616E6765207573656420666F7220746865204750494F206966204F4B2E0A4966206120686172647761726520636C6F636B20697320616374697665206F6E20746865204750494F20746865207265706F72746564207265616C2072616E67652077696C6C20626520313030303030302028314D292E200A49662068617264776172652050574D20697320616374697665206F6E20746865204750494F20746865207265706F72746564207265616C2072616E67652077696C6C20626520617070726F78696D6174656C79203235304D206469766964656420627920746865207365742050574D206672657175656E63792E
		Protected Function AnalogRealRange(User_GPIO As UInteger) As uinteger
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.gpioGetPWMrealRange(User_GPIO)
		    if result < 0 then MakeException (result) else return result
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 52657475726E73207468652050574D20647574796379636C652073657474696E6720666F7220746865204750494F2C206F722072616973657320616E20657863657074696F6E
		Protected Function AnalogValue(GPIO As UInteger) As UInteger
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.gpioGetPWMdutycycle(GPIO)
		    if result < 0 then MakeException (result) else return result
		  #else
		    PigpioErrorCheck
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 5374617274732050574D206F6E20746865204750494F2C20647574796379636C65206265747765656E203020286F66662920616E642072616E6765202866756C6C79206F6E292E2052616E67652064656661756C747320746F203235352E20
		Protected Sub AnalogValue(User_GPIO As UInteger, assigns dutyCycle as uinteger)
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.gpioPWM(User_GPIO, dutyCycle)
		    if result < 0 then MakeException (result)
		  #else
		    PigpioErrorCheck
		  #endif
		End Sub
	#tag EndMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function bbI2CClose Lib pigpioLibName (SDA As UInteger) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function bbI2COpen Lib pigpioLibName (SDA As UInteger, SCL As Uinteger, Baud as Uinteger) As Integer
	#tag EndExternalMethod

	#tag Method, Flags = &h1, Description = 526561647320746865204750494F206C6576656C2C206F6E206F72206F66662C206F722072616973657320616E206572726F722E
		Protected Function Bits_0_31() As Uint32
		  #If TargetARM And TargetLinux Then
		    return pigpio.gpioRead_Bits_0_31()
		  #else
		    PigpioErrorCheck
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 526561647320746865204750494F206C6576656C2C206F6E206F72206F66662C206F722072616973657320616E206572726F722E
		Protected Function Bits_32_53() As Uint32
		  #If TargetARM And TargetLinux Then
		    return pigpio.gpioRead_Bits_32_53()
		  #else
		    PigpioErrorCheck
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 44656C61797320666F72206174206C6561737420746865206E756D626572206F66206D6963726F7365636F6E647320737065636966696564206279206D6963726F732E0A52657475726E73207468652061637475616C206C656E677468206F66207468652064656C617920696E206D6963726F7365636F6E64732E200A44656C617973206F6620313030206D6963726F7365636F6E6473206F72206C6573732075736520627573792077616974732E
		Protected Function Delay(MySecs as Uint32) As uint32
		  #If TargetARM And TargetLinux Then
		    return pigpio.gpioDelay(Mysecs)
		  #else
		    PigpioErrorCheck
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 526561647320746865204750494F206C6576656C2C206F6E206F72206F66662C206F722072616973657320616E206572726F722E
		Protected Function DigitalValue(GPIO As UInteger) As Boolean
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.gpioRead(GPIO)
		    if result < 0 then MakeException (result) else return result = 1
		  #else
		    PigpioErrorCheck
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 5365747320746865204750494F206C6576656C2C206F6E206F72206F66662E20
		Protected Sub DigitalValue(GPIO As UInteger, assigns value as Boolean)
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.gpioWrite(GPIO, if (value, pigpio.On, pigpio.Off))
		    if result < 0 then MakeException (result)
		  #else
		    PigpioErrorCheck
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 546865206C656E67746820696E20444D4120636F6E74726F6C20626C6F636B73206F6620746865206C6F6E676573742077617665666F726D20637265617465642073696E6365206770696F496E697469616C697365207761732063616C6C65642C206F7220616E206572726F7220636F64652E
		Protected Function DMAHighestLength() As Integer
		  #If TargetARM And TargetLinux Then
		    return pigpio.gpioWaveGetHighCbs()
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 546865206C656E67746820696E20444D4120636F6E74726F6C20626C6F636B73206F66207468652063757272656E742077617665666F726D2C206F7220616E206572726F7220636F64652E20
		Protected Function DMALength() As Integer
		  #If TargetARM And TargetLinux Then
		    return pigpio.gpioWaveGetCbs()
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 546865206D6178696D756D20706F737369626C652073697A65206F6620612077617665666F726D20696E20444D4120636F6E74726F6C20626C6F636B732E
		Protected Function DMAMaxLength() As Integer
		  #If TargetARM And TargetLinux Then
		    return pigpio.gpioWaveGetMaxCbs()
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 546865206D6178696D756D20706F737369626C652073697A65206F6620612077617665666F726D20696E2070756C7365732E2028726561642D6F6E6C7929
		Protected Function DMAMaxPulses() As Integer
		  #If TargetARM And TargetLinux Then
		    return pigpio.gpioWaveGetMaxPulses()
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 546865206C656E67746820696E2070756C736573206F6620746865206C6F6E676573742077617665666F726D20637265617465642073696E6365206770696F496E697469616C697365207761732063616C6C65642C206F7220616E206572726F7220636F64652E
		Protected Function DMAPulseHighestLength() As Integer
		  #If TargetARM And TargetLinux Then
		    return pigpio.gpioWaveGetHighPulses()
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 546865206C656E67746820696E2070756C736573206F66207468652063757272656E742077617665666F726D2C206F7220616E206572726F7220636F64652E20
		Protected Function DMAPulseLength() As Integer
		  #If TargetARM And TargetLinux Then
		    return pigpio.gpioWaveGetPulses()
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 5768657468657220612077617665666F726D2069732063757272656E746C79206265696E67207472616E736D69747465642E
		Protected Function DMATransmitsWaveform() As Boolean
		  #If TargetARM And TargetLinux Then
		    return pigpio.gpioWaveTxBusy = 1
		  #else
		    PigpioErrorCheck
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 546865206C656E67746820696E206D6963726F7365636F6E6473206F6620746865206C6F6E676573742077617665666F726D20637265617465642073696E6365206770696F496E697469616C697365207761732063616C6C65642C206F7220616E206572726F7220636F64652E20
		Protected Function DMAWaveformHighestLength() As Integer
		  #If TargetARM And TargetLinux Then
		    return pigpio.gpioWaveGetHighMicros()
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 546865206C656E67746820696E206D6963726F7365636F6E6473206F6620746865206C6F6E676573742077617665666F726D20637265617465642073696E6365206770696F496E697469616C697365207761732063616C6C65642C206F7220616E206572726F7220636F64652E
		Protected Function DMAWaveformLength() As Integer
		  #If TargetARM And TargetLinux Then
		    return pigpio.gpioWaveGetMicros()
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 546865206C656E67746820696E206D6963726F7365636F6E6473206F6620746865206C6F6E676573742077617665666F726D20637265617465642073696E6365206770696F496E697469616C697365207761732063616C6C65642C206F7220616E206572726F7220636F64652E
		Protected Function DMAWaveformMaxLength() As Integer
		  #If TargetARM And TargetLinux Then
		    return pigpio.gpioWaveGetMaxMicros()
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function getspiOpen Lib pigpioLibName (spiChannel as uinteger, baud as uinteger, flags as uinteger) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioDelay Lib pigpioLibName (gpio as uinteger) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioGetMode Lib pigpioLibName (gpio as uinteger) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioGetPWMdutycycle Lib pigpioLibName (gpio as uinteger) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioGetPWMfrequency Lib pigpioLibName (gpio as uinteger) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioGetPWMrange Lib pigpioLibName (gpio as uinteger) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioGetPWMrealRange Lib pigpioLibName (gpio as uinteger) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioGetServoPulsewidth Lib pigpioLibName (gpio as uinteger) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioGlitchFilter Lib pigpioLibName (userGpio as uinteger, steady as uinteger) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioHardwareRevision Lib pigpioLibName () As UInteger
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioInitialise Lib pigpioLibName () As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioNoiseFilter Lib pigpioLibName (userGpio as uinteger, steady as uinteger, active as uinteger) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioNotifyBegin Lib pigpioLibName (notificationhandle as uinteger, bitMask as uint32) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioNotifyClose Lib pigpioLibName (notificationhandle as uinteger) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioNotifyOpen Lib pigpioLibName () As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioNotifyOpenWithSize Lib pigpioLibName (size as integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioNotifyPause Lib pigpioLibName (notificationhandle as uinteger) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioPWM Lib pigpioLibName (gpio as uinteger, dutycycle as uinteger) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioRead Lib pigpioLibName (gpio as uinteger) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioRead_Bits_0_31 Lib pigpioLibName () As uint32
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioRead_Bits_32_53 Lib pigpioLibName () As uint32
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioSerialRead Lib pigpioLibName (usergpio as uinteger, byref buffer as ptr, buffersize as UInteger) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioSerialReadClose Lib pigpioLibName (userGpio as uinteger) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioSerialReadInvert Lib pigpioLibName (userGPIO as Uinteger, Invert as UInteger) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioSerialReadOpen Lib pigpioLibName (user_GPIO as Uinteger, baud as uinteger, dataBits as uinteger) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioServo Lib pigpioLibName (gpio as uinteger, pulsewidth as uinteger) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioSetAlertFunc Lib pigpioLibName (gpio as uinteger, alertFunction as Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioSetAlertFuncEx Lib pigpioLibName (gpio as uinteger, alertFunction as Ptr, userData as ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioSetISRFunc Lib pigpioLibName (gpio as uinteger, edge as pigpio . PigpioEdge, timeout as integer, ISRFunc as ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioSetISRFuncEx Lib pigpioLibName (gpio as uinteger, edge as pigpio . PigpioEdge, timeout as integer, ISRFunc as ptr, userdata as ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioSetMode Lib pigpioLibName (gpio as uinteger, mode as uinteger) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioSetPullUpDown Lib pigpioLibName (gpio as uinteger, mode as pigpio . PigpioPud) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioSetPWMfrequency Lib pigpioLibName (gpio as uinteger, value as uinteger) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioSetPWMrange Lib pigpioLibName (gpio as uinteger, range as uinteger) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioSetWatchdog Lib pigpioLibName (UserGPIO as uinteger, timeout as uinteger) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Sub gpioTerminate Lib pigpioLibName ()
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioTrigger Lib pigpioLibName (userGPIO as uinteger, pulseLength as uinteger, level as uinteger) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioVersion Lib pigpioLibName () As Uinteger
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioWaveAddGeneric Lib pigpioLibName (numberOfPulses as uinteger, Pulse as pigpio . pigpioPulse) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioWaveAddNew Lib pigpioLibName () As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioWaveAddSerial Lib pigpioLibName (User_gpio as uinteger, baud as uinteger, dataBits as uinteger, stopBits as Uinteger, offset as uinteger, numberOfBytes as uinteger, Data as ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioWaveChain Lib pigpioLibName (Waves as ptr, Size as Uinteger) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioWaveClear Lib pigpioLibName () As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioWaveCreate Lib pigpioLibName () As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioWaveDelete Lib pigpioLibName (id as uinteger) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioWaveGetCbs Lib pigpioLibName () As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioWaveGetHighCbs Lib pigpioLibName () As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioWaveGetHighMicros Lib pigpioLibName () As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioWaveGetHighPulses Lib pigpioLibName () As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioWaveGetMaxCbs Lib pigpioLibName () As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioWaveGetMaxMicros Lib pigpioLibName () As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioWaveGetMaxPulses Lib pigpioLibName () As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioWaveGetMicros Lib pigpioLibName () As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioWaveGetPulses Lib pigpioLibName () As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioWaveTxAt Lib pigpioLibName () As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioWaveTxBusy Lib pigpioLibName () As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioWaveTxSend Lib pigpioLibName (waveId as uinteger, WaveMode as pigpio . PigpioWavemode) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioWaveTxStop Lib pigpioLibName () As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function gpioWrite Lib pigpioLibName (gpio as uinteger, value as integer) As integer
	#tag EndExternalMethod

	#tag Method, Flags = &h1, Description = 5265616473206120626C6F636B206F6620757020746F2033322062797465732066726F6D2074686520737065636966696564207265676973746572206F662074686520646576696365206173736F63696174656420776974682068616E646C652E20
		Protected Function i2cBlockData(i2cHandle as Uinteger, i2cRegister as Uint8) As xojo.Core.MemoryBlock
		  #If TargetARM And TargetLinux Then
		    dim block as new xojo.Core.MutableMemoryBlock(32)
		    dim blockptr as ptr = block.Data
		    dim result as integer = pigpio.i2cReadBlockData(i2cHandle, i2cRegister, blockptr)
		    if result < 0 then MakeException (result) else return new xojo.Core.MemoryBlock(blockptr)
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 52656164732061206365727461696E206E756D626572206F662062797465732066726F6D2074686520737065636966696564207265676973746572206F662074686520646576696365206173736F63696174656420776974682068616E646C65202E2054686520636F756E74206D617920626520312D33322E20
		Protected Function i2cBlockData(i2cHandle as Uinteger, i2cRegister as Uint8, numberOfBytes as uinteger) As xojo.Core.MemoryBlock
		  #If TargetARM And TargetLinux Then
		    dim block as new xojo.Core.MutableMemoryBlock(numberOfBytes)
		    dim blockptr as ptr = block.Data
		    dim result as integer = pigpio.i2cReadI2CBlockData(i2cHandle, i2cRegister, blockptr, numberOfBytes)
		    if result < 0 then MakeException (result) else return new xojo.Core.MemoryBlock(blockptr)
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 577269746573203120746F20333220627974657320746F2074686520737065636966696564207265676973746572206F662074686520646576696365206173736F63696174656420776974682068616E646C652E20
		Protected Sub i2cBlockDatai2c(i2cHandle as Uinteger, i2cRegister as Uint8, numberOfbytes as uinteger, assigns value as xojo.Core.MemoryBlock)
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.i2cWritei2cBlockData(i2cHandle, i2cRegister, value.data, numberOfbytes)
		    if result < 0 then MakeException (result)
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function i2cBlockProcessCall Lib pigpioLibName (i2chandle as uinteger, i2cregister as uint8, byref buffer as ptr, count as UInteger) As Integer
	#tag EndExternalMethod

	#tag Method, Flags = &h1, Description = 526561647320612073696E676C6520627974652066726F6D2074686520646576696365206173736F63696174656420776974682068616E646C652E20
		Protected Function i2cByte(i2cHandle as Uinteger) As uint8
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.i2cReadByte(i2cHandle)
		    if result < 0 then MakeException (result) else return result
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 53656E647320612073696E676C65206279746520746F2074686520646576696365206173736F63696174656420776974682068616E646C652E20
		Protected Sub i2cByte(i2cHandle as Uinteger, assigns value as uint8)
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.i2cWriteByte(i2cHandle, value)
		    if result < 0 then MakeException (result)
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 526561647320612073696E676C6520627974652066726F6D2074686520737065636966696564207265676973746572206F662074686520646576696365206173736F63696174656420776974682068616E646C652E
		Protected Function i2cByteData(i2cHandle as Uinteger, i2cRegister as Uint8) As UInt8
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.i2cReadByteData(i2cHandle, i2cRegister)
		    if result < 0 then MakeException (result) else return result
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 57726974657320612073696E676C65206279746520746F2074686520737065636966696564207265676973746572206F662074686520646576696365206173736F63696174656420776974682068616E646C652E
		Protected Sub i2cByteData(i2cHandle as Uinteger, i2cRegister as Uint8, assigns value as uint8)
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.i2cWriteByteData(i2cHandle, i2cRegister, value)
		    if result < 0 then MakeException (result)
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 436C6F736573207468652049324320646576696365206173736F6369617465642077697468207468652068616E646C652E20
		Protected Sub i2cClose(i2cHandle as Uinteger)
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.i2cClose(i2cHandle)
		    if result < 0 then MakeException (result)
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function i2cClose Lib pigpioLibName (i2chandle as uinteger) As Integer
	#tag EndExternalMethod

	#tag Method, Flags = &h1, Description = 5772697465732061206365727461696E206E756D626572206F6620627974657320286F7220616C6C20696620796F7520646F6EE28099742073706563696679206974292066726F6D2076616C756520746F2074686520726177206465766963652E20
		Protected Sub i2cDevice(i2cHandle as Uinteger, numberOfBytes As UInteger = 0, assigns value as xojo.Core.MemoryBlock)
		  #If TargetARM And TargetLinux Then
		    if numberOfBytes = 0 then numberOfBytes = value.size
		    dim result as integer = pigpio.i2cWriteDevice(i2cHandle, value.data, numberOfBytes)
		    if result < 0 then MakeException (result) 
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 52656164732061206365727461696E206E756D626572206F662062797465732066726F6D20746865207261772064657669636520696E746F206275662E20
		Protected Function i2cDevice(i2cHandle as Uinteger, numberOfBytes As UInteger) As Xojo.Core.Memoryblock
		  #If TargetARM And TargetLinux Then
		    dim block as new xojo.Core.MutableMemoryBlock(numberOfBytes)
		    dim blockptr as ptr = block.data
		    dim result as integer = pigpio.i2cReadDevice(i2cHandle, blockptr, numberOfBytes)
		    if result < 0 then MakeException (result) else return new xojo.Core.MemoryBlock(blockptr)
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 53746F7073206269742062616E67696E6720493243206F6E20612070616972206F66204750494F2070726576696F75736C79206F70656E656420776974682062624932434F70656E2E20
		Protected Sub i2cEndBitBanging(DataGPIO as Uinteger)
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.bbI2CClose(DataGPIO)
		    if result < 0 then MakeException (result) 
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 52657475726E7320612068616E646C6520666F722074686520646576696365206174207468652061646472657373206F6E2074686520493243206275732E
		Protected Function i2cOpen(i2cBus as Uinteger, i2cAddress as Uinteger) As integer
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.i2cOpen(i2cBus, i2cAddress, 0)
		    if result < 0 then MakeException (result) else return result
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function i2cOpen Lib pigpioLibName (i2cBus as Uinteger, i2cAddress as Uinteger, i2cFlags as Uinteger) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function i2cProcessCall Lib pigpioLibName (i2chandle as uinteger, i2cregister as uint8, value as UInt16) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function i2cReadBlockData Lib pigpioLibName (i2chandle as uinteger, i2cregister as uint8, byref value as ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function i2cReadByte Lib pigpioLibName (i2chandle as uinteger) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function i2cReadByteData Lib pigpioLibName (i2chandle as uinteger, i2cregister as uint8) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function i2cReadDevice Lib pigpioLibName (i2chandle as uinteger, byref value as ptr, count as uinteger) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function i2cReadI2CBlockData Lib pigpioLibName (i2chandle as uinteger, i2cregister as uint8, byref value as ptr, count as uinteger) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function i2cReadWordData Lib pigpioLibName (i2chandle as uinteger, i2cregister as uint8) As Integer
	#tag EndExternalMethod

	#tag Method, Flags = &h1, Description = 546869732066756E6374696F6E2073656C6563747320612070616972206F66204750494F20666F72206269742062616E67696E6720493243206174206120737065636966696564206261756420726174652E200A4269742062616E67696E672049324320616C6C6F777320666F72206365727461696E206F7065726174696F6E7320776869636820617265206E6F7420706F737369626C65207769746820746865207374616E6461726420493243206472697665722E200A6F2062617564207261746573206173206C6F772061732035300A6F207265706561746564207374617274730A6F20636C6F636B2073747265746368696E670A6F20493243206F6E20616E792070616972206F66207370617265204750494F20
		Protected Sub i2cSetBitBanging(DataGPIO as Uinteger, ClockGPIO as Uinteger, Baud As UInteger)
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.bbI2COpen(DataGPIO, ClockGPIO, Baud)
		    if result < 0 then MakeException (result) 
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 53657473207468652049324320286932632D62636D3237303829206D6F64756C65202275736520636F6D62696E6564207472616E73616374696F6E732220706172616D65746572206F6E206F72206F66662E20
		Protected Sub i2cSetCombinedMode(Value as Boolean)
		  #If TargetARM And TargetLinux Then
		     pigpio.i2cSwitchCombined(if (value, 1, 0))
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 57726974657320757020746F20333220627974657320746F2074686520737065636966696564207265676973746572206F662074686520646576696365206173736F63696174656420776974682068616E646C652E20
		Protected Function i2cSwapBlockData(i2cHandle as Uinteger, i2cRegister as Uint8, numberOfbytes as int64 = -1,  value as xojo.Core.MemoryBlock) As xojo.Core.MemoryBlock
		  #If TargetARM And TargetLinux Then
		    if numberOfbytes = -1 then numberOfbytes = value.size
		    dim blockptr as ptr = value.data
		    dim result as integer = pigpio.i2cBlockProcessCall(i2cHandle, i2cRegister, blockptr, numberOfbytes)
		    if result < 0 then MakeException (result) else return new xojo.core.memoryblock (blockptr)
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 5772697465732031362062697473206F66206461746120746F2074686520737065636966696564207265676973746572206F662074686520646576696365206173736F63696174656420776974682068616E646C6520616E642072656164732031362062697473206F66206461746120696E2072657475726E2E
		Protected Function i2cSwapUint16Data(i2cHandle as Uinteger, i2cRegister as Uint8,  value as uint16) As uint16
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.i2cProcessCall(i2cHandle, i2cRegister, value)
		    if result < 0 then MakeException (result) else return result
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Sub i2cSwitchCombined Lib pigpioLibName (value as Integer)
	#tag EndExternalMethod

	#tag Method, Flags = &h1, Description = 526561647320612073696E676C652031362062697420776F72642066726F6D2074686520737065636966696564207265676973746572206F662074686520646576696365206173736F63696174656420776974682068616E646C652E
		Protected Function i2cUint16Data(i2cHandle as Uinteger, i2cRegister as Uint8) As uint16
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.i2cReadWordData(i2cHandle, i2cRegister)
		    if result < 0 then MakeException (result) else return result
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 57726974657320612073696E676C652031362062697420776F726420746F2074686520737065636966696564207265676973746572206F662074686520646576696365206173736F63696174656420776974682068616E646C652E20
		Protected Sub i2cUint16Data(i2cHandle as Uinteger, i2cRegister as Uint8, assigns value as uint16)
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.i2cWriteWordData(i2cHandle, i2cRegister, value)
		    if result < 0 then MakeException (result)
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function i2cWriteBlockData Lib pigpioLibName (i2chandle as uinteger, i2cregister as uint8, buffer as ptr, count as UInteger) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function i2cWriteByte Lib pigpioLibName (i2chandle as uinteger, value as UInt8) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function i2cWriteByteData Lib pigpioLibName (i2chandle as uinteger, i2cregister as uint8, value as UInt8) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function i2cWriteDevice Lib pigpioLibName (i2chandle as uinteger, value as ptr, count as uinteger) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function i2cWriteI2CBlockData Lib pigpioLibName (i2chandle as uinteger, i2cregister as uint8, buffer as ptr, count as UInteger) As Integer
	#tag EndExternalMethod

	#tag Method, Flags = &h1, Description = 53656E647320612073696E676C65206269742028696E207468652052642F5772206269742920746F2074686520646576696365206173736F63696174656420776974682068616E646C652E20
		Protected Sub i2cWriteQuick(i2cHandle as Uinteger, value as Boolean)
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.i2cWriteQuick(i2cHandle, if (value,1, 0))
		    if result < 0 then MakeException (result)
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function i2cWriteQuick Lib pigpioLibName (i2chandle as uinteger, bit as uinteger) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function i2cWriteWordData Lib pigpioLibName (i2chandle as uinteger, i2cregister as uint8, value as UInt16) As Integer
	#tag EndExternalMethod

	#tag Method, Flags = &h1, Description = 52657475726E73207468652070696770696F2076657273696F6E206E756D626572206966204F4B2C206F74686572776973652072616973657320616E20657863657074696F6E2E
		Protected Function Initialise() As Integer
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.gpioInitialise
		    if result < 0 then MakeException (result) else return result
		  #else
		    PigpioErrorCheck
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 52656769737465727320612066756E6374696F6E20746F2062652063616C6C65642028612063616C6C6261636B29207768656E657665722074686520737065636966696564204750494F20696E74657272757074206F63637572732E20
		Protected Sub InterruptFunction(GPIO As UInteger, edge as pigpio.PigpioEdge, timeout as integer, assigns ISRFunction as Ptr)
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.gpioSetISRFunc(GPIO, edge, timeout, ISRFunction)
		    if result < 0 then MakeException (result) 
		  #else
		    PigpioErrorCheck
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 52656769737465727320612066756E6374696F6E20746F2062652063616C6C65642028612063616C6C6261636B29207768656E657665722074686520737065636966696564204750494F20696E74657272757074206F63637572732E20
		Protected Sub InterruptFunction(GPIO As UInteger, edge as pigpio.PigpioEdge, timeout as integer, userdata as xojo.core.memoryblock, assigns ISRFunction as Ptr)
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.gpioSetISRFuncEx(GPIO, edge, timeout, ISRFunction, userdata.data)
		    if result < 0 then MakeException (result) 
		  #else
		    PigpioErrorCheck
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub InterruptFunctionTemplate(GPIO As Integer, Level as Integer, Tick as Uint32)
		  // These are the parameters an InterruptFunction receives
		  
		  #Pragma unused GPIO
		  #Pragma unused Level
		  #Pragma unused Tick
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub MakeException(errorcode as Integer)
		  dim err as new xojo.core.ErrorException
		  err.ErrorNumber = errorcode
		  Select case errorcode
		  case -1
		    err.Message = "PI_INIT_FAILED"
		    err.Reason = "gpioInitialise failed"
		  case -2
		    err.Message = "PI_BAD_USER_GPIO"
		    err.Reason = "GPIO not 0-31"
		  case -3
		    err.Message = "PI_BAD_GPIO"
		    err.Reason = "GPIO not 0-53"
		  case -4
		    err.Message = "PI_BAD_MODE"
		    err.Reason = "mode not 0-7"
		  case -5
		    err.Message = "PI_BAD_LEVEL"
		    err.Reason = "level not 0-1"
		  case -6
		    err.Message = "PI_BAD_PUD"
		    err.Reason = "pud not 0-2"
		  case -7
		    err.Message = "PI_BAD_PULSEWIDTH"
		    err.Reason = "pulsewidth not 0 or 500-2500"
		  case -8
		    err.Message = "PI_BAD_DUTYCYCLE"
		    err.Reason = "dutycycle outside set range"
		    
		  case -21
		    err.Message = "PI_BAD_DUTYRANGE"
		    err.Reason ="dutycycle range not 25-40000"
		  case -92
		    err.Message = "PI_NOT_PWM_GPIO"
		    err.Reason = "GPIO is not in use for PWM"
		  End Select
		  raise err
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 4765747320746865204750494F206D6F64652E20
		Protected Function Mode(GPIO As UInteger) As pigpio . PigpioMode
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.gpioGetMode(GPIO)
		    if result < 0 then MakeException (result) else return pigpio.PigpioMode(result)
		  #else
		    PigpioErrorCheck
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 5365747320746865204750494F206D6F64652C207479706963616C6C7920696E707574206F72206F75747075742E20
		Protected Sub Mode(GPIO As UInteger, assigns mode as pigpio.PigpioMode)
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.gpioSetMode(GPIO, integer(mode))
		    if result < 0 then MakeException (result) 
		  #else
		    PigpioErrorCheck
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 537461727473206E6F74696669636174696F6E73206F6E20612070726576696F75736C79206F70656E65642068616E646C652077697468206120626974206D61736B20696E6469636174696E6720746865204750494F287329206F6620696E7465726573742E0A5365652070696770696F4E6F74696669636174696F6E20666F722074686520726573756C7420737472756374757265206F66206E6F74696669636174696F6E732E
		Protected Sub NotificationsBegin(NotifcationHandle As UInteger,   BitMask as uint32)
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.gpioNotifyBegin(NotifcationHandle, BitMask)
		    if result < 0 then MakeException (result) 
		  #else
		    PigpioErrorCheck
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 506175736573206E6F74696669636174696F6E73206F6E20612070726576696F75736C79206F70656E65642068616E646C652E5365652070696770696F4E6F74696669636174696F6E20666F722074686520726573756C7420737472756374757265206F66206E6F74696669636174696F6E732E
		Protected Sub NotificationsEnd(NotifcationHandle As UInteger)
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.gpioNotifyClose(NotifcationHandle)
		    if result < 0 then MakeException (result) 
		  #else
		    PigpioErrorCheck
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 506175736573206E6F74696669636174696F6E73206F6E20612070726576696F75736C79206F70656E65642068616E646C652E5365652070696770696F4E6F74696669636174696F6E20666F722074686520726573756C7420737472756374757265206F66206E6F74696669636174696F6E732E
		Protected Sub NotificationsPause(NotifcationHandle As UInteger)
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.gpioNotifyPause(NotifcationHandle)
		    if result < 0 then MakeException (result) 
		  #else
		    PigpioErrorCheck
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 546869732066756E6374696F6E20726571756573747320612066726565206E6F74696669636174696F6E2068616E646C652E20596F752063616E207061737320616E206F7074696F6E616C2042756666657253697A652076616C75652E
		Protected Function NotificatonGetHandle(BufferSize as integer = 0) As Integer
		  #If TargetARM And TargetLinux Then
		    dim result as integer
		    if buffersize > 0 then
		      result  = pigpio.gpioNotifyOpenWithSize(buffersize)
		    else
		      result  = pigpio.gpioNotifyOpen()
		    end if
		    if result < 0 then MakeException (result) else return result
		  #else
		    PigpioErrorCheck
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PigpioErrorCheck()
		  #if not( TargetARM And TargetLinux )Then
		    #pragma error "PigpioLib works only on Raspberry Pi!"
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 53657473206F7220636C65617273207265736973746F722070756C6C20757073206F7220646F776E73206F6E20746865204750494F2E
		Protected Sub PullUpValue(GPIO As UInteger, assigns pud as pigpio.PigpioPud)
		  #If TargetARM And TargetLinux Then
		    dim result as integer =  pigpio.gpioSetPullUpDown(GPIO, pud)
		    if result < 0 then MakeException (result) 
		  #else
		    PigpioErrorCheck
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 52657475726E7320746865206672657175656E63792028696E20686572747A29207573656420666F7220746865204750494F206966204F4B2E0A466F72206E6F726D616C2050574D20746865206672657175656E63792077696C6C206265207468617420646566696E656420666F7220746865204750494F206279206770696F53657450574D6672657175656E63792E200A4966206120686172647761726520636C6F636B20697320616374697665206F6E20746865204750494F20746865207265706F72746564206672657175656E63792077696C6C206265207468617420736574206279206770696F4861726477617265436C6F636B2E200A49662068617264776172652050574D20697320616374697665206F6E20746865204750494F20746865207265706F72746564206672657175656E63792077696C6C206265207468617420736574206279206770696F486172647761726550574D2E20
		Protected Function PWMFrequency(User_GPIO As UInteger) As Integer
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.gpioGetPWMfrequency(User_GPIO)
		    if result < 0 then MakeException (result) else return result
		  #else
		    PigpioErrorCheck
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 5365747320746865206672657175656E637920696E20686572747A20746F206265207573656420666F7220746865204750494F2E2052616E6765206D757374206265206265747765656E20323520616E642034303030302E0A45616368204750494F2063616E20626520696E646570656E64656E746C792073657420746F206F6E65206F6620313820646966666572656E742050574D206672657175656E636965732E200A53656520687474703A2F2F6162797A2E636F2E756B2F7270692F70696770696F2F6369662E68746D6C236770696F536572766F20666F722061207461626C65206F662076616C7565732E
		Protected Function PWMFrequency(User_GPIO As UInteger, assigns frequency as uinteger) As Integer
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.gpioSetPWMfrequency(User_GPIO, frequency)
		    if result < 0 then MakeException (result) else return result
		  #else
		    PigpioErrorCheck
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 546869732066756E6374696F6E20636C6F736573207468652073657269616C20646576696365206173736F63696174656420776974682068616E646C652E20
		Protected Sub SerClose(SerHandle as uinteger)
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.serClose(serhandle)
		    if result < 0 then MakeException (result) 
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function serClose Lib pigpioLibName (SerHandle as uinteger) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function serDataAvailable Lib pigpioLibName (SerHandle as uinteger) As Integer
	#tag EndExternalMethod

	#tag Method, Flags = &h1, Description = 546869732066756E6374696F6E2072657475726E7320746865206E756D626572206F6620627974657320617661696C61626C6520746F20626520726561642066726F6D2074686520646576696365206173736F63696174656420776974682068616E646C652E20
		Protected Function SerialPortAvailableData(serHandle as Uinteger) As Integer
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.serDataAvailable(serHandle)
		    if result < 0 then MakeException (result) else Return result
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 5265616473206120627974652066726F6D207468652073657269616C20706F7274206173736F63696174656420776974682068616E646C652E
		Protected Function SerialPortByte(serHandle as Uinteger) As UInt8
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.serReadByte(serHandle)
		    if result < 0 then MakeException (result) else Return result
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 5772697465732061206279746520746F207468652073657269616C20706F7274206173736F63696174656420776974682068616E646C652E
		Protected Sub SerialPortByte(serHandle as Uinteger,  assigns value as uint8)
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.serWriteByte(serHandle, value)
		    if result < 0 then MakeException (result)
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 526561647320757020636F756E742062797465732066726F6D20746865207468652073657269616C20706F7274206173736F63696174656420776974682068616E646C6520616E6420777269746573207468656D20746F206275662E20
		Protected Sub SerialPortBytes(serHandle as Uinteger, numberOfbytes as uinteger = 0, assigns value as xojo.Core.MemoryBlock)
		  #If TargetARM And TargetLinux Then
		    if numberOfbytes = 0 then numberOfbytes = value.size
		    dim result as integer = pigpio.serWrite(serHandle,  value.data, numberOfbytes)
		    if result < 0 then MakeException (result)
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 577269746573203120746F20333220627974657320746F2074686520737065636966696564207265676973746572206F662074686520646576696365206173736F63696174656420776974682068616E646C652E20
		Protected Function SerialPortBytes(serHandle as Uinteger, numberOfbytes as uinteger) As xojo.Core.MemoryBlock
		  #If TargetARM And TargetLinux Then
		    dim block as new xojo.Core.MutableMemoryBlock(numberOfbytes)
		    dim blockptr as ptr = block.data
		    dim result as integer = pigpio.serRead(serHandle, blockptr, numberOfbytes)
		    if result < 0 then MakeException (result) else return new xojo.Core.MemoryBlock(blockptr)
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 4F70656E7320612073657269616C206465766963652061742061207370656369666965642062617564207261746520776974682073706563696669656420666C61677320616E642072657475726E73206974732068616E646C652E
		Protected Function SerialPortOpen(Devicename as Text, baud as uinteger, SerFlags as Uinteger) As integer
		  #If TargetARM And TargetLinux Then
		    dim nameblock as new xojo.Core.MutableMemoryBlock(Devicename.Length+1)
		    nameblock.CStringValue(0) = Devicename.ToCString(xojo.core.TextEncoding.UTF8)
		    dim result as integer = pigpio.serOpen(nameblock.Data, baud, serflags)
		    if result < 0 then MakeException (result) else return result
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 52657475726E73206E756D6265726F6662797465732066726F6D2061206269742062616E672072656164696E67206F662073657269616C20646174612E200A5468652062797465732072657475726E656420666F7220656163682063686172616374657220646570656E642075706F6E20746865206E756D626572206F662064617461206269747320646174615F626974732073706563696669656420696E20746865206770696F53657269616C526561644F70656E20636F6D6D616E642E200A466F7220646174615F6269747320312D382074686572652077696C6C206265206F6E65206279746520706572206368617261637465722E0A466F7220646174615F6269747320392D31362074686572652077696C6C2062652074776F20627974657320706572206368617261637465722E0A466F7220646174615F626974732031372D33322074686572652077696C6C20626520666F757220627974657320706572206368617261637465722E0A
		Protected Function SerialRead(userGPIO As Uinteger, numberOfBytes as uinteger) As xojo.Core.MemoryBlock
		  #If TargetARM And TargetLinux Then
		    dim block as new xojo.Core.MutableMemoryBlock(numberOfBytes)
		    dim dataptr as ptr = block.data
		    dim result as integer = pigpio.gpioSerialRead(userGPIO, dataptr, numberOfBytes)
		    if result < 0 then 
		      MakeException (result) 
		    else
		      return new xojo.Core.MemoryBlock(dataptr)
		    end if
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 436C6F7365732061204750494F20666F72206269742062616E672072656164696E67206F662073657269616C20646174612E20
		Protected Sub SerialReadClose(userGPIO As Uinteger)
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.gpioSerialReadClose(userGPIO)
		    if result < 0 then MakeException (result) 
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 4F70656E732061204750494F20666F72206269742062616E672072656164696E67206F662073657269616C20646174612E200A42617564206D757374206265206265747765656E20353020616E64203235303030302E
		Protected Sub SerialReadOpen(userGPIO As Uinteger, Baud as Uinteger, DataBits as Uinteger)
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.gpioSerialReadOpen(userGPIO, Baud, DataBits)
		    if result < 0 then MakeException (result) 
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 436F6E6669677572657320746865206C6576656C206C6F67696320666F72206269742062616E672073657269616C2072656164732E20
		Protected Sub SerialReadSetInvert(userGPIO As Uinteger, assigns invert as Boolean)
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.gpioSerialReadInvert(userGPIO, if (invert, 1, 0))
		    if result < 0 then MakeException (result) 
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function serOpen Lib pigpioLibName (serTty as ptr, Baud as uinteger, serFlags as uinteger) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function serRead Lib pigpioLibName (serchandle as uinteger, byref value as ptr, count as uinteger) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function serReadByte Lib pigpioLibName (serchandle as uinteger) As Integer
	#tag EndExternalMethod

	#tag Method, Flags = &h1, Description = 53746172747320736572766F2070756C736573206F6E20746865204750494F2C20706F737369626C652076616C75657320617265203020286F6666292C2035303020286D6F737420616E74692D636C6F636B776973652920746F203235303020286D6F737420636C6F636B77697365292E20
		Protected Sub ServoPulsewidth(User_GPIO As UInteger)
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.gpioGetServoPulsewidth(User_GPIO)
		    if result < 0 then MakeException (result)
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 53746172747320736572766F2070756C736573206F6E20746865204750494F2C20706F737369626C652076616C75657320617265203020286F6666292C2035303020286D6F737420616E74692D636C6F636B776973652920746F203235303020286D6F737420636C6F636B77697365292E20
		Protected Sub ServoPulsewidth(User_GPIO As UInteger, assigns pulsewidth as uinteger)
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.gpioServo(User_GPIO, pulsewidth)
		    if result < 0 then MakeException (result)
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function serWrite Lib pigpioLibName (serchandle as uinteger, buffer as ptr, count as UInteger) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function serWriteByte Lib pigpioLibName (serhandle as uinteger, value as UInt8) As Integer
	#tag EndExternalMethod

	#tag Method, Flags = &h1, Description = 53657473206120676C697463682066696C746572206F6E2061204750494F2E200A4C6576656C206368616E676573206F6E20746865204750494F20617265206E6F74207265706F7274656420756E6C65737320746865206C6576656C20686173206265656E20737461626C6520666F72206174206C6561737420737465616479206D6963726F7365636F6E64732E20546865206C6576656C206973207468656E207265706F727465642E204C6576656C206368616E676573206F66206C657373207468616E20737465616479206D6963726F7365636F6E6473206172652069676E6F7265642E20
		Protected Sub SetGlitchFilter(UserGPIO as UInteger, SteadyTime as Uinteger)
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.gpioGlitchFilter(UserGPIO,  SteadyTime)
		    if result < 0 then MakeException (result)
		  #else
		    PigpioErrorCheck
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 536574732061206E6F6973652066696C746572206F6E2061204750494F2E200A4C6576656C206368616E676573206F6E20746865204750494F206172652069676E6F72656420756E74696C2061206C6576656C20776869636820686173206265656E20737461626C6520666F7220737465616479206D6963726F7365636F6E64732069732064657465637465642E204C6576656C206368616E676573206F6E20746865204750494F20617265207468656E207265706F7274656420666F7220616374697665206D6963726F7365636F6E6473206166746572207768696368207468652070726F6365737320726570656174732E20
		Protected Sub SetNoiseFilter(UserGPIO as UInteger, SteadyTime as Uinteger, ActiveTime as Uinteger)
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.gpioNoiseFilter(UserGPIO,  SteadyTime, ActiveTime)
		    if result < 0 then MakeException (result)
		  #else
		    PigpioErrorCheck
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 536574732061207761746368646F6720666F722061204750494F2E0A546865207761746368646F67206973206E6F6D696E616C6C7920696E206D696C6C697365636F6E64732E200A4F6E65207761746368646F67206D6179206265207265676973746572656420706572204750494F2E200A546865207761746368646F67206D61792062652063616E63656C6C65642062792073657474696E672074696D656F757420746F20302E200A4966206E6F206C6576656C206368616E676520686173206265656E20646574656374656420666F7220746865204750494F20666F722074696D656F7574206D696C6C697365636F6E64733A2D200A312920616E79207265676973746572656420616C6572742066756E6374696F6E20666F7220746865204750494F2069732063616C6C6564207769746820746865206C6576656C2073657420746F2050495F54494D454F55542E0A322920616E79206E6F74696669636174696F6E20666F7220746865204750494F206861732061207265706F7274207772697474656E20746F20746865206669666F20776974682074686520666C6167732073657420746F20696E6469636174652061207761746368646F672074696D656F75742E20
		Protected Sub SetWatchdog(UserGPIO as UInteger, Timeout as Uinteger)
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.gpioSetWatchdog(UserGPIO,  timeout)
		    if result < 0 then MakeException (result)
		  #else
		    PigpioErrorCheck
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 436C6F736573207468652053504920646576696365206964656E746966696564206279207468652068616E646C652E20
		Protected Sub spiClose(spiHandle as Uinteger)
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.spiClose(spiHandle)
		    if result < 0 then MakeException (result)
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function spiClose Lib pigpioLibName (spihandle as uinteger) As Integer
	#tag EndExternalMethod

	#tag Method, Flags = &h1, Description = 52657475726E7320612068616E646C6520666F72207468652053504920646576696365206F6E20746865206368616E6E656C2E20446174612077696C6C206265207472616E736665727265642061742062617564206269747320706572207365636F6E642E2054686520666C616773206D6179206265207573656420746F206D6F64696679207468652064656661756C74206265686176696F7572206F6620342D77697265206F7065726174696F6E2C206D6F646520302C20616374697665206C6F7720636869702073656C6563742E20
		Protected Function spiOpen(SpiChannel as Uinteger, baud as uinteger, spiFlags as uinteger) As UInteger
		  #If TargetARM And TargetLinux Then
		    dim result as integer=  pigpio.getspiOpen(SpiChannel, baud, spiFlags)
		    if result < 0 then MakeException (result) else return result
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function spiRead Lib pigpioLibName (spihandle as uinteger, byref buffer as ptr, count as UInteger) As Integer
	#tag EndExternalMethod

	#tag Method, Flags = &h1, Description = 526561647320636F756E74206279746573206F6620646174612066726F6D207468652053504920646576696365206173736F6369617465642077697468207468652068616E646C652E20
		Protected Function spiRead(spiHandle as Uinteger, numberOfBytes As Uinteger) As xojo.Core.MemoryBlock
		  #If TargetARM And TargetLinux Then
		    dim block as new xojo.Core.MutableMemoryBlock(numberOfBytes)
		    dim blockptr as ptr = block.Data
		    dim result as integer = pigpio.spiRead(spiHandle,  blockptr, numberOfBytes)
		    if result < 0 then MakeException (result) else return new xojo.Core.MemoryBlock(blockptr)
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 546869732066756E6374696F6E207472616E736665727320636F756E74206279746573206F6620646174612066726F6D20496E42756666657220746F207468652053504920646576696365206173736F6369617465642077697468207468652068616E646C652E2053696D756C74616E656F75736C7920636F756E74206279746573206F6620646174612061726520726561642066726F6D207468652064657669636520616E6420706C6163656420696E206F75744275666665722E20
		Protected Function spiTransfer(spiHandle as Uinteger, inbuffer as xojo.Core.MemoryBlock, byref outbuffer as xojo.Core.MutableMemoryBlock, numberofbytes as uinteger) As Integer
		  #If TargetARM And TargetLinux Then
		    dim outptr as ptr = outbuffer.Data
		    dim result as integer = pigpio.spiXfer(spiHandle,  inbuffer.data, outptr, numberofbytes )
		    if result < 0 then 
		      MakeException (result) 
		    else 
		      outbuffer = new xojo.Core.MutableMemoryBlock(outptr)
		      return result
		    end if
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function spiWrite Lib pigpioLibName (spihandle as uinteger, buffer as ptr, count as UInteger) As Integer
	#tag EndExternalMethod

	#tag Method, Flags = &h1, Description = 57726974657320636F756E74206279746573206F6620646174612066726F6D2062756620746F207468652053504920646576696365206173736F6369617465642077697468207468652068616E646C652E20
		Protected Function spiWrite(spiHandle as Uinteger, numberOfBytes As Uinteger = 0, value as xojo.Core.MemoryBlock) As Integer
		  #If TargetARM And TargetLinux Then
		    if numberOfBytes = 0 then numberOfBytes = value.size
		    dim result as integer = pigpio.spiWrite(spiHandle,  value.data, numberOfBytes )
		    if result < 0 then MakeException (result) else return result
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function spiXfer Lib pigpioLibName (spihandle as uinteger, inbuffer as ptr, byref outbuffer as ptr, count as UInteger) As Integer
	#tag EndExternalMethod

	#tag Method, Flags = &h1, Description = 52657365747320746865207573656420444D41206368616E6E656C732C2072656C6561736573206D656D6F72792C20616E64207465726D696E6174657320616E792072756E6E696E6720746872656164732E2043616C6C206265666F72652070726F6772616D20657869742E20
		Protected Sub Terminate()
		  #If TargetARM And TargetLinux Then
		     pigpio.gpioTerminate
		  #else
		    PigpioErrorCheck
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 546869732066756E6374696F6E2073656E6473206120747269676765722070756C736520746F2061204750494F2E20546865204750494F2069732073657420746F206C6576656C20666F722070756C73654C656E206D6963726F7365636F6E64732028312D3130302920616E64207468656E20726573657420746F206E6F74206C6576656C2E2020
		Protected Sub Trigger(UserGPIO as UInteger, PulseLength as Uinteger, Level as Boolean)
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.gpioTrigger(UserGPIO,  pulselength, if(level , 1, 0))
		    if result < 0 then MakeException (result)
		  #else
		    PigpioErrorCheck
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 4372656174657320612077617665666F726D2066726F6D2074686520646174612070726F766964656420627920746865207072696F722063616C6C7320746F20746865206770696F576176654164642A2066756E6374696F6E732E2055706F6E2073756363657373206120776176652069642067726561746572207468616E206F7220657175616C20746F20302069732072657475726E65642E
		Protected Function WaveformCreate() As integer
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.gpioWaveCreate()
		    if result < 0 then MakeException (result) else return result
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 52657475726E7320746865206964206F66207468652077617665666F726D2063757272656E746C79206265696E67207472616E736D69747465642E200A412076616C7565206F662039393938206D65616E732077617665666F726D206E6F7420666F756E6420616E642039393939206D65616E73206E6F2077617665206973206265696E67207472616E736D69747465642E
		Protected Function WaveformCurrent() As uinteger
		  #If TargetARM And TargetLinux Then
		    return pigpio.gpioWaveTxAt()
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 4372656174657320612077617665666F726D2066726F6D2074686520646174612070726F766964656420627920746865207072696F722063616C6C7320746F20746865206770696F576176654164642A2066756E6374696F6E732E2055706F6E2073756363657373206120776176652069642067726561746572207468616E206F7220657175616C20746F20302069732072657475726E65642E
		Protected Sub WaveformDelete(Waveform as Uinteger)
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.gpioWaveDelete(waveform)
		    if result < 0 then MakeException (result)
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 436C6561727320616C6C2077617665666F726D7320616E6420616E7920646174612061646465642062792063616C6C7320746F207468652041646457617665666F726D2066756E6374696F6E732E20
		Protected Sub WaveformsClearAll()
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.gpioWaveClear()
		    if result < 0 then MakeException (result) 
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 41626F72747320746865207472616E736D697373696F6E206F66207468652063757272656E742077617665666F726D2E2052657475726E732074727565206966207375636365737366756C2072616973657320616E20657863657074696F6E20656C73652E
		Protected Function WaveformStopTransmission() As Boolean
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.gpioWaveTxStop() 
		    if result < 0 then MakeException (result) else Return true
		  #else
		    PigpioErrorCheck
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 546869732066756E6374696F6E207472616E736D697473206120636861696E206F662077617665666F726D732E20596F752063616E20646566696E6520616E206F7074696F6E616C206E756D626572206F66206974656D7320746F2070617373206F6E6C792E0A4E4F54453A20416E792068617264776172652050574D2073746172746564206279206770696F486172647761726550574D2077696C6C2062652063616E63656C6C65642E20
		Protected Sub WaveformsTransmit(Waveforms() As Uinteger, NumberOfItems as int64 = -1)
		  #If TargetARM And TargetLinux Then
		    dim items as integer = Waveforms.Ubound
		    if NumberOfItems < 0 then NumberOfItems = (items+1) * IntegerSize else NumberOfItems = NumberOfItems * IntegerSize
		    dim block as new xojo.Core.MutableMemoryBlock(NumberOfItems)
		    for q as Integer = 0 to items
		      #if Target32Bit
		        block.UInt32Value(q*IntegerSize) = Waveforms(q)
		      #elseif Target64Bit
		        block.UInt64Value(q*IntegerSize) = Waveforms(q)
		      #Endif
		    next
		    dim result as integer = pigpio.gpioWaveChain(block.data, NumberOfItems)
		    if result < 0 then MakeException (result) 
		  #else
		    PigpioErrorCheck
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 7472616E736D697473207468652077617665666F726D207769746820696420776176655F69642E20546865206D6F64652064657465726D696E65732077686574686572207468652077617665666F726D2069732073656E74206F6E6365206F72206379636C657320656E646C6573736C792E205468652053594E432076617269616E7473207761697420666F72207468652063757272656E742077617665666F726D20746F2072656163682074686520656E64206F662061206379636C65206F722066696E697368206265666F7265207374617274696E6720746865206E65772077617665666F726D2E200A5741524E494E473A20626164207468696E6773206D61792068617070656E20696620796F752064656C657465207468652070726576696F75732077617665666F726D206265666F726520697420686173206265656E2073796E63656420746F20746865206E65772077617665666F726D2E200A4E4F54453A20416E792068617264776172652050574D2073746172746564206279206770696F486172647761726550574D2077696C6C2062652063616E63656C6C65642E20
		Protected Function WaveformTransmit(WaveId as Uinteger, WaveMode as pigpio.PigpioWavemode) As Integer
		  #If TargetARM And TargetLinux Then
		    dim result as integer = pigpio.gpioWaveTxSend(waveid, WaveMode)
		    if result < 0 then MakeException (result) else return result
		  #else
		    PigpioErrorCheck
		  #endif
		End Function
	#tag EndMethod


	#tag Note, Name = Status
		
		missing:
		i2cSegments – unertain about the neture of a I2C Segment
		i2cZip - need a closer look into …
		bbI2CZip  ditto
		
	#tag EndNote


	#tag ComputedProperty, Flags = &h1, Description = 546865206861726477617265207265766973696F6E2E2028726561642D6F6E6C7929
		#tag Getter
			Get
			  #If TargetARM And TargetLinux Then
			    return pigpio.gpioHardwareRevision()
			  #else
			    PigpioErrorCheck
			  #endif
			  
			End Get
		#tag EndGetter
		Protected HardwareRevision As UInteger
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  #if Target32Bit
			    return 4
			  #else
			    return 8
			  #endif
			End Get
		#tag EndGetter
		Private IntegerSize As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1, Description = 5468652070696770696F2076657273696F6E2E2028726561642D6F6E6C7929
		#tag Getter
			Get
			  #If TargetARM And TargetLinux Then
			    return pigpio.gpioVersion()
			  #else
			    PigpioErrorCheck
			  #endif
			  
			End Get
		#tag EndGetter
		Protected Version As UInteger
	#tag EndComputedProperty


	#tag Constant, Name = Off, Type = Double, Dynamic = False, Default = \"0", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = On, Type = Double, Dynamic = False, Default = \"1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = pigpioLibName, Type = Text, Dynamic = False, Default = \"pigpio.so", Scope = Private
	#tag EndConstant

	#tag Constant, Name = pigpioName, Type = Text, Dynamic = False, Default = \"pigpioLib", Scope = Private
	#tag EndConstant


	#tag Structure, Name = pigpioNotification, Flags = &h0
		segno as uint16
		  flags as uint16
		  tick as uint32
		level as uint32
	#tag EndStructure

	#tag Structure, Name = pigpioPulse, Flags = &h0
		gpioOn as uint32
		  gpioOff as uint32
		usDelay as uint32
	#tag EndStructure


	#tag Enum, Name = PigpioEdge, Type = UInteger, Flags = &h0
		Rising = 0
		  Falling = 1
		Either = 2
	#tag EndEnum

	#tag Enum, Name = PigpioMode, Type = Integer, Flags = &h0
		Input = 0
		  Output = 1
		  Alt0 = 4
		  Alt1 = 5
		  Alt2 = 6
		  Alt3 = 7
		  Alt4 = 3
		Alt5 = 2
	#tag EndEnum

	#tag Enum, Name = PigpioPud, Type = Integer, Flags = &h0
		Off = 0
		  Down = 1
		Up = 2
	#tag EndEnum

	#tag Enum, Name = PigpioWavemode, Type = UInteger, Flags = &h0
		OneShot = 0
		  Repeat = 1
		  OneShotSync = 2
		RepeatSync = 3
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule