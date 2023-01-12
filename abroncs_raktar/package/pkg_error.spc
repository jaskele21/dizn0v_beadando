CREATE OR REPLACE PACKAGE pkg_error IS
  wrong_email_format_ex EXCEPTION;
  gc_wrong_email_format_ex CONSTANT NUMBER := -20001;
  PRAGMA EXCEPTION_INIT(wrong_email_format_ex, -20001);
  tulaj_not_found_ex EXCEPTION;
  gc_tulaj_not_found_ex CONSTANT NUMBER := -20002;
  PRAGMA EXCEPTION_INIT(tulaj_not_found_ex, -20002);
  wrong_evszak_ex EXCEPTION;
  gc_wrong_evszak_ex CONSTANT NUMBER := -20003;
  PRAGMA EXCEPTION_INIT(wrong_evszak_ex, -20003);
  abroncs_not_found_ex EXCEPTION;
  gc_abroncs_not_found_ex CONSTANT NUMBER := -20004;
  PRAGMA EXCEPTION_INIT(abroncs_not_found_ex, -20004);
  felni_not_found_ex EXCEPTION;
  gc_felni_not_found_ex CONSTANT NUMBER := -20005;
  PRAGMA EXCEPTION_INIT(felni_not_found_ex, -20005);
END pkg_error;
/