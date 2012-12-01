// Overload this file in your own device-specific config if you need
// non-standard property_perms and/or control_perms structs
//
// To avoid conflicts...
// if you redefine property_perms, #define PROPERTY_PERMS there
// if you redefine control_perms, #define CONTROL_PARMS there
//
// A typical file will look like:
//

// Alternatively you can append to the existing property_perms and/or
// control_perms structs with the following:
#define PROPERTY_PERMS_APPEND \
    { "radio.",           AID_RADIO,    0 }, \
    { "net.vpnclient",    AID_VPN,      0 }, \
    { "net.dnschange",    AID_VPN,      0 }, \
    { "wifi.",            AID_WIFI,     0 }, \
    { "persist.log.",     AID_SHELL,    AID_LOG }, \
    { "tcmd.",            AID_MOT_TCMD, AID_MOT_WHISPER }, \
    { "mot.backup_restore.", AID_MOT_TCMD, 0}, \
    { "bluetooth.",       AID_SYSTEM,    0 }, \
    { "hw.whisper",       AID_MOT_WHISPER, 0 }, \
    { "persist.mot.proximity.", AID_RADIO, 0 }, \
    { "cdma.nbpcd.supported", AID_RADIO, AID_RADIO }, \
    { "persist.atvc.",     AID_MOT_ATVC, 0 }, \
    { "sys.media.",        AID_SHELL, 0 },
