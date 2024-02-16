let
  smbUsername = "smbuser";
  smbEnableDomain = false;
  smbDomain = "domain.com";
  smbPassword = "ILoveSamba";
in {
  smbUsername = "${smbUsername}";
  smbEnableDomain = if smbEnableDomain == true then true else false;
  smbDomain = "${smbDomain}";
  smbPassword = "${smbPassword}";
}
