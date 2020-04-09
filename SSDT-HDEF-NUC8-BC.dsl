// Automatic injection of HDEF properties

//DefinitionBlock("", "SSDT", 2, "hack", "_HDEF", 0)
//{
    External(_SB.PCI0.HDEF, DeviceObj)
    //External(RMCF.AUDL, IntObj)
    //External(RMCF.FAKH, IntObj)
    External(\RMDA, IntObj)

    Scope (_SB.PCI0.HDEF)
    {
        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
        {
            If (LEqual (Arg2, Zero))
            {
                Return (Buffer (One)
                {
                     0x03                                           
                })
            }

            Return (Package (0x08)
            {
                "alc-layout-id", 
                Buffer (0x04)
                {
                     0x0E, 0x00, 0x00, 0x00                         
                }, 

                "layout-id", 
                Buffer (0x04)
                {
                     0x1C, 0x00, 0x00, 0x00                         
                }, 

                "model", 
                Buffer (0x23)
                {
                    "Realtek ALC235 HD Audio Controller"
                }, 

                "PinConfigurations", 
                Buffer (One)
                {
                     0x00                                           
                }
            })
        }
    }
//}
//EOF
