const depSelect = document.getElementById("dep");
const proSelect = document.getElementById("pro");
const disSelect = document.getElementById("dis");
const mensajeUbigeo = document.getElementById("mensajeUbigeo");

// 1. Cargar departamentos al inicio
window.addEventListener("DOMContentLoaded", () => {
    fetch("ubigeo?a=DEP")
        .then(res => res.text())
        .then(data => {
            depSelect.innerHTML += data;
        });
});

// 2. Al seleccionar un departamento, cargar provincias
depSelect.addEventListener("change", () => {
    const depId = depSelect.value;
    proSelect.innerHTML = "<option value=''>-- Selecciona una provincia --</option>";
    disSelect.innerHTML = "<option value=''>-- Selecciona un distrito --</option>";
    proSelect.disabled = true;
    disSelect.disabled = true;
    mensajeUbigeo.innerHTML = "";

    if (depId) {
        fetch(`ubigeo?a=PRO&d=${depId}`)
            .then(res => res.text())
            .then(data => {
                proSelect.innerHTML += data;
                proSelect.disabled = false;
            });
    }
});

// 3. Al seleccionar una provincia, cargar distritos
proSelect.addEventListener("change", () => {
    const provId = proSelect.value;
    disSelect.innerHTML = "<option value=''>-- Selecciona un distrito --</option>";
    disSelect.disabled = true;
    mensajeUbigeo.innerHTML = "";

    if (provId) {
        fetch(`ubigeo?a=DIS&p=${provId}`)
            .then(res => res.text())
            .then(data => {
                disSelect.innerHTML += data;
                disSelect.disabled = false;
            });
    }
});

// 4. Al seleccionar un distrito, mostrar mensaje y formulario
disSelect.addEventListener("change", () => {
    const depText = depSelect.options[depSelect.selectedIndex]?.text;
    const proText = proSelect.options[proSelect.selectedIndex]?.text;
    const disText = disSelect.options[disSelect.selectedIndex]?.text;

    if (disSelect.value) {
        mensajeUbigeo.innerHTML = `
            <div class="mensaje-box">
                <p>
                    <strong>Ubicación seleccionada:</strong><br>
                    Departamento: <strong>${depText}</strong><br>
                    Provincia: <strong>${proText}</strong><br>
                    Distrito: <strong>${disText}</strong>
                </p>
                <label for="domicilio" class="label-domicilio">Ingrese su domicilio:</label>
                <input type="text" id="domicilio" name="domicilio" placeholder="Ej. Jr. Lima 123" class="input-domicilio">
                <button type="button" class="btn-enviar" id="btnEnviar">Enviar</button>
            </div>
        `;

        // 5. Lógica del botón Enviar
        const btnEnviar = document.getElementById("btnEnviar");
        btnEnviar.addEventListener("click", () => {
            const direccion = document.getElementById("domicilio").value.trim();
            const idDep = depSelect.value;
            const idPro = proSelect.value;
            const idDis = disSelect.value;

            if (!direccion) {
                alert("Por favor, ingrese su dirección.");
                return;
            }

            btnEnviar.disabled = true;

            const formData = new URLSearchParams();
            formData.append("iddepartamento", idDep);
            formData.append("idprovincia", idPro);
            formData.append("iddistrito", idDis);
            formData.append("direccion", direccion);

            fetch("ubigeo", {
                method: "POST",
                headers: {
                    "Content-Type": "application/x-www-form-urlencoded"
                },
                body: formData.toString()
            })
                .then(res => res.text())
                .then(msg => {
                    alert(msg);
                    mensajeUbigeo.innerHTML = ""; // Limpiar mensaje
                    depSelect.value = "";
                    proSelect.innerHTML = "<option value=''>-- Selecciona una provincia --</option>";
                    proSelect.disabled = true;
                    disSelect.innerHTML = "<option value=''>-- Selecciona un distrito --</option>";
                    disSelect.disabled = true;
                })
                .catch(err => {
                    console.error("Error al enviar datos:", err);
                    alert("❌ Ocurrió un error al enviar los datos.");
                })
                .finally(() => {
                    btnEnviar.disabled = false;
                });
        });
    } else {
        mensajeUbigeo.innerHTML = "";
    }
});
