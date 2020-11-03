
function refreshData() {
    var forms = document.getElementsByClassName('needs-validation');
  
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
        if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
            form.classList.add('was-validated');
        } else {
            const firstname = document.getElementById("first-name").value; //firstname
            const lastname = document.getElementById("last-name").value; //lastname
            const birthday = document.getElementById("birthdate").value; //birthday
            const lieunaissance = document.getElementById("birth-place").value; //place of born
            const address = document.getElementById("address").value; //address
            const town = document.getElementById("city").value; //city
            const zipcode = document.getElementById("post-code").value; //zipcode

            var data = {
                f: firstname,
                l: lastname,
                b: birthday,
                p: lieunaissance,
                a: address,
                c: town,
                z: zipcode
                // r: reason
            }

            const reasons = [
                "travail",
                "achats",
                "sante",
                "famille",
                "handicap",
                "sport_animaux",
                "convocation",
                "missions",
                "enfants"
            ]
            for(const reason of reasons) {
                var merged = data
                merged["r"] = reason
                document.getElementById(reason).href = window.location.origin + "/generate.html#" + serialize(merged);
            }
            document.querySelector("#generation-link").style.display = "block";
        }
    });


}

function serialize(obj) {
    var str = [];
    for(var p in obj)
        str.push(encodeURIComponent(p) + "=" + encodeURIComponent(obj[p]));
    return str.join("&");
}
