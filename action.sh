MODDIR=${0%/*}

provision_tee() {
  echo "——— provision start, report errors to developer ———"

  # This commands works the following way.
  # KmInstallKeybox Keybox_File Device_Id Attest_Device_Props_Bool
  LD_LIBRARY_PATH=/vendor/lib64/hw:/vendor/lib64:$MODDIR/common/lib64 $MODDIR/common/KmInstallKeybox $MODDIR/common/attestation.xml attestation true

  echo "——— provision end ———"
}

echo "!WARNING!"
echo "Only do this action once when your TEE has not yet been reprovisioned to enable RKP. Check with Key Attestation before running this script."
echo ""
echo "———————————"
echo ""
echo "Reprovisioning TEE... This will allow RKP (Remote Key Provisioning) to work again on your device."
echo ""

provision_tee

echo ""
echo "The following features should now work on your device without issues. Reboot is not necessary."
echo ""
echo "Google Remote Key Provisioning (BASIC integrity with a working fingerprint)"
echo "Widevine Remote Key Provisioning 4.0 (Security level: L1)"
