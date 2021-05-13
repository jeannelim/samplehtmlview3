
var licenseKey;

function setLicenseKey(key) {
  console.log("key", key);
  licenseKey = key;
}

function loadPdf() {
    PSPDFKit.unload(document.getElementById('myPdfDiv'));
    PSPDFKit.load({
      container: document.getElementById('myPdfDiv'), //document.getElementsByTagName('flt-platform-view')[0].shadowRoot.getElementById('myPdfDiv'),
      document: "sample.pdf",
      licenseKey: licenseKey,
    })
    .then(_instance => {
      console.log("PSPDFKit loaded", _instance);

    })
    .catch(error => {
      console.error(error.message);
    });
}


